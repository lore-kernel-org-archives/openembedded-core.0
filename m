Return-Path: <pbarker@toganlabs.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 363AE77BE0
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Oct 2017 13:15:48 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id f4so23378533wme.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Oct 2017 06:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=toganlabs-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=MIrr99Esf2GLCKHScO8jdd4u3XNZ7coLJlgl+SwdWRQ=;
	b=zfaY90pbNhDLxw1UcS0yIyF+QQ2EJxJWSxdyWx+LIohDYZhtBNlh+6lhJjLqNhph4g
	KPxQQ92Ehbh2wzJtvhptqIZVwLhAbdfjia4vGbh5zpvUdbGJf1r8LuYmrMw2fP4lrT4/
	rUBhVnwx5LlcN4fdQQS1sew6ZZqA3ZvKweP3lQCZMoScOY5kxAmmPY90Q63jPaQsoTOH
	u4qMJ6KNInriVQ5xHHchOeImjCA3/JWSlOs9HQfmi4BLZOjNNS/+u+k6T1VBmd+ewAqU
	G4yF6xrStVifGquR6QdF8r27NhVyukjTSOJx8PeH3gV89NStcOzNI1oDbEHViOsvVmgT
	n9Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=MIrr99Esf2GLCKHScO8jdd4u3XNZ7coLJlgl+SwdWRQ=;
	b=PnSxcUKHMR3Sci7RaqugZchddPWg5yDKBkeeWUt/cUdO8qqbAMZvomMR0uFe3kAcmj
	+ySgN80RhSH/hOqTyxkCVcwMf7we9/qPwwwx5hrmxX4C7O57ycFFz6ViUgrVHl83YF9z
	DG38Cl9/z/HJBvwcDVFy9ObmCBZMbEzN/4PhQ9DjPaRPjWx0Ee6wjLaYWVfmAN+MNicm
	qQuCw8fSucvpG4sT29LOl3gxlS4D6kQLBf0QKJAHHTDZDc/oL9y8Hxzq76xKHriB3zcw
	dgGF3U/IoV7Tzr3Z5QOZCMKBjE2sY1vewcoRIXXYCWM1EBx/o5KMZohhFe51IYNL11Eq
	Qm3Q==
X-Gm-Message-State: AMCzsaXlH6BDNk/6thvW2YWvWjCuiH/1rUHY6FkcyFD4UZxNADqGQO/o
	Sb9eQrbqZXerZ9x0SpEoNZLnqF2cjm6fKtKZXTk5Aw==
X-Google-Smtp-Source: AOwi7QCme883gH/4hrDbwIHAeF6uvqkJeAXBHxMjxIIAKcSK/7zOUzhR0XUIrC2zIaAKISLJbCfHdnJ4Ym4mUGVVGkE=
X-Received: by 10.223.186.142 with SMTP id p14mr10224810wrg.169.1507554949854; 
	Mon, 09 Oct 2017 06:15:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.173.139 with HTTP; Mon, 9 Oct 2017 06:15:49 -0700 (PDT)
In-Reply-To: <CAPyrkgxRjHRF9ALg9QwdUPdXAsetFNb9iUCQZNw+GtJsz+hM5g@mail.gmail.com>
References: <CAPyrkgxRNsTbD=o7op_xi7T+f85rT3-4XF9d0bvkqVpvphiKaQ@mail.gmail.com>
	<CAJTo0LY8Z+qqGHXuBNAD1_4eS-fXjhL3VcofkbeHfp6aaBGhaQ@mail.gmail.com>
	<CAPyrkgxRjHRF9ALg9QwdUPdXAsetFNb9iUCQZNw+GtJsz+hM5g@mail.gmail.com>
From: Paul Barker <pbarker@toganlabs.com>
Date: Mon, 9 Oct 2017 14:15:49 +0100
Message-ID: <CAPyrkgxV9aQvx3frYAJFKuK3jBY7Cv+V8=zFjvvLM-jbK5PH8g@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>, Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Illegal instruction when running go binaries in qemux86
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
X-List-Received-Date: Mon, 09 Oct 2017 13:15:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 5, 2017 at 3:35 PM, Paul Barker <pbarker@toganlabs.com> wrote:
> On Thu, Oct 5, 2017 at 3:31 PM, Burton, Ross <ross.burton@intel.com> wrot=
e:
>> On 5 October 2017 at 15:23, Paul Barker <pbarker@toganlabs.com> wrote:
>>>
>>> So my question is: should we just set GO386 =3D "387" so that it applie=
s
>>> to all go binaries and accept the slight loss of performance on x86
>>> systems that do support sse2 instructions? Or should we make this
>>> MACHINE specific so that sse2 instructions can be used where
>>> supported?
>>
>>
>> Definitely machine-specific.  Need a way of mapping from OE tunes to Go
>> options that control the instructions used.
>>
>> Ross
>
> Looking again, we already have go_map_arm() in goarch.bbclass to set
> HOST_GOARM and TARGET_GOARM. We probably need to do the same for the
> GO386 variable.
>

I'm looking at what I can use to determine if sse2 is supported for a
given machine/tune.

In TUNE_FEATURES I could check for "core2" or "corei7" based on what's
in oe-core, but not sure this will cover tunings which might be
defined in other layers.

Alternatively I could check TUNE_CCARGS for "-msse2" or later but that
feels dirty.

Any suggestions on this?

--=20
Paul Barker
Tog=C3=A1n Labs Ltd

