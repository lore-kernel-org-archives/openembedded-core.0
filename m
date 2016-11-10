Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id E031F65C90
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2016 20:33:52 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id f82so55359565wmf.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2016 12:33:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=g2pYarRe1hZe1mqcgnBUJpiuugyoaBODOTuwhdt6E4c=;
	b=GigSqMx111vkW0hSI7WvzCZeINoM+NkDT07yISuvI1BqpzDeVuUpuT46LdrFz3sVBz
	kgy1egeCX4IysYlTTWDA/RWnBFU60Dr1VP7vksufik6bPtsFtK4RyBXqcKGeFOSSnQC5
	piJKnvKJufDXWFxnVeIPITXhABA2HRCqzIlzBT3T3KVeIfof/Ozl6ifmdmx9GEjFrErL
	/AMIzvZFqmwksnzbJ3c12+oklJAmufV/TGPQ8qN2MOo4oV1kkrUy6NAroWVL4iwgXIhB
	EO93v5Ahc7/10dnzNgAaL0o38M/t2+jCdkU4cs/I1G7yyPHV3dRrYxXtIQ/5STlJSsw0
	J0zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=g2pYarRe1hZe1mqcgnBUJpiuugyoaBODOTuwhdt6E4c=;
	b=J2kHjR8069OKKOmKpSv52n646D6kt8l07BceNeV6WIbmx/aZ59O+0bzyOS0NdY6x62
	NuESgMabR8vSg74zPkzDmsHCRlUnOuWcvxQcBXwRKXUFnWSGw4KvT7m/4vMq/q/97/+J
	SfBrWaufi4mESUzb6ZprCVvstqj7kGNy42oVluKo5YK7rb41oTkGGkXZw2uzs+01WxYn
	VU1sTykHZxui0nA5xLZxAzyiQ6naEpmw1vJwo7MIu1C9PcQuXnhvN4X2nbXLzmze1ufD
	eYUZMkzGqSwT1iv9xLVEZ+H2TTuCC1o+kfJc4AZjzMrffFW0e1h+6p0twjCMMlYkfIGd
	wl/Q==
X-Gm-Message-State: ABUngvdpIsjUtsrid76ZcnSS96BG+Cbx7v4gBHCLNgbkGyxNBGiLEI15lpf3bSB44iyo3z8ZoZyKcMyMtvQwWQ==
X-Received: by 10.194.231.8 with SMTP id tc8mr5900140wjc.193.1478810033930;
	Thu, 10 Nov 2016 12:33:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.15.9 with HTTP; Thu, 10 Nov 2016 12:33:33 -0800 (PST)
In-Reply-To: <CAJTo0LbKYTd9SRZgHHHyuF0Wt+7AqYdLcweUTO78ROgYsG9VYA@mail.gmail.com>
References: <cover.1478779674.git.maciej.borzecki@rndity.com>
	<504135c9082216ff89af282dfcb686a50b22f578.1478779674.git.maciej.borzecki@rndity.com>
	<CAJTo0LbKYTd9SRZgHHHyuF0Wt+7AqYdLcweUTO78ROgYsG9VYA@mail.gmail.com>
From: =?UTF-8?Q?Maciej_Borz=C4=99cki?= <maciej.borzecki@rndity.com>
Date: Thu, 10 Nov 2016 21:33:33 +0100
Message-ID: <CAD4b0_KMU9ba8-EhtLOLqnp1XGLGryKGLVfYZUQVjaZgeSZsKg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Maciej Borzecki <maciek.borzecki@gmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 08/10] wic: selftest: do not repeat core-image-minimal
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
X-List-Received-Date: Thu, 10 Nov 2016 20:33:54 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Nov 10, 2016 at 9:15 PM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 10 November 2016 at 12:18, Maciej Borzecki <maciej.borzecki@rndity.com>
> wrote:
>>
>>      def test_qemux86_directdisk(self):
>>          """Test creation of qemux-86-directdisk image"""
>>          image = "qemux86-directdisk"
>> -        self.assertEqual(0, runCmd("wic create %s -e core-image-minimal"
>> \
>> -                                   % image).status)
>> +        wic_cmd_vars = {
>> +            'wks': image,
>> +            'image': self.OE_IMAGE,
>> +        }
>> +        self.assertEqual(0, runCmd("wic create %(wks)s -e %(image)s" \
>> +                                   % wic_cmd_vars).status)
>
>
> Is it just me who thinks that this is more understandable then?
>
> def test_qemux86_directdisk(self):
>   self.assertEqual(0, runCmd("wic create qemux86-directdisk -e
> core-image-minimal").status)
>   self.assertEqual(1, len(glob(os.path.join(self.resultdir,
> "core-image-minimal-*direct"))))
>
> Not my test case so just an opinion :)
>

Now that I look at this patch, I probably might have overdone it a little. Let's
wait and see what Ed thinks about this change. I suppose there might be a need
for v3 of this series, in which case I'll just drop this patch and rebase the
remaining patches.

Cheers,
-- 
Maciej Borzecki
RnDity

