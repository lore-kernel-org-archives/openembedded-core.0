Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f47.google.com (mail-vb0-f47.google.com
	[209.85.212.47])
	by mail.openembedded.org (Postfix) with ESMTP id 5F7C261862
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 15:21:50 +0000 (UTC)
Received: by mail-vb0-f47.google.com with SMTP id h10so1233638vbh.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Sep 2013 08:21:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=rJANCgoOuXxEAJmIXUGZsuTViK1Sz15Kle9OsRFRHrU=;
	b=a+Y+DPi+KUTwiOREUJBDLKaH2TgOk9tEuaDODg1U2m8MSDpEYbMuq4qSrCk1NyT7g0
	h62EvJeL7oLFJS3jMo77scH2ynuB9KDX3ORd+10C/Z3kTAeiNEf/YfemR5ldy6jiLFN6
	zQ0imGhL0gRfHzcX/tcJ7hLWBCuVESjPtZtlWidya/j009VAotVEVt5tGW6093oAaOFB
	UI/FE7mVay1X5CWKY9bVVulbMrnhxvoUvbfdo6YTRnB6V1CPDae2Z9cDDaUnRzmr5ojk
	9T9ZCE85PtpulBkI2YBQC7l2zCIBQ40fYhnwM/q8+dRkm0uc45UjuK6y7yyKBW8ECwiD
	fyGw==
X-Gm-Message-State: ALoCoQm0cVUtCk0cn7aYLwNlp3XV7jRRnGperTNaCpk6zkPaqkjxnBCaFE/msrXMSDxz+TB5simn
X-Received: by 10.52.166.200 with SMTP id zi8mr603652vdb.38.1378394512095;
	Thu, 05 Sep 2013 08:21:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Thu, 5 Sep 2013 08:21:32 -0700 (PDT)
In-Reply-To: <CAJTo0LZ6FHdDe0NgE0sQvqg+pF4hf_MjvRDe1L=HV-7021EAOg@mail.gmail.com>
References: <cover.1378339881.git.dvhart@linux.intel.com>
	<4562a00806c5a6573b5aa650764ad12bc93edda7.1378339881.git.dvhart@linux.intel.com>
	<CAJTo0LY-oi+tQy7rs84axy4R71Y4j=HtEgXALN20aVdATwzVdg@mail.gmail.com>
	<1378392729.14029.73.camel@dvhart-mobl4.amr.corp.intel.com>
	<CAJTo0LZ6FHdDe0NgE0sQvqg+pF4hf_MjvRDe1L=HV-7021EAOg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 5 Sep 2013 16:21:32 +0100
Message-ID: <CAJTo0LY=p5Gafe-4i7i3Cs01hqrFFOsMzRGovfurpF1gqX=9xg@mail.gmail.com>
To: Darren Hart <dvhart@linux.intel.com>
Cc: yunguo.wei@windriver.com, Poky <poky@yoctoproject.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] xf86-video-mga: Pull in Matrox MGA support from meta-intel
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
X-List-Received-Date: Thu, 05 Sep 2013 15:21:51 -0000
Content-Type: text/plain; charset=UTF-8

On 5 September 2013 16:11, Burton, Ross <ross.burton@intel.com> wrote:
> On 5 September 2013 15:52, Darren Hart <dvhart@linux.intel.com> wrote:
>>> Assuming success in an distro where opengl isn't enabled will result
>>> in the driver believing that DRI is enabled when it isn't, so expect
>>> to see build failures from this.
>>
>> Should we be adding a distro depends on opengl for this driver as is
>> being done for others currently?
>
> No, because DRI is optional in this driver.  Follow opengl and flip
> --enable/disable-dri.
>
> (assuming I don't change the server to always build DRI)

Follow-up.  Using PACKAGECONFIG to respecting the "opengl"
DISTRO_FEATURE and --enable/--disable-dri should work for the MGA
driver.  dri.h is part of Mesa, so obviously opengl and DRI are
entwined.

Ross

