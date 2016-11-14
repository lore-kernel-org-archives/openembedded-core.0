Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id DAADE70100
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2016 10:38:50 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id a197so89703048wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2016 02:38:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=9pLYlgIX/028NgTmm7qECf2q9MjSIkR6+54aq1K7Vg4=;
	b=Eyie7ZDdwndiHLPwIHJ+/z0/Uf467vGEN1OjWppHISRZ6PFWtg2AhYDN2ZdhLoQ5Gk
	s0RHU9llyARpLyd0Ywvi0neWSIMdttbSy+EYqhvWcjmTCZof8YhbYHUcIsBirG2zg1fj
	FYkX4i1I7UG68c6Fzb5onzvXNocz+EWee2DwpJjtAlCtbEeD86v742L6cDfu7VT4JCd9
	hZ2fszkGMUEjcqVdw5M9ymgR4YBpYuQsjI0KpdEB91toYU8bhz1w/rzw0/PxyR0WK0yD
	bYeCdhrrXiXJwEJFprFJ+8VSjBRZbYjFYzwP03pzhrMZ0j0w7hTAgNjvh1d5xLv+l9xW
	iNiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=9pLYlgIX/028NgTmm7qECf2q9MjSIkR6+54aq1K7Vg4=;
	b=JfIQ46JkpJ7Q4FjtLZIFkTWONNV0nUwsRFITIClBWr+2xIlhmgH6Q624+3SWkXNsLe
	wZQvQBvCzVipGNHigLJvptsLzxnS9q7D0syFuI4likukK02scy2GBA4R6N8MvHpYm8Bm
	rCOb74ipOuSgG4fgl6DcmMp5nRevVWtk/0jIybtBMVEUvOfUcsLhn3IBQeu9oHo4rmB9
	g5Wlmd1uaX4/9uL9i5zfJEq3lYdMGV2g1F8ebY8yNMs6EAiAJ/9rdybzpRyICZGSEy2i
	T8O0Jh5pnENuWRuWNXAwTMGS5ZOADB/OnR7R8MHEtpVQJZEIuWiE9ybJSQfstJR7wB3J
	ZX/A==
X-Gm-Message-State: ABUngve/moVENjirJmtQKDtoYMxjoS3Ezyn7xAYrikdnWWKNqAWLpWiHiG+QMsCJCNwTzFr7VGCwPY7Upic0kw==
X-Received: by 10.28.66.7 with SMTP id p7mr10170207wma.64.1479119931951; Mon,
	14 Nov 2016 02:38:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.15.9 with HTTP; Mon, 14 Nov 2016 02:38:31 -0800 (PST)
In-Reply-To: <CAD4b0_KMU9ba8-EhtLOLqnp1XGLGryKGLVfYZUQVjaZgeSZsKg@mail.gmail.com>
References: <cover.1478779674.git.maciej.borzecki@rndity.com>
	<504135c9082216ff89af282dfcb686a50b22f578.1478779674.git.maciej.borzecki@rndity.com>
	<CAJTo0LbKYTd9SRZgHHHyuF0Wt+7AqYdLcweUTO78ROgYsG9VYA@mail.gmail.com>
	<CAD4b0_KMU9ba8-EhtLOLqnp1XGLGryKGLVfYZUQVjaZgeSZsKg@mail.gmail.com>
From: =?UTF-8?Q?Maciej_Borz=C4=99cki?= <maciej.borzecki@rndity.com>
Date: Mon, 14 Nov 2016 11:38:31 +0100
Message-ID: <CAD4b0_JW-zxqcsuRQzk69in17OgG1SOo7EjpeAK8Nf72B7X_Vg@mail.gmail.com>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
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
X-List-Received-Date: Mon, 14 Nov 2016 10:38:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 10, 2016 at 9:33 PM, Maciej Borz=C4=99cki
<maciej.borzecki@rndity.com> wrote:
> On Thu, Nov 10, 2016 at 9:15 PM, Burton, Ross <ross.burton@intel.com> wro=
te:
>>
>> On 10 November 2016 at 12:18, Maciej Borzecki <maciej.borzecki@rndity.co=
m>
>> wrote:
>>>
>>>      def test_qemux86_directdisk(self):
>>>          """Test creation of qemux-86-directdisk image"""
>>>          image =3D "qemux86-directdisk"
>>> -        self.assertEqual(0, runCmd("wic create %s -e core-image-minima=
l"
>>> \
>>> -                                   % image).status)
>>> +        wic_cmd_vars =3D {
>>> +            'wks': image,
>>> +            'image': self.OE_IMAGE,
>>> +        }
>>> +        self.assertEqual(0, runCmd("wic create %(wks)s -e %(image)s" \
>>> +                                   % wic_cmd_vars).status)
>>
>>
>> Is it just me who thinks that this is more understandable then?
>>
>> def test_qemux86_directdisk(self):
>>   self.assertEqual(0, runCmd("wic create qemux86-directdisk -e
>> core-image-minimal").status)
>>   self.assertEqual(1, len(glob(os.path.join(self.resultdir,
>> "core-image-minimal-*direct"))))
>>
>> Not my test case so just an opinion :)
>>
>
> Now that I look at this patch, I probably might have overdone it a little=
. Let's
> wait and see what Ed thinks about this change. I suppose there might be a=
 need
> for v3 of this series, in which case I'll just drop this patch and rebase=
 the
> remaining patches.

Ed, did you get a chance to review this series?

Cheers,
--=20
Maciej Borzecki
RnDity

