Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id F27AD77532
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 Jun 2016 08:41:23 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id n184so4230174wmn.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 Jun 2016 01:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dominion-thruhere-net.20150623.gappssmtp.com; s=20150623;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=X4FeDzlxF+kKpMIEk7lEj6dOQbC5fq8VX81YQjdBzvs=;
	b=brd7BbH5I0RDd8MvAzGBjc20Gj6UH5VRsWexOrM+112tz5JTrWq8bsyQpXqvayjQRB
	UAYkbkckPjeg3I192cvvoUI6pVg8um9wpzAKmKlSDPpQzUAIcAF/ic5Op2vG0faFHKpF
	Lh4ydI2V/J3G8i7y4iVGCmxd1ghivyibZGAlEcP/JgaJTETxg/0/IJ0ocoUYx7eiEcex
	GP1S32ff5iosZV6nkwlarevCWTfnznjMpEgoQj0jnpPLgvGC663p5lp8mgBq1mgCKNLr
	YDR42o2Vu5U5UooKH+Xxcb2smgzZK5FhPJ5DhVwoA3lkJ1wIzcVQlJ5cfpmDM6f+l6NR
	6nMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=X4FeDzlxF+kKpMIEk7lEj6dOQbC5fq8VX81YQjdBzvs=;
	b=Jn4RC9bk5wwwty+zf6exZAHW1at+PvHNFNTie4gKRJWcKSCW4HYV962W9Mhgead8Bw
	+YYGToAIJWa1in7e3ohpRKtVXGt33sJvfo/qjpTchPUkYYNDwABVtL534nwOiRVUjmK9
	3Uj9ri7p2S09A6v5F0MN6oJ4lGQhh2BqvbJ78gh+HPbWcWMiGf4KQDo2Jzo3Ci0ms9eQ
	wbimYp5KA8ADwL2yj2aXtqiD4EUpLOYbPI1F3ud+q/cf34cLOfRTB05P7YSkJUFlU8dz
	kLm5sybSRDKs3GpGk0qOus5WL1neCCEGkujwLDvZtl2ANmVZO0DFZ9FRXvt6CinuqCTV
	g9/g==
X-Gm-Message-State: ALyK8tLsbMGdB4HemDW2mkX4X2a6AfZOEbFB88X0eijUvlmA3UlHPZD6hSNnEy07pfXLxQ==
X-Received: by 10.28.47.70 with SMTP id v67mr3195707wmv.56.1465029683777;
	Sat, 04 Jun 2016 01:41:23 -0700 (PDT)
Received: from [172.20.0.187] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by smtp.gmail.com with ESMTPSA id
	uq7sm9554346wjc.19.2016.06.04.01.41.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 04 Jun 2016 01:41:22 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <0FCEA83D-C569-48F0-AFAA-2E9D5BD96820@dominion.thruhere.net>
Date: Sat, 4 Jun 2016 10:41:21 +0200
Message-Id: <32A5DABC-B911-4C2E-B9CD-A520BCA395EC@dominion.thruhere.net>
References: <1464025857-23995-1-git-send-email-koen.kooi@linaro.org>
	<0FCEA83D-C569-48F0-AFAA-2E9D5BD96820@dominion.thruhere.net>
To: Koen Kooi <koen.kooi@linaro.org>
X-Mailer: Apple Mail (2.3124)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Revert "image.bbclass: don't execute compression commands multiple times"
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
X-List-Received-Date: Sat, 04 Jun 2016 08:41:27 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

ping 2

> Op 30 mei 2016, om 13:28 heeft Koen Kooi <koen@dominion.thruhere.net> =
het volgende geschreven:
>=20
> ping
>=20
>> Op 23 mei 2016, om 19:50 heeft Koen Kooi <koen.kooi@linaro.org> het =
volgende geschreven:
>>=20
>> The commit breaks image_types_uboot.bbclass:
>>=20
>> ERROR: Logfile of failure stored in: =
/build/linaro/build/build/tmp-glibc/work/genericarmv8-oe-linux/linaro-imag=
e-minimal-initramfs/1.0-r0/temp/log.do_image_cpio.16506
>> Log data follows:
>> | DEBUG: Executing python function set_image_size
>> | DEBUG: Python function set_image_size finished
>> | DEBUG: Executing shell function do_image_cpio
>> | 31373 blocks
>> | Image Name:   linaro-image-minimal-initramfs-g
>> | Created:      Mon May 23 19:38:56 2016
>> | Image Type:   ARM Linux RAMDisk Image (gzip compressed)
>> | Data Size:    7326620 Bytes =3D 7154.90 kB =3D 6.99 MB
>> | Load Address: 00000000
>> | Entry Point:  00000000
>> | mkimage: Can't open =
/build/linaro/build/build/tmp-glibc/deploy/images/genericarmv8/linaro-imag=
e-minimal-initramfs-genericarmv8-20160523173835.rootfs.cpio.gz: No such =
file or directory
>>=20
>> This reverts commit 94f61c2682e5cfd819ac84535650c3e0a654415a.
>>=20
>> Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
>> ---
>> meta/classes/image.bbclass | 8 ++------
>> 1 file changed, 2 insertions(+), 6 deletions(-)
>>=20
>> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
>> index 9f4c83f..df3bd3a 100644
>> --- a/meta/classes/image.bbclass
>> +++ b/meta/classes/image.bbclass
>> @@ -410,13 +410,9 @@ python () {
>>                    # Create input image first.
>>                    gen_conversion_cmds(type)
>>                    localdata.setVar('type', type)
>> -                    cmd =3D "\t" + localdata.getVar("COMPRESS_CMD_" =
+ ctype, True)
>> -                    if cmd not in cmds:
>> -                        cmds.append(cmd)
>> +                    cmds.append("\t" + =
localdata.getVar("COMPRESS_CMD_" + ctype, True))
>>                    vardeps.add('COMPRESS_CMD_' + ctype)
>> -                    subimage =3D type + "." + ctype
>> -                    if subimage not in subimages:
>> -                        subimages.append(subimage)
>> +                    subimages.append(type + "." + ctype)
>>                    if type not in alltypes:
>>                        =
rm_tmp_images.add(localdata.expand("${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${ty=
pe}"))
>>=20
>> --=20
>> 2.4.3
>>=20
>> --=20
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>=20
>=20


