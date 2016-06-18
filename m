Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 9880470100
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jun 2016 13:13:23 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id c82so818913wme.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jun 2016 06:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dominion-thruhere-net.20150623.gappssmtp.com; s=20150623;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=EovxkgMeZ228H1Te+r+6Ci1LRDqwtoP+kfVTbLVQp/Y=;
	b=Wufv6vrDaAERRixemMWFIRWyI/Cavcc8o5ZbXxEwqqTw2WDCPe+rUWvhEqzCZUb64Q
	45B3cvtY7Wmt+35q9Y9Z7y9bUt/Mq9lfOlmEFArYzhNMqjKbbvjeRdUzZ3IzfS5X19rC
	44QSQllhykd8cSlDvBof3qhtizM0sAwHh7FXuI4OGZ/G2Wd0nN4WpwsAWSTQcjIKswAm
	eTe4qc8s+1bemFTtlVIxvx4upMI/+6r1QQn4EkoRe3/O94hDgUd/CfMf1x+996lnntqp
	Zn77+vLBunFiLF8FXgeAgA95YT9E60mDikJ52cSJQRxMjc4qp0zCi8Gmz5oFHdbyHPNA
	MpNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=EovxkgMeZ228H1Te+r+6Ci1LRDqwtoP+kfVTbLVQp/Y=;
	b=FXY/dv+kPv9pgPyYS5SOKhiRlJh/qODFw2fOQ1zDtkrCxWuUmtFRN5MGxxoxh4qxRS
	h6PzKDoeEzfuHQxJhL2K4gOylSyELFdk472IlEet3ruZEwMNK4nU5IQqfJxh4nlJd2KJ
	oZWoJzWcYjpWsI/3J6uQmhBbVceR6d8HFMJVT+FY8EHMtlDpKlLuwXGPEjrvIqpxgjjp
	kCSZ3Re7FLOE1bsAo3G1pO1HWnNk6YROmJ/0RyZoBy0W/OHPD6nTwAK5Q0uIbiOQgHT8
	G6onACz1/l0pdC6wuiKAd0y48rDpsNV36DqXkH/wvq/hB5ILZUT91TUEo9DTdNcPQ4Db
	ajvg==
X-Gm-Message-State: ALyK8tKPOcbgBLc5Bv3LQbLUCvsXW/KjCnZiWioGjdmoBKCnARdcFHF6UnfmANGXdzM6Ow==
X-Received: by 10.28.46.141 with SMTP id u135mr3015182wmu.74.1466255603464;
	Sat, 18 Jun 2016 06:13:23 -0700 (PDT)
Received: from [172.20.0.187] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by smtp.gmail.com with ESMTPSA id
	v70sm3659656wmf.18.2016.06.18.06.13.22
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 18 Jun 2016 06:13:22 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1465045799.13979.33.camel@linuxfoundation.org>
Date: Sat, 18 Jun 2016 15:08:04 +0200
Message-Id: <F5F5FC08-7E44-4648-A769-EC4D8F4D9EB7@dominion.thruhere.net>
References: <1464025857-23995-1-git-send-email-koen.kooi@linaro.org>
	<0FCEA83D-C569-48F0-AFAA-2E9D5BD96820@dominion.thruhere.net>
	<32A5DABC-B911-4C2E-B9CD-A520BCA395EC@dominion.thruhere.net>
	<1465045799.13979.33.camel@linuxfoundation.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.3124)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Koen Kooi <koen.kooi@linaro.org>
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
X-List-Received-Date: Sat, 18 Jun 2016 13:13:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Op 4 jun. 2016, om 15:09 heeft Richard Purdie =
<richard.purdie@linuxfoundation.org> het volgende geschreven:
>=20
> On Sat, 2016-06-04 at 10:41 +0200, Koen Kooi wrote:
>> ping 2
>=20
> It would be helpful if you'd cc'd the person who's patch you were
> suggesting we revert. I added Sasha to cc.

Since the original committer has shown zero interest in responding here =
or fixing the problem in the past month, can you please commit this? =
This fixes a clear regression, which alone should have been reason =
enough to commit this.


