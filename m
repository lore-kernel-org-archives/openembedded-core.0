Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f180.google.com (mail-pd0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id B38F560881
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 16:56:46 +0000 (UTC)
Received: by mail-pd0-f180.google.com with SMTP id 14so686457pdc.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 09:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=G2KMaPEre1I2Wj/4uHKr3qfXbMnZXPBhrnPzxrk+mug=;
	b=zf/gv5eKwX9pr2rgJ7V/hi8+599GtLdn+IY9YGmYY9y2xfKL5oR42WBCWhr8IsbsAC
	SeUtTyyP34Nxf8h5o9v4d78cuDB2UNkDhsAqHyHNLsnim/2NJcNFNwlZwFZ6uL8Vgmj7
	3TQjFU1vlL9MfnmXWd6cnKpEbyCfb9tKI25J+KnZ8UwOnEz7qeYtepDjDkXItImdXGlF
	NnkVSDLY10CcEdfxx0rnpio8YWoACNLdRSBJCwZB86m/MyOw87nM/Wjrkn1DUocbw61c
	576O2B6GN6suN9Jx/tj0/h4EUcfESEiJmGjjJHdJ3rGuWEy4JOf7sS/EcYaFlvO2oWU5
	PCYA==
X-Received: by 10.66.146.232 with SMTP id tf8mr9671578pab.32.1369933007915;
	Thu, 30 May 2013 09:56:47 -0700 (PDT)
Received: from ramanathan-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36]) by mx.google.com with ESMTPSA id
	al2sm42723925pbc.25.2013.05.30.09.56.46 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 30 May 2013 09:56:47 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <51A7751E.9060102@windriver.com>
Date: Thu, 30 May 2013 09:56:44 -0700
Message-Id: <BD275838-4C3A-49B8-8CEF-27A3A7BBC81E@gmail.com>
References: <cover.1369820334.git.hongxu.jia@windriver.com>
	<51A71980.30802@communistcode.co.uk>
	<51A74370.3030700@windriver.com> <51A74CFA.5090609@balister.org>
	<51A7751E.9060102@windriver.com>
To: Mark Hatle <mark.hatle@windriver.com>
X-Mailer: Apple Mail (2.1503)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/4]Add FUSE: File system in Userspace
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
X-List-Received-Date: Thu, 30 May 2013 16:56:47 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On May 30, 2013, at 8:49 AM, Mark Hatle <mark.hatle@windriver.com> =
wrote:

> The issue isn't that it's a few bad recipes, the issue is that meta-oe =
is a collection of software that doesn't fit anywhere else.  (I'm =
speaking specifically of meta-oe, -not- meta-openembedded which has =
multiple layers in it.)

OK I see that you are not supporting meta-oe in your commercial product =
but are in need of bits and pieces from it I would suggest to poach the =
recipes and keep them in your own supported layer if you do not wish to =
support meta-oe and It would be nice if you fed back any bug fixes or =
changes.=

