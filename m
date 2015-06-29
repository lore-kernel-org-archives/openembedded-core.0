Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f41.google.com (mail-qg0-f41.google.com
	[209.85.192.41])
	by mail.openembedded.org (Postfix) with ESMTP id 2458B7413A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jun 2015 16:42:08 +0000 (UTC)
Received: by qgii30 with SMTP id i30so8826628qgi.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jun 2015 09:42:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=X0uJZ0DGqM3xCl5EpEUT2N36SSvD0HA0AfCFb67mvqk=;
	b=hd1ONwUM7WxQgWMS4lhfoHJ8VvlxGJT3HmIDfPT1HOkZeRugvVyW0RAT2KJVgx7Vbb
	SaD7tvdsCMi96zq2IfpzhxRkBc58lQewAtTjd/l4FcuTYuhA+2+5ofq3d/j2vn9O5AQ/
	zjEBR391yB4+7Bqg2/44epkX3ilfVbKCAQXd3IUgnexT7GkTVV7+jS9b1Gybfx5wjfP3
	hGM2JTPWnK+MlxMAdsdcIkUdoda/jlwMpD6oPPydpNZO9ux2/SV17tEUVIcokFZ4msNs
	FAMiGCP8as3JZK00LDl3OEAlcZlJMGjgHL6KsYfNfnj7UCXetqE/zQhaOWH2bmg9Jqli
	QDsw==
X-Gm-Message-State: ALoCoQn9bQjBo0kKf0Osm1/ate4Yr0xyxTa9A+eLIF9lZ6Mq3GNZlcbjEQgF12Bv0c54iL90LZiZ
X-Received: by 10.140.231.19 with SMTP id b19mr20568836qhc.22.1435596129624;
	Mon, 29 Jun 2015 09:42:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Mon, 29 Jun 2015 09:41:50 -0700 (PDT)
In-Reply-To: <558A610C.2060600@windriver.com>
References: <cover.1435126503.git.liezhi.yang@windriver.com>
	<bb310561fc74eda7e03e10ccd7b3c29e7ad50992.1435126503.git.liezhi.yang@windriver.com>
	<558A610C.2060600@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 29 Jun 2015 17:41:50 +0100
Message-ID: <CAJTo0LaE__10br7LoZit8OTaZ=-oqC4KegoGJeKuG45LCLN07A@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 8/8] perl-ptest: fix RDEPENDS
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
X-List-Received-Date: Mon, 29 Jun 2015 16:42:12 -0000
Content-Type: multipart/alternative; boundary=001a11c12f0058fd0c0519aac578

--001a11c12f0058fd0c0519aac578
Content-Type: text/plain; charset=UTF-8

On 24 June 2015 at 08:49, Robert Yang <liezhi.yang@windriver.com> wrote:

> Sorry, please drop the last patch [PATCH 8/8] , I copy it from
> IMAGE_INSTALL, but it isn't correct, other patches are fine.
>

Will there be a follow-up patch to fix the rdepends so they're complete?
Or is the current set good as it is?

Ross

--001a11c12f0058fd0c0519aac578
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 24 June 2015 at 08:49, Robert Yang <span dir=3D"ltr">&lt;<a href=3D"mail=
to:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":ul" clas=
s=3D"a3s" style=3D"overflow:hidden">Sorry, please drop the last patch [PATC=
H 8/8] , I copy it from<br>
IMAGE_INSTALL, but it isn&#39;t correct, other patches are fine.</div></blo=
ckquote><div><br></div><div>Will there be a follow-up patch to fix the rdep=
ends so they&#39;re complete?=C2=A0 Or is the current set good as it is?</d=
iv><div><br></div><div>Ross</div></div></div></div>

--001a11c12f0058fd0c0519aac578--
