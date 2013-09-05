Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f47.google.com (mail-vb0-f47.google.com
	[209.85.212.47])
	by mail.openembedded.org (Postfix) with ESMTP id E4C3D6C6A6
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 14:40:10 +0000 (UTC)
Received: by mail-vb0-f47.google.com with SMTP id h10so1199077vbh.34
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Sep 2013 07:40:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=dgqlwOY3Y6sPDvxz67gFmhLbZ9U66PdNS4H4rnZ2wHg=;
	b=bXNqGAp7Z9iPyp8Vh9ZW0hxpDfLVZjv3npa+A+fP3xTCojktU9kAReeWi4DGg8s8gD
	OFGcbvwlxCQ9CauOD2pSvvPSNMxl7mwH/YgXyJvzAqsPqakrug939HikH4D2GjxYyXrY
	lciceAyhz1KK9GHcQ1Tj30CdZylFV2sJGqyvqFqt7eCFPZQ2xvtf+TSKzJfaAilK8Aqk
	ycKJHS7NKqDEjSixCKnAHXw6dT7bGYzau9grO/vze3Bx46lqPVC0+N9+yS4w2nLybdjx
	xyzb+Uoa/OL6a56zem0r0wNOKjlvSJKKntQGvQqYY+xIQbtQ8/wxNZyDzs6wxfArnI/J
	Znsg==
X-Gm-Message-State: ALoCoQlsQRBPx/B0sLlD8H/h8lHV7O3PDGUD9yWxbFKEE80llxgmYTKNptO+OfDsgiD1Cfb4Y9T0
X-Received: by 10.52.119.228 with SMTP id kx4mr2922443vdb.12.1378392012240;
	Thu, 05 Sep 2013 07:40:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Thu, 5 Sep 2013 07:39:52 -0700 (PDT)
In-Reply-To: <CAJTo0LadXyEOszmBw=QR+AyQY9YeKpCNTX+zqQEGmXRm-9LChA@mail.gmail.com>
References: <1378311722-17752-1-git-send-email-ross.burton@intel.com>
	<1378332114.1059.260.camel@ted>
	<CADkTA4NbnmnQZXB2YLv5psJwA=gDAh9Bi4sGOr2dp30sTR0bJg@mail.gmail.com>
	<20130905071133.GG11500@jama>
	<CAJTo0LZ0vG0w24Wkr2KiwWoEF9bFwyJeBpg4xnfLpYe9ELd+mQ@mail.gmail.com>
	<CAJTo0LaPJjQqR80ZpowVBfjhYFLwqUvFF0wQm+S1VfKWeEDqdg@mail.gmail.com>
	<1378386554.27411.14.camel@firebird.rb.intel.com>
	<CAJTo0LadXyEOszmBw=QR+AyQY9YeKpCNTX+zqQEGmXRm-9LChA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 5 Sep 2013 15:39:52 +0100
Message-ID: <CAJTo0LYkTmTAzZtrApYJJHGxyxb5ZoL2_Wm20fNWfbn82Gn4ww@mail.gmail.com>
To: "Stanacar, StefanX" <stefanx.stanacar@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qemu: add recommend of kernel-modules for all qemu machines
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
X-List-Received-Date: Thu, 05 Sep 2013 14:40:11 -0000
Content-Type: text/plain; charset=UTF-8

On 5 September 2013 15:19, Burton, Ross <ross.burton@intel.com> wrote:
> On 5 September 2013 14:09, Stanacar, StefanX <stefanx.stanacar@intel.com> wrote:
>> I just tested that the third option can be done (for this case at least)
>> by changing ConditionPathExists=/proc/sys/fs/binfmt_misc/ to
>> ConditionDirectoryNotEmpty=/proc/sys/fs/binfmt_misc/ for
>> proc-sys-fs-binfmt_misc.automount unit file and
>> "df" doesn't complain as it doesn't attempt to automount anymore. On a
>> system which does have that module loaded there are two files there so
>> that's why the condition works.
>
> Confirmed, patch incoming.

I take it back, this is wrong.  When the module is available on disk
but not yet loaded the binfmt_misc directory is empty, so this change
means it shouldn't be automounting.  It is, which is... interesting.

Ross

