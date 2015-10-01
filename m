Return-Path: <armccurdy@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 4583D770A5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Oct 2015 18:55:54 +0000 (UTC)
Received: by wicge5 with SMTP id ge5so2691216wic.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Oct 2015 11:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=W7UvKrdAACxy+IbLnVm3+c3+R4ePJlTjRHRNmossVQE=;
	b=HQYZU3WyYrpiyHySPgScAK616xXOrohpIvuNeJ6uVvXB8sXYwJ6xrFZa0/bjLk/ssF
	NX3qGE0kuTCwHPAYP/W7fEr2SDCcf+XuHEDoMNPybfMfVAxMT2AQmalejxt9zKK6woUG
	9AS4EvHxWPVttWwlajGRkkIVEjM8t2O9iFc1iSx4XvUq1n42PEbKyA6EFWNeFM8lMacD
	BevNqLajx7xlF3tCgrIVAEJ6YWqmCv6a5Cekhbm+xwhZ2uweRpsEKZ45AtOPsKhIXA+x
	AVU/Mw1eBhu4F2gYEL1za3GPLJjRNPKUV+hDGTCi8DObg2HoqBGksjYJ4HxYn+k5jyyz
	pVCg==
MIME-Version: 1.0
X-Received: by 10.194.5.35 with SMTP id p3mr14374619wjp.132.1443725754832;
	Thu, 01 Oct 2015 11:55:54 -0700 (PDT)
Received: by 10.194.169.6 with HTTP; Thu, 1 Oct 2015 11:55:54 -0700 (PDT)
In-Reply-To: <71039CBC-0B0A-43AF-8C7D-34D73FCFE32C@gmail.com>
References: <CAJ86T=Xkpa=hO1kizYrsSOTpeMOfbnZeniEWdMgCNhXae2W_5Q@mail.gmail.com>
	<71039CBC-0B0A-43AF-8C7D-34D73FCFE32C@gmail.com>
Date: Thu, 1 Oct 2015 11:55:54 -0700
Message-ID: <CAJ86T=VrarVcJ=EUup0k+=mXh=YoDLP2TyDxmZU9SYEHyc8MkQ@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: Sorting rootfs manifest with .ipk packaging
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
X-List-Received-Date: Thu, 01 Oct 2015 18:55:55 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Sep 30, 2015 at 5:48 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
>> On Sep 30, 2015, at 3:03 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>>
>> I'd like the rootfs manifest to be sorted when using .ipk packaging.
>> Would a patch to sort the result of OpkgPkgsList().list be acceptable?
>> Or would the sorting be better done elsewhere?
>
> its not clear what kind of sorting are you looking for. It could be a good thing in general if its
> configurable and you can explain the value add of doing it.

Aim is to make the manifest for each rootfs a little more human
readable by sorting the list of installed packages alphabetically.

Currently, when ipk packaging is used, the order of packages in the
manifest matches the order in /var/lib/opkg/status, which appears to
be "random".

It looks like RpmPkgsList().list does always sort it's results before
returning, so adding a sort to OpkgPkgsList().list would make it
consistent with the RPM equivalent.

>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

