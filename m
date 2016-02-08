Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id E7BB7731C8
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Feb 2016 23:43:43 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id p63so1462923wmp.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Feb 2016 15:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=3GIJ/qemSfoSP7J+WvSgmOa5A1QzoTJ+RYPBok8uiaE=;
	b=mUuq0GXfJFqlFTzJGDS4nsqNfw6QWg51gYgIigHghVSBehUwoIYy+EFzR/QWdU0Ryj
	j8Ki+Z1sX9nlTlVOd8hEgvs7fSozI2mTq4ZwrS9WNJEMsaOnaKPIj23GJ0UVEPU9dkmX
	91HCLET/ZQxEM/Wa+PMTdtw8fnRebMgIhVoqXJ6jxVlKAkNOipR3iB+Utln7IL57LGbP
	PEfTRQfKl3wBUVA/35h+p/77WQhUh6QadzQ1lAaPpK+AX2nDTZpbaAhHVHQBLlaNGYdJ
	khNfskDANu9ulfsgyinjrSsX7hNwESJ5oREJV1aavHvdptR+6vTtW3xCJfUNG5A3MU8v
	QHjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=3GIJ/qemSfoSP7J+WvSgmOa5A1QzoTJ+RYPBok8uiaE=;
	b=Ej3k8pgxp22WzIG2O+ujP6sn+ur6o3zF5aAmp4MmevFdp6i43/TnDB/TJYVOi0hZlt
	rTrunPMHHaFqmiHC+13c1LjyVqBAUu3H/mJhtiPDvGHGHCakOSLiLP4dURNcFMdQ/+Wy
	wb8COaBP0apbZLD795ULHzSbnUbubVwHSxXrn1IQnrT3GHgbbp1rYIsZ9mcxOxonwCBj
	eTwfM2SQx6XagOghp2GDxlGISFmQbzLvEYDXhWwKiuwzP56lHpCvZnooP8q2+5Jh+b3k
	mSfes38xpT5ahCSesOkk6X6UV4KowETI6eBbpnFZGs+0BKX6LGmsBKGzUqVdUcMK5bvn
	t/BQ==
X-Gm-Message-State: AG10YOSgUsm0wihui8qOrGnScboL4I4riRSi4yySBswf8UejWl+oRDZSQhFw0BQnjtZ6tEE/7dHdo8iR713XSQ==
MIME-Version: 1.0
X-Received: by 10.28.54.22 with SMTP id d22mr1292618wma.72.1454975024053; Mon,
	08 Feb 2016 15:43:44 -0800 (PST)
Received: by 10.194.209.131 with HTTP; Mon, 8 Feb 2016 15:43:43 -0800 (PST)
In-Reply-To: <CAJTo0LayxZ-T_cw0H5ndoxHkUHXwcqRdfu7oYjUevX+QzR4CTw@mail.gmail.com>
References: <CAJ86T=UvphArYq85qN1yNsCeCtbr_AaapGoZmhprS7cCU3FM0Q@mail.gmail.com>
	<CAMKF1sqdRHprniyiaiUNrghVwZ4tY=hn7gEHwf1g2fxi3SWEtA@mail.gmail.com>
	<CAJ86T=UjJMJ_44ws-Esuak2nGC8ML-_-=vPAGHXJS0=0rU0fEQ@mail.gmail.com>
	<CAJTo0LayxZ-T_cw0H5ndoxHkUHXwcqRdfu7oYjUevX+QzR4CTw@mail.gmail.com>
Date: Mon, 8 Feb 2016 15:43:43 -0800
Message-ID: <CAJ86T=VqhcakK1zhS2CdaD0-ZwdeBufLH1b06DZqrOraLiZFkw@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: TARGET_CFLAGS for non-target builds
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
X-List-Received-Date: Mon, 08 Feb 2016 23:43:46 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Feb 8, 2016 at 3:00 PM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 8 February 2016 at 20:03, Andre McCurdy <armccurdy@gmail.com> wrote:
>>
>> Can you give an example? Looking at native.bbclass it seems to replace
>> TARGET_CFLAGS with BUILD_CFLAGS, not manipulate it.
>
> Sure, so in doing a native build TARGET_CFLAGS is used.  But as
> security_flags.inc was using TARGET_CFLAGS_append, the end result was
> BUILD_CFLAGS appended with the security flags.

Yes, for native, TARGET_CFLAGS will end up being "${BUILD_CFLAGS}
${SECURITY_CFLAGS}".

However it shouldn't matter - native.bbclass sets CFLAGS to
BUILD_CFLAGS, not TARGET_CFLAGS.

Do you have an example where host gcc can legitimately be invoked with
TARGET_CFLAGS?

> Ross

