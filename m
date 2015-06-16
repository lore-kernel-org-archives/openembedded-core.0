Return-Path: <sledz@dresearch-fe.de>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 3E57373E44
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jun 2015 14:12:51 +0000 (UTC)
Received: by wiga1 with SMTP id a1so110333198wig.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jun 2015 07:12:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:content-type:content-transfer-encoding;
	bh=CgCbhILKANCWwW80sMuX3SJU5kNJEUrho1lpqUWbd/A=;
	b=bxyFwqZYK0aw2oPXxC2WQkMtvYssCnu1TAKcheiiTL1kukywZ2JXO7bOCInkcu5fhi
	4nYDXIchIQ/PcTBTK/h08eQeZcQ+qn2w67fVtGhEchLbU2PlWJSPvTuqh/8lD/5gnavT
	a1kwwyqHTLcdc0TVa+qDhYEjXMXShQkKFsHpUd3yIgNGZwPxMABUpxdOR4JnqZUh1zwi
	HZdwPhlnGOIsHRUijjgprwqBBSrGAub/0+GouKN5kwtgCSVKXKFAqrA9/u0H0NYlfNRU
	3KUXAIzmyCkEA4I8iEt4IxXjbYkHxoE09M4CHxANTfdRcmN2duZY5QLevDx3dOwzhW9F
	OlDw==
X-Gm-Message-State: ALoCoQn6QHJVB6BpFP18tQ5R7P0cxaMT3BMvofFqdkJAicgujED7cIVrdFOdUIlKyfJFRuDVNPhY
X-Received: by 10.180.20.198 with SMTP id p6mr7396265wie.38.1434463972142;
	Tue, 16 Jun 2015 07:12:52 -0700 (PDT)
Received: from [172.29.23.46] (zk223.dresearch-fe.de. [217.92.177.116])
	by mx.google.com with ESMTPSA id ul1sm1854277wjc.30.2015.06.16.07.12.50
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 16 Jun 2015 07:12:51 -0700 (PDT)
Message-ID: <55802EE1.6040703@dresearch-fe.de>
Date: Tue, 16 Jun 2015 16:12:49 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: openembedded-core <openembedded-core@lists.openembedded.org>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: multiple git repos vs. AUTOREV?
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
X-List-Received-Date: Tue, 16 Jun 2015 14:12:56 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

For development purposes we use this method to build always from the HEAD revision of a git repository.

-------------> snip <--------------
SRCREV="${AUTOREV}"
PV = "gitr${SRCPV}"

SRC_URI = "git://git@bitbucket.org/.../foo.git;protocol=ssh"
-------------> snap <--------------

Now we like to do the same in one recipe which uses sources from two git repos.

Our first try was this one. But if failed..

-------------> snip <--------------
SRCREV_foo="${AUTOREV_foo}"
SRCREV_bar="${AUTOREV_bar}"
PV = "gitr${SRCPV_foo}+${SRCPV_bar}"

SRC_URI = " \
	git://git@bitbucket.org/.../foo.git;protocol=ssh,name=foo \
	git://git@bitbucket.org/.../bar.git;protocol=ssh,name=bar \
"
-------------> snap <--------------

Is it possible to do what we want? And what's the right way to do it?

Thx,
Steffen

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058

