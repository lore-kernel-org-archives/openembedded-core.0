Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 7FC5C6FEFA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Aug 2016 07:29:09 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id v123so1432449qkh.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Aug 2016 00:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=w6GPe73GcB4uF/xxFtYloAO8aJEHwb7VRsArqyVj2ao=;
	b=qtkvM061mlWdx51+EbsewoFhuOTiKZpAuiFVLLfDE10T9C5Ifv14dDx6SfOUft0xDn
	OlpS3WQigNg65sw/Ejugj4zr2f1p15OzStPZAQv9j8P3XJP5AxyXVnpokhYfb+UNGpOc
	fMg6anpQRJKj53J9YFSbhewLcYBiELcM4stqGTJj/6WoLerM2sYBi+pGP1BQN7VVKQSH
	x1g+NZYynM3wTTgxICNc8x4tZugxiMql5jKvJHPqscYK5QS213Tbw5mlr6hPN9cnu/Hh
	5OzwSVC2rZHBzpQt2lscnJnWLon+R7BGKxitfEnFpjI1RepHFKc2Ol0gWSBHvscunonR
	mYGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=w6GPe73GcB4uF/xxFtYloAO8aJEHwb7VRsArqyVj2ao=;
	b=JKnvB0cfwNo6yIZrO6vyg++vQsb1T3Qd6vdtnlzyO2Y4k8qkCupfjUJ95DWHyQfGJ2
	HCacv4XJKguy81hVysK8uk2nYk8+rNgpEV5mH52sYz+q9/obFC5ex2AD6yuAzLlpsEtZ
	x7Yes1rAX3RM8PPJkfF/Jaxd2SwS2cqE02JK5no+Tl8Qi9P/CL7EyUoThg1LxoZHHWNa
	hXAik8bbfR7LlUQ7jlAI6J07+dhaoBjTY5l+j4gNqah8VGfuMRmc+fGO7KM6G57nhugO
	Ob1Brd2K35EkIqCq1X/SG+DNGy+l/m8VcCayiqSTV4hsvxkGS+CtwJeQP4zTlJBj7vm2
	A0tA==
X-Gm-Message-State: AEkooutVEipmy4AqSapNppTfg3a88LqzDZ23yM4FmXC62pOW3IrbFwQS3JSxVUsnr0M66fc6Y6mJSBgBcBjEWA==
X-Received: by 10.55.155.140 with SMTP id d134mr16309040qke.145.1470986949740; 
	Fri, 12 Aug 2016 00:29:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.215.13 with HTTP; Fri, 12 Aug 2016 00:28:39 -0700 (PDT)
In-Reply-To: <1470986810.4987.8.camel@andred.net>
References: <1470924371-1675-1-git-send-email-git@andred.net>
	<3A0FE7FC-807D-4CED-8673-DA28B5F36A88@gmail.com>
	<1470986810.4987.8.camel@andred.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 12 Aug 2016 00:28:39 -0700
Message-ID: <CAMKF1sqdpxYYrKnLkJ1VofY=qz5FEKsKWBo_7WrU+Cm_Kp1fDQ@mail.gmail.com>
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libnl: musl fixes
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
X-List-Received-Date: Fri, 12 Aug 2016 07:29:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 12, 2016 at 12:26 AM, Andr=C3=A9 Draszik <git@andred.net> wrote=
:
> On Thu, 2016-08-11 at 22:45 -0700, Khem Raj wrote:
>> >
>> > On Aug 11, 2016, at 7:06 AM, Andr=C3=A9 Draszik <git@andred.net> wrote=
:
>> >
>> > The libnl+musl combination has two issues at the moment:
>> > a) a public header file #include's an incorrect file
>> >   (sys/poll.h instead of poll.h), which causes warnings and
>> >   potentially errors (-Werror) in a musl based system
>> > b) musl only ever provides the XSI version of strerror_r()
>> >
>>
>> yes so you can check for something like
>> (_POSIX_C_SOURCE >=3D 200112L || _XOPEN_SOURCE >=3D 600) && ! _GNU_SOURC=
E
>> use XSI version
>> else use GNU version
>
> Well, the feature test is supposed to be set by the user (libnl in this
> case), and evaluated by the c library (musl). libnl explicitly sets
> _GNU_SOURCE, i.e. it expects the glibc version.

I see. It is something which should atleast be brought up with
upstream as an issue
they may just say, we need GNU version but atleast we will know

> Given musl doesn't provide the glibc version, and apart from implementing
> the other version in musl, I don't see any viable alternative other than
> what I posted.
> One could #undefine _GNU_SOURCE and #define POSIX_C_SOURCE as appropriate
> during compilation of the affected files, but that might have other side-
> effects, and would be a major deviation from upstream...

