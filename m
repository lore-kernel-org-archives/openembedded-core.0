Return-Path: <kergoth@gmail.com>
Received: from mail-ot0-f195.google.com (mail-ot0-f195.google.com
	[74.125.82.195])
	by mail.openembedded.org (Postfix) with ESMTP id 345A7719E2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jun 2017 15:29:00 +0000 (UTC)
Received: by mail-ot0-f195.google.com with SMTP id q16so17047538otb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jun 2017 08:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=5dZW/rYiU6gcYhmfl26x9VjIWFqouan0B4JuoVjweWQ=;
	b=k7oOJkR7vM33dG+OSxvpC0nHVb2XnEg9Smch3YqqtVg5nK1qkhccqIJLlx68NItRJs
	Gf+bQBXopPAzC+TZ25BZXaGA6nVGhf/8lRjVaD8sPewDNqwQXhbaedQM2gD0T19Li3dH
	6DA9090+tZlhGKpraYjDg04OYAeEsEg3HZBbt2nt3Z6iZzAhwkxVrmjUqYpcLMqSAjiO
	qrplkOKzp0mjCO/hOVPfQqx18+1SZwy6E3pIs/QsO8YGemyHVa1RLjOVwxtbl1RLvXRo
	Pz2mKziPFTUGuXoAuM++EsrDclNWsrKv1UjfRiqJsN4HNU0Q/ROhjjpucQnKPl/qO6s3
	lpJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=5dZW/rYiU6gcYhmfl26x9VjIWFqouan0B4JuoVjweWQ=;
	b=ZHjvarOjvcFC+MPVK7YLnKj1FM5pRQ5KqkNQrrianGs/2+JMBOtxHmJyC5vY99Vv/U
	sUHyo/Pu16GkJyHGGPZ/HHAiW/h7UC1y4/tPCI28JvTQkuTn+7hNI0+18AZZFFaSGRcm
	nX6BlgTKFKfxzrtTNGP34jcCLvNmiUkKhD6g08XcDCofvW+1F3MEbB9Dh4U76J9z5qEV
	nnyLD/HI49OHQuDpsZcSvuGAIwTAT7yTJMnqX4p1mXkySiSfILR3pO+i52UNAqRl4A9e
	Saw5+b5WM2cQvQ0jNrSg41+ulGgzj3LRgbEW7MsjudGi8tQQVCo5t6Wad2PkPHRTJstj
	AK2w==
X-Gm-Message-State: AKS2vOxdRI635tRo0srCGkzcS3f9c5Y8eoQOOXHkOrGMeTC60ZsFtk0P
	x6Wdx8t4p8nul6FAPOzLT41oZT6swg==
X-Received: by 10.157.3.206 with SMTP id f72mr21858970otf.217.1498058942182;
	Wed, 21 Jun 2017 08:29:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.30.230 with HTTP; Wed, 21 Jun 2017 08:28:41 -0700 (PDT)
In-Reply-To: <1498004059-12231-1-git-send-email-california.l.sullivan@intel.com>
References: <1498004059-12231-1-git-send-email-california.l.sullivan@intel.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Wed, 21 Jun 2017 08:28:41 -0700
Message-ID: <CABcZANmLQno0gXMoaBPz22WpsoPCvkCySe1JY+m7L4n5TTqsLw@mail.gmail.com>
To: California Sullivan <california.l.sullivan@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] x86-base.inc: Don't add live to IMAGE_FSTYPES, default instead
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
X-List-Received-Date: Wed, 21 Jun 2017 15:29:01 -0000
Content-Type: multipart/alternative; boundary="94eb2c03de9c19fce305527a0730"

--94eb2c03de9c19fce305527a0730
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 20, 2017 at 5:14 PM, California Sullivan <
california.l.sullivan@intel.com> wrote:

> Using +=3D makes it difficult to remove. Soft-set with ?=3D instead.
>
> Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
> ---
>  meta/conf/machine/include/x86-base.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/conf/machine/include/x86-base.inc
> b/meta/conf/machine/include/x86-base.inc
> index 7365953..bfacdf5 100644
> --- a/meta/conf/machine/include/x86-base.inc
> +++ b/meta/conf/machine/include/x86-base.inc
> @@ -10,7 +10,7 @@ MACHINE_FEATURES +=3D "screen keyboard pci usbhost ext2
> ext3 x86 \
>
>  MACHINE_EXTRA_RRECOMMENDS +=3D "kernel-modules"
>
> -IMAGE_FSTYPES +=3D "live"
> +IMAGE_FSTYPES ?=3D "live"
>

I=E2=80=99m assuming you verified that none of the existing machines includ=
ing this
were depending on the +=3D behavior to add to the current value? And this
would almost certainly result in a different default for any machines that
don=E2=80=99t adjust IMAGE_FSTYPES at all, since it=E2=80=99d be adding to =
the bitbake.conf
or distro default.
--=20
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--94eb2c03de9c19fce305527a0730
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Tue, Jun 20, 2017 at 5:14 PM, California Sullivan <span dir=3D"ltr">&lt;=
<a href=3D"mailto:california.l.sullivan@intel.com" target=3D"_blank">califo=
rnia.l.sullivan@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex"><div id=3D":12j" class=3D"a3s aXjCH m15cc800708907dec">Using +=3D ma=
kes it difficult to remove. Soft-set with ?=3D instead.<br>
<br>
Signed-off-by: California Sullivan &lt;<a href=3D"mailto:california.l.sulli=
van@intel.com">california.l.sullivan@intel.<wbr>com</a>&gt;<br>
---<br>
=C2=A0meta/conf/machine/include/x86-<wbr>base.inc | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/conf/machine/include/<wbr>x86-base.inc b/meta/conf/machin=
e/include/<wbr>x86-base.inc<br>
index 7365953..bfacdf5 100644<br>
--- a/meta/conf/machine/include/<wbr>x86-base.inc<br>
+++ b/meta/conf/machine/include/<wbr>x86-base.inc<br>
@@ -10,7 +10,7 @@ MACHINE_FEATURES +=3D &quot;screen keyboard pci usbhost e=
xt2 ext3 x86 \<br>
<br>
=C2=A0MACHINE_EXTRA_RRECOMMENDS +=3D &quot;kernel-modules&quot;<br>
<br>
-IMAGE_FSTYPES +=3D &quot;live&quot;<br>
+IMAGE_FSTYPES ?=3D &quot;live&quot;</div></blockquote></div><br>I=E2=80=99=
m assuming you verified that none of the existing machines including this w=
ere depending on the +=3D behavior to add to the current value? And this wo=
uld almost certainly result in a different default for any machines that do=
n=E2=80=99t adjust IMAGE_FSTYPES at all, since it=E2=80=99d be adding to th=
e bitbake.conf or distro default.<br>-- <br><div class=3D"gmail_signature" =
data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr">C=
hristopher Larson<br>kergoth at gmail dot com<br>Founder - BitBake, OpenEmb=
edded, OpenZaurus<br>Senior Software Engineer, Mentor Graphics</div></div><=
/div></div>
</div></div>

--94eb2c03de9c19fce305527a0730--
