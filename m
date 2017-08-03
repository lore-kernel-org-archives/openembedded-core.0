Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 9FC3E6E666
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Aug 2017 16:43:02 +0000 (UTC)
Received: by mail-io0-f171.google.com with SMTP id m88so9082487iod.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Aug 2017 09:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=x5MXMaIb0chTOkxeTsY/iSBeUCTim0CpO/Y3XNvI9tw=;
	b=BtHLQZnbheNvyAyg6yB2+rXaoveugc5byKeHrkLnWJYhSJGlGojV7QQ76HEl6GL4aZ
	e4DX/IQILzupih+7HjBPC/mMy0JW/+a715J4fEBKEUeFRGNtOyK8U7ck4SiFVRTNszsS
	tnWPA9v+TIIqrfIDpdZUoxHNQdvW4Tj8EtlBaqm8QEhMq1woiWIE7idjIl2pG+FKLzEc
	RCXibvssA2cpyuixHgn9py95jqStQm7hJYJFGD96UC9XnAeyM6KVuDMIi9QPVRLEdYkq
	1r9ALnZvIix0bB5uMTCtFyQQQe/WwqPZiwCQQqeu6HgE0zbwrHPrkZjmD7C8Dfyu5Sfw
	KuUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=x5MXMaIb0chTOkxeTsY/iSBeUCTim0CpO/Y3XNvI9tw=;
	b=aarxrnXLGzoW7qrDy0/xjOXj1ygcFzQfaa5dJDFQYdTqm+EqYtbeanBGrUG1L4CEVT
	6rCR18MYZzf7uIwDHouN+gns6fzfrIbQGWHZSAmWo3AInLS/FzaYtgVATuU2cyLtX34b
	g3Iig7yVUZvg8yycMsfGImWCYaEsTeKFxmC3DbQrPhqrRdQP71obyDLlzRcS32BjXkVM
	mYz0f4HHJSryELDzFRzBIyEdnUDTILpm30szq4pojbwyrYoxL89IqG59hXaX5O49bWNt
	iYAlktRWqNhvUpXpngvJTgwFDil8RzwEoB3l+QDvenMNHBZ5FxoxbEFc6LEQqwOK02vK
	cE+w==
X-Gm-Message-State: AIVw111qRbShKjvxBpyrR4f7dwBwdGSluk3+omwRbVs6XCcx2qdZF/Uy
	c0hO8TEhlxVDaZGEPPLuGrIj7lOSg+HV
X-Received: by 10.107.132.33 with SMTP id g33mr2455509iod.300.1501778583738;
	Thu, 03 Aug 2017 09:43:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.135.234 with HTTP; Thu, 3 Aug 2017 09:42:43 -0700 (PDT)
In-Reply-To: <CAJTo0La48UP4m0NRFM+TwrrpmTm1jR222yRaBfD=Nq7fNehg6Q@mail.gmail.com>
References: <cover.1500357604.git.dengke.du@windriver.com>
	<dd968ff528a0928627a3bb12b4b1e8d77a1ff829.1500357604.git.dengke.du@windriver.com>
	<CAJTo0Lac01Ny9N5D0p8Qv+GCFXRNv0qF_BjGdXx4Q3zvc+1How@mail.gmail.com>
	<CAMKF1soL-B5ryhSUD9twYD6BUwSQOpRN37uxd=OkC9HNLQaC1Q@mail.gmail.com>
	<CAJTo0Lb0YdjLaVyLqHxfztCuYyrvEVAzXSZt5wZ7o=c_PXMh3g@mail.gmail.com>
	<CAJTo0La48UP4m0NRFM+TwrrpmTm1jR222yRaBfD=Nq7fNehg6Q@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 3 Aug 2017 17:42:43 +0100
Message-ID: <CAJTo0LYbn44Eva+zF1k8KxXMr5atREEzXr_r6odbpiF7g8uf+w@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] expat: upgrade to 2.2.2
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
X-List-Received-Date: Thu, 03 Aug 2017 16:43:02 -0000
Content-Type: multipart/alternative; boundary="001a113ed2e803f49b0555dc1333"

--001a113ed2e803f49b0555dc1333
Content-Type: text/plain; charset="UTF-8"

On 24 July 2017 at 11:23, Burton, Ross <ross.burton@intel.com> wrote:

> I've filed a bug upstream about the failure on Debian 8:
> https://github.com/libexpat/libexpat/issues/97
>

And this bug is now resolved.  expat in git can read /dev/urandom directly
if it doesn't find the syscalls it wants.

Ross

--001a113ed2e803f49b0555dc1333
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 24 July 2017 at 11:23, Burton, Ross <span dir=3D"ltr">&=
lt;<a href=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@i=
ntel.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"=
gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">I&#39;ve filed=
 a bug upstream about the failure on Debian 8:=C2=A0<a href=3D"https://gith=
ub.com/libexpat/libexpat/issues/97" target=3D"_blank">https://github.com/<w=
br>libexpat/libexpat/issues/97</a></div></blockquote><div><br></div><div>An=
d this bug is now resolved. =C2=A0expat in git can read /dev/urandom direct=
ly if it doesn&#39;t find the syscalls it wants.</div><div><br></div><div>R=
oss</div></div></div></div>

--001a113ed2e803f49b0555dc1333--
