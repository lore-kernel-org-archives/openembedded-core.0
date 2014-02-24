Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f45.google.com (mail-qg0-f45.google.com
	[209.85.192.45])
	by mail.openembedded.org (Postfix) with ESMTP id DC52360172
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 13:18:33 +0000 (UTC)
Received: by mail-qg0-f45.google.com with SMTP id j5so14795666qga.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 05:18:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=qVLo3WRrvJdBhsztkXe/Yzs66Lyl4TeZCftJeiUZDf8=;
	b=kFxLCMLgsMdqfT6Lp8w+EsXTndN/gCnZ5zt9a0Kh1zpfiKFySVgpIH1jVs0zOhvW80
	WtHn0I9kHIFYSXfBSQPWfQmiW/DrbDzWAN59Sb7WqelwsqAANwX9HZv1yMsR6+zr8tM8
	mmdqiovcgKvuYSXnBufA4OAGUJSiBrvppGVCRtTD2dxaKwoYx5k0sHd0KA/tkyJ06Dwq
	HDxmm0+5Xc3DtIVVSRj5ArmtfU5+Y6hMoPes+OGGwQxrTHacTv0/ovl5oTq59uokTuRq
	0cR3eFEEGPYdHEPuzPNe8IFaoj2+S2HohwX8WrLaHREFBsH2FQikkFH6YkrC5Q9QZUI4
	DmrA==
X-Gm-Message-State: ALoCoQmNwUReRKZWyfSEzR0RSSu1qTNV/osC2HBVfkjNDwJT0a1kSD/E6CEQF3EkrWvNstaC3MFR
X-Received: by 10.140.42.54 with SMTP id b51mr27812266qga.87.1393247914197;
	Mon, 24 Feb 2014 05:18:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.79 with HTTP; Mon, 24 Feb 2014 05:18:13 -0800 (PST)
In-Reply-To: <CAOMwXhOmoLP_8+mv_c_4Eg8YG_T1JD-ao+P1S9FDKvityy_3mA@mail.gmail.com>
References: <CAOMwXhOmoLP_8+mv_c_4Eg8YG_T1JD-ao+P1S9FDKvityy_3mA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 24 Feb 2014 13:18:13 +0000
Message-ID: <CAJTo0LY6hsYxR2=aeRodKhZ+5VBEUh+q+7nRYU0E6XYc+Pn-NQ@mail.gmail.com>
To: Laszlo Papp <lpapp@kde.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: No versioning for existing images
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
X-List-Received-Date: Mon, 24 Feb 2014 13:18:37 -0000
Content-Type: text/plain; charset=UTF-8

On 24 February 2014 12:01, Laszlo Papp <lpapp@kde.org> wrote:
> For instance, the MeeGo Nokia phone had a software version information
> in the settings, and that is something I would personally consider as
> the image version, but again, there might be better ways. Please share
> good practices in here., or alternatively, feel free to point me to
> any documentation, examples, etc.

This is an interesting example and a useful demonstration of why the
image version isn't always that useful.  The software build number
covers *everything* that goes into the image, but the image version
number is just the version of the top-level image recipe.  If you bump
the version of eglibc your image version won't be increased.

There's nothing to stop you doing versioned images but as the version
doesn't represent anything beyond the image recipe version it's not as
useful as you'd think.

Ross

