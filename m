Return-Path: <ross.burton@intel.com>
Received: from mail-ot0-f193.google.com (mail-ot0-f193.google.com
	[74.125.82.193])
	by mail.openembedded.org (Postfix) with ESMTP id 44EDF74AD7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jun 2018 15:47:39 +0000 (UTC)
Received: by mail-ot0-f193.google.com with SMTP id i17-v6so4703413otl.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jun 2018 08:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=d45uDJBXWOQ2i6jZxV9w9KDH24Yc7T9D8dJHiq1ldkU=;
	b=KdFmGwM09IY2hpXyx7JTf2Ivgkpri71sPh8HmskV/5JaHc0Kk/CPHxnElBwZ4YnK9a
	tzWwJM4Ak+JMPQRxeVTN1QM2hgnzDzZ49Wshpul9V0Y/PtwNa6n+UnP4jAPRmVagM99f
	WzhyYgDJK+QKo9j4Itr+9MWS4V4Q9NvKuhRv/k/d1MF9UOGIzjCZ2Dj2qkuEQvWPUEg2
	5Ln2nXi8Ff5rf+5lx9PZ7YT5ai/fMDgWS/cMdZtmcSmhrfjrio8H9vKarEfJ2bPB3TC7
	8qk43YmUjXu9cgWgujK5LIibAGCCyWIQbsfae/7zRf3EzpF1ie61Spy3wU6rIAFE9WtP
	CryQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=d45uDJBXWOQ2i6jZxV9w9KDH24Yc7T9D8dJHiq1ldkU=;
	b=bmWmBzbZKnBwDND1tq981P2TTUQr5iYHzKMuZTvcO2INpjzdNoSmYJta7ik/LsYUSN
	KcaspIFvBpWwiMe9H9K1F8pZeQJZTENMGy9+GK9UnxdCjzUq7undTZeqjygZn4gWywLZ
	Kucxs1LmOnBvJwY0oco1/Bc5Ci6aqDcpZXUuJP+9SFi8xRDvVFmzg9faCS1OSgvxCRdC
	m8NG2qVSDO8rnB4Nzpr94Zi7ZaiibY6ex2ejMWoLWjsSYnG0/B/3aBdYQTiSZzF0Fgvg
	pCTMoJiaaKJslB0K2cIvk8hAv492+JuKt3UhGI0qI1GaVaXboebvPWSmURmCQFxuaGE3
	fQ6g==
X-Gm-Message-State: APt69E2PCAWpiW80ZoVVK4DsQEP5Zqdm4V51FoD+IzHJfN7p2YrHf8Oe
	Jy9KX2LC+k8L5yiU8fuD+bqHoV5xJD0Uu+2HgggeQw==
X-Google-Smtp-Source: ADUXVKKG/bqZYaenZkq+t/WLMgNle7bkNYy1FSM0VYJLqYx/lenYP35/GCUhwSUtFIdTEYww7TL/xK0FdRkmkwIvCws=
X-Received: by 2002:a9d:1553:: with SMTP id
	z19-v6mr7179788otz.135.1529941660055; 
	Mon, 25 Jun 2018 08:47:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:434d:0:0:0:0:0 with HTTP; Mon, 25 Jun 2018 08:47:19
	-0700 (PDT)
In-Reply-To: <CAJ86T=XcvARBBjkiaCmhqEFwZZW0ez-Spx+FY-C+6MjPGaxkOg@mail.gmail.com>
References: <1510668898-21058-1-git-send-email-shashwatx.pandey@intel.com>
	<1510668898-21058-2-git-send-email-shashwatx.pandey@intel.com>
	<1510654305.4049.60.camel@andred.net>
	<CAJ86T=XcvARBBjkiaCmhqEFwZZW0ez-Spx+FY-C+6MjPGaxkOg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 25 Jun 2018 16:47:19 +0100
Message-ID: <CAJTo0LaRMOi+GXfnEOu8X1rvZyLMHvJ7D+GGPiqXtJrX=xgXNQ@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] Image_types: use ustar format in cpio command
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
X-List-Received-Date: Mon, 25 Jun 2018 15:47:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Was reminded about this by a bug review.

The original bug was about cpio images in general, not initramfs.  It
was a sdk-ptest image so no doubt that does have some huge files, but
yes 4GB is still bigger than you'd expect.

I'll kick a build and see if I can replicate...

Ross

On 14 November 2017 at 19:10, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Tue, Nov 14, 2017 at 2:11 AM, Andr=C3=A9 Draszik <git@andred.net> wrot=
e:
>> On Tue, 2017-11-14 at 22:14 +0800, Shashwat Pandey wrote:
>>> Using ustar format due to ROOTFS size exceeding issue.
>>> Ustar supports up to 8GB.
>>> Where as newc support up to 4GB.
>>>
>>> [YOCTO #11674]
>>
>> Do recent kernels actually support ustar for initramfs? I thought it onl=
y
>> supported newc? My 4.9 kernel certainly still only mentions newc...
>
> Also note that the sizes being referred to are actually the "file size
> limits for individual files" not the total cpio archive size.
>
>   https://www.gnu.org/software/cpio/manual/cpio.html
>
> What's the case where > 4GB files are needed in an initramfs?
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

