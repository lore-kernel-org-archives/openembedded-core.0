Return-Path: <raj.khem@gmail.com>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id 04CE377E24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 18:00:09 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id g21so1005365lfk.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 11:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=YQHz6Psm2QipqMW4A0vbsxqaCsRFNbNG4965hQonl+0=;
	b=epyN7UFXckAyI/w8RNsftNzFE+zLyITm/iVoh6tZ5HAp6uao4zQKP8xJ9hLnU/aajv
	fHmG9ui0gHjZa8EEu/4myq/Hdos7/MY0Mdsjq2dC1VSw09NaPpQ7/1/a6jq94BQXYLmp
	D4pQxdhZbeN0VXyjvC4hfY835sqqp4k2eUvbX9J/noM5aM3v468oVN5fOuF7zChCehwJ
	KzTDPtCD6m5FR0gHwvsfv72meDjy4v7Wdo7CX2DgTerd3C6EM1x540kzv4rBUJiRHR+l
	7X9UU2/1UFjbGA4/PkJWSQERUJX1nu/CI+zH2nZp4igUG066Nj5oqqCzOn1f70hMruh7
	gC7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=YQHz6Psm2QipqMW4A0vbsxqaCsRFNbNG4965hQonl+0=;
	b=CEXCtOVJTsdlCZIHNV3RCkoGiMRQ7OwT259j9/qoe2jSGY9XIesqr1a1O36gZqPrZR
	47wyhU2t/zG6AW9x76lkOjltRb3HggBwVwSd77AU+2aQKLWCRnHNqnP7gR0OGErn0UCY
	ImQJEaROi87p9NL1rcoSDoENWfhDM6L3bqMsy1m6dsWuKYW5WD0OBGOGSfPz5S4n3tiK
	ddHj4wB0UFHx5ZJdTb8RApTsjvX30G7+KUZtrb4m3BBEe4RZtc3iWLI+NInxT6EPOvZt
	p9fEQWcUf7XV9QEIvbnnj4HjE+EHvfUVR/OnmMI0G/UXREFOJEI1ODkTsztYXzP9vrZ5
	x1dQ==
X-Gm-Message-State: AIVw1119lIomM4EdaBxCOETMfB+5DcLkQmS5oSO0M99mKqPU1M0uDObi
	V0B2CksZKXJdXlg3J20QZ72Q6TFdxQ==
X-Received: by 10.80.145.198 with SMTP id h6mr3369140eda.108.1499796010490;
	Tue, 11 Jul 2017 11:00:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.145.210 with HTTP; Tue, 11 Jul 2017 10:59:39 -0700 (PDT)
In-Reply-To: <CAHiDW_EK4f9PoCnoCzDbNjmKrQeyT-UmJ2jDVqxsmq=CQHLfWg@mail.gmail.com>
References: <cover.1498569089.git.jussi.kukkonen@intel.com>
	<7f8b7c06040b1a12d4a85f82a2ec7c44617538a6.1498569089.git.jussi.kukkonen@intel.com>
	<CAC+thW2RzkC5YsXiHsgaB8Y8+b156YXwLi5TJnq2nzrPS=hBfA@mail.gmail.com>
	<CAHiDW_FuM-jB6f+xN1QOcqAvTUvfehfpWjoSL8N+XiFS9kLX-Q@mail.gmail.com>
	<CAHiDW_GVArsb8O_kgsBLyqC=6sLz8c3+ABsCPD_QSkpU6G5aHQ@mail.gmail.com>
	<CAHiDW_EK4f9PoCnoCzDbNjmKrQeyT-UmJ2jDVqxsmq=CQHLfWg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 11 Jul 2017 10:59:39 -0700
Message-ID: <CAMKF1srwg43QrxOGz7UrqmuQ5ptRNJzYC5p9GAcLN7Ldw0ynuA@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] libepoxy: Upgrade 1.4.2 -> 1.4.3
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
X-List-Received-Date: Tue, 11 Jul 2017 18:00:10 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 11, 2017 at 1:34 AM, Jussi Kukkonen
<jussi.kukkonen@intel.com> wrote:
> On 11 July 2017 at 11:27, Jussi Kukkonen <jussi.kukkonen@intel.com> wrote:
>>
>> On 11 July 2017 at 10:42, Jussi Kukkonen <jussi.kukkonen@intel.com> wrote:
>>>>
>>>> Exception: FileExistsError: [Errno 17] File exists:
>>>> '/home/gizero/work/smartliving/distro/repo-master/build-poky/tmp/sysroots-components/raspberrypi3/userland/usr/include/KHR/khrplatform.h'
>>>> ->
>>>> '/home/gizero/work/smartliving/distro/repo-master/build-poky/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/gtk+3/3.22.16-r0/recipe-sysroot/usr/include/KHR/khrplatform.h'
>>>
>>>
>>> /usr/include/KHR/khrplatform.h is the egl platform header file, provided
>>> by both mesa and RPI userland. Does mesa end up in your gtk+3 recipe-sysroot
>>> somehow?
>>>
>>> For clarity: this could be a bug but it is unlikely to be related to the
>>> libepoxy change (it does not use or ship the actual header file).
>>>
>>
>>
>> Actually this was maybe fixed by Otavios upgrade to mesa 17.1.4 -- mesa
>> accidentally shipped khrplatform.h even when egl was disabled (which is what
>> mesa-gl in oe-core does).
>>
>
> Sorry, I've not had enough  coffee. It was the other way round:
> khrplatform.h is the platform header that mesa now thinks is needed whether
> egl is enabled or not -- so they've started installing it in any case from
> 17.1.4 which means mesa-gl now provides khrplatform.h and thus conflicts
> with userland.
>
> I don't know what the correct fix is yet, just wanted to correct my original
> wrong info.
>

Post an update to sync this header for userland package.

>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

