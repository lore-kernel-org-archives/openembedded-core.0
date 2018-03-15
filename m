Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f50.google.com (mail-it0-f50.google.com
	[209.85.214.50])
	by mail.openembedded.org (Postfix) with ESMTP id B078578077
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2018 17:02:59 +0000 (UTC)
Received: by mail-it0-f50.google.com with SMTP id k135-v6so9972384ite.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2018 10:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=koYC9HV6UkwS1S5AR7D84heCaojRRcAG2UcKmKURpKk=;
	b=v/rR7lMUaMMN5np5MNvxQhNIngPQsoQ8BxV3YPYPWAio/hNaHgEl3CZdR2riIIKZcM
	GsUKflpxNClckNceemeyk018M7IyVev1oo1hZu3K6IIYJx78yuK0FFM3VeoAdcX8A54j
	ei2PM8Eo4+havxkbNoWueaAJBDBXoLPV0CbRV7M6ylWvCaxcbYQXpDxfAwg2cCrbZJoH
	uJh+8v7wFAxHcLDOz1r0pgTAHIYnxLV9KxHMAuTq9Yt02D4ejAxM7ZS+3bUUvnMM5vbc
	Uur8m36qdURE2WhYQz6LsjaxIQYxG6dD9zdENRXWd0eNG9ExVK8riVyqxchtV0axwfWQ
	WAcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=koYC9HV6UkwS1S5AR7D84heCaojRRcAG2UcKmKURpKk=;
	b=KCnRfKRO6byIWcACkpxZst7P9gYs35nDag+akuCTMrZV8+rPtyjUFzNuY6qC5BahqS
	43nsl+EfSIL1+PUjqqbBatFDUYdhhHGESL4KwzdwU3FbqbjsFPSvtYNSm3ZmQoocXIcw
	O6M23+f4mChG9C5ZLaNwC69yB3oEOK/XNgdx4whhpGBv+C1m5UjJe5wf2mqXrOgO/rZd
	V67W7ULHZ+0Sf/g7FWqkfFJSqHG7PiEO+bLl1Sq3uDHkWQ32od1RBiT2uhqFoAxzFwE5
	GTyravx9Nt39cBK/Uo3Q5SDDyX55PgHduuDu0EuIrTOIvAFXFsHaV/BfpWh5lBM79uwk
	doTQ==
X-Gm-Message-State: AElRT7HY+VFNYfUH4a78nsFnbnKCtjalzQ63z/g40AhOl++8eMvAqI+h
	e2vvn1ZRAuDGM2PIVVR+92x2yweoOqd1WGe6yf070w==
X-Google-Smtp-Source: AG47ELv0Ej/C+a7TWwkJEUf7x6oCiDRVLfrJLdZUDkYL8b6OfJQaEsqW/m1Zf3//ECCTY6RzGzryhWDw+/v9XTNbN+M=
X-Received: by 10.36.185.24 with SMTP id w24mr6973924ite.127.1521133380667;
	Thu, 15 Mar 2018 10:03:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.30.9 with HTTP; Thu, 15 Mar 2018 10:02:40 -0700 (PDT)
In-Reply-To: <CADNbA1q6JMK=x49Q3VDKC58hLNrK4uKhudf_Zia=CCURiDVMEQ@mail.gmail.com>
References: <1520806702-5879-1-git-send-email-derek@asterius.io>
	<0fbe649e-846b-0446-64c1-587fa1221a9f@linux.intel.com>
	<CADNbA1pbbMD+7e8xXwOmzGAUmQXbis_cGx3zTrXLCNnRXqyrVA@mail.gmail.com>
	<5baad61a-a285-5aa5-3a7f-ee4dabf3242a@linux.intel.com>
	<CADNbA1q6JMK=x49Q3VDKC58hLNrK4uKhudf_Zia=CCURiDVMEQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 15 Mar 2018 17:02:40 +0000
Message-ID: <CAJTo0LbQQidvBd=sREHiBwzesECiNOuyDFMtarSFkQ5eBsEY5A@mail.gmail.com>
To: Derek Straka <derek@asterius.io>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2] python3: update to version 3.5.5 to fix security issues
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
X-List-Received-Date: Thu, 15 Mar 2018 17:02:59 -0000
Content-Type: multipart/alternative; boundary="f403045d9a50cfc867056776764b"

--f403045d9a50cfc867056776764b
Content-Type: text/plain; charset="UTF-8"

On 15 March 2018 at 17:00, Derek Straka <derek@asterius.io> wrote:

> I'll stop failing eventually... I'm surprised I didn't get a bounce from
> the patch test script.  In any case, I sent the native version.
>
>
Git does the right thing and does the merge, so the patch applies.

Ross

--f403045d9a50cfc867056776764b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 15 March 2018 at 17:00, Derek Straka <span dir=3D"ltr">=
&lt;<a href=3D"mailto:derek@asterius.io" target=3D"_blank">derek@asterius.i=
o</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"gmail_q=
uote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">I&#39;ll stop failing=
 eventually... I&#39;m surprised I didn&#39;t get a bounce from the patch t=
est script.=C2=A0 In any case, I sent the native version.=C2=A0=C2=A0</div>=
<div class=3D"HOEnZb"><div class=3D"h5"><div class=3D"gmail_extra"><br></di=
v></div></div></blockquote><div><br></div><div>Git does the right thing and=
 does the merge, so the patch applies.</div><div><br></div><div>Ross=C2=A0<=
/div></div></div></div>

--f403045d9a50cfc867056776764b--
