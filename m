Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f43.google.com (mail-qg0-f43.google.com
	[209.85.192.43])
	by mail.openembedded.org (Postfix) with ESMTP id 7431560053
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Sep 2015 15:15:27 +0000 (UTC)
Received: by qgev79 with SMTP id v79so173666455qge.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Sep 2015 08:15:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=56/PaA1gyGzCI4XBcHhaOTKwvpOiC7nH3CpOrIxGDsU=;
	b=aZJo5Umw7F4ZAprmDn/N9D5XJ0QMWvYtvHMieVXjgRxRybYNfMfkXHAECDehNGFvs4
	LKEgBgDwbADO2CcHl261lRmW6RuYRPZqscQ1yDr4zy3T3xSGGhfbXSkqgVx12F1rwEYK
	i2cMMr1bYwj5luhuUXB3BZwuouP9Rq3fko3t33B+0E/fwi9Ijr90Sc4CA/aeqkUBMEpH
	2uCFNMp4ChDOqU2Ij4Ltpb0MorF0o2zCslHado9YOrFSxyZ5Ek1UKsufT1es7xvJqy8B
	JHAIO8jnPG1Kn5hhrSMTRC3fpTAISK/h1+sZ3tkbOpOvsMAF5dI//XjTUBTUoU9seJ0t
	0C9g==
X-Gm-Message-State: ALoCoQlUpoUhdR8Uzz9f4+pcyjdtsMVCWnsaOOcrNYNBSHH61y1aC/umQELSDl5fBnL/fw9Qm17i
X-Received: by 10.140.232.150 with SMTP id d144mr44735816qhc.17.1442416527094; 
	Wed, 16 Sep 2015 08:15:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.86 with HTTP; Wed, 16 Sep 2015 08:15:07 -0700 (PDT)
In-Reply-To: <55F978DD.9060007@windriver.com>
References: <cover.1442389930.git.liezhi.yang@windriver.com>
	<8bf3ec997007d1d921f4dce21f55612da0dce585.1442389930.git.liezhi.yang@windriver.com>
	<CAJTo0LbZTObHC+Urrc=3_EXWVaJb-_JeMnxO+=cRXsZySzM4PA@mail.gmail.com>
	<55F978DD.9060007@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 16 Sep 2015 16:15:07 +0100
Message-ID: <CAJTo0LaCot0Fx-ZHEJRP7j75Op2KT5sAMpF5pa1ttBcYee5cSA@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] subversion: 1.8.13 -> 1.8.14 since 1.8.13.tar.gz was gone
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
X-List-Received-Date: Wed, 16 Sep 2015 15:15:31 -0000
Content-Type: multipart/alternative; boundary=001a11354852b80971051fdec487

--001a11354852b80971051fdec487
Content-Type: text/plain; charset=UTF-8

On 16 September 2015 at 15:12, Robert Yang <liezhi.yang@windriver.com>
wrote:

> -SRC_URI = "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
> +SRC_URI = "http://archive.apache.org/dist/${BPN}/${BP}.tar.bz2 \
>

Looking at http://www.apache.org/dist/apr/ ($APACHE_MIRROR/apr) it appears
that this latest-release-only applies to every project they release, so we
should change APACHE_MIRROR instead of just the subversion recipe.

Ross

--001a11354852b80971051fdec487
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 16 September 2015 at 15:12, Robert Yang <span dir=3D"ltr">&lt;<a href=3D=
"mailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.=
com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,2=
04);border-left-style:solid;padding-left:1ex"><div id=3D":pi" class=3D"" st=
yle=3D"overflow:hidden">-SRC_URI =3D &quot;${APACHE_MIRROR}/${BPN}/${BPN}-$=
{PV}.tar.bz2 \<br>
+SRC_URI =3D &quot;<a href=3D"http://archive.apache.org/dist/$%7BBPN%7D/$%7=
BBP%7D.tar.bz2" rel=3D"noreferrer" target=3D"_blank">http://archive.apache.=
org/dist/${BPN}/${BP}.tar.bz2</a> \</div></blockquote></div><br>Looking at=
=C2=A0<a href=3D"http://www.apache.org/dist/apr/">http://www.apache.org/dis=
t/apr/</a> ($APACHE_MIRROR/apr) it appears that this latest-release-only ap=
plies to every project they release, so we should change APACHE_MIRROR inst=
ead of just the subversion recipe.</div><div class=3D"gmail_extra"><br></di=
v><div class=3D"gmail_extra">Ross</div></div>

--001a11354852b80971051fdec487--