>=20
> I've seen multiple different conflicting patches regarding the image
> types code and I've not had a chance to try and figure out what the
> real set of problems are and which of the various proposed patches =
make
> things worse or better.
>=20
> Until someone can explain clearly to me what the problems are and how
> we move forward, or I find time to dig into it myself, we're a bit
> stuck :/. I just mention this since I expect you're getting frustrated
> hearing nothing. This has been flagged in my inbox, I'm just lacking
> the time to do everything I'd like :(
>=20
> Cheers,
>=20
> Richard
>=20
>>> Op 30 mei 2016, om 13:28 heeft Koen Kooi <
>>> koen@dominion.thruhere.net> het volgende geschreven:
>>>=20
>>> ping
>>>=20
>>>> Op 23 mei 2016, om 19:50 heeft Koen Kooi <koen.kooi@linaro.org>
>>>> het volgende geschreven:
>>>>=20
>>>> The commit breaks image_types_uboot.bbclass:
>>>>=20
>>>> ERROR: Logfile of failure stored in:
>>>> /build/linaro/build/build/tmp-glibc/work/genericarmv8-oe
>>>> -linux/linaro-image-minimal-initramfs/1.0
>>>> -r0/temp/log.do_image_cpio.16506
>>>> Log data follows:
>>>>> DEBUG: Executing python function set_image_size
>>>>> DEBUG: Python function set_image_size finished
>>>>> DEBUG: Executing shell function do_image_cpio
>>>>> 31373 blocks
>>>>> Image Name:   linaro-image-minimal-initramfs-g
>>>>> Created:      Mon May 23 19:38:56 2016
>>>>> Image Type:   ARM Linux RAMDisk Image (gzip compressed)
>>>>> Data Size:    7326620 Bytes =3D 7154.90 kB =3D 6.99 MB
>>>>> Load Address: 00000000
>>>>> Entry Point:  00000000
>>>>> mkimage: Can't open /build/linaro/build/build/tmp
>>>>> -glibc/deploy/images/genericarmv8/linaro-image-minimal
>>>>> -initramfs-genericarmv8-20160523173835.rootfs.cpio.gz: No such
>>>>> file or directory
>>>>=20
>>>> This reverts commit 94f61c2682e5cfd819ac84535650c3e0a654415a.
>>>>=20
>>>> Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
>>>> ---
>>>> meta/classes/image.bbclass | 8 ++------
>>>> 1 file changed, 2 insertions(+), 6 deletions(-)
>>>>=20
>>>> diff --git a/meta/classes/image.bbclass
>>>> b/meta/classes/image.bbclass
>>>> index 9f4c83f..df3bd3a 100644
>>>> --- a/meta/classes/image.bbclass
>>>> +++ b/meta/classes/image.bbclass
>>>> @@ -410,13 +410,9 @@ python () {
>>>>                   # Create input image first.
>>>>                   gen_conversion_cmds(type)
>>>>                   localdata.setVar('type', type)
>>>> -                    cmd =3D "\t" +
>>>> localdata.getVar("COMPRESS_CMD_" + ctype, True)
>>>> -                    if cmd not in cmds:
>>>> -                        cmds.append(cmd)
>>>> +                    cmds.append("\t" +
>>>> localdata.getVar("COMPRESS_CMD_" + ctype, True))
>>>>                   vardeps.add('COMPRESS_CMD_' + ctype)
>>>> -                    subimage =3D type + "." + ctype
>>>> -                    if subimage not in subimages:
>>>> -                        subimages.append(subimage)
>>>> +                    subimages.append(type + "." + ctype)
>>>>                   if type not in alltypes:
>>>>=20
>>>> rm_tmp_images.add(localdata.expand("${IMAGE_NAME}${IMAGE_NAME_SU
>>>> FFIX}.${type}"))
>>>>=20
>>>> --=20
>>>> 2.4.3
>>>>=20
>>>> --=20
>>>> _______________________________________________
>>>> Openembedded-core mailing list
>>>> Openembedded-core@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>>=20
>>>=20
>>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


