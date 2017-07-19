Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 41E9372F87
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jul 2017 22:32:39 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id 65so1629381wmf.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jul 2017 15:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=N6uWQpmrWPgvuEIfo0U0dkN5WTPASi5z0ZHc+xLpMaE=;
	b=hKNW8oKDkyxSnmIjRDvELlFRb03zRoLPI9sE6ymMNmiChwmx46zJZA8iZgYPkLHQJs
	xkqujj73fQib8f/jDeCY50uS2VZ5wPBsJuI0bxSVWjt5SsNrZnOonyzHC4oCW0WqVFrR
	qSJypLOEyb7AezNHvzTBhsG9swLsHD2N29QpEW4e6RTAvKMx7XscUn/HNWuJtZ1x/PEt
	HTw2y+8y+jxldAt1fi26h59ulQ0EOa/Bj1BF04o0ldGQdsBzDm82n9ziBD+J3AGEHq37
	N7p+qjArfhVz+5vhkMDaAFLpFwWcb/fsEm8FCy+GWdOnT4JmCbXVn3Gtr1rw3jynOhx6
	zwQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=N6uWQpmrWPgvuEIfo0U0dkN5WTPASi5z0ZHc+xLpMaE=;
	b=s4vewo7Vd7E/k0exTc/9UCfYSY52dpT2khZ3vkseEWpYX1BXfnmpuVFDAPqMKmWMNB
	bFq9vHKwftkNHl7bpo7fqKn6MhwtbwRhoVQjbuVQFam5VKF1BnI2z8MKXoG/4mG5JF11
	u0wVbAFe2OHMz2t9E0pt5sZ/CaPfrsjMW8K4hR7zXkt6hdaSnvkgJw3Zg3+UIqaXkWxm
	uw6Mv8FhfcabfISfRRV6ag6YWirNqLoGRJ3AzphWubAWJ0nifdw1yZR1JQ7xo5tVY4dQ
	c/hlfNnQ/CtfTS3ckAX8gOsoa10jWTPyFgODfnVrGDIQB3PMMz/ZYrQ5mtsc4vtEjsyZ
	H+Tg==
X-Gm-Message-State: AIVw113SzIn70dB29klHQOZYXeUiU2Fk254vPUds4XZrapQTWaUkujeI
	aHnUn7tDqzI/uQxWXYZ9QxCNTBFg7g==
X-Received: by 10.80.176.162 with SMTP id j31mr1137249edd.186.1500503560875;
	Wed, 19 Jul 2017 15:32:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.149.173 with HTTP; Wed, 19 Jul 2017 15:32:10 -0700 (PDT)
In-Reply-To: <6E51916E4A1F32428260031F4C7CD2B6119BDF6B@ORSMSX112.amr.corp.intel.com>
References: <1500417901-4667-1-git-send-email-juro.bystricky@intel.com>
	<CAMKF1spivq5cRcMDz-uehbqWRUzXyJf6TQ53sOtmFJu+_i1iqw@mail.gmail.com>
	<CAJ86T=XT9yufogwxMbV-0dW1ooYdvy5DOequ_X4fRQ7=nFWdOQ@mail.gmail.com>
	<CAMKF1soRVeHPLh_LFSxpcGG=1u1OcKvMv3yEifihP_Y7Y-eXUw@mail.gmail.com>
	<6E51916E4A1F32428260031F4C7CD2B6119BDF6B@ORSMSX112.amr.corp.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 19 Jul 2017 18:32:10 -0400
Message-ID: <CAMKF1sop5dtZZ101eCSS=a7Sb1e9nz6sKXsPYNLDqa19MCj=ag@mail.gmail.com>
To: "Bystricky, Juro" <juro.bystricky@intel.com>
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
X-List-Received-Date: Wed, 19 Jul 2017 22:32:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 19, 2017 at 5:57 PM, Bystricky, Juro
<juro.bystricky@intel.com> wrote:
>> precisely, the problem is that some host compiler may silently ignore
>> unknown warnings and some host may not be using gcc as default system
>> compiler at all e.g. mageia distro and may be more in future.
>>
>
> Yes, it does not nor it attempts to solve all toolchain issues.
> The expectation is that a compiler will choke on an unrecognized option.
> For example, gcc will do the following:
>
> $ gcc -Wnot-cross-compiler hello_world.c
> gcc: error: unrecognized command line option =E2=80=98-Wnot-cross-compile=
r=E2=80=99
>
> As for non-gcc compilers: yes, they may silently ignore unrecognized opti=
ons
> (which IMHO is just wrong). In that case the new options does not work as=
 intended,
> but it does no harm either.
> Anyway, the intended use was to add something like this a .conf file:
>
> TARGET_CC_ARCH_append_class-target =3D " -Wnot-cross-compiler -Werror=3Dn=
ot-cross-compiler"
>

it solves x86 specific issues alone
and we have to carry this patch since
I have less hopes for gcc to accept it.


>

