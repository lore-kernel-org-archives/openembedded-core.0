Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f65.google.com (mail-it0-f65.google.com
	[209.85.214.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6A8C574F28
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 May 2018 15:58:41 +0000 (UTC)
Received: by mail-it0-f65.google.com with SMTP id c5-v6so17239870itj.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 May 2018 08:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=F2pvZB78iRA3btRy/9w6Fa53wZ4b2RVhLPg4gWJQj+E=;
	b=aaUB/Dgpy28gSosnGMDBbhHFecnsvpSaSO6mVmEQS+DbWcPuZzeVHAiZvVS6+aXiPm
	U9JAC90glinOMlmBBBos5h4GR8o2mOOQqXJUeqjmmJ5S16FL/1lLrvnsmgW/p26XwbUY
	SSZEMq5UncDvwFzDwjz+EUcC25WCk5raeS56LRIaoKxqAxQTvPWjDrDTVFvBCUkgefpf
	RQG+2OG4hU4wfOmWP4RwqX8gOljZ5wEehVVoXFMepnpe1n5gp7HP3GYgjOT5U+v0UbXL
	ruZATLb927hpc5jM/E9Vg09JP8mN+ha6hhICse+9J53YgDphpo7w4Cq5EQr0LE/PX5Ea
	3dyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=F2pvZB78iRA3btRy/9w6Fa53wZ4b2RVhLPg4gWJQj+E=;
	b=l5pyjF5JF5EuwWiCBMnsebPBWGnjErgD9BpNtSQuLFpkADhQ2Bk2U2vsn9NClzIIP9
	xOQY7/sPZCIAXvwfm9722z2A5mxx93K0D/rbHIdo5Y0RouMJAc0dTJz0Ay6PLsrH5YX8
	Mf76ZwKSarM79izVEBsiJTcgkcLHBBafRfXEQqDdqvQ5vXTNvWM8YD0YwhK+eHkFCPzi
	3LdYKepP9SwzGKB/4AcxI50d/oeFma5oVTIeuJtCJh2mPMpCiS1jXVhSWZuviMMfBysb
	bRbDfIcGPBQYCKJYkmeUw4DJnfvgqlaVa2SPwlnvY3dgAMXLikH/xL9NbeRSlgI8iIHD
	+Klw==
X-Gm-Message-State: ALKqPwcXUfMI64eugaQ5aBCUl96wp82tmeusCr5nF8yGAVvEwft2z45M
	LcdsfyLHjX2eJ1E2EYUvvH4BkmSkPEWaqD2JcZIg3w==
X-Google-Smtp-Source: AB8JxZrp5cuXYTfbRgWvcUioN+NX2w3NwXl6h/5ps2iGBDOjLNmjJGaw5nuMeUWU99Mcw+CPMf/2ida5vOrLPGVw8DQ=
X-Received: by 2002:a24:496:: with SMTP id
	144-v6mr9982232itb.131.1525881522844; 
	Wed, 09 May 2018 08:58:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.239.11 with HTTP; Wed, 9 May 2018 08:58:22 -0700 (PDT)
In-Reply-To: <20180509154920.5987-1-danismostlikely@gmail.com>
References: <20180509154920.5987-1-danismostlikely@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 9 May 2018 16:58:22 +0100
Message-ID: <CAJTo0LbCv1A6+ORgJzrGmwO4CSaS9H9VwwC61cd5HS0qx+YNyg@mail.gmail.com>
To: Dan McGregor <danismostlikely@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] go-native: use nonarch_libdir
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
X-List-Received-Date: Wed, 09 May 2018 15:58:42 -0000
Content-Type: multipart/alternative; boundary="0000000000002388c4056bc7fa04"

--0000000000002388c4056bc7fa04
Content-Type: text/plain; charset="UTF-8"

Is that *right* though?  Non-arch libdir is for architecture-independent
pieces as the name suggests.

Ross

On 9 May 2018 at 16:49, Dan McGregor <danismostlikely@gmail.com> wrote:

> From: Dan McGregor <dan.mcgregor@usask.ca>
>
> Setting staging_libdir to libdir caused unnecessary rebuilds of
> go-native when switching from a multilib build to a non-multilib
> build. Switch to nonarch_libdir because that's the same on both
> multilib and regular builds.
>
> Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
> ---
>  meta/recipes-devtools/go/go-native.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/go/go-native.inc
> b/meta/recipes-devtools/go/go-native.inc
> index b76fb0825e4..76c83848cd3 100644
> --- a/meta/recipes-devtools/go/go-native.inc
> +++ b/meta/recipes-devtools/go/go-native.inc
> @@ -1,6 +1,6 @@
>  # Use immediate assingment here to get the original (/usr/lib)
>  # instead of the one rewritten by native.bbclass.
> -nonstaging_libdir := "${libdir}"
> +nonstaging_libdir := "${nonarch_libdir}"
>
>  inherit native
>
> --
> 2.18.0-dev
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000002388c4056bc7fa04
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Is that *right* though?=C2=A0 Non-arch libdir is for archi=
tecture-independent pieces as the name suggests.<div><br></div><div>Ross</d=
iv></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 9 May=
 2018 at 16:49, Dan McGregor <span dir=3D"ltr">&lt;<a href=3D"mailto:danism=
ostlikely@gmail.com" target=3D"_blank">danismostlikely@gmail.com</a>&gt;</s=
pan> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex">From: Dan McGregor &lt;<a hre=
f=3D"mailto:dan.mcgregor@usask.ca">dan.mcgregor@usask.ca</a>&gt;<br>
<br>
Setting staging_libdir to libdir caused unnecessary rebuilds of<br>
go-native when switching from a multilib build to a non-multilib<br>
build. Switch to nonarch_libdir because that&#39;s the same on both<br>
multilib and regular builds.<br>
<br>
Signed-off-by: Dan McGregor &lt;<a href=3D"mailto:dan.mcgregor@usask.ca">da=
n.mcgregor@usask.ca</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/go/go-<wbr>native.inc | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-devtools/go/go-<wbr>native.inc b/meta/recipes-dev=
tools/go/go-<wbr>native.inc<br>
index b76fb0825e4..76c83848cd3 100644<br>
--- a/meta/recipes-devtools/go/go-<wbr>native.inc<br>
+++ b/meta/recipes-devtools/go/go-<wbr>native.inc<br>
@@ -1,6 +1,6 @@<br>
=C2=A0# Use immediate assingment here to get the original (/usr/lib)<br>
=C2=A0# instead of the one rewritten by native.bbclass.<br>
-nonstaging_libdir :=3D &quot;${libdir}&quot;<br>
+nonstaging_libdir :=3D &quot;${nonarch_libdir}&quot;<br>
<br>
=C2=A0inherit native<br>
<span class=3D"HOEnZb"><font color=3D"#888888">=C2=A0<br>
-- <br>
2.18.0-dev<br>
<br>
-- <br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--0000000000002388c4056bc7fa04--
