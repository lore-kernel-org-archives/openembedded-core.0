Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id D5F48781C2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 01:35:47 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id t3so884044wme.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jul 2017 18:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=aG2oSnJjNAXXkT+A/MVOFgedfsWgJSIy3V6gu2QZx7I=;
	b=TDqPKy5zG+NxyM351GGB/AW11qb7gqbnobXxId4xHQzJSCKQhtp6hFsNNlR7IodJih
	Jc6VLPn4lJ5iH+Up8yIS+zLJOON1GWpRwdixjuwKXywiyv3s8vfRMYg6xyrJ7wDRfc0j
	J7bNKl2nes5rwvC1v2N3UeBw2qSR/JY0fmtCETHQnV4HHD5BQsh6I8TL+cmkAikMe1wr
	EPFp6Bjjy+5qNoGCB7UM1VBzZbgMbErHkT5U602JGdiVsV2Y2D0ljHMMnwJ9z2pOKHuR
	FKnVMez8lX9h/lUy/L8Mrv9hzwb4xHxHBXxgjr5hlp6JpQVohwtCKWEm7r+CDQH0M7MY
	V6/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=aG2oSnJjNAXXkT+A/MVOFgedfsWgJSIy3V6gu2QZx7I=;
	b=ncYtCMTfJETQ2+ex25MAslmEE0Z06e35ogyjRe/FIdsAxC5c+jZLwab9rolECPQpvE
	LsxU+oPpU8l12j8s+bvF8awcJ+nJWkLrIyd+9GkO+zvgkZer6Agzu/qepsQOsV6jQx9/
	FAgoYEwoNegSFLlvj+4W5LrtO0Gz8A7MvEXVF5/mkZ7sNhMBdyFaOpnrn2/7/Wnuq3t/
	n3oP9msXzWKg4hPCMUoZDac9gk+X4Vw3nizSZKqZ+UNgIWb/crbnhZqRCCNSCsnjKDvn
	0vt3KK43qh/Qu5nUinbDGJ6U8wNHv5G9mTQmAJWaD5xQ5FmvlvJuxdZPshHznEsR6+ZD
	dGbg==
X-Gm-Message-State: AIVw111ErSw+xsDQVylJuSeHKaSE4N5/1dPm+BLm9F3nVPUppku09ZWC
	m5A6hjj6bQhzKlf08iWjDoerW7TQuA==
X-Received: by 10.80.159.165 with SMTP id c34mr1353237edf.11.1500514548517;
	Wed, 19 Jul 2017 18:35:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.149.173 with HTTP; Wed, 19 Jul 2017 18:35:18 -0700 (PDT)
In-Reply-To: <CAJ86T=XYR9Z=aMO-BAAZYJ2Lh=ZXQy+J5J-LjSuT-n_Hx-1ayA@mail.gmail.com>
References: <1500417901-4667-1-git-send-email-juro.bystricky@intel.com>
	<CAMKF1spivq5cRcMDz-uehbqWRUzXyJf6TQ53sOtmFJu+_i1iqw@mail.gmail.com>
	<CAJ86T=XT9yufogwxMbV-0dW1ooYdvy5DOequ_X4fRQ7=nFWdOQ@mail.gmail.com>
	<CAMKF1soRVeHPLh_LFSxpcGG=1u1OcKvMv3yEifihP_Y7Y-eXUw@mail.gmail.com>
	<6E51916E4A1F32428260031F4C7CD2B6119BDF6B@ORSMSX112.amr.corp.intel.com>
	<CAJ86T=XYR9Z=aMO-BAAZYJ2Lh=ZXQy+J5J-LjSuT-n_Hx-1ayA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 19 Jul 2017 21:35:18 -0400
Message-ID: <CAMKF1soYE49jfc-pkYMLgdh5DJVuA0wyLFiA90Z_3OB7i6tUOw@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-7.inc: add new warning "Wnot-cross-compiler"
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
X-List-Received-Date: Thu, 20 Jul 2017 01:35:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 19, 2017 at 7:26 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Wed, Jul 19, 2017 at 2:57 PM, Bystricky, Juro
> <juro.bystricky@intel.com> wrote:
>>> precisely, the problem is that some host compiler may silently ignore
>>> unknown warnings and some host may not be using gcc as default system
>>> compiler at all e.g. mageia distro and may be more in future.
>>
>> Yes, it does not nor it attempts to solve all toolchain issues.
>> The expectation is that a compiler will choke on an unrecognized option.
>> For example, gcc will do the following:
>>
>> $ gcc -Wnot-cross-compiler hello_world.c
>> gcc: error: unrecognized command line option =E2=80=98-Wnot-cross-compil=
er=E2=80=99
>>
>> As for non-gcc compilers: yes, they may silently ignore unrecognized opt=
ions
>> (which IMHO is just wrong). In that case the new options does not work a=
s intended,
>> but it does no harm either.
>> Anyway, the intended use was to add something like this a .conf file:
>>
>> TARGET_CC_ARCH_append_class-target =3D " -Wnot-cross-compiler -Werror=3D=
not-cross-compiler"
>
> Personally, I think we already try to pass too much via CC or the
> compiler command line (e.g. -fdebug-prefix-map=3DXXX). Has there ever
> been any thought of OE providing a toolchain wrapper, which could pass
> these kinds of housekeeping options to the underlying toolchain while
> keeping build logs clean and without the worry that CC, CFLAGS, etc
> get ignored or clobbered by a custom Makefile somewhere?

we could do it by providing customized spec file
but this will not be good for external toolchains

