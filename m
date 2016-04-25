Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 26CF66067C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Apr 2016 09:11:22 +0000 (UTC)
Received: by mail-io0-f180.google.com with SMTP id u185so177249087iod.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Apr 2016 02:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=dUQ7PCCg1joNBddgEynna2ViyULhtxWUG/uB4PIyGS8=;
	b=1RmBP/LtmPBHIndlEH1DWXKEma+1J1Rgxf4zB9oTS5ElT8vKB8fNvouFIyptpTqbZ0
	/SrA9nRe+lZ8iD2NEOZ4eVE7MnedL6zMVOYlKOqtxIvrxDjuioBhpksgcXHCzCoxqCxt
	WtcMYfTyVy95d471D0Lsr8curzREYVb8FbWhTJDmpO4GKSQZVeSGuHvicTqoXKuldS2i
	juVF9LCuev/NJ8/Xn9pk2PjQc4RpTjFJjnCIiUyvYZXGAu9ZH51KxdB8aWQqEDyBpset
	UnNY4ouWT45aurBSEbYcQN8PkozGRq/I+Qj2i33H7D5FLf8WilJSRcxRlTy/bzxpmLFR
	uFXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=dUQ7PCCg1joNBddgEynna2ViyULhtxWUG/uB4PIyGS8=;
	b=e0AUCSOununSM8VeLuFZQJ9/IJSGo/Oi67VAaXZVYoqdrYNsy7FK2bHb3nb8RAU3ix
	ewEzUzoicqaozHs19RAOQh6D7ovQBGvB+FSEs3CxECnk2IuaIQAXJ+BvMhS5c0npj//E
	JQWpDLobesu6YodbQrgSpXdHR2W59D/e8KpwmNmLSYg4+k02Y13aYvgsRLXpLbMFJesm
	OWwLH8KiyEkbSwiUYEZF01RgfkHLnFYaUm+MVQ1gq90cBj0DcnirW9Ecil0IwGG+Ke87
	XaWVvt7zTEbq3/BxVNLxt6drQ/2s4HaqjOa70DOnBSz+NLFAndleahj7c5ak9lLYnqEG
	kiwg==
X-Gm-Message-State: AOPr4FUPF2WCKsc7abr/GUvqUTdF6/b8mOEIUnJVyZEBsUo61Is1HbAMv/rBViBPwwfV8d1vk4LWx3TXGr6qWGw8
X-Received: by 10.107.51.213 with SMTP id z204mr12778454ioz.148.1461575483293; 
	Mon, 25 Apr 2016 02:11:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.9.106 with HTTP; Mon, 25 Apr 2016 02:11:03 -0700 (PDT)
In-Reply-To: <1461569133-13241-1-git-send-email-obi@opendreambox.org>
References: <1461569133-13241-1-git-send-email-obi@opendreambox.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 25 Apr 2016 10:11:03 +0100
Message-ID: <CAJTo0La317pVNc9NLZTc3coUS94v40SBND00RbC-aa7mtex5dw@mail.gmail.com>
To: Andreas Oberritter <obi@opendreambox.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] rpm: explicitly disable tomcrypt
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
X-List-Received-Date: Mon, 25 Apr 2016 09:11:23 -0000
Content-Type: multipart/alternative; boundary=001a11440cd07e966705314b8ffc

--001a11440cd07e966705314b8ffc
Content-Type: text/plain; charset=UTF-8

On 25 April 2016 at 08:25, Andreas Oberritter <obi@opendreambox.org> wrote:

> Configure autodetects libtomcrypt, but then it adds libtommath to
> $LIBS and fails to link subsequent tests if it's unavailable.
>

There was a patch last week to add a PACKAGECONFIG instead, so I'll pick
that instead of this.

Ross

--001a11440cd07e966705314b8ffc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 25 April 2016 at 08:25, Andreas Oberritter <span dir=3D"ltr">&lt;<a href=
=3D"mailto:obi@opendreambox.org" target=3D"_blank">obi@opendreambox.org</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":mo" class=
=3D"a3s aXjCH">Configure autodetects libtomcrypt, but then it adds libtomma=
th to<br>
$LIBS and fails to link subsequent tests if it&#39;s unavailable.<br></div>=
</blockquote></div><br>There was a patch last week to add a PACKAGECONFIG i=
nstead, so I&#39;ll pick that instead of this.</div><div class=3D"gmail_ext=
ra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11440cd07e966705314b8ffc--
