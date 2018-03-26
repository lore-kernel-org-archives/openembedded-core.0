Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f194.google.com (mail-io0-f194.google.com
	[209.85.223.194])
	by mail.openembedded.org (Postfix) with ESMTP id 0AB8B60125
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2018 11:23:05 +0000 (UTC)
Received: by mail-io0-f194.google.com with SMTP id r18so22789343ioa.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2018 04:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=6oQHGx3Vkt92yhrsLZvUdIuDHGjr6dXTZxFa1Nip7Gw=;
	b=cP4EVAYpSH8efAFSoZtlz9zQfyGLcmhnNLHTtXEz94PK8FsmEjJOPy07Q13w8Xyo9y
	AZAjjqE7DCdnJJREWZJ8/ukQsDaHyEh0+lIQV5vTJesvRdQo7QAKOWg5ML4yt7Br0uQt
	hhxg7Q3FSOm/SxC5JuFBhVeplAgmSKGFhZU4OXk+9qKK/o5kRiA/eU8Wq96Fbn3NBZn0
	4O+ArVdFkOw5vGif+UjvxPi0O9bQ0C6oy/Uub967YvBDgw/N0ivg1URfGyyLTCNv0Vzt
	rlExM9Q76IevDn3lIYYpG+mmvK8RpoPoNcyqriP3COcvJfBRCda+qtRMecG7NIPSr5Rp
	yWIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=6oQHGx3Vkt92yhrsLZvUdIuDHGjr6dXTZxFa1Nip7Gw=;
	b=BGd5NxRosUbP8SR9/UpAblFAWAxshVCDF/fb9clbYzT8Bzjm8fv/v61CNy3lzYdaYx
	m0xYqH/6PIfzwHlmqUU29mAjb862JnzRnsv62XCyNpy2RDOviOAwIlCg324j5GJpebXx
	IqKvyP3LvhfExTETIo7Sb51xecS4Tha1bh9Y4IpBFJ04YTbN2+GFEdRhNuC0vSs0w+P3
	Dg61H/ZzgSbd6EfyX3hvzgRAis3Fb/o1io5XJLJTRUdu6nSKR+UHjHWPg+go/XB2sgNl
	yYBtb2j532pYz/4LNMt7hERU5qJxLmBqPKgW+agjRWe9PYvKL7ufW4sFUJdG82gfyRor
	qo4Q==
X-Gm-Message-State: AElRT7GERBTkARMNaLJyRPPmBZvLhizAi0ORS2c6XxScNbru+yY37VVv
	L47L5OGzo+DERinl6yC+P/xB3L2gHC12NqnWE+buuQ==
X-Google-Smtp-Source: AG47ELuuUBv7tw/QTdqmLXfdgzBwqIpVUwAHYlT+iuzffYTSLkdHOK7fvT5FeLSs+AfsGiVrFpFhPkgbOLQlx/kbIAM=
X-Received: by 10.107.6.231 with SMTP id f100mr41137940ioi.23.1522063386017;
	Mon, 26 Mar 2018 04:23:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.30.9 with HTTP; Mon, 26 Mar 2018 04:22:45 -0700 (PDT)
In-Reply-To: <CALbNGRTFb-QQz-oj9CjBiskYdoSPoDXUnOPZ3pn7-km6L1Gm4w@mail.gmail.com>
References: <1522060814-13140-1-git-send-email-awais_belal@mentor.com>
	<CALbNGRTFb-QQz-oj9CjBiskYdoSPoDXUnOPZ3pn7-km6L1Gm4w@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 26 Mar 2018 12:22:45 +0100
Message-ID: <CAJTo0LYvGPg93xoaHvxX4PB5BNUfdPCnQfKr8TPyYA9pBMF5fw@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] matchbox-wm: fix QA issues with composite enabled
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
X-List-Received-Date: Mon, 26 Mar 2018 11:23:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 26 March 2018 at 12:15, Andreas M=C3=BCller <schnitzeltony@gmail.com> wr=
ote:
> On Mon, Mar 26, 2018 at 12:40 PM, Awais Belal <awais_belal@mentor.com> wr=
ote:
>> If we try and enable composite support using --enable-composite
>> through EXTRA_OECONF the following warnings are seen
>> WARNING: matchbox-wm-1.2.1-r0 do_package_qa: QA Issue: matchbox-wm rdepe=
nds on libxcomposite, but it isn't a build dependency, missing libxcomposit=
e in DEPENDS or PACKAGECONFIG? [build-deps]
>> WARNING: matchbox-wm-1.2.1-r0 do_package_qa: QA Issue: matchbox-wm rdepe=
nds on libxdamage, but it isn't a build dependency, missing libxdamage in D=
EPENDS or PACKAGECONFIG? [build-deps]
>> This fixes the above mentioned warnings.
>>
>> Signed-off-by: Awais Belal <awais_belal@mentor.com>
>> ---
>>  meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.2.bb | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.2.bb b/me=
ta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.2.bb
>> index 815a75f..58e21a4 100644
>> --- a/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.2.bb
>> +++ b/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.2.bb
>> @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D "file://src/wm.h;endline=3D21;md5=
=3Da7e844465edbcf79c282369f93caa
>>                      file://src/wm.c;endline=3D21;md5=3D8dc9d24477d87ef5=
dfbc2e4927146aab"
>>
>>  SECTION =3D "x11/wm"
>> -DEPENDS =3D "libmatchbox virtual/libx11 libxext libxrender startup-noti=
fication expat gconf libxcursor libxfixes"
>> +DEPENDS =3D "libmatchbox virtual/libx11 libxext libxrender startup-noti=
fication expat gconf libxcursor libxfixes libxcomposite libxdamage"
>>
>>  # SRCREV tagged 1.2.2
>>  SRCREV =3D "27da947e7fbdf9659f7e5bd1e92af92af6c03970"
>> --
>> 2.7.4
>>
> Maybe I missed something but from what I read it seems you are adding
> options to your EXTRA_OECONF and fix QA by adding dependencies for all
> cases.
>
> Isn't this exactly what PACKAGECONFIGs are for?

Yes, if the dependencies are only required when specific options are
turned on, then add a PACKAGECONFIG (or add the DEPENDS in your
bbappend where you turn the options on).

Ross

