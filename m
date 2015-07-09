Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id 5B43B6017E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jul 2015 11:42:18 +0000 (UTC)
Received: by qkhu186 with SMTP id u186so183868281qkh.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jul 2015 04:42:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=vWaHqUtFIfvSv/qbr5Y5R/JACoBzW7Lf+UHTLGDk15E=;
	b=Yflu/Ko9igh/EEesqDGQcX5xr8Jb4VGrKew6mVrGJXpU1eZtKEOgzYsfS+ax7+/x4O
	/Tl7UpymeTvbmd/BrdyTlvfwwpAbtDkwymj+GWxUJUzIg+P/zJy3osglBDI0WUz2GR5W
	di5edXlRMDeDOXuK7gIIpDx4LFR2bx1X04qcSpUx0Gqnpo4eqGWsvyWI3nwdDAICD3Qt
	5l08I7fQ2TPWS8+ejvZNgMP0k7jJ/43bwJd4iiSS+YS4hmFCDVAYvlBf4bi4QqeHBH7U
	Ss2FvTHvkeE1r01Gzba5ilslIYi57lCWCP1UL2dEVRYDVwH8sOTAMM51AgTri0ML6NVs
	SA1Q==
X-Gm-Message-State: ALoCoQn1XTd8ZrjRkPTGQEg971R7FDnLcXR2XkXTOn5w0rzFaZu7hFyhd6tQHU40pNzDx/poDe0h
X-Received: by 10.140.231.19 with SMTP id b19mr23953204qhc.22.1436442139000;
	Thu, 09 Jul 2015 04:42:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Thu, 9 Jul 2015 04:41:59 -0700 (PDT)
In-Reply-To: <CAALGJZbmg2kqahBp5jFL4mk2N6upacQpmi9bpd3jSf5A-c4T8A@mail.gmail.com>
References: <2219152.1ss8pFxefq@peggleto-mobl.ger.corp.intel.com>
	<CAJTo0La0qFDC36msPioX=-=xsdWrhGSUrKC-9DokxV9Htx003Q@mail.gmail.com>
	<CAALGJZbmg2kqahBp5jFL4mk2N6upacQpmi9bpd3jSf5A-c4T8A@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 9 Jul 2015 12:41:59 +0100
Message-ID: <CAJTo0LaQR12MZP05tOSABbaRCAL=tA2boNdjKGJT54oLjAsG4w@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] RFC: libav vs. ffmpeg, redux
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
X-List-Received-Date: Thu, 09 Jul 2015 11:42:19 -0000
Content-Type: multipart/alternative; boundary=001a11c12f006f99b3051a6fbf9a

--001a11c12f006f99b3051a6fbf9a
Content-Type: text/plain; charset=UTF-8

On 9 July 2015 at 11:35, Christian Ege <k4230r6@gmail.com> wrote:

> Another option could be supporting both.
>

I totally endorse having a layer that has the one that isn't in oe-core,
but oe-core should pick one and support it properly.

Ross

--001a11c12f006f99b3051a6fbf9a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 9 July 2015 at 11:35, Christian Ege <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:k4230r6@gmail.com" target=3D"_blank">k4230r6@gmail.com</a>&gt;</span> w=
rote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex"><div id=3D":6g8" class=3D"a3s" styl=
e=3D"overflow:hidden">Another option could be supporting both.<br></div></b=
lockquote></div><br>I totally endorse having a layer that has the one that =
isn&#39;t in oe-core, but oe-core should pick one and support it properly.<=
/div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</=
div></div>

--001a11c12f006f99b3051a6fbf9a--
