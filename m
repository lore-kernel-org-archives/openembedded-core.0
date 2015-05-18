Return-Path: <dbaryshkov@gmail.com>
Received: from mail-ie0-f175.google.com (mail-ie0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id DA63673DA5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 May 2015 14:42:43 +0000 (UTC)
Received: by iepj10 with SMTP id j10so23952205iep.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 May 2015 07:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=gYfhwN+Pfw5e3iUNM0iMoTY/RAQHep/dDHDsK5nzBlU=;
	b=Qt0zvvoKUZK0AhzwZ7KR8FEtTokOd4TbO7O44qS9EydoPVDIKSqfu0VN5UezUie1/c
	728H3/1YDmTabdgQchfWyUETeIzaWgT//+cYjHhokJVAt6XRZytnqFhNCj2wy66zATM+
	dXDlVMTzALS3/F1Lgl9w1k78cwMER9leGLixuyEBNmn5rm1nF6azhiySFQwautc3hnld
	SWS9tiV2Qqb6cqhxan0VxEnGUA9RZtDrAcf7jHPiPyGKP5DAYfppLr4Syzi3nLpisLRg
	uZx4Skcekx2/ks21bFnLDxmmXdAq85jICBI5SsFWet6ZgoHRKW557dsX5n/mhGAz6aOx
	zBnA==
MIME-Version: 1.0
X-Received: by 10.107.5.210 with SMTP id 201mr30174707iof.57.1431960164905;
	Mon, 18 May 2015 07:42:44 -0700 (PDT)
Received: by 10.64.233.66 with HTTP; Mon, 18 May 2015 07:42:44 -0700 (PDT)
Date: Mon, 18 May 2015 17:42:44 +0300
Message-ID: <CALT56yMUTwHc5Z5c_x+V0EqMdpgqMnyu=6y3=UARJ9eCuHswDw@mail.gmail.com>
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Cortex-A9 vs Thumb configuration
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
X-List-Received-Date: Mon, 18 May 2015 14:42:45 -0000
Content-Type: text/plain; charset=UTF-8

Hello,

I was hit by one of changes in the package arch/tune/etc. naming. I'm
building an image
for the qemuarma9 (well, the error will be applicable to any
ARMv7-based machine).

After enabling ARM_INSTRUCTION_SET="thumb" in the config, I received
the following
error:

ERROR:  OE-core's config sanity checker detected a potential misconfiguration.
    Either fix the cause of this error or at your own risk disable the
checker (see sanity.conf).
    Following is the list of potential problems / advisories:

    Error, the PACKAGE_ARCHS variable does not contain TUNE_PKGARCH
(armv7at2-vfp-neon).


-- 
With best wishes
Dmitry

