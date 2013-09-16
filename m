Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f174.google.com (mail-ve0-f174.google.com
	[209.85.128.174])
	by mail.openembedded.org (Postfix) with ESMTP id EFA1160579
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 22:32:51 +0000 (UTC)
Received: by mail-ve0-f174.google.com with SMTP id jy13so3574015veb.33
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 15:32:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=hFXlRS7BNTlppGXSoLS2xoVUPXe7smogFo08bV2ScIQ=;
	b=Xty/F1od3gXC+wWICRUCNPENK0lf9ugzPbxUC9QPuczw53RB4gyjkhtBt23PMd3mFk
	9RFhFas3BSwxWfMJtDAVIyqHavgjXOrFHGzutqr/furjHSgdZPo6E+dHY4dXSkd9INkh
	L888oaTbSa/w12Im8oac7RsJI2vqtgwdcz4Mx14gtPhc5dT1YInzqSig1XBr5XK8l+S2
	VHoboNaJRPSQiyBnN8Afyh2wpaWclcWQd/LoRitKCHOECMLQu0btHXvT2fHUbrnS/FIh
	3htG9anNAS5TF14+QRUcuG8f8+BGMsDCFdYtnfPYSzoNdUfdcWGlGHXGwIL65UqfZIaA
	8sww==
X-Gm-Message-State: ALoCoQnM6irPLRtvv1FkVaXCZarjOqI8ghRkohnliuXhP4vAIOMcFy80zFGwrH3JhpfGPOPjgrSx
X-Received: by 10.58.108.74 with SMTP id hi10mr29743116veb.14.1379370773082;
	Mon, 16 Sep 2013 15:32:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Mon, 16 Sep 2013 15:32:33 -0700 (PDT)
In-Reply-To: <523784BB.8080404@mlbassoc.com>
References: <CAH2s=tsyyTMO9KoJMfP0SS4x0vMLphYuDWhPEv0eWeui3CjJ1w@mail.gmail.com>
	<523784BB.8080404@mlbassoc.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 16 Sep 2013 23:32:33 +0100
Message-ID: <CAJTo0LbhQkrrMYLrXJSpPR4MzYx6zYtSBxOVFhAivqH+O96hHA@mail.gmail.com>
To: Gary Thomas <gary@mlbassoc.com>
Cc: Tim Biernat <biernat@ieee.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: re. Enabling x264 support in gstreamer
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
X-List-Received-Date: Mon, 16 Sep 2013 22:32:53 -0000
Content-Type: text/plain; charset=UTF-8

On 16 September 2013 23:22, Gary Thomas <gary@mlbassoc.com> wrote:
> I did indeed get it working by using the attached .bbappend file.
> Actually pretty simple, I hope that the documentation on PACKAGECONFIG
> catches up soon.

You don't need the DEPENDS line, the x264 stana specifies that for you.

I presume you're refering to something like a worked example of how to
use PACKAGECONFIG instead of just a reference?  You should file a bug
about that - there's a never-ending amount for Scott to document so
pointers for obvious gaps are always welcomed.

Ross

