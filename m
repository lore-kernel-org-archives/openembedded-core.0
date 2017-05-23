Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f172.google.com (mail-qt0-f172.google.com
	[209.85.216.172])
	by mail.openembedded.org (Postfix) with ESMTP id BC59B71C14
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 May 2017 13:14:52 +0000 (UTC)
Received: by mail-qt0-f172.google.com with SMTP id f55so126990069qta.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 May 2017 06:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=wg/lh6y1Kp9fBMNiA1LRc4JFMW2RE8IDA8GWoN30elc=;
	b=vRcGMZn+DDFbld0DrSDhlNE4nW7OA+KCRdFzG4SigiQcRX+y9IT9KzDMvan0rYsIFR
	luxi65vYbrARsDePOlsk2b1ns5R5ryn2n5H3XO4beUFfGrRCXS176iE3uI3rUGCG6TZS
	QufuZ2Gp9YPWMQWEN7Z9wPyqYFK5UOetWyRjDhv5iZtkUmpzgV30sSo8OilVsYZoCbky
	sTHUJ2bZ9bmbk8U8Kic4h36j7hvnpJSIhuXnw02KHmQVNzSqxgi1OyKTiOZ9/XtktJ/2
	z6QrWaFlDP4VAag2F0eH5Go05QmlVfHUxT5cKbkWCnJ1Mg/XeqPaYoZ4re/FJOgnRF4J
	maeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wg/lh6y1Kp9fBMNiA1LRc4JFMW2RE8IDA8GWoN30elc=;
	b=bzihWJHAEV+hgu8fem85Prg6idCjoSAxGPIVn13Oc4T5SlpcZuPWBJmRduGqb2Noza
	D5FOiSBr8iSiuCmfse0CywM8KqQ3+uzR49r7X/sOFhc5xLaAUl1b2TBj7ZieexCfhoyw
	DD5gTcFkl6McDev+1jaUuGhM/7U19DenWoT+TbcYUvGFh8Wb2uuyhjg50os0vLbyvQW/
	fb+ERV8QLfdKezw5CRLXo42q/N0KPsQ8JNNpTAq9AKlITCJIbgrcyeArzuonQ1y4KrU6
	MFW8zt7lCpmkOY5wJwMtVTzrp27DnZ5KYaRUv77q9kjnvxCfidoRcoyhlZgLJbze/XyS
	cvLw==
X-Gm-Message-State: AODbwcBHmT1aygNhr8MXcX/WUpDIVi1+Vm5k6ze0JT7wxuSbmLlbmMrI
	h4wTDXX2kLsZehTrQuGkfKOlu/LMG7h7mZo=
X-Received: by 10.200.39.164 with SMTP id w33mr27784790qtw.93.1495545293739;
	Tue, 23 May 2017 06:14:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.41.115 with HTTP; Tue, 23 May 2017 06:14:33 -0700 (PDT)
In-Reply-To: <20170522050042.42403-10-raj.khem@gmail.com>
References: <20170522050042.42403-1-raj.khem@gmail.com>
	<20170522050042.42403-10-raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 23 May 2017 14:14:33 +0100
Message-ID: <CAJTo0La8fX-H==K-R37j2uTG2s_a5ww0hmNqtLNOEox8C-EZuQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 10/15] db: Add --tag=CC to cross libtool invocation
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
X-List-Received-Date: Tue, 23 May 2017 13:14:52 -0000
Content-Type: multipart/alternative; boundary="001a114039f4fab389055030c549"

--001a114039f4fab389055030c549
Content-Type: text/plain; charset="UTF-8"

On 22 May 2017 at 06:00, Khem Raj <raj.khem@gmail.com> wrote:

> +EXTRA_OEMAKE_append_class-target = " LIBTOOL='${STAGING_BINDIR_CROSS}/${HOST_SYS}-libtool
> --tag=CC'"
>

packages/corei7-64-poky-linux/db/db-cxx: RDEPENDS: removed all items
"libstdc++ (['>= 6.3.0'])"

This doesn't seem right (happy to be told otherwise).

Ross

--001a114039f4fab389055030c549
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 22 May 2017 at 06:00, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:r=
aj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wrot=
e:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left-width:1px;border-left-style:solid;border-left-color:rgb(204,204,=
204);padding-left:1ex"><div id=3D"gmail-:1qu" class=3D"gmail-a3s gmail-aXjC=
H gmail-m15c2e8a521b462ce">+EXTRA_OEMAKE_append_class-<wbr>target =3D &quot=
; LIBTOOL=3D&#39;${STAGING_BINDIR_<wbr>CROSS}/${HOST_SYS}-libtool --tag=3DC=
C&#39;&quot;<br></div></blockquote></div><br>packages/corei7-64-poky-linux/=
db/db-cxx: RDEPENDS: removed all items &quot;libstdc++ ([&#39;&gt;=3D 6.3.0=
&#39;])&quot;<br></div><div class=3D"gmail_extra"><br></div><div class=3D"g=
mail_extra">This doesn&#39;t seem right (happy to be told otherwise).</div>=
<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div><=
/div>

--001a114039f4fab389055030c549--
