Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f172.google.com (unknown [209.85.216.172])
	by mail.openembedded.org (Postfix) with ESMTP id DAB2C60196
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 May 2014 15:55:18 +0000 (UTC)
Received: by mail-qc0-f172.google.com with SMTP id l6so3062032qcy.17
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 May 2014 08:55:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=XKvzXWadHq0n4/Ahidxcd3aTzNyY5GnDYWUAicC9g8I=;
	b=SBLSskI219ddkalYJeVGi5e4Vmg40bOCr8fJLxKyQDdAzzOS5/C6kYO3oTGYH39FqM
	Ev8Rlrg1p1TFZK+y6PcvYUCQJz0C8y9IxA8lCC6RzT1ZKwGB1csv71HmTQyxaEYiYmky
	uNYifQqxFuaDKF1azZHW0T1XN9uk0ARw3VhcCOWh5C8s7BxI8GDt19GCNR9Sv6DdN2nq
	zLpZYaXRjwIok0+u2zbY5OjTIn7vB25bicteqjkaRaagy5QvwjT7XImiAiXaJ8iwFE9c
	KQiUH5JI7hx7+EFEVvJiT54kqMIv+Dc9+0eiDJrgUMYlpZX2jl06utmDpHkewFzIa1uL
	ilgQ==
X-Gm-Message-State: ALoCoQljSzhw//Fy7vVemEaBj9IXUjE1fxTWKWIQUVR4jYIQMjRmQdoY7fIdiW3p4gyM2bDEZ6Bb
X-Received: by 10.140.104.78 with SMTP id z72mr5988944qge.60.1399564518767;
	Thu, 08 May 2014 08:55:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.101.77 with HTTP; Thu, 8 May 2014 08:54:57 -0700 (PDT)
In-Reply-To: <CAJTo0LZbPXzXyvKXGZZYDT1BDWg3XYrRO_NXsXmuHLMmmW_S3Q@mail.gmail.com>
References: <CAJTo0LZbPXzXyvKXGZZYDT1BDWg3XYrRO_NXsXmuHLMmmW_S3Q@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 8 May 2014 16:54:57 +0100
Message-ID: <CAJTo0LZ_S=mNgM6gtPSfYf=AVRxdLcJ_CO31c+emmQrib80hjw@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>, 
	OE-devel <openembedded-devel@lists.openembedded.org>, 
	"yocto@yoctoproject.org" <yocto@yoctoproject.org>
Subject: Re: GStreamer 0.10's future
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
X-List-Received-Date: Thu, 08 May 2014 15:55:21 -0000
Content-Type: text/plain; charset=UTF-8

On 8 May 2014 15:48, Burton, Ross <ross.burton@intel.com> wrote:
> For the 1.7 release I want to move GStreamer 0.10 from oe-core into
> meta-multimedia, and ensure everything in oe-core has ported to
> GStreamer 1.x.  GStreamer 0.10 is considered dead upstream and is
> unmaintained so we don't need to be shipping both versions anymore.

So the catch here is that Qt4 currently depends on GStreamer 0.10.

Can someone who doesn't come out in a rash when looking at C++ code
spend two minutes to tell if me Qt4 supports GStreamer 1.0 (unlikely)
and whether we can make GStreamer 0.10 support a build-time
configuration and simply disable it in oe-core.

Ross

