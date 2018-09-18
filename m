Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f169.google.com (mail-qt0-f169.google.com
	[209.85.216.169])
	by mail.openembedded.org (Postfix) with ESMTP id 8457E79493
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2018 23:24:33 +0000 (UTC)
Received: by mail-qt0-f169.google.com with SMTP id k38-v6so3411882qtk.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2018 16:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=XcpYNvwNFx++T3Ec0cVegD/pDWbSRKgBnBCaz3w25Vo=;
	b=BVpMePSpTw8RBzVLTyKRFyrY9OYfaVuxVkbfGwr8W7H5HBpRQTRvnc8OQh4W24not8
	gtaJFCMxzhw0+PE8JijaNmT3yscfv1noZ7D41TQw6oGYjDFV5vi77kRMW0vRixl32b98
	j9xg9r7KmOHNTA9ZkQsp10MgCwg1G9u35KaTZ2B8Uk0kQ96Y/Jk9T9wMvBx2OOdZ7ohA
	D7CkPzRu4wPoGxHOygPUfZ/5jSNWrCzhE8VJkRTrCLZf/XBSrVN3M/xjZsCxvlUw/eXB
	kj0fHHzugVFOUKK7HqktANEIIirvq8eqp5nYwFet+VtAsevfk0MjmcWjSzFXwoXf19kW
	jfAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=XcpYNvwNFx++T3Ec0cVegD/pDWbSRKgBnBCaz3w25Vo=;
	b=ufe8w8hDFHfU8OCBuGpNgPsJsXMnlGVNTDUHNGKioCVoC8kOiQuQt7YOofR60kb6rA
	ibz2VUxa4969ZMmfXg7+o8Uib5GijIFzz8xPwmYEOWTuFA/J0SGyuRaEY3EsOmrTdtLI
	/OD8e/7Av1P2ZSIHcZ6sefO6z0AExE4zuqGdV1/oz8zQYiLJMo5Egdn8mb7l/cC8DmbR
	cOA6nb+XD3MdKxSZnta2QHnt2EvcuVTdCqfhQuVQbF8c0CcVnJN2LZWrihfGWQIUS5BZ
	iyxA/YdXINcJoLkyxMZg3rWUBe9bY0Ib+SuuyT/7H5pnJRO7lL57KJd9wrja0IoBIe7D
	aLzA==
X-Gm-Message-State: APzg51CxxXpH5TP/YatcZq1zK75KPgzuw4RXVpCrGWCBUONGv3B0QjxJ
	E5zwSBlQI4VSzpknnGt73gzqE5oRURvHSXdV0j4=
X-Google-Smtp-Source: ANB0VdatcDhpCkRbjogOEwnPWbh/kBdzEmmy1bJ/tEAF6sMC8H/7PvlmVKyZkVdCX5KSn5umoIhWMX2fmpJBuvbQ1fA=
X-Received: by 2002:ac8:758d:: with SMTP id
	s13-v6mr23368096qtq.161.1537313074309; 
	Tue, 18 Sep 2018 16:24:34 -0700 (PDT)
MIME-Version: 1.0
References: <20180917212943.27237-1-abrodkin@synopsys.com>
	<20180917212943.27237-2-abrodkin@synopsys.com>
In-Reply-To: <20180917212943.27237-2-abrodkin@synopsys.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 18 Sep 2018 16:24:23 -0700
Message-ID: <CAMKF1sqLMxn-duY6Y2S=qpizrj5dZxeG3jeL-KNH6eg9CJ170A@mail.gmail.com>
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Cc: linux-snps-arc@lists.infradead.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 01/10] siteinfo: Define data for ARC
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
X-List-Received-Date: Tue, 18 Sep 2018 23:24:33 -0000
Content-Type: multipart/alternative; boundary="000000000000b3f09305762d9712"

--000000000000b3f09305762d9712
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 17, 2018 at 2:29 PM Alexey Brodkin <Alexey.Brodkin@synopsys.com=
>
wrote:

> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> ---
>  meta/classes/siteinfo.bbclass | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/classes/siteinfo.bbclass b/meta/classes/siteinfo.bbclas=
s
> index 86bb853b..dccf122 100644
> --- a/meta/classes/siteinfo.bbclass
> +++ b/meta/classes/siteinfo.bbclass
> @@ -20,6 +20,8 @@ def siteinfo_data(d):
>          "allarch": "endian-little bit-32", # bogus, but better than
> special-casing the checks below for allarch
>          "aarch64": "endian-little bit-64 arm-common arm-64",
>          "aarch64_be": "endian-big bit-64 arm-common arm-64",
> +        "arc": "endian-little bit-32 arc-common",
> +        "arceb": "endian-big bit-32 arc-common",


Probably need to add arc-common file as well
Since it=E2=80=99s used here

>
>          "arm": "endian-little bit-32 arm-common arm-32",
>          "armeb": "endian-big bit-32 arm-common arm-32",
>          "avr32": "endian-big bit-32 avr32-common",
> --
> 1.8.3.1
>
>

--000000000000b3f09305762d9712
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Mon,=
 Sep 17, 2018 at 2:29 PM Alexey Brodkin &lt;<a href=3D"mailto:Alexey.Brodki=
n@synopsys.com">Alexey.Brodkin@synopsys.com</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">Signed-off-by: Alexey Brodkin &lt;<a href=3D"mailto=
:abrodkin@synopsys.com" target=3D"_blank">abrodkin@synopsys.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/siteinfo.bbclass | 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/meta/classes/siteinfo.bbclass b/meta/classes/siteinfo.bbclass<=
br>
index 86bb853b..dccf122 100644<br>
--- a/meta/classes/siteinfo.bbclass<br>
+++ b/meta/classes/siteinfo.bbclass<br>
@@ -20,6 +20,8 @@ def siteinfo_data(d):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;allarch&quot;: &quot;endian-little =
bit-32&quot;, # bogus, but better than special-casing the checks below for =
allarch<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;aarch64&quot;: &quot;endian-little =
bit-64 arm-common arm-64&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;aarch64_be&quot;: &quot;endian-big =
bit-64 arm-common arm-64&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;arc&quot;: &quot;endian-little bit-32 ar=
c-common&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;arceb&quot;: &quot;endian-big bit-32 arc=
-common&quot;,</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Pr=
obably need to add arc-common file as well</div><div dir=3D"auto">Since it=
=E2=80=99s used here=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;arm&quot;: &quot;endian-little bit-=
32 arm-common arm-32&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;armeb&quot;: &quot;endian-big bit-3=
2 arm-common arm-32&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;avr32&quot;: &quot;endian-big bit-3=
2 avr32-common&quot;,<br>
-- <br>
1.8.3.1<br>
<br>
</blockquote></div></div>

--000000000000b3f09305762d9712--
