Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id BEC5B7317E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 18:40:04 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id p63so131637934wmp.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Feb 2016 10:40:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=uddWRi8Kr2a8EHLLvLnRl+Vq2elEzUxheNTIy2+I4tQ=;
	b=Z7STTLVk065rOTZ3QRM2L6D4oqheQ8xu7fkeoqz9Dfmpaxo1fAxAhAz/qkX2z/4ks7
	KIeXuZKblujEGzmJUkXV+s7RnS/dtKDcwSvmeEf0FIK5HVFHHifDFpzIEyaJt4F50oNR
	vzvNVoueXR8FOARF0i1S3H8Fgljv6ImSA+/mlanUmxfpcuQyXTFKBE4tno077dCsTDSA
	0fwBNTltFja+9PEWSqWzBSq1BplNkGcmAvxfKH2BTYLpYsSpQtJDLa8wBI3oOZwE4hh8
	yCRattFwDqayBVQ4J2qdvQdvaS9AjscA3+cYDZMRGoCf9xIyZQ8TP5e+rJoyCgLsjImM
	Jxpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=uddWRi8Kr2a8EHLLvLnRl+Vq2elEzUxheNTIy2+I4tQ=;
	b=KnwbJQ2HLyRWWxFx+U9iq6Drh10z3PLm+YKv/z5N945BeaLNXxGAlXDz+gmy64WAZT
	d1MlfaN49TRtMPhvX8gH35rgtFkjNfag/Foz6pCuprnFmEsHmLWdtQYCqBJUbkDyBkTY
	7bxNrzRl+IJdcieL9TYBdre720UM6veWleFXUD4RBrEKuw94k/WIpCb22mHiaLjMotwk
	n9aT7lawkxj6wcqZwEnLA4KlOY96FYVbWMqkToV0PTcD+2MughNC/vqJ0ieyx45isq6j
	CR7V+lchyRC8s06gPzzEvWiU4C+ECJXD531nWsBqU40dN5efp95xaUag88tpM0I5X8OX
	IblA==
X-Gm-Message-State: AG10YOSYH7znWsgCWVPKuIRH+jQuwUgAwgIdjDBBPMes3NvJDZWaMQL8HCA7bW0N6ebW8XZhIIFZu4BMR6WrlA==
MIME-Version: 1.0
X-Received: by 10.28.53.193 with SMTP id c184mr18956015wma.4.1454438404592;
	Tue, 02 Feb 2016 10:40:04 -0800 (PST)
Received: by 10.194.209.131 with HTTP; Tue, 2 Feb 2016 10:40:04 -0800 (PST)
In-Reply-To: <CAJTo0LZ5BC4MWpaHL2Zk=ts5iJ-7-U9UQAVetBLwqUzEBLs0Qg@mail.gmail.com>
References: <1454363382-13387-1-git-send-email-armccurdy@gmail.com>
	<CAJTo0LbfKq2CtEj3Y8zBmgQiXPNJF4587R2httpbmsNHgG+mhA@mail.gmail.com>
	<CAJ86T=XibuPtxUY2c+TQ35_KdBO47wRoCuSehgTbGfaR+tb8_A@mail.gmail.com>
	<CAJTo0LZ5BC4MWpaHL2Zk=ts5iJ-7-U9UQAVetBLwqUzEBLs0Qg@mail.gmail.com>
Date: Tue, 2 Feb 2016 10:40:04 -0800
Message-ID: <CAJ86T=UJL+69b2nvcnEWJyUjA_KYwi91kbUz88hcKOQwPE+ONg@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFT][PATCH] curl: disable curl-config binconfig file
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
X-List-Received-Date: Tue, 02 Feb 2016 18:40:07 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Feb 2, 2016 at 3:23 AM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 2 February 2016 at 04:18, Andre McCurdy <armccurdy@gmail.com> wrote:
>>
>> Thanks. Unfortunately I don't see a clean solution for this. The
>> setup.py script uses curl-config to determine which ssl implementation
>> curl has been built against and that information isn't available from
>> pkg-config.
>>
>> It's probably fixable with some surgery, but I'm not sure it's worth
>> the maintenance effort just so we can disable curl binconfig...
>>
>> Please drop my "curl: disable curl-config binconfig file" patch.
>
> The feature tests?  That's exposed in pkg-config as the supported_features
> variable.

setup.py actually parses the output of curl-config --libs (ie "-lcurl
-lnettle -lgnutls -lz") to decide which ssl implementation curl has
been built against. There's nothing in curl's pkg-config file which
gives that same information.

A second question is why pycurl thinks it needs to know which ssl
implementation curl is using. I don't think it really does, but fixing
it and then rewriting setup.py is not a trivial patch.

> I wouldn't be surprised if more recipes in meta-oe were using
> curl-config though, so I do agree with you here: moving away from
> curl-config would be good but scoping out the damage in a world build
> including meta-oe needs to be done first.
>
> Ross

