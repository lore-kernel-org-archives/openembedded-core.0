Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 7377A71AC5
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Oct 2017 02:32:55 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id m28so10817619pfi.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Oct 2017 19:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=fL61NiJfsh4ob9W+FWm3OytfqILqyQcf/Y8A0QWs9xw=;
	b=SiId7GA85xc9fV+2zfyDtpfr6+Wv2NlYBpNXABPVV5Xvxck24L/IEeTOMq72uilKD4
	uOQcwAF83zbLYCYlxxjAfe28eeavQIdC+EUpdVQJteDxa/Mj1hHsYyEnvlssZGAqByA/
	NznLa8049SNGcv2gKWdvOQmHbPSHzXdeRKrdH97KhJMDCpEUFOqZqKkI0X2IPiv7B7vq
	KSmJ5tjp2nvq5jAz5RebEkjWqAHjVfl9UxUfQdhMgr1s66i7yzuCRSu92Oh0tVVxYmY0
	5IERTX1u15428Fjv8c08AyLA+GvjbxVemTtizphQnTgwmU1fo6fGw4dE5yrnUT4G0nWf
	eL8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=fL61NiJfsh4ob9W+FWm3OytfqILqyQcf/Y8A0QWs9xw=;
	b=OpuMsKsdMwFjLdzA56ojZm5n0dS6sqdVKfF5wPYFh7pPKySZwI21p7ULKUjCXu0XJO
	SFmC/MoSdWkT/Ls6ZsU5lXpXNgHJ2tZBz4o3uBftFsNl7GifKmaGNCMJlK5QJ0IbsnxX
	cJz7J85KabKfRtr2NPI6415tY/Od87+2bz2q9XAo3lxQIYOgXJcigxNJrSbyMQfywaH8
	46yrF+aDJZOtwOsJW1VA3QQBQ3sOCJsmBTSXDe17ypWmDSju9F8DcS32HU+0DkH/bIwB
	tfNeIOR8VETJU5Dw2D4WUUUZPmJ2nLpQyPvDUAX5mW6WmPG6NWoXjKmEkXf2+97dG+Ie
	ei6w==
X-Gm-Message-State: AHPjjUgqk0/+wzMnAjRuxDB+SYNNaGvSkGBhgqKyXqFhGM/fwofcfWl2
	TFDoWLh2WednkHtFtSuU0GOuIpSPAUmLRgPZPZ4=
X-Google-Smtp-Source: AOwi7QBPQw2v3eebyxdRs2Ry54ufrGKGSmHmMzw3ieo29NmCA+SK+96PZu/BvbN2pfGDBjujCPVb7IyZBQVS8KPalRg=
X-Received: by 10.84.177.129 with SMTP id x1mr18949909plb.161.1507084376499;
	Tue, 03 Oct 2017 19:32:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.135.23 with HTTP; Tue, 3 Oct 2017 19:32:25 -0700 (PDT)
In-Reply-To: <427c98e1-fbe4-592b-6554-a3a93d747c61@denx.de>
References: <1507067652-27633-1-git-send-email-juro.bystricky@intel.com>
	<CAJ86T=UdzPA4WyTELZjiLmfAtK4asKRN-SBd6tsinmi76FiV_A@mail.gmail.com>
	<427c98e1-fbe4-592b-6554-a3a93d747c61@denx.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 3 Oct 2017 19:32:25 -0700
Message-ID: <CAMKF1sqiBU6oicH4vCvJQDDR+5BRP=RXttheU9ysCdd4QRYwfQ@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: yau.wai.gan@intel.com, Juro Bystricky <jurobystricky@hotmail.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] siteinfo: nios2-linux - remove wrong mutex info
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
X-List-Received-Date: Wed, 04 Oct 2017 02:32:55 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 3, 2017 at 7:25 PM, Marek Vasut <marex@denx.de> wrote:
> On 10/04/2017 04:01 AM, Andre McCurdy wrote:
>> On Tue, Oct 3, 2017 at 2:54 PM, Juro Bystricky <juro.bystricky@intel.com> wrote:
>>> With the commit f4e8e9242c5df095b52688b083df3c9d36e7144b
>>
>> That revision doesn't exist in oe-core...
>

it exists in poky, sometimes users confuse Openembedded repositories with
yocto repositories, its unfortunate but not uncommon

> Also, isn't there some sort of standardized format for listing git
> commit IDs in commit messages ? I recall Linux kernel agreed on
> something like that.
>
>>> some nios2 builds
>>> (uboot, core-image-minimal, etc) were broken due to db trying to use ARM instructions
>>> in mutexes. The reason was db "configure" used the cached entry from nios2-linux
>>> (which was incorrect). So the remedy was to remove the incorrect cached entry
>>> and let db "configure" figure out which is the proper mutex to use.
>>>
>>> Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
>>> ---
>>>  meta/site/nios2-linux | 1 -
>>>  1 file changed, 1 deletion(-)
>>>
>>> diff --git a/meta/site/nios2-linux b/meta/site/nios2-linux
>>> index 2f4e570..5bae748 100644
>>> --- a/meta/site/nios2-linux
>>> +++ b/meta/site/nios2-linux
>>> @@ -33,7 +33,6 @@ db_cv_path_sh=${db_cv_path_sh=/bin/sh}
>>>  db_cv_path_strip=${db_cv_path_strip=/usr/bin/strip}
>>>  db_cv_align_t=${db_cv_align_t='unsigned long long'}
>>>  db_cv_alignp_t=${db_cv_alignp_t='unsigned long'}
>>> -db_cv_mutex=${db_cv_mutex=ARM/gcc-assembly}
>>>  db_cv_posixmutexes=${db_cv_posixmutexes=no}
>>>  db_cv_uimutexes=${db_cv_uimutexes=no}
>>>
>>> --
>>> 2.7.4
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
> --
> Best regards,
> Marek Vasut
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

