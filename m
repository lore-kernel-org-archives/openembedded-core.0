Return-Path: <tharvey@gateworks.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 643F960557
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 May 2017 21:29:23 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id 70so25178264wmq.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 May 2017 14:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gateworks-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=vWnWu4ILZCzGdZr9GSKp1ZCIOxIxKOsPd7neb0Ym+/8=;
	b=HPfx+c7RDs6nn8QMtw5nO56mRw5APTvJaBsTYxlDmZ3W6sg8W6HsZcpMu7I7dtuVcV
	oQcD8A7FknqWOdkifhO1erRceAvl1z5fjjmh3Iq3TRqRegTKr/Hm/S1Q3fgEhoWQ/HlB
	ICEs18gPsPj6MoS6exUZVslVUq3bn7v0o/Gq6qhtLcX9xfW7KV9GyxtIZlEH5RNwOByo
	EmyezKBWnrJKoidmTx/608cVbfSfHMNC9XWvTXW2FFPzS1gAo20N1K+K+xzT23yoeIfW
	dsCymdRdluyGIcI27NymU+Myi+12+GIEzm5KIrDQheOqzLAH+DisMt8RMTbl2a0JAXJI
	sCfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=vWnWu4ILZCzGdZr9GSKp1ZCIOxIxKOsPd7neb0Ym+/8=;
	b=X5KI8Cyp6c5kt8sm+mAT2Q46MPpp/I60nWuto0bmzH0HSm7EY4vc7Vg2dBQ23rSARb
	JYYAwlLVZIERrU00WFjkym2V3yu+VxgwLZvf9Hyc/Y9JmO6ERN1scJlx59bc+o+Nh0Fx
	5ahZnUf9rb10z/UVSmZo2diIKqmSgF+5ww4s+9ZyFP1ViEcIPCVdmcmQlNWo1L8JU4+j
	d20PKapyymV+Ux7qcgGnq9pFq/AooKNFeZS6gPytp6sNzKpoHqz4eYDeHS9cw/Fn9tc6
	Eh2A0jsdh9Usq3Keil5KN0rnoDggtURJAwhZuMH77aRTk0eZp8BoXWuP8lqgFQipGnly
	pfBg==
X-Gm-Message-State: AODbwcAj412vQExV5CaXjQB2YUu7g9i7fJgtFmmtws+g+xOs//qoc8Lz
	sMJsIexqizE/tV+0qVWMB3tcU/HfJ3V7
X-Received: by 10.28.137.201 with SMTP id l192mr11633625wmd.27.1495056564662; 
	Wed, 17 May 2017 14:29:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.212.21 with HTTP; Wed, 17 May 2017 14:29:24 -0700 (PDT)
In-Reply-To: <1495052131.7502.1.camel@gmail.com>
References: <CAJ+vNU02n6DavkhuwM8gU7daWLyyd4QHgd0N5topHJQiO2_6RA@mail.gmail.com>
	<1495052131.7502.1.camel@gmail.com>
From: Tim Harvey <tharvey@gateworks.com>
Date: Wed, 17 May 2017 14:29:24 -0700
Message-ID: <CAJ+vNU1kh56xNCvy77zMM2Pc5hnaM+jFBhzdvip5h2dQ_+YMNA@mail.gmail.com>
To: Max Krummenacher <max.oss.09@gmail.com>
Cc: poky@yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: Re: populate sdk broken for u-boot-mkimage
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
X-List-Received-Date: Wed, 17 May 2017 21:29:24 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, May 17, 2017 at 1:15 PM, Max Krummenacher <max.oss.09@gmail.com> wrote:
> Hi Tim
>
> Just sent a patch which may fix what you see.
>
> Regards
> Max
>
> Am Mittwoch, den 17.05.2017, 12:36 -0700 schrieb Tim Harvey:
>> Greetings,
>>
>> I'm running into the following build error when trying to create an
>> SDK for an image that includes u-boot-mkimage-native.
>>
>> The nativesdk-u-boot-mkimage do_package task fails with:
>> ERROR: nativesdk-u-boot-mkimage: chrpath command failed with exit code 7:
>> b'/usr/src/ventana/yocto/pyro-2.3/build/tmp/work/x86_64-nativesdk-fslcsdk-linux/nativesdk-u-boot
>> -mkimage/1_2017.01-r0/package/opt/fslc-x11/2.3/sysroots/x86_64-fslcsdk-linux/usr/bin/uboot
>> -mkimage:
>> RPATH=/usr/src/ventana/yocto/pyro-2.3/build/tmp/work/x86_64-nativesdk-fslcsdk-linux/nativesdk-u
>> -boot-mkimage/1_2017.01-r0/recipe-sysroot-native/usr/lib:/usr/src/ventana/yocto/pyro
>> -2.3/build/tmp/work/x86_64-nativesdk-fslcsdk-linux/nativesdk-u-boot-mkimage/1_2017.01-r0/recipe
>> -sysroot-native/lib\n'b"new
>> rpath '$ORIGIN/../../../../../../../usr/src/ventana/yocto/pyro-2.3/build/tmp/work/x86_64-nativesdk
>> -fslcsdk-linux/nativesdk-u-boot-mkimage/1_2017.01-r0/recipe-sysroot
>> -native/usr/lib:$ORIGIN/../../../../../../../usr/src/ventana/yocto/pyro-2.3/build/tmp/work/x86_64
>> -nativesdk-fslcsdk-linux/nativesdk-u-boot-mkimage/1_2017.01-r0/recipe-sysroot-native/lib'
>> too large; maximum length 287\n"
>> DEBUG: Python function perform_packagecopy finished
>> DEBUG: Python function do_package finished
>> ERROR: Function failed: perform_packagecopy
>>
>> I'm guessing this has something to do with the long list of args in
>> EXTRA_OEMAKE_class-nativesdk from
>> http://git.yoctoproject.org/cgit.cgi/poky/tree/meta/recipes-bsp/u-boot/u-boot-mkimage_2017.01.bb
>>
>> Any ideas?
>>
>> Regards,
>>
>> Tim

Max,

indeed your patch '[OE-core] [PATCH] u-boot-mkimage: fix nativesdk
build' resolves my problem.

This should be backported to at least the pyro branch as well I would assume?

Tim

