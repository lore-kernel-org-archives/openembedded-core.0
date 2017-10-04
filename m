Return-Path: <alistair23@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id DBC3777E9C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Oct 2017 22:30:12 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id l10so406754wre.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Oct 2017 15:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+B6+UCrIHiB6YE6nT1+x17cb9CUr/dVdqsDJHyozMEw=;
	b=r3Gxb4yZPmGcIG1HH21FYLvBjr0zKiLhgDK+GAPxjX+PPsv9yZfXuhOJJN3kDRTMmE
	eNFQ25GG3orsDm6HvEJcllMhucWEJ0ijGwA1/GxFoFYxP9uaN64gntftqyqrtxfZaEHx
	q/GP9s28q0G2uJ8gmLdoYF84PT6cRZHqCcj5Ww8bODFPO5WtW7iMNblBivlYjafD3h0Q
	BsVycx3yGDLsmU53DTWpaL3Ug2isYSsLcwcLtJF/Ab7Vnt3NVqIytoPJBD9rp++Ybb9m
	lvzAPqMO87gjSuz3vf78OyJmr32tVQDcVFmHIQ3z+bZvbfxkDVEKSFNBT64TL8/2cpZN
	aplw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+B6+UCrIHiB6YE6nT1+x17cb9CUr/dVdqsDJHyozMEw=;
	b=f8UofoLN/cxdkVDEzVihEmr+ck3pCVf1zqbl1H+zYqQEGQWz0FTQQy0c2YftuUqaop
	oavJdXJ7dQ8cUwgqysuIa+FxkxH32KW2yzYvDIxE+PQiy8a7yba6bfYdMPXjcn/OLMva
	9fnacbRQU6UuM3ZQwIkcwkFBdgafNPWHswkyoQXQw871jxg17oK20MeF5pSZb6eN6wVF
	c/+qLei0o93/Dfl+viIloqCPSlr/PduP5tAZBpi6p/ULNZ41b6DilZmOHwXHRm24GqdD
	bB7voRgwkGzBsSxA3znsuUTL+rY/5IOe1W1KfGE24+eOu5wZGcwyaF8eNtu/ZR4EAGa5
	1zRg==
X-Gm-Message-State: AMCzsaWKVW/kKX8TBuWO5Llj25BX5iXxZb1gxYsbS+wbQIJIf7yQhyGx
	njU8SBxe/Y9Z9WxU55r8THNjmksTLzSKXk7/t4I=
X-Google-Smtp-Source: AOwi7QB4OUaVNyXQAq44fKEpu14dRQ4WxFaF8Re1L18bjcBL3aHvqSEjrPXos1KxRv5e89QzRten00atDlJKvYa1l+Y=
X-Received: by 10.223.196.167 with SMTP id m36mr10071656wrf.225.1507156213541; 
	Wed, 04 Oct 2017 15:30:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.157.2 with HTTP; Wed, 4 Oct 2017 15:29:42 -0700 (PDT)
In-Reply-To: <CAJTo0LZLHN3CbuK3AZPT9sPotT3qcosa5vJVKzSYau3HcqZJnw@mail.gmail.com>
References: <20170925225655.24585-1-alistair.francis@xilinx.com>
	<CAKmqyKN2b3nHMOTD-QS1-MchR6prLJAtr8_tn7-umWKm=6HB_Q@mail.gmail.com>
	<CAJTo0LZLHN3CbuK3AZPT9sPotT3qcosa5vJVKzSYau3HcqZJnw@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 4 Oct 2017 15:29:42 -0700
Message-ID: <CAKmqyKPnLJBtK4MvSbMOFXO+MmC5S1gGH53x5QmVL112Z7uQrw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glib-2.0: Remove recommend shared-mime-info for MinGW
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
X-List-Received-Date: Wed, 04 Oct 2017 22:30:13 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 4, 2017 at 3:23 PM, Burton, Ross <ross.burton@intel.com> wrote:
> Already queued for master and probably rocko.

Thanks for that.

Alistair

>
> Ross
>
> On 4 October 2017 at 22:50, Alistair Francis <alistair23@gmail.com> wrote:
>>
>> On Mon, Sep 25, 2017 at 3:56 PM, Alistair Francis
>> <alistair.francis@xilinx.com> wrote:
>> > Commit glib-2.0: recommend shared-mime-info
>> > (51e4f9ca5368af5cefa26f4ca50b282e858982f8) broke compilation when cross
>> > compiling for Windows. This patch removes the recommendation for
>> > shared-mime-info when using MinGW cross compile.
>> >
>> > Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
>> > Cc: Ross Burton <ross.burton@intel.com>
>> > Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
>>
>> Ping!
>>
>> Thanks,
>> Alistair
>>
>> > ---
>> >  meta/recipes-core/glib-2.0/glib.inc | 2 ++
>> >  1 file changed, 2 insertions(+)
>> >
>> > diff --git a/meta/recipes-core/glib-2.0/glib.inc
>> > b/meta/recipes-core/glib-2.0/glib.inc
>> > index ce15ccefc3..8434b7dae3 100644
>> > --- a/meta/recipes-core/glib-2.0/glib.inc
>> > +++ b/meta/recipes-core/glib-2.0/glib.inc
>> > @@ -74,6 +74,8 @@ FILES_${PN}-codegen =
>> > "${datadir}/glib-2.0/codegen/*.py \
>> >  FILES_${PN}-utils = "${bindir}/*"
>> >
>> >  RRECOMMENDS_${PN} += "shared-mime-info"
>> > +# When cross compiling for Windows we don't want to include this
>> > +RRECOMMENDS_${PN}_remove_mingw32 = "shared-mime-info"
>> >
>> >  ARM_INSTRUCTION_SET_armv4 = "arm"
>> >  ARM_INSTRUCTION_SET_armv5 = "arm"
>> > --
>> > 2.11.0
>> >
>
>

