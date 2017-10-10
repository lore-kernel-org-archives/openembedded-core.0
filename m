Return-Path: <oystwa@gmail.com>
Received: from mail-it0-f67.google.com (mail-it0-f67.google.com
	[209.85.214.67])
	by mail.openembedded.org (Postfix) with ESMTP id AD5676E650
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Oct 2017 12:39:13 +0000 (UTC)
Received: by mail-it0-f67.google.com with SMTP id f187so2286311itb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Oct 2017 05:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=OLCAzdsXrNq98gE4Z6DQ1QAt0ApHcdIPEK29VHvZVJc=;
	b=avly8UuqzPKDik9uNgkAtbp9jm0b8uxRQr/AjoirDwBufH64cW5ryN2xVSQ499LiFt
	c9t317pUwi6B6157TE8Tg379/KW7ECa3gXkllFJyLS5U+mRcbJkkpukmHKRW3PTrMNXW
	yLYAIYIMtFVFHuvpc0ls4uO4t0H6B7VGEL1kHc9/GsXW1+w9WQFAQY4PPJ72+2vWVP1U
	eoyjHMnu3aB2Zn/4JoyxRd/+9XxfzMnm9dQQOg4WL+W7j0NEblxZO1+nqnIroM2YKmEk
	T/rDUnTCUQr//Eidw56RL7JCAnoDXISlU6piftla3T8PFM5MDkuJ5Fnvb90Lv3qhWvgZ
	hsJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=OLCAzdsXrNq98gE4Z6DQ1QAt0ApHcdIPEK29VHvZVJc=;
	b=QOMaLDLwqBkMemXL/49WmZdqULNFSh01gCwzfpoCx15aYPFTOn0CB0aD4ZppBZJeiG
	/oP8ImTkG+rnVAAsgj4Mp4Y4A2Lr4d0lvBC3WDDORGUTUPHDQrR8LRt5a5uZb29CLHMb
	J8Gokp03Pk716uvuXT/1xGxOqz3gnq75wFf23kSt7j147XORh1EGnUp3tRkvX2qXfH45
	MOPpmdD44Fx99i9tSu5LdOSM8S9HZ4vhbAc/NojUfmKOYiwpvgAu/YsHqa4orgxTqZ0X
	xOcDm0x44yF/kc152ItbIi6AUVzgO/YlJznVOn3h4DMGZjfugaGFDJ7xIx41hWBOj6VI
	+hoA==
X-Gm-Message-State: AMCzsaUYaCsdbrG/xFQanmZK37EQWR+ZYpCEyJBwMlLaNefHEtJ1Ehk3
	nErp1J5gPXf7q9lW6BwvqTcIrlJRzx9sdrOkE88=
X-Google-Smtp-Source: AOwi7QAvkanQCW5cZFrlsGMJQixiJ14ig2Qkno87ZAX/9otabEq2Quj8ofoMysflZ+Jj+YkFFXvrD8kcCqJKdi6nOQs=
X-Received: by 10.36.218.193 with SMTP id z184mr18435409itg.137.1507639154706; 
	Tue, 10 Oct 2017 05:39:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.196.16 with HTTP; Tue, 10 Oct 2017 05:38:34 -0700 (PDT)
In-Reply-To: <CAD4b0_JXtK+3RxhNKG-yP8nb_hCLdt+vO_58H1p1jXSc5Striw@mail.gmail.com>
References: <20171010120012.20163-1-oystwa@gmail.com>
	<33c05071-504f-897e-48d7-c3e6ddaefaaa@linux.intel.com>
	<CAD4b0_JXtK+3RxhNKG-yP8nb_hCLdt+vO_58H1p1jXSc5Striw@mail.gmail.com>
From: =?UTF-8?Q?=C3=98ystein_Walle?= <oystwa@gmail.com>
Date: Tue, 10 Oct 2017 14:38:34 +0200
Message-ID: <CAFaJEqs=GgsEwsjT3=e6hYnK8TMvgUfZd2c475wwsgMeUU6cgQ@mail.gmail.com>
To: =?UTF-8?Q?Maciej_Borz=C4=99cki?= <maciej.borzecki@rndity.com>
Cc: =?UTF-8?Q?=C3=98ystein_Walle?= <ow@datarespons.no>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cmake: fix typo in toolchain file
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
X-List-Received-Date: Tue, 10 Oct 2017 12:39:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 10 October 2017 at 14:31, Maciej Borz=C4=99cki <maciej.borzecki@rndity.c=
om> wrote:
> On Tue, Oct 10, 2017 at 2:25 PM, Alexander Kanavin
>
>> Where is the typo and what is it, exactly?
>
> -set( CMAKE ASM_FLAGS ${CMAKE_C_FLAGS} CACHE STRING "" FORCE )
>
> missing _ between CMAKE and ASM

Correct. As it is the code defines a variable named "CMAKE" with the
contents "ASM_FLAGS ${CMAKE_C_FLAGS}". As far as CMake is concerned that
is valid and so this will not generate any form of error, but may
result in incorrect flags.

I can resend the patch with a better commit message if you like.

--
=C3=98sse

