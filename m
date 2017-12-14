Return-Path: <sledz@dresearch-fe.de>
Received: from mail-lf0-f54.google.com (mail-lf0-f54.google.com
	[209.85.215.54])
	by mail.openembedded.org (Postfix) with ESMTP id 1B0996006E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Dec 2017 13:35:01 +0000 (UTC)
Received: by mail-lf0-f54.google.com with SMTP id a12so6690872lfe.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Dec 2017 05:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dresearch-fe-de.20150623.gappssmtp.com; s=20150623;
	h=to:from:subject:message-id:date:user-agent:mime-version
	:content-language:content-transfer-encoding;
	bh=C6UyzeiI4CgSLB6pVrAJzbu4Rlv/4o7IYep1OxWnbaQ=;
	b=K6LDgDPvTa7ndHDI6UdgKvuCJLkziWtRDaMNuTT5/fBChoxT/5Ln8+zlowUEwB/PZJ
	iC2ARyHSwuH7zMT6zTTK71gdsj6QZjXZzb/awhSc23k/Lcm0K30y3ZptFSoBYHnk4EYp
	DfTNIgk19BWt2SpBg0nbS9CDzEOapETpcuo3QO9jpjtCPeP1MpHxds7LoNC3+OsGMP81
	jLUQM64f1j0mZkzEFSrD0F3L5felPQswdZ5gSW1LBfAK4cbBru6+bl6eV0Rwh86cHxSy
	6sIaHF6alWR1mX+fFvtvVJSCbnZ7n0K6oMcsTbUEmN2UEGIm0yjxOlh6IAe8PmqhU/p4
	lJKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:from:subject:message-id:date:user-agent
	:mime-version:content-language:content-transfer-encoding;
	bh=C6UyzeiI4CgSLB6pVrAJzbu4Rlv/4o7IYep1OxWnbaQ=;
	b=P6KFDIE6RQCzGjbEF5czykaR4MY7n1gXbDkMsUDhVeeeCMSK6bJhwflH8W18tYRWSu
	317e5VdN4loJxqvZUZFzcOYp7Y844OMNmUjdWTvTVfwn3vsWRaQJ4rUdeQ7FBC7har5V
	TPBgG5eZAGseTwCXgxF1hCBAWcmCYWm/75zpmY8cejwtx1YCS/n/sZx9YrIakp8B9bGk
	n5qlijRJLXzmGeVqJ0lmkOBaP++rF0CqReqNnEAtMAWGbJk3aQWOLuFpLDQ47IMKhuda
	w6eoJgi9anv4P40MvBHUVf9eaCvxRhjWm7KtTYhCdBJPxv3xCg8bdDI48S+J6uu87RRb
	bpyA==
X-Gm-Message-State: AKGB3mI7jKlghwvVux7VtqUGqSHQXuX3qLtnX1pHi7SomKNBTpLWvMBB
	rwj7rU5vgliOfnXSnoxkD49OeA==
X-Google-Smtp-Source: ACJfBouickveaMlUvXaqkTCp036eDLEiGd9+WWDlobRxwgKdDF02dqpraBu25nNd+GotXNWRqVx8UQ==
X-Received: by 10.25.223.70 with SMTP id q6mr3998709lfj.27.1513258502184;
	Thu, 14 Dec 2017 05:35:02 -0800 (PST)
Received: from ?IPv6:2003:a:31:4300::46? ([2003:a:31:4300::46])
	by smtp.googlemail.com with ESMTPSA id
	k11sm766340lja.19.2017.12.14.05.35.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Dec 2017 05:35:01 -0800 (PST)
To: openembedded-core <openembedded-core@lists.openembedded.org>
From: Steffen Sledz <sledz@dresearch-fe.de>
Message-ID: <266c426e-ed0c-6fbb-842c-01962b9ef71b@dresearch-fe.de>
Date: Thu, 14 Dec 2017 14:34:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
Subject: How to fix file-rdes QA error for /usr/bin/python?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Dec 2017 13:35:02 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: 8bit

With rocko some builds are rejected because of the following package QA error (formerly it was just a warning).

 ERROR: foo-1_gitrAUTOINC+2595b80a79-r17 do_package_qa: QA Issue: /..../foo.py contained in package foo requires /usr/bin/python, but no providers found in RDEPENDS_for? [file-rdeps]

But the recipe still contains an rdep for python in recipe foo_git.bb

 RDEPENDS_{PN} += " ... python "

I assume the problem is that /usr/bin/python is not provided by any package but is just a symlink (created via u-a?).

How can/should this be fixed?

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058

