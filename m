Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f48.google.com (mail-oi0-f48.google.com
	[209.85.218.48])
	by mail.openembedded.org (Postfix) with ESMTP id 4DBF2790AB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2018 09:01:51 +0000 (UTC)
Received: by mail-oi0-f48.google.com with SMTP id v8-v6so865939oie.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2018 02:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ktWWc/br0axWUVWixRquGQ7w+h95hz+aBwl/GIgjHw4=;
	b=TdtOLgqtjcIcC8dqWIKhy101/+/JvnLmOIG0f3TPRA1iJqqwHXxNidyEr3CTdpIhri
	v+rN3PJlCW0dX3lk+oVssBiCa2D8Szd0rwz1tzcpjy12dAo5sEwyUDD3Izx5TmrbxTtK
	fOmNu/CP1sdj8tGGI19F4hoPQRpQwDFAIeP1vYpGKGhhDVVQUv4YmCS2Zo4c9g5kYYZS
	aNEnNjsotgxds/osJAgR5mYCFkbu8GmPRU5AltlqIR5DPLdU0MWEjPC6vJhm1Ez3ZdZZ
	jCXFKjMjntoyoodmR198aW9BwkXm4GmD8tfmuemWzOuQz6t58Ad9/vF0POHl2dVqphAl
	CNkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ktWWc/br0axWUVWixRquGQ7w+h95hz+aBwl/GIgjHw4=;
	b=lKIYozBicjLjkBYvy632I8UngAz7hK+LsRrNOFZS7tEtmtkcfmV23B2XECDKVXS7Eh
	Irmy0a9+P53BVMU7J1iTHrrhOgUtwMM0Vh+vJtGoDeo2V4bK3pwk6Q9/s6+aWuu7MhaM
	M8cRdjXhRW3kUz32tgYChK/gNcIRUcWDDzBwtdgcbSsjZEQTokqiyNPJCllYVrQHRiZB
	Jzg9CiDpZ7lSzRtBsNbnSQHVuEwwl5Q5rc/bTN0hlIeUQ5u8iORh669XEBfGHDsCzOKd
	aJjY6A5It1Cjefu0lJhil88vYubrHt+NJyiayImPqeZwiIuynbihsZ+T+DKg4ND+5Kyg
	U05A==
X-Gm-Message-State: AOUpUlFhjsQTfJmF5JG3kLVkuCL1bCdBaQHDIpxoTykRGV4mDZlES+IY
	HXDlrNVzyFIGirilY4z7urSHyO0vWtChln30lzN19A==
X-Google-Smtp-Source: AA+uWPzJsJB40mk2xnX4wPaLhZKkTAJIa6x2cAsQunAd/f7Kw/dPEIWgiJzNEHFgNvWPGeBsuJt59OCqQYPjMIgOMDs=
X-Received: by 2002:aca:5dc5:: with SMTP id
	r188-v6mr26702602oib.320.1534323711698; 
	Wed, 15 Aug 2018 02:01:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:6845:0:0:0:0:0 with HTTP; Wed, 15 Aug 2018 02:01:31
	-0700 (PDT)
In-Reply-To: <CA+NJmkdCRHgRLUZz0bm3sALnCt+o91g=rDG4Rht+Q8H5MVBj6Q@mail.gmail.com>
References: <CA+NJmkes2FzO3OvTVxjL075A5G_UMUjj_J-oc1BtjThTQ=YiZg@mail.gmail.com>
	<CAJTo0LaSOFApbGM6OpBWhkQUEdPk9qvXy-q+HWyiSVMku7G4=g@mail.gmail.com>
	<CA+NJmkdCRHgRLUZz0bm3sALnCt+o91g=rDG4Rht+Q8H5MVBj6Q@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 15 Aug 2018 10:01:31 +0100
Message-ID: <CAJTo0LZ7azGBFnSSmULFpo32ijcU-5p8Or6OjMN1asddsWPj_w@mail.gmail.com>
To: Isaac Nickaein <nickaein.i@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: iotop: failure, python module subprocess is missing
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
X-List-Received-Date: Wed, 15 Aug 2018 09:01:51 -0000
Content-Type: text/plain; charset="UTF-8"

That's the fix: please send the patch to
openembedded-devel@lists.openembedded.org as a proper patch against
the recipe.

Ross

On 15 August 2018 at 09:33, Isaac Nickaein <nickaein.i@gmail.com> wrote:
>> Yes.  Should be a simple fix. :)
>
> As a workaround, I added  iotop_%.bbappend to my layer with following content:
>
> RDEPENDS_${PN} += " python-subprocess "
>
> This fixed the issue but I'm not sure if this is the *correct* fix.
> There could be some other bug or some other higher-level missing
> dependency that could be overseen.

