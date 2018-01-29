Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f67.google.com (mail-it0-f67.google.com
	[209.85.214.67])
	by mail.openembedded.org (Postfix) with ESMTP id 68CBB782DD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jan 2018 16:50:38 +0000 (UTC)
Received: by mail-it0-f67.google.com with SMTP id 196so10035889iti.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jan 2018 08:50:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zxqjLuu7gZnlF1goa7yawPzJFDHGDH6jSQRr5ROAfeo=;
	b=bcoQMxd+yaeUV1TOLda0r7cOJspR2I+70B5rEzQAvVm46XuUXAWqc1opUG3lnwkmTV
	kcicaC79nqbIZNQY/dx32idFf29IN252cjeUdNsYlpgaX+2hLlnklHPnH1BNNoJSQ9tl
	OckENFy8AxE0PWXQcpDzKA7Hi2OD60C15uEz25cNESpunfNQwqkRC2i7EWsQQD1hDMoV
	f6hu1kjJ7oe/tvIH/QL+n7TQ4rx4EeC2QVbqcGdJwCq8y820bi5zrjm85KxnklLNs6PL
	u+hO/fud+uGBDR6Y9jXob62/8XeBojcdQcbBAHNFU+FfdlewiF/Rq7fI8CEx1BoYF/d6
	iJSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zxqjLuu7gZnlF1goa7yawPzJFDHGDH6jSQRr5ROAfeo=;
	b=sCZ3lGKudApVGPR9eQ931C/quCb6VdpHEd9FnaE5RSFXhBSfu/PVCQC0rp9u3X67a3
	yTTPYUBGea+wDTddMbC03EVsahwqGrWGcmBenCcm+ZJSSZE3QnpBGl+ykQXRsIB0rJg9
	ZUMpmHQ/mm2rxRjutm9XRtCjZ9TaPoGGPgyrMsGir8GqsgF5xvXigst6T6T5Hln3bXkS
	PFPU5YCqlsI8JuLn21c03vgWqjPm9Yknmho45XNCZtEtph/p1fhqJUo0kvCACbzztxRD
	zVEejp3PJSckovbwDDCPWwibY52Quq68OhQqfQ1sYWdNKx9oVaSNL7gpgbDsUa/PkfTs
	BHxQ==
X-Gm-Message-State: AKwxytdtWvIw/pcamlj9kw+TXEsYS966gSM6kHTqjlCRfR9SzxxEGAEi
	fIDmUDUSBxUKlq65M77VAMR/GJMzA5ENHzYFYZVN1Q==
X-Google-Smtp-Source: AH8x224I0zzTIK6CyCbnjdKBho0qqQLplVYUkjm4Mr71uKc21soBkI1tRJsdvhNpkK2gWAAloZr69F7T0tzj4JAZQjg=
X-Received: by 10.36.215.69 with SMTP id y66mr27741247itg.10.1517244640166;
	Mon, 29 Jan 2018 08:50:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.206 with HTTP; Mon, 29 Jan 2018 08:50:19 -0800 (PST)
In-Reply-To: <20180129141920.16224-1-niko.mauno@vaisala.com>
References: <20180129141920.16224-1-niko.mauno@vaisala.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 29 Jan 2018 16:50:19 +0000
Message-ID: <CAJTo0LbRJRbCv7i3Qe15NJnxv0MhCOuc14MHR_4o8-7Q0KCNVg@mail.gmail.com>
To: Niko Mauno <niko.mauno@vaisala.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] u-boot: Add coreutils-native to DEPENDS
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
X-List-Received-Date: Mon, 29 Jan 2018 16:50:39 -0000
Content-Type: multipart/alternative; boundary="94eb2c0afc44d0a02c0563ed0b31"

--94eb2c0afc44d0a02c0563ed0b31
Content-Type: text/plain; charset="UTF-8"

Depending on all of coreutils-native just for the comm binary is a bit of
an overkill, arguing to add comm to HOSTTOOLS is a lower-impact fix.

Ross

On 29 January 2018 at 14:19, Niko Mauno <niko.mauno@vaisala.com> wrote:

> Coreutils provides 'comm' command which is called during do_compile()
> from scripts/check-config.sh. This fixes following issues which are
> otherwise quietly ignored:
>
>   .../scripts/check-config.sh: line 33: comm: command not found
>   .../scripts/check-config.sh: line 38: comm: command not found
>
> Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
> ---
>  meta/recipes-bsp/u-boot/u-boot_2017.01.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-bsp/u-boot/u-boot_2017.01.bb
> b/meta/recipes-bsp/u-boot/u-boot_2017.01.bb
> index 37c21dcaa3..8b00a8d294 100644
> --- a/meta/recipes-bsp/u-boot/u-boot_2017.01.bb
> +++ b/meta/recipes-bsp/u-boot/u-boot_2017.01.bb
> @@ -1,4 +1,4 @@
>  require u-boot-common_${PV}.inc
>  require u-boot.inc
>
> -DEPENDS += "bc-native dtc-native"
> +DEPENDS += "bc-native coreutils-native dtc-native"
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--94eb2c0afc44d0a02c0563ed0b31
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Depending on all of coreutils-native just for the comm bin=
ary is a bit of an overkill, arguing to add comm to HOSTTOOLS is a lower-im=
pact fix.<div><br></div><div>Ross</div></div><div class=3D"gmail_extra"><br=
><div class=3D"gmail_quote">On 29 January 2018 at 14:19, Niko Mauno <span d=
ir=3D"ltr">&lt;<a href=3D"mailto:niko.mauno@vaisala.com" target=3D"_blank">=
niko.mauno@vaisala.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex">Coreutils provides &#39;comm&#39; command which is called during do_com=
pile()<br>
from scripts/check-config.sh. This fixes following issues which are<br>
otherwise quietly ignored:<br>
<br>
=C2=A0 .../scripts/check-config.sh: line 33: comm: command not found<br>
=C2=A0 .../scripts/check-config.sh: line 38: comm: command not found<br>
<br>
Signed-off-by: Niko Mauno &lt;<a href=3D"mailto:niko.mauno@vaisala.com">nik=
o.mauno@vaisala.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-bsp/u-boot/<a href=3D"http://u-boot_2017.01.bb" rel=3D"n=
oreferrer" target=3D"_blank">u-<wbr>boot_2017.01.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-bsp/u-boot/<a href=3D"http://u-boot_2017.01.bb" r=
el=3D"noreferrer" target=3D"_blank">u-<wbr>boot_2017.01.bb</a> b/meta/recip=
es-bsp/u-boot/<a href=3D"http://u-boot_2017.01.bb" rel=3D"noreferrer" targe=
t=3D"_blank">u-<wbr>boot_2017.01.bb</a><br>
index 37c21dcaa3..8b00a8d294 100644<br>
--- a/meta/recipes-bsp/u-boot/<a href=3D"http://u-boot_2017.01.bb" rel=3D"n=
oreferrer" target=3D"_blank">u-<wbr>boot_2017.01.bb</a><br>
+++ b/meta/recipes-bsp/u-boot/<a href=3D"http://u-boot_2017.01.bb" rel=3D"n=
oreferrer" target=3D"_blank">u-<wbr>boot_2017.01.bb</a><br>
@@ -1,4 +1,4 @@<br>
=C2=A0require u-boot-common_${PV}.inc<br>
=C2=A0require u-boot.inc<br>
<br>
-DEPENDS +=3D &quot;bc-native dtc-native&quot;<br>
+DEPENDS +=3D &quot;bc-native coreutils-native dtc-native&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.11.0<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--94eb2c0afc44d0a02c0563ed0b31--
