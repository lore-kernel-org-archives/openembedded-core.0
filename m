Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 4C81A786AB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Nov 2017 17:05:44 +0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id i38so30163152iod.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Nov 2017 09:05:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xyZFveLYyBx2lw+oFxZ/vlxUsuvqku14OaZ91jqZueU=;
	b=lpY7k/QXo79MRX+lytyxRBBQjcURTTO/oYbMeeZddvynqDilh1hRR4wYkUYXXTgEfi
	ttkCOFxHKj65nHmOh75Bqy10vpxLf9yc3izKgNWX9BlvVqZB3dbO2bm8m+FiESm9odrB
	bab926+mGpHnGHn1+MRBDJILyNSCp1svBaj3jHBsHbPBD8jeLL4IET6AGW1lQXq3ZbMG
	h0QTYFjBopaQJZRMw7/VfVwWp5A1RGP8ImDeHUg1bTzXsw91bmNm6h/NSgi13TA7B50v
	1/+C5WoGKjZGSn1jBf4+UwR3uksLOPGAQTBWs72yyiXuggraR5E73J5tkXkg3azPnSXt
	sAyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xyZFveLYyBx2lw+oFxZ/vlxUsuvqku14OaZ91jqZueU=;
	b=GqJVaM4EcObQ4L9eHG/6w6PqkZL/YI63WElauZu1vlbfQKPehiDBzo6FJsMnEsmjUv
	UUmqpgu/ZgyNWWp33TXgZUV1hv8YXuXGtlmBcAVj+XyFNnsM5WVTutlGCWk7FtdJsJyC
	3jzhKFQFYkY/tlKohgpsQggyvj9WODRpaS2h+ZgeSRRcnJnL3wtWK1vohaV2PPiobA4s
	vLfVjZWQFQKEipMcQv67epgjNqlWT28exp5fg5Hm1ryMxOjtvY2bQ5Sn2nJrYY9zgJoJ
	mMzkprEIJY5taIC694erB7jfm6akojP0riapeq07AX74+p2k0NcJkyqnHVff8M3Yyfl6
	uXAQ==
X-Gm-Message-State: AJaThX41llWwjAgvgVkp1f+QkKKdi9GyMBc4HJ97eNRIxMuut6Ly4oQw
	lRLMDTvpEpUe8IkE36gH3qilpl03nE0DBC8nkjvnhw==
X-Google-Smtp-Source: AGs4zMams7oWTe6+bRpf2m6NSs3H5W+CF1WKKE+blP5xt1/Ic5nv0pUlHseXxz4XG7ObCRQsr6gMa3DSy6bkoR5+i2o=
X-Received: by 10.107.178.145 with SMTP id b139mr32249258iof.52.1511543146356; 
	Fri, 24 Nov 2017 09:05:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.171.134 with HTTP; Fri, 24 Nov 2017 09:05:25 -0800 (PST)
In-Reply-To: <dec09146d2c3b9c8ee079613586d8c70cd5b7d72.1508360667.git.alejandro.hernandez@linux.intel.com>
References: <cover.1508360667.git.alejandro.hernandez@linux.intel.com>
	<dec09146d2c3b9c8ee079613586d8c70cd5b7d72.1508360667.git.alejandro.hernandez@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 24 Nov 2017 17:05:25 +0000
Message-ID: <CAJTo0LZ9zc9iUDvqT0an2LFgNszckm2PKkTD__XQZ253YoeOrw@mail.gmail.com>
To: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] python3: Restructure python3 packaging and replace it with autopackaging
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
X-List-Received-Date: Fri, 24 Nov 2017 17:05:45 -0000
Content-Type: multipart/alternative; boundary="001a114ca1624d6eb9055ebd90e8"

--001a114ca1624d6eb9055ebd90e8
Content-Type: text/plain; charset="UTF-8"

On 18 October 2017 at 22:07, Alejandro Hernandez <
alejandro.hernandez@linux.intel.com> wrote:

> @@ -77,8 +75,30 @@ do_install() {
>                 sed -i -e '1s|^#!.*|#!/usr/bin/env python3|' $PYTHSCRIPT
>         done
>
> -       # Tests are large and we don't need them in the native sysroot
> -       rm ${D}${libdir}/python${PYTHON_MAJMIN}/test -rf
> +        # Add a symlink to the native Python so that scripts can just
> invoke
> +        # "nativepython" and get the right one without needing absolute
> paths
> +        # (these often end up too long for the #! parser in the kernel as
> the
> +        # buffer is 128 bytes long).
> +        ln -s python3-native/python3 ${D}${bindir}/nativepython3
>

Is that rm of the tests redundant?

Ross

--001a114ca1624d6eb9055ebd90e8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 18 October 2017 at 22:07, Alejandro Hernandez <span dir=
=3D"ltr">&lt;<a href=3D"mailto:alejandro.hernandez@linux.intel.com" target=
=3D"_blank">alejandro.hernandez@linux.intel.com</a>&gt;</span> wrote:<br><d=
iv class=3D"gmail_extra"><div class=3D"gmail_quote"><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">@@ -77,8 +75,30 @@ do_install() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i -e &#39;1s|^=
#!.*|#!/usr/bin/env python3|&#39; $PYTHSCRIPT<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 done<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# Tests are large and we don&#39;t need them in=
 the native sysroot<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0rm ${D}${libdir}/python${PYTHON_<wbr>MAJMIN}/te=
st -rf<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Add a symlink to the native Python so that s=
cripts can just invoke<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # &quot;nativepython&quot; and get the right o=
ne without needing absolute paths<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # (these often end up too long for the #! pars=
er in the kernel as the<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # buffer is 128 bytes long).<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln -s python3-native/python3 ${D}${bindir}/nat=
ivepython3<br>
</blockquote><div><br></div><div>Is that rm of the tests redundant?</div><d=
iv><br></div><div>Ross</div><div><br></div></div></div></div>

--001a114ca1624d6eb9055ebd90e8--
