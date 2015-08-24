Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id A73A2766DF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 16:18:33 +0000 (UTC)
Received: by qkbm65 with SMTP id m65so74157604qkb.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 09:18:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Qzrq/KxFh/w3/jLKwlRJWj/Lv5rG4iq56cWJ41vupbM=;
	b=KMDtzFl2IrOmlgc7Vqetdd4MFNeeWbmWXs2U7MkmRKoOa516+f3thTW+P3rKIFQzSB
	iMIjjUgvWTUC71b2mC6YCpaaeg+aA9+EUoHQ9m1xUgkKedCL+nU2S3xsW8Fs2WBg9/ah
	cpPUQiSsJtB0MClGoJRs0rsrW4g0qT8M8/CczgvIFJm5BmTwg2D5iBCT6BChZEpLy/WT
	jodkXhr63N0M8JZHQfdyaR0ULJXeG+sIe30AZBRyFX29LzbKPo9bcgiG2dN3BFUKyQ3i
	Qqie/t2JtkVoXj3cGGbqmb0CDVUSWnz1OvXt46qyxuIwbC0yFg1A01lddrWWGku4WhJ7
	2fDQ==
X-Gm-Message-State: ALoCoQmABy2B8CLAjLsf5jrQUSi27hmLw1O16uf8dHBSUKEy/38cP3jpklCCFuCX4H4TXsZ+t2ll
X-Received: by 10.55.212.13 with SMTP id l13mr54624771qki.29.1440433113272;
	Mon, 24 Aug 2015 09:18:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.98.67 with HTTP; Mon, 24 Aug 2015 09:18:13 -0700 (PDT)
In-Reply-To: <1440386359-14110-1-git-send-email-rongqing.li@windriver.com>
References: <1440386359-14110-1-git-send-email-rongqing.li@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 24 Aug 2015 17:18:13 +0100
Message-ID: <CAJTo0LbOFtEZwj3j39ukrSmZAp0O4s==9baGqLaqHYJZdJaMpw@mail.gmail.com>
To: "rongqing.li@windriver.com" <rongqing.li@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] xmlto: xsltproc is required by both native and target
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
X-List-Received-Date: Mon, 24 Aug 2015 16:18:37 -0000
Content-Type: multipart/alternative; boundary=001a1147a5200a3892051e10f8b0

--001a1147a5200a3892051e10f8b0
Content-Type: text/plain; charset=UTF-8

On 24 August 2015 at 04:19, <rongqing.li@windriver.com> wrote:

> @@ -20,9 +20,7 @@ RDEPENDS_${PN} = "docbook-xml-dtd4 \
>                    util-linux \
>                    libxml2 \
>                    bash \
> -"
> -RDEPENDS_${PN}_append_class-target = " \
> -                  libxslt-bin \
> +                  libxslt \
>

This drops the runtime dependency on libxslt-bin, is this intentional?
Should the dependency on libxslt be libxslt-bin?  Does it even need an
explicit dependency on libxml? (does it use the xmllint or xmlcatalog
binaries).

Ross

--001a1147a5200a3892051e10f8b0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 24 August 2015 at 04:19,  <span dir=3D"ltr">&lt;<a href=3D"mailto:rongqi=
ng.li@windriver.com" target=3D"_blank">rongqing.li@windriver.com</a>&gt;</s=
pan> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":d5" class=3D"a3s"=
 style=3D"overflow:hidden">@@ -20,9 +20,7 @@ RDEPENDS_${PN} =3D &quot;docbo=
ok-xml-dtd4 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0util-l=
inux \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libxml=
2 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bash \=
<br>
-&quot;<br>
-RDEPENDS_${PN}_append_class-target =3D &quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libxslt-bin=
 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libxslt \</=
div></blockquote></div><br>This drops the runtime dependency on libxslt-bin=
, is this intentional?=C2=A0 Should the dependency on libxslt be libxslt-bi=
n?=C2=A0 Does it even need an explicit dependency on libxml? (does it use t=
he xmllint or xmlcatalog binaries).</div><div class=3D"gmail_extra"><br></d=
iv><div class=3D"gmail_extra">Ross</div></div>

--001a1147a5200a3892051e10f8b0--
