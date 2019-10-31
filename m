Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f65.google.com (mail-ua1-f65.google.com
	[209.85.222.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3F6177F834
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2019 08:28:10 +0000 (UTC)
Received: by mail-ua1-f65.google.com with SMTP id d19so1582664uaq.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2019 01:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=rscxhXT9uh0o8WtltgwHS3D7J/XBDYDJMyOUHkGf+k8=;
	b=QSHIzHM5tTQkuibptDTDpGgUJ/GZMXDyN5exjZkKdhUr86zOKmk8ftJzJ9rOpqdGc0
	ww2NrSINpnuYTsYeacjuACMbp/5eZ20TpimRHCReJC5nc1a5OqnamkY3gmSzh2ljXO0z
	kHU4gqrftNAGhANiqnhdvZAdGjvvs0N3yuop7VaFnPkIE6K91uSzIUQ13Ssd4wFwRt/q
	vFkMZGA7IVDE7cdy3BNOL5vM7K062IttFhZDz6799eKtArTLaDGlrjqETuKtH52jqoyE
	oU2LczQTgZHWqi6p/BOXLJIXD40k4E9dMEBv/8VoEI8Euq2cGLBu6VhO/SkFkS0GT0xj
	9LWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=rscxhXT9uh0o8WtltgwHS3D7J/XBDYDJMyOUHkGf+k8=;
	b=n5gxUX4p+p+/pTlKbNyXwBZI2HDODlzit9b29N0ZkuvOSaejuedKng5iBQOdTYv3gH
	+QKLdQilcDdwQVksxHFzW89YwP4TOwDbNxXhnSllARc+EjPlgNX68CCc/mebfnsgt/oc
	PM5gONMwmWiQzpuFQdDcb8H4dnHK2iPRVwXRSgSOBEcOGUlM1w9rztoUcFOtHFwhGFvt
	O1hKl8hP0qT76PDDT3I/+ok5Y0hTz9jxJf5Y+iYJfsS8l99RnD9tFg2yc1LH9aW2npOQ
	6uqv9EE8o8Egg85aCKToGbnSG0QBdL9AZ8xpuYcVJwyNZKA1+FZarVV1jrmag97yzc+h
	aOlw==
X-Gm-Message-State: APjAAAXJve8FGAIbAou32uTXhQlOyjxCMntZ/Uxy9GIPQv1StNvVKlcI
	5iaI/U+B7VQ9sk0Azy/GCmMgAk0uhnEvdTirStw=
X-Google-Smtp-Source: APXvYqyk7DWRPNoWDpmVBljCNFSveYJj9ze7aiT3Dw+KoUqv4mxl5ILHuHzU3+dRQ0Z95i77w8E07YLH9zwyxh/w3wE=
X-Received: by 2002:ab0:2907:: with SMTP id v7mr2145983uap.89.1572510491141;
	Thu, 31 Oct 2019 01:28:11 -0700 (PDT)
MIME-Version: 1.0
References: <20191024111126.41198-1-alex.kanavin@gmail.com>
	<20191024111126.41198-2-alex.kanavin@gmail.com>
	<cd1794cf-f129-cd0f-f2e1-21d070e41b2f@intel.com>
In-Reply-To: <cd1794cf-f129-cd0f-f2e1-21d070e41b2f@intel.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 31 Oct 2019 09:28:00 +0100
Message-ID: <CANNYZj-Hz2_QHS+uMSNv_GVMP27ujUBm7QxeOEGEKrf+Wwv=Yw@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/5] oe-selftest: extend virgl gtk test to also check the SDL option
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
X-List-Received-Date: Thu, 31 Oct 2019 08:28:10 -0000
Content-Type: multipart/alternative; boundary="0000000000003aea75059630a1a8"

--0000000000003aea75059630a1a8
Content-Type: text/plain; charset="UTF-8"

On Thu, 31 Oct 2019 at 00:14, Ross Burton <ross.burton@intel.com> wrote:

>
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/56/builds/771/steps/8/logs/step2d
>
> Centos 7 worker, if that matters.
>

Thanks, I think it does matter. Virgl tests are already partly disabled for
centos 7 (they are not running kmscube with the gtk frontend), and it seems
that with the sdl frontend it fails even before kmscube is executed. I
guess I should disable them altogether on that (ancient) distro.

Alex

--0000000000003aea75059630a1a8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, 31 Oct 2019 at 00:14, Ross Burton=
 &lt;<a href=3D"mailto:ross.burton@intel.com">ross.burton@intel.com</a>&gt;=
 wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex"><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/56/build=
s/771/steps/8/logs/step2d" rel=3D"noreferrer" target=3D"_blank">https://aut=
obuilder.yoctoproject.org/typhoon/#/builders/56/builds/771/steps/8/logs/ste=
p2d</a><br>
<br>
Centos 7 worker, if that matters.<br></blockquote><div><br></div><div>Thank=
s, I think it does matter. Virgl tests are already partly disabled for cent=
os 7 (they are not running kmscube with the gtk frontend), and it seems tha=
t with the sdl frontend it fails even before kmscube is executed. I guess I=
 should disable them altogether on that (ancient) distro.</div><div><br></d=
iv><div>Alex<br></div></div></div>

--0000000000003aea75059630a1a8--
