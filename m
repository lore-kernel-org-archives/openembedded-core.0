Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id 643F578CB1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 11:05:38 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id n84-v6so8356212oib.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 04:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=PpIPWiwM56jSKt3Agv/QCk/ZCCBWmwXXOKcujuRe1Gk=;
	b=fNlfD1FZ4lmLuqbngqqmyc4/TelJXj1py+w0N5JR6BEOUnKWgObxq9TnHOzr0ga6iU
	cpleBdo/a6/ldRChB0eyDQfvSHfNcd1cvwcfaK767YMHaaOXwarbAqdtgL5b6CdlBNFx
	PGVVTAhntVXcr62vjXi8S5cGrJZb8GSrVapkXqLZUFnvqukFqLNFMvHFRNIYMNG/Mz7I
	XhPK1VdpWADreoabDjfIevLVK7WcWM+Uzp+cdKNqDJA5fIi9LNvkOanBo4O0SWOVoKad
	bCCE43WEgo6v5JD9aGWmKtg4oOa5V7dDFlcRm5VugovFD2p/bM3GX4SRYbs98EHfHi0L
	wY5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=PpIPWiwM56jSKt3Agv/QCk/ZCCBWmwXXOKcujuRe1Gk=;
	b=TeMYGovteON/wkdfI/N/r+NOAm76IRPAr9qy6YMF7MhHrg6FixOYLTEx47zpGehPVV
	918mT3LShpUq6NyIJc+zLSb5q9JE9kEY2TinzgIfKa9HwvPCbDgnr3NfsIDinUXxF6l6
	Ul4+ILvSKfihSjA/vxT+56V3Vj5S7JdqHp3OMklBEeLl6bGNfnHW2QM1TeavvXJJmkG7
	FtuGf5tWBi7WHwwOmAFGIx2uyipOki5wFO1e/phQwlf5+y/rbY+0JdwWZNlIcGBUTgnR
	9VcA14V7ifS9A95s39f2qnJSUL6d8856u6Ed3E9NEmJnhiBeTFTG6uW5bI8gZ4UtC1ps
	c8bg==
X-Gm-Message-State: AOUpUlFnsH7S6dsDJoX0YO8gUzize8Hd4Gt1zJlls7P+la2zXY+WP4yH
	/CDv5IiVxbGbAR42PETpRpzZsZOt0GXTuULqu+32TA==
X-Google-Smtp-Source: AAOMgpclJGsW/dTsvgGK0OmIBtzya1w4zyiU0jQnpvUEOdTdydq/8aPoarsMAXG1VAnr3L5RTDlKRD1iMUHtADHeFzE=
X-Received: by 2002:aca:5dc5:: with SMTP id
	r188-v6mr6210563oib.320.1532689539246; 
	Fri, 27 Jul 2018 04:05:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:6845:0:0:0:0:0 with HTTP; Fri, 27 Jul 2018 04:05:18
	-0700 (PDT)
In-Reply-To: <CAJ86T=VQ_Qk0TOhHRiZ0SThgZ8-HZOTz6L5JXD4K2ut+7tbWFA@mail.gmail.com>
References: <20180726135835.17632-1-adrian.ratiu@ni.com>
	<CAJTo0LajamOMF5TsuMZo+sBRLr=AqWYJUJPnifZUME=rKrO48g@mail.gmail.com>
	<CAJ86T=VQ_Qk0TOhHRiZ0SThgZ8-HZOTz6L5JXD4K2ut+7tbWFA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 27 Jul 2018 12:05:18 +0100
Message-ID: <CAJTo0LbkAc9NgGyE2HCvFLt6ggcO-iMpYp-XMDB9oy=RAV7TEQ@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] util-linux.inc: add fallocate only for class-target
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
X-List-Received-Date: Fri, 27 Jul 2018 11:05:38 -0000
Content-Type: text/plain; charset="UTF-8"

On 27 July 2018 at 00:58, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Thu, Jul 26, 2018 at 4:34 PM, Burton, Ross <ross.burton@intel.com> wrote:
>> On 26 July 2018 at 14:58, Ioan-Adrian Ratiu <adrian.ratiu@ni.com> wrote:
>>> Because the util-linux_2.32.bb recipe explicitely disables fallocate
>>> for nativesdk triggering build warnings:
>>
>> Does anyone know why util-linux disables fallocate for nativesdk and
>> native builds?
>
> Seems to date back to this commit:
>
>   http://git.openembedded.org/openembedded-core/commit/?id=17f3c548caf4adec37c3bbb139aa6b3900419794
>
>   +# fallocate is glibc 2.10, fallocate64 is glibc 2.11
>   +# we need to disable it for older versions
>   +EXTRA_OECONF += "ac_cv_func_fallocate=no"
>   +EXTRA_OECONF_virtclass-native += "--disable-fallocate
> --disable-use-tty-group"

Well done, it was late and I got bored following the git-blame log.  :)

Sounds like historical reasons to me, does anyone object to dropping this?
Ross

