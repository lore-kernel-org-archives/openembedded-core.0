Return-Path: <jpewhacker@gmail.com>
Received: from mail-io0-f195.google.com (mail-io0-f195.google.com
	[209.85.223.195])
	by mail.openembedded.org (Postfix) with ESMTP id 5AAFA78449
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Feb 2018 02:28:37 +0000 (UTC)
Received: by mail-io0-f195.google.com with SMTP id m11so325803iob.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Feb 2018 18:28:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:message-id:subject:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=J8pbkgj9OFUDkL2O9p2lEl+eWgt5fQRsNgg1xtZnwQk=;
	b=AUJoCOUTWX6BmB62nW4X/DkSS/vJUj5HK3Li9XKgKqB5p8tL0DEDoCgcK1L1B4vR8I
	uREZoTB7bkSdzIsBt2oPO18M1OQVTbKrvtXv/WJb67djxRDDjCQVgf7sZwhQ0bediAtw
	FjN7Jp2Hcg+4mDWj/0DuOTwt+X5ZdtzQSjm3F1IaFNfYUVuwRF98cMDoI6JCr6EVu0Wx
	TKkh14mSUs7wILs5NPgCpFfgtP84TUcG5Ybh0AQjuU4Q2kF008hpp0mO9KEuX2iOggSE
	+sr0z4uT0QPFLSPRmkeqLra4RQT+lespr8+qCt7hdv8IGw+TeSeGgaNcMd8lZHNIIJV7
	xG6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:subject:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=J8pbkgj9OFUDkL2O9p2lEl+eWgt5fQRsNgg1xtZnwQk=;
	b=aoE1QeREJFFtyoZlwiE9yappGxqnd85DgP/QDZbAunJTdNTnWViphx60OKsN+I9hot
	YHabYEEl1Gz/qaepADOIXgHVAv6nPEd7SePclboc3p9JvqCeKov2r1biNWrZ8VsbSETn
	2aUNnb+VRTmSAWyVIl8oUjEJCTw4eSSRzremt661LcM78dPZS7bfpnbfNLntMaOdtJYT
	aVcv/ZtZqtFrLniSpCojGDaAmKqcpRx1wn7e2hZyq3FQtCLjvSI1A1JTE9gIGtPriJR4
	VeWIYpc3fgnjnEmpexGnAeiavNEvNHrn/MmjzPMdzAm4P9FcPiagbxXybRwj1EnG/Je7
	+zAw==
X-Gm-Message-State: APf1xPBhklQiDe2IIIuL1ZIwJC8+TbF7jeDxV+tzhnu9YbN2yzDpwSeY
	sFTAejDjffdENPBmc+C1eEw=
X-Google-Smtp-Source: AH8x225uiLiWZ3zO1cFwpaw89ciu91VyciTOewovMRS0uk3bATm6yp0NxQEQGdVBMuAOMEOT6TnPYg==
X-Received: by 10.107.27.138 with SMTP id b132mr5571743iob.205.1517970518541; 
	Tue, 06 Feb 2018 18:28:38 -0800 (PST)
Received: from farscape ([2605:a601:a83:3700:10fb:b4c1:2c33:798c])
	by smtp.googlemail.com with ESMTPSA id
	l5sm34709itl.27.2018.02.06.18.28.37
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 06 Feb 2018 18:28:37 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Message-ID: <1517970512.7888.8.camel@gmail.com>
To: Martin Kelly <mkelly@xevo.com>, Alexander Kanavin
	<alexander.kanavin@linux.intel.com>, Jussi Pakkanen <jpakkane@gmail.com>
Date: Tue, 06 Feb 2018 20:28:32 -0600
In-Reply-To: <36bec7a1-e968-ca73-0dcb-444ebc6da496@xevo.com>
References: <2ce0ac68-4ef4-41f5-c931-81990ecd1d03@xevo.com>
	<CADqQcK4-=Q3mvKJfhjHbJEUYeTiGq3c7dCAR3E=w+ktr+_7RyA@mail.gmail.com>
	<e3dda70b-e6b2-bb18-2fe0-807b5c4fed48@xevo.com>
	<CAAjYPQ=u2U3f6DrL1KP-RkftD8P3nbASf1YUeeL0PFP6vY=hzQ@mail.gmail.com>
	<0ca64688-6a1d-0415-537f-bf59fb8dd2a6@xevo.com>
	<aa0ec366-dcd4-bac2-418a-acb0f9a06709@xevo.com>
	<0f020bf5-d0e7-82ae-c2b3-e7ea5006313d@linux.intel.com>
	<a6f2ab9f-e466-6107-a8a5-12d0706277ce@xevo.com>
	<36bec7a1-e968-ca73-0dcb-444ebc6da496@xevo.com>
X-Mailer: Evolution 3.26.3 (3.26.3-1.fc27) 
Mime-Version: 1.0
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Issues with meson in SDK with cross-file
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
X-List-Received-Date: Wed, 07 Feb 2018 02:28:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2018-02-06 at 15:39 -0800, Martin Kelly wrote:
> (ping)
> 
> Paul, what do you about the options we have here for making meson
> work 
> properly in the SDK?
> 
> To recap, here are the available options. I'm wondering if you could 
> give your opinion on the best fit for how OE SDKs work:
> 
> - Generate meson.cross toolchain file at SDK extraction time.
> - Wrap meson with a shell script that dynamically generates a
> toolchain 

FWIW, I *just* pushed up a patch to add support for this to so that I
could have Icecream distributed compiling support in the SDK. I called
them post-relocation scripts, see http://lists.openembedded.org/piperma
il/openembedded-core/2018-February/147282.html

This patch show how you install a post-relocation script from a recipe:
http://lists.openembedded.org/pipermail/openembedded-core/2018-February
/147283.html (look at icecc-setup.sh). It's pretty easy and modeled
after the environment setup scripts. The issue that meson is having
sounds similar to what I encountered with Icecream: something needed in
the SDK can only really be generated by host system when the SDK is
installed. There isn't enough information or the ability to generate it
beforehand when the SDK is constructed by Yocto.

Granted, this patch has not yet gone through the rigors of code review
so it will likely change, but I think that it is safe to say that such
a feature would be useful for more that just meson.

> file and then runs meson pointing to it.
> - Change meson to support pulling in env vars in meson.cross, and use
> a
> fixed meson.cross file that references the env vars.
> 
> On 01/17/2018 09:47 AM, Martin Kelly wrote:
> > Paul, any opinion?
> > 
> > On 01/12/2018 04:35 AM, Alexander Kanavin wrote:
> > > On 01/11/2018 09:22 PM, Martin Kelly wrote:
> > > > Khem and Alexander, could you comment on which solution is
> > > > preferable 
> > > > from an SDK standpoint? Otherwise, could you nominate someone
> > > > else to 
> > > > do so in your place? :)
> > > 
> > > I'm not sure who is the resident SDK expert, perhaps Paul
> > > Eggleton?
> > > 
> > > Alex

