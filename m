Return-Path: <lpapp@archlinux.us>
Received: from mail-pd0-f182.google.com (mail-pd0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id DB6696E3E0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 14:11:29 +0000 (UTC)
Received: by mail-pd0-f182.google.com with SMTP id v10so6321508pde.41
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 06:11:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=JzLXHV1QsMtbFm0gTfFLTKJdipiJwbrQ5fLUGHW2slw=;
	b=CyHO+Aq3SqCjmiL9quwWibcxAGkuO81AW071i1wdzL34ggAWUf9KgXCkCs9WMseKD9
	TqSg/EXmgcRXnuO9kNzPp0lv6LosuNerzsiAkfNMCDZ6l1d1FnZzSAyrm/qG9fWoz6y7
	8Hv+BalZtKMi6w1VabhlHRBiyLaIZI6RD8W8jWmYPlsGbFoaXlWnz9i8xIUCZyzY3FWW
	9LtQr5Tz0muqDlHiQNzz7YUshMdU/dH8ATsGkLKOQVTTxWlrFhGsUmaITjgolsvBG/84
	Gho36Lm+5qhue49sgZX+QL/FQ64RFE9fimSbCGsHP47d7Szwzpqb04w1UOSMgpeUIZaQ
	TFkw==
X-Gm-Message-State: ALoCoQkpYl5ilvNiZGWikhWDttUWhTRU1vUfAptNU/2XmCQoeADkVU84ydWDY0Cuwqqh3AwXtXpB
MIME-Version: 1.0
X-Received: by 10.66.49.74 with SMTP id s10mr25743929pan.0.1393251090203; Mon,
	24 Feb 2014 06:11:30 -0800 (PST)
Sender: lpapp@archlinux.us
Received: by 10.70.26.195 with HTTP; Mon, 24 Feb 2014 06:11:30 -0800 (PST)
In-Reply-To: <20140224135848.GA26295@ad.chargestorm.se>
References: <CAOMwXhOmoLP_8+mv_c_4Eg8YG_T1JD-ao+P1S9FDKvityy_3mA@mail.gmail.com>
	<CAJTo0LY6hsYxR2=aeRodKhZ+5VBEUh+q+7nRYU0E6XYc+Pn-NQ@mail.gmail.com>
	<CAOMwXhN+D+kGw70ijEs_Zd9aNiLsmuts0B6SHf9QXkytgaQCPA@mail.gmail.com>
	<20140224135848.GA26295@ad.chargestorm.se>
Date: Mon, 24 Feb 2014 14:11:30 +0000
X-Google-Sender-Auth: 4mTAQZjREephyO8EQRkncU5EdKM
Message-ID: <CAOMwXhMsjQ2v40hM5UCx1R_NHnop2G2z_kTDVCqV4dWPwXW9EQ@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: Laszlo Papp <lpapp@kde.org>, "Burton, Ross" <ross.burton@intel.com>, 
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: No versioning for existing images
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
X-List-Received-Date: Mon, 24 Feb 2014 14:11:30 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Feb 24, 2014 at 1:58 PM, Anders Darander <anders@chargestorm.se> wrote:
> * Laszlo Papp <lpapp@kde.org> [140224 14:37]:
>
>> On Mon, Feb 24, 2014 at 1:18 PM, Burton, Ross <ross.burton@intel.com> wrote:
>> > On 24 February 2014 12:01, Laszlo Papp <lpapp@kde.org> wrote:
>> >> For instance, the MeeGo Nokia phone had a software version information
>> >> in the settings, and that is something I would personally consider as
>> >> the image version, but again, there might be better ways. Please share
>> >> good practices in here., or alternatively, feel free to point me to
>> >> any documentation, examples, etc.
>
>> > This is an interesting example and a useful demonstration of why the
>> > image version isn't always that useful.
>
>> I am not sure about that; see below.
>
>> > The software build number
>> > covers *everything* that goes into the image, but the image version
>> > number is just the version of the top-level image recipe.
>
>> The problem is that build numbers, that I have seen at least, are
>> human unreadable. A human readable number would be nicer to have;
>> something that I have just double checked on my Blackberry Limited
>> Edition phone, and it is so that the OS Version is 10.0.10.738 in the
>> settings.
>
>> Perhaps the build number can be made human readable... but currently,
>> when I build an image, all I get is a long and not so convenient
>> time-stamp. Is there a more gentle way of generating image version
>> then?
>
> Human readable... I think that I've got to agree with Ross on this one.
>
> Though, the big question is about human readable...
>
> For our internal images, we're using
>
> IMAGE_PREPROCESS_COMMAND += "rootfs_update_timestamp ;\
>              date +%Y%m%d%H%M >${IMAGE_ROOTFS}/etc/build ; \
>              git describe --dirty --long --always >${IMAGE_ROOTFS}/etc/version ;\
>              "
>
> The first line is more or less the timestamp that you dislike.
>
> The git describe line is our main versioning. Using that line we get the
> abreviated SHA1 of our repo, the last tag, the number of commits after
> the last tag, and finally whether the repo was clean or dirty during the
> build.
>
> This allows us internally to pinpoint the exact build setup (assuming
> the build wasn't dirty, which it should never be on an autobuilder /
> release build).
>
> It might not be as pretty as the 10.0.10.738 in your example, though for
> us it's sufficient for the time being.

As you are writing, that is good for internal operation, but I would
dislike providing such "versioning" for customers.

