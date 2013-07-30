Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f169.google.com (mail-ob0-f169.google.com
	[209.85.214.169])
	by mail.openembedded.org (Postfix) with ESMTP id 376C76B44C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2013 21:00:07 +0000 (UTC)
Received: by mail-ob0-f169.google.com with SMTP id wc20so6990932obb.28
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2013 14:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=U1wGQ4PdlH0mkjK6/lK08mk5PQC/R1HFTRZHAaF+1hA=;
	b=pMFy+83dBD4GAK/QI7FB4l+HvHPpBSyDzLhp0QZjXFaApwiy7TbAW4ACzicx0QDwUZ
	DF/0M+4zOvESilB2SGZMI0gL+ckL8qQU9eST3sno+EwMzho4ihEIgiOj75iYXZPFZHHq
	pk1MoO6OEqu3Q/UBOatU2YOQfcQl5mKpoQt2oDGL0Yj6xukWbil6AqzDs/PsJ7/1sLKt
	3bqeporp2nNVtKw1yHTFs31PnOh4TkG6FjzpfJRyBbDxc26EGrgRhgiAs40oH8wCMBlW
	ZdCObLpIJFpw7sQUW0B9XnzdlzpN49nUvvDX2Zm9j77ZFQiYUk9cnZeslE24iIudti/N
	g7FQ==
MIME-Version: 1.0
X-Received: by 10.60.115.199 with SMTP id jq7mr63692529oeb.19.1375218007053;
	Tue, 30 Jul 2013 14:00:07 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.125.199 with HTTP; Tue, 30 Jul 2013 14:00:06 -0700 (PDT)
In-Reply-To: <1375200330.8017.26.camel@phil-desktop.brightsign>
References: <1375136787-18139-1-git-send-email-otavio@ossystems.com.br>
	<14478313.i1FmA8Di2T@helios>
	<CAP9ODKogS69N51YxJ54-saCXbS0orquD8cbFCWWKLosE_TjSeg@mail.gmail.com>
	<1375186489.13247.55.camel@phil-desktop.brightsign>
	<CAP9ODKrC8koJjy-1P82wJ5UrP8Yqp_sQhCFDqqjsGe_Gyv-NSQ@mail.gmail.com>
	<51F7D1BB.8010405@windriver.com>
	<1375197551.8017.6.camel@phil-desktop.brightsign>
	<51F7DF2C.9030207@windriver.com>
	<1375200330.8017.26.camel@phil-desktop.brightsign>
Date: Tue, 30 Jul 2013 18:00:06 -0300
X-Google-Sender-Auth: mlbDqku8TLB1gbcbs7nt07pNQ3g
Message-ID: <CAP9ODKoT05fad89zz=O2Y-AJrr+GaCzTCBEuT5BT50Leek-0tQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Phil Blundell <pb@pbcl.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base.bbclass: Add support to EXTRA_DISTRO_FEATURES
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
X-List-Received-Date: Tue, 30 Jul 2013 21:00:07 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Jul 30, 2013 at 1:05 PM, Phil Blundell <pb@pbcl.net> wrote:
> On Tue, 2013-07-30 at 10:43 -0500, Mark Hatle wrote:
>> That only filters out recommendations though.  A good example is some x86
>> packagegroups have a requirement of 'vte'.  It turns out a class of end users
>> don't want 'vte'.  And they have no easy way to remove it.  Telling them to
>> generate a new image, with a custom IMAGE_INSTALL value that includes everything
>> except 'vte' doesn't make sense to them.
>
> I'm not familiar with the particular example that you mentioned, but it
> sounds as though the packagegroups in question ought to be recommending
> vte rather than depending on it.  I think this is probably true for
> packagegroup dependencies in general in fact.
>
> The intended semantics of RDEPENDS are that anything named in that list
> is absolutely required for correct operation and can't be removed
> without breaking the functionality of the package that's doing the
> depending.  Things that are desirable but not absolutely necessary
> should be in RRECOMMENDS (and can be suppressed with
> BAD_RECOMMENDATIONS), and things which are entirely optional but might
> be "nice to have" should be in RSUGGESTS.

--
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

