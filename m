Return-Path: <andre.draszik@gmail.com>
Received: from mail-yb1-f193.google.com (mail-yb1-f193.google.com
	[209.85.219.193])
	by mail.openembedded.org (Postfix) with ESMTP id B522B6C11C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Nov 2018 12:57:03 +0000 (UTC)
Received: by mail-yb1-f193.google.com with SMTP id i78-v6so3868901ybg.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Nov 2018 04:57:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=SPUXqaVXQ/trLuylj+/XHdecyxVAOD0WBwwv/3uScGk=;
	b=bfVTZ85AE/tWBB6xHbCEcGFTf71WX/xeo8cPaNJkulvM0DVrRGcgW3Iu43UOTkgt5m
	sQHP5Tx9SrDgy1CmyUx3ACtGkmwm9tWzwchrqnkZc43VuqMOwcCElW6m59Vz9pBEcGZt
	CP6cQ84lvvxN3HVVRizeWc73vLL3ueriiVm3hZp/rr4A3mPuMeqvh8K4vrvQJa47XQWD
	uQ4tWiBtpmWreHMopCjTt8t9eGhWJJgQgBhZ4xtlRlnzN3NelQuAGnlG/zhOpnoU96Do
	FkWhim6CMZPTN+DNru4lLqmbAVWeXKiG1pkTvBTq+KJvxicpXDVQLzBO7Nyq0oIitx5P
	YYxQ==
X-Gm-Message-State: AGRZ1gIGPrngkhLor82RKF8ikzaaTQFNpkbKT0ek3dkA+6Z23PDeODA2
	nwJod7vHUgzrNw0qhFNNuR0cHfe+
X-Google-Smtp-Source: AJdET5cn77GXfCnNQJJggC0YbXkN2cqG5EFkEhzuR2TqQDMI3WUHgMaTEkjx2dHD4lnCvPrIUhj6rw==
X-Received: by 2002:a25:2fc6:: with SMTP id
	v189-v6mr637095ybv.245.1542027424566; 
	Mon, 12 Nov 2018 04:57:04 -0800 (PST)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	s189-v6sm445273ywg.69.2018.11.12.04.57.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 12 Nov 2018 04:57:03 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Nov 2018 12:56:52 +0000
Message-Id: <20181112125653.21157-1-git@andred.net>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <09487c1d7e9d9a2cf0c60883ad209712c2d31dc2.camel@andred.net>
References: <09487c1d7e9d9a2cf0c60883ad209712c2d31dc2.camel@andred.net>
MIME-Version: 1.0
Subject: Re: broken sstate archives
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
X-List-Received-Date: Mon, 12 Nov 2018 12:57:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

As a follow-up and as a reference for the future - having done countless
builds I am confident enough that a kernel update solved the problem:
- linux (Debian 9) versions 4.9.110-3+deb9u6 and 4.9.110-3+deb9u5 both
  exhibit the problem
- 4.18.6-1~bpo9+1 doesn't

Something must have gone into the btrfs driver to fix the issue. I didn't
really spend the time to try and find the relevant commit.

For reference, I am also sending my hackish patch to poky to detect
the error case early, which (tries) to detect the broken archive, and
simply runs tar again.

Thanks Richard for all your inputs.

Cheers,
Andre'



