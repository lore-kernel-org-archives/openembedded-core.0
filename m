Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f169.google.com (mail-qc0-f169.google.com
	[209.85.216.169])
	by mail.openembedded.org (Postfix) with ESMTP id 65A426B7AD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 11:54:43 +0000 (UTC)
Received: by mail-qc0-f169.google.com with SMTP id e9so6765634qcy.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 03:54:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=9W8TwazPnAjj1OFZdcEUlIerM0MZHLb/4qMQSYjJpAE=;
	b=jMMced3rHsNRb3gUwHbpLjTCza4yyrNA6O/B7SBeG57Ux0TtqoKTi9S7XY9obUrX5z
	lReqGDMaBmfG6l5XAeix2HvbgI79LyTXZQRa9PXEiPXzQSi8tEvTIZ2+WFVMRGzMKdcn
	srG/fTMFGvWH8WCyjdmowT5+tsJw8ogruV4Xh9AZMXi0llvsB3lnjCA6GCjwbLPUU7BK
	U0eSqpHG5UKPlG5URFOk8tkakiZbpfVb7gHIQTdu7tDcRGG95RQpXXzit8SFc0ak/LUG
	AX1KBZkksx7ZndC1jeozLL9xBODyfzrJZo3h8NxbRtHaJ1orZcLEpXb43qdIgQidBh10
	fALw==
X-Gm-Message-State: ALoCoQlcqHVoUWp+PoQUR9m/TwKepJT8DmBFKVteCjT89RBuXFSgG1kL61ShUttigrfJ4LSHKRfa
X-Received: by 10.140.42.138 with SMTP id c10mr27709395qga.24.1393242884910;
	Mon, 24 Feb 2014 03:54:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.79 with HTTP; Mon, 24 Feb 2014 03:54:24 -0800 (PST)
In-Reply-To: <CABuzA3Odaup7ZC1EZPMLEULzjpDxrhRq6Oq97Ben9uLjCOKNEA@mail.gmail.com>
References: <CABuzA3Odaup7ZC1EZPMLEULzjpDxrhRq6Oq97Ben9uLjCOKNEA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 24 Feb 2014 11:54:24 +0000
Message-ID: <CAJTo0LYxZpiSyyQoa_Q=dY8=ShTOc2=aq5Gn4nkqLn-jmbX_BA@mail.gmail.com>
To: John Stirling <ap.john.stirling@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: qt4-embedded - jpeg, gif, tiff support
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
X-List-Received-Date: Mon, 24 Feb 2014 11:54:44 -0000
Content-Type: text/plain; charset=UTF-8

On 24 February 2014 11:39, John Stirling <ap.john.stirling@gmail.com> wrote:
> I've just noticed jpeg, gif, tiff are not working for me.

I suspect you're not pulling in the image decoder packages into your
images: to reduce dependency creep these are split into separate
packages:

$ ls qt4-embedded-plugin-imageformat*
qt4-embedded-plugin-imageformat-gif_4.8.5-r0_i586.ipk
qt4-embedded-plugin-imageformat-ico_4.8.5-r0_i586.ipk
qt4-embedded-plugin-imageformat-jpeg_4.8.5-r0_i586.ipk
qt4-embedded-plugin-imageformat-mng_4.8.5-r0_i586.ipk
qt4-embedded-plugin-imageformat-svg_4.8.5-r0_i586.ipk
qt4-embedded-plugin-imageformat-tga_4.8.5-r0_i586.ipk
qt4-embedded-plugin-imageformat-tiff_4.8.5-r0_i586.ipk

Ross

