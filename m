Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f45.google.com (mail-yh0-f45.google.com
	[209.85.213.45])
	by mail.openembedded.org (Postfix) with ESMTP id 3AD6A609C0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 13:07:58 +0000 (UTC)
Received: by mail-yh0-f45.google.com with SMTP id 29so971575yhl.32
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 06:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=I9qU02JWsxumpyQ5Chi6fzMXFric4Eu+03Wg7ZALAmY=;
	b=ZXH7p9RIzqw03wgqfud7IYr6xHnK6vhw/g7Lql7FpmuDzD1cN5M2iyqGC1XVHExV/g
	90vzQHPbZVEj7QDNZF2Z56MzoFT9MwFnSgyRWI6HY/npODTRb4QmQvWW0MqFeRfn5bfj
	GjR8dL1mgzPQLK9yAHx24rtOf2yyowbD16ucHJvX5BBs2HdEjgrbFl2gFjQm6JUZRkCn
	9N18qnmSDqGuqsSKxnB28+7Ax/MNV67cfhaGwtNbxXP6z2/RklwvsSRuNC0BVCdBB4+p
	Y2jiDYh10/AjIMbHsqbh2AotYC3JJB2RkK59F1vU1FTbNFdwmLOX1/mO6Xv7vzB5/UkZ
	mQwA==
MIME-Version: 1.0
X-Received: by 10.236.199.13 with SMTP id w13mr17026286yhn.105.1408021678770; 
	Thu, 14 Aug 2014 06:07:58 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.56.201 with HTTP; Thu, 14 Aug 2014 06:07:58 -0700 (PDT)
In-Reply-To: <18e2b9ecac47dcfef1b00a538a61d1f5d4fe51fd.1408005909.git.Qi.Chen@windriver.com>
References: <cover.1408005909.git.Qi.Chen@windriver.com>
	<18e2b9ecac47dcfef1b00a538a61d1f5d4fe51fd.1408005909.git.Qi.Chen@windriver.com>
Date: Thu, 14 Aug 2014 10:07:58 -0300
X-Google-Sender-Auth: mfbdRUXLI8QeVMm8LcSv2NjGvO4
Message-ID: <CAP9ODKrPqTqnDuMoWXcrqukCfUMEc1SS1976i5VvPmN7Xm_7zQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 08/10] v86d: set INHIBIT_UPDATERCD_BBCLASS if 'sysvinit' not in DISTRO_FEATURES
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
X-List-Received-Date: Thu, 14 Aug 2014 13:08:05 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Aug 14, 2014 at 5:46 AM, Chen Qi <Qi.Chen@windriver.com> wrote:
> Set INHIBIT_UPDATERCD_BBCLASS to "1" if 'sysvinit' is not in DISTRO_FEATURES.
>
> The functionality of the init script 'fbsetup' is implemented internally in
> systemd. So fbsetup is not installed if 'sysvinit' is in DISTRO_FEATURES.
>
> That's why we need to set INHIBIT_UPDATERCD_BBCLASS to "1" to avoid
> generation of update-rc.d related preinst/postinst scripts.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>

Shouldn't this be handled in systemd class?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

