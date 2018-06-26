Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3917D747CD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jun 2018 10:33:32 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id f79-v6so15507110oib.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jun 2018 03:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=PJWzEryj+x43EWezidSisFxT1mYEAaa5has1UZpAV5I=;
	b=oT0wzN8e/xmLAQPffWplM+CtJa9eI4cUPfzs7QMl50oIGCbjxlQ4FJTRb4d0jcHPIx
	6nIsFWAZljg1WFwH8qBmQOl7ezTCXp66BTKciobt2yKHIoJnpSrdb9FW+XydjXJZ+6IX
	7dvRhy+VicH2KocLo29lQ9ZHK9G5LlsHTo4gcqLwvdqywtUwUf+hpH6NCOW5DGwgNsuu
	XH/VH6C+P6dBM+146KOSRYnystEqbyACQk2xm1KHRPleDuomJs9waTTi84ynMcOWbee7
	SqcSfLfNFqpO7vecT3Jxai8HjW3aB+Z3WS105Ad2Ynme5RJIUMBY6KB4aMjUBKUBaTrR
	GHwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=PJWzEryj+x43EWezidSisFxT1mYEAaa5has1UZpAV5I=;
	b=TQFKu/YyAjtJXy//plyGm6l5Xab0J1uY7c5hb78Er7PGphZx2MMUuxA/6BD8rn6zmK
	JzxaDSb2k5R9vHoF8pcrsKpnPJQegDLZN5/ibU5AwdH7ZAiGYbFXJWiO8Zn1eimlMfdN
	fA4rxkHfNpb12Z+k628sHTi/9A39L4bLoJYAfXn1xz+Sx4QhFTl6Cf8khRPfkuyzg+Io
	PND7QihMbitvf1P2qKIFD2NdSq0+jS23+GVMO6kWM3CZMSkq+chVKwhHPVgShOpkQOZr
	Kc4/JSbVe8j0yVe1SsYSpD4bLf1norILnuycJ1w4OigXWJeQZkzE3BVPr1K7kTXtWGK2
	/EkQ==
X-Gm-Message-State: APt69E1Hjp28nejnrLVw08XSuqn+gS38lRYpKltSSVSY5Q8ONYZ9RpZX
	wjo3Cv7ginGK14nSWziv7b+ZJCuicskqX7VKDMQ=
X-Google-Smtp-Source: AAOMgpc+PEh3hCafq/WgTECom3g3ghtuKBouK/HxmfscnmN2RAijro2i5pWNohEli0yDfRKpSzfcRxFo5u57xCWmI+Q=
X-Received: by 2002:aca:41d6:: with SMTP id
	o205-v6mr521171oia.38.1530009213079; 
	Tue, 26 Jun 2018 03:33:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:90c5:0:0:0:0:0 with HTTP; Tue, 26 Jun 2018 03:33:32
	-0700 (PDT)
In-Reply-To: <CANNYZj_tSbtCh13rCUVYW0iqozQ65q+OufCgVGSW96J11wibEA@mail.gmail.com>
References: <20180625092738.17962-1-olofjn@axis.com>
	<CANNYZj_kMAYH6=EcXM4ACwZhUp3qzzZdv9k6nev-v2oitWO6SQ@mail.gmail.com>
	<7693ed11-5b51-52f6-08f9-4e4f9b76fa90@windriver.com>
	<CANNYZj-MKfxraD-Ho6_Rej3R8dXSAWo3-JtZvQ4SanH183uWvA@mail.gmail.com>
	<CANNYZj_tSbtCh13rCUVYW0iqozQ65q+OufCgVGSW96J11wibEA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 26 Jun 2018 12:33:32 +0200
Message-ID: <CANNYZj-8KYbZw-kcaAU0DQNd9=Lmy4eog75iY+6rtr2as5hEDA@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Olof Johansson <olofjn@axis.com>
Subject: Re: [PATCH] rpm: Avoid leaking temporary scriplet files
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
X-List-Received-Date: Tue, 26 Jun 2018 10:33:32 -0000
Content-Type: text/plain; charset="UTF-8"

I believe the culprit is likely this patch:
http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-devtools/rpm/files/0001-When-cross-installing-execute-package-scriptlets-wit.patch

As scriptlets are executed outside of rpm's chroot, they are being
written into system's /var/tmp, not rootfs's. This patch should
probably be amended to prepend the rootfs path when scriptlets are
written out, and then we should be sorted.

Alex

2018-06-25 21:43 GMT+02:00 Alexander Kanavin <alex.kanavin@gmail.com>:
> The temporary files are written here (macros.in file):
>
> %_tmppath               %{_var}/tmp
>
> What I don't understand is why they end up in the host /var and not
> the rootfs one. The rpm database location is deduced from to _var as
> well, and it does get created in the correct location. Further
> investigation needed...
>
> Alex
>
> 2018-06-25 21:20 GMT+02:00 Alexander Kanavin <alex.kanavin@gmail.com>:
>> 2018-06-25 18:47 GMT+02:00 Mark Hatle <mark.hatle@windriver.com>:
>>> My question is "why is this a problem"?  (Why is debugging on for normal usage?)
>>>
>>> If you want to enable debugging with RPM, leaving the files is the right answer.
>>>  Otherwise, as mentioned in the post it's REALLY hard to debug scriptlet failures.
>>
>> Not at all. I've done quite a bit of scriptlet failure debugging (in
>> preparation for turning their failures into actual bitbake failures),
>> and haven't had to look at stuff in /var/tmp once. I'm fine with
>> deleting them.
>>
>> When debugging is enabled, rpm writes each line of the scriptles as it
>> is being executed into the log, so you don't generally need to look at
>> the whole scriptlet. And even if you do, it's written as plaintext
>> into the beginning of the rpm file, so just look at it with 'less'.
>>
>>> As for the rootfs.py cleaning them up, it's simply not possible -- assuming they
>>> end up in a shared tmp dir, as you wouldn't have any idea who created them..
>>> this build, or another, or a system process....  (Now if they only install into
>>> the image's /var/tmp, thats a completely different case -- but I still question
>>> why debug is enabled at all.)
>>
>> Then we should write them to the rootfs /var/tmp and not the one on
>> the host. Or even ${T} where the rest of rpm/dnf logs go. Then they
>> don't need to be cleaned at all.
>>
>>> This suggests some (probably[*]) larger, upstreamable work done
>>> in rpm itself, to be able to configure that behavior. I think
>>> this is better than nothing, for now. Perhaps the bug report
>>> shouldn't be closed, and this be merged as a workaround? (It
>>> causes real issues, at least for images with lots of
>>> pre/postinstalls.)
>>
>> Sorry but no. I do not want 'workarounds' as merging them removes all
>> incentive for you to develop a proper fix.
>>
>>> Does anybody see value in what --rpmverbosity=debug brings, as
>>> opposed to the default level of info? Would dropping that from
>>> lib/oe/package_manager.py's RpmPM._invoke_dnf be a better
>>> solution, or workaround?
>>
>> We used to have that configurable, but the default level of
>> information is rather useless when things go wrong, and *especially*
>> when scriptlets fail. So recently that has changed to always enable
>> debug.
>>
>> Alex

