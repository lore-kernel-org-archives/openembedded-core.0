Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f173.google.com (mail-vc0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id 2CB246162A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2013 13:09:09 +0000 (UTC)
Received: by mail-vc0-f173.google.com with SMTP id id13so6012501vcb.18
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2013 06:09:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=UOxuKl1fGfMIU9wWsbsdpVieUuBHSGrntgY1TPj98wk=;
	b=Eo8SVdfpHriWepVuzccCUcv6E1vgT0yR+tsXoNJw4R29Ggiz5IAzEhp20mVIoIdXLe
	/E9HpdNy8jtuObFwvU687PyRMTnrHdefzx5gHINgHHRfrik7kAARH9SpkZ892bcfCN6r
	GsidHsWO3N3/iQ/5jy3nAw+jMiIG5fmWdIRFNNd2KXmu4tDaHOuBr1VRVSM10aMe2j+y
	E8UBiA54YEMjLVJhSLup6IKI/hD9TOFJrUuNszHD6ooQxkF9DZFDRDF/9d5Pn3ipyxxv
	1VvfK4gOAuOGolrRJAp8AnRapc42GJ6jl1dIAEkksAqYz3Oz5Djfh3yn6THNW2sXQLdd
	qwIA==
X-Gm-Message-State: ALoCoQntlGigoOUVsLwvl/3UzXTdBx8NkduzQi+5GZA1LYPraRobuskDfK4j/oBibdoAsR0y4Io0
X-Received: by 10.58.19.233 with SMTP id i9mr19812vee.36.1378904950641; Wed,
	11 Sep 2013 06:09:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Wed, 11 Sep 2013 06:08:50 -0700 (PDT)
In-Reply-To: <ADD6A3980E8C39419A432FF422031B4C70492C1F@ORSMSX103.amr.corp.intel.com>
References: <1378729614-11794-1-git-send-email-ross.burton@intel.com>
	<ADD6A3980E8C39419A432FF422031B4C704914C3@ORSMSX103.amr.corp.intel.com>
	<CAJTo0LbKD7_vPLK1qV5ZAUBB78GedUZ84SLTSTe9MULArzn4uA@mail.gmail.com>
	<ADD6A3980E8C39419A432FF422031B4C70492C1F@ORSMSX103.amr.corp.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 11 Sep 2013 14:08:50 +0100
Message-ID: <CAJTo0LbvTNA=YgA5APK55MtO2wS7QDqJUy4t4C_C0g14AYC=wQ@mail.gmail.com>
To: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH] mesa-gl: add GL-only Mesa recipe
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
X-List-Received-Date: Wed, 11 Sep 2013 13:09:09 -0000
Content-Type: text/plain; charset=UTF-8

On 11 September 2013 01:23, Kamble, Nitin A <nitin.a.kamble@intel.com> wrote:
> With few more fixes, this is working for EMGD based meta-intel BSPs.
> Here are the commits which worked:
>
> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=nitin/mesa-gl

The dependency on "mesa" is actually right, any other GL
implementation may or may not provide the DRI interface, which is what
X is depending on.

I've updated my mesagl branch to add a virtual/mesa provider.

> http://git.yoctoproject.org/cgit/cgit.cgi/meta-intel-contrib/log/?h=nitin/mesa-gl

Add a preferred provider of virtual/mesa="mesa-gl" in here and I think
you'll be sorted.

Ross

