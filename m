Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f177.google.com (mail-qk0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id F3742607A4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jul 2015 19:40:10 +0000 (UTC)
Received: by qkhu186 with SMTP id u186so59371985qkh.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Jul 2015 12:40:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=r34/zsvK5SVpOsRTWsYMSInudIZwbLMYro8hQY0LF4o=;
	b=G2GBNz5o8k1ALjAkZ6nEHBm2G086CRghz7VAV72NmfypOycL1yEeA5KQm7plbYrzYy
	VEUsi1a7EUzF0QqkhnUsdhrVNxAjWYsTmBAHPsqe9t97RiZZY6YNE4f0rJGKzNKa8aNq
	1lU01HtfYOSDEKoIQjzxwq8M97HkvUEfWS0tjBwSTRcTpw32ltxzPIj+9Ww6wxsh5qLK
	Ykx0K4ZQEAUSu2NuYnpLVbVbIuABfkcXzNdQYPiVjOQkIFw2m57a8FbZ3mgF/6qAADdc
	XMFi2AA7UMaZkXVlpAvuauWaFCcamXq6I4A//VMoHgwcWcxaG6NJFbA3wTNdIfPGYz2q
	N4zw==
X-Gm-Message-State: ALoCoQmQAP/YNcndJyr6zjs/IGfHwRm6pL7QYXhhXEFjCpUzo+jCN6030Zxp5sWWBdV495MlHKUR
X-Received: by 10.140.235.19 with SMTP id g19mr47385954qhc.52.1435866010728;
	Thu, 02 Jul 2015 12:40:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Thu, 2 Jul 2015 12:39:51 -0700 (PDT)
In-Reply-To: <1435737141-31961-1-git-send-email-jackie.huang@windriver.com>
References: <1435737141-31961-1-git-send-email-jackie.huang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 2 Jul 2015 20:39:51 +0100
Message-ID: <CAJTo0LacneDbjFJR+uPQs__cqx+FVwXEuyCXe5zVui+Gu9tbpg@mail.gmail.com>
To: "jackie.huang@windriver.com" <jackie.huang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] xorg-proto-common: allow the empty package
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
X-List-Received-Date: Thu, 02 Jul 2015 19:40:12 -0000
Content-Type: multipart/alternative; boundary=001a11376dac83cb350519e99b7b

--001a11376dac83cb350519e99b7b
Content-Type: text/plain; charset=UTF-8

On 1 July 2015 at 08:52, <jackie.huang@windriver.com> wrote:

>  # ${PN} is empty so we need to tweak -dev and -dbg package dependencies
> +# and allow ${PN} to be created empty
> +ALLOW_EMPTY_${PN} = "1"
>  RDEPENDS_${PN}-dev = ""
>  RRECOMMENDS_${PN}-dbg = "${PN}-dev (= ${EXTENDPKGV})"
>

As the comment and surrounding lines state, the dependencies on PN from
PN-dev and PN-dbg are already removed.  What other package has a runtime
dependency on PN, and when you find it a better solution is to remove the
dependency instead of creating empty packages.

Ross

--001a11376dac83cb350519e99b7b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 1 July 2015 at 08:52,  <span dir=3D"ltr">&lt;<a href=3D"mailto:jackie.hu=
ang@windriver.com" target=3D"_blank">jackie.huang@windriver.com</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><div id=3D":va" class=3D"a3s" =
style=3D"overflow:hidden">=C2=A0# ${PN} is empty so we need to tweak -dev a=
nd -dbg package dependencies<br>
+# and allow ${PN} to be created empty<br>
+ALLOW_EMPTY_${PN} =3D &quot;1&quot;<br>
=C2=A0RDEPENDS_${PN}-dev =3D &quot;&quot;<br>
=C2=A0RRECOMMENDS_${PN}-dbg =3D &quot;${PN}-dev (=3D ${EXTENDPKGV})&quot;</=
div></blockquote></div><br>As the comment and surrounding lines state, the =
dependencies on PN from PN-dev and PN-dbg are already removed.=C2=A0 What o=
ther package has a runtime dependency on PN, and when you find it a better =
solution is to remove the dependency instead of creating empty packages.</d=
iv><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</di=
v></div>

--001a11376dac83cb350519e99b7b--
