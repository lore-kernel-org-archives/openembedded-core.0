Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f176.google.com (mail-it1-f176.google.com
	[209.85.166.176])
	by mail.openembedded.org (Postfix) with ESMTP id 1E3316D147
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2019 17:02:07 +0000 (UTC)
Received: by mail-it1-f176.google.com with SMTP id e24so21590747itl.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2019 10:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=WXcCe+3U/CFHSHPnM7+e92+RJe/fEz0su3Oj8u4Eixw=;
	b=0mguLCBbNIJYfJ5kXhqOsLsWghBht9q+Hans9vNmlyreNNGszXTETpPRf2XdXeyRdl
	+zAN2W/WdPmcg3HdlZM2HFuzW1ds7OrlIrc4xHGYpVWTtI0X69ejzAN+5YU974pYHvjj
	Edu+hj0m5sJUnVRXQXVnDPUwIp5EiIBiNsiwxWBXKVZpGsW4VxDce+tLnO1NlqSn0s5N
	CNLh/nj5kpQ56V2nJKBOYkbvGUIr5ULP6kxBcfBImKVtsrO2CsDFVgzAUKh4TcAadXRB
	KmAmllgvV2sH4DnKUgJiptgFDvRqrpyULVQsBx5QGc6yi50mknf2+H1RwIKxTjHawRK1
	x+1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=WXcCe+3U/CFHSHPnM7+e92+RJe/fEz0su3Oj8u4Eixw=;
	b=ldWI4i6s5waN4hJxU/ccJNxAoY7PSrzvVxpqteqL4XKp4yjMfOuyw8LD8YepTxUIOu
	88vkyg+ejBN++q+briYeYsC4fAid/KFZ5fROSqFstbgTimPrjyb2dC+/eaFcVuAKgv2F
	e9VubNzMtTDPATAXs0Fx371AYgeAQ/bb4wqT7LqBPIHIJ5wKJdzkSWEgQaADbLmNvItV
	rJ/i2YjHOwGtSzjpfRE7C9eDDarMj0yIY5TOrVZpzr9MGV0FOPkIlh0OdpELZ142Sit9
	7cAWTjRB909XuRuWwFwEyJe59wmSh++5LPh1w8hEXFiB8vSKA7JS98nZQHIoZg/gbEW7
	yDVA==
X-Gm-Message-State: APjAAAVZCJnj5UqzZwJALLSFq55YVySCYOmEQvZjdBnytnW3SmhWNJ+9
	rmU8J1ekuyOs8MVTNgDJNsomRXRVWuLKV9KoFc1I05KZ
X-Google-Smtp-Source: APXvYqyUVz0FpPl5HRhmTlYqxQAV+ZOdIUp0EHTkSkepz4YY/TuZLhCGKc143M2JOHK1RGhd8QXNQiYFSQVUE5nzy90=
X-Received: by 2002:a24:1747:: with SMTP id 68mr9361472ith.62.1552928528752;
	Mon, 18 Mar 2019 10:02:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190318165138.30402-1-paul@betafive.co.uk>
In-Reply-To: <20190318165138.30402-1-paul@betafive.co.uk>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 18 Mar 2019 17:01:57 +0000
Message-ID: <CAJTo0Lbbcaexxy-PXpbmZhicdrR0z1pfi7Qu0St6N7CNT0VgEA@mail.gmail.com>
To: Paul Barker <paul@betafive.co.uk>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] tzdata: Add tzdata-all package
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
X-List-Received-Date: Mon, 18 Mar 2019 17:02:08 -0000
Content-Type: text/plain; charset="UTF-8"

I'd prefer that installing 'tzdata' installed everything, and then
there were other pieces for subsets.  We learnt this the hard way from
people installing "python" and wondering why bits of the standard
library were missing.

Ross

On Mon, 18 Mar 2019 at 17:01, Paul Barker <paul@betafive.co.uk> wrote:
>
> The tzdata-all package provides a simple way of ensuring all timezones
> are supported in an image.
>
> Signed-off-by: Paul Barker <paul@betafive.co.uk>
> ---
>  meta/recipes-extended/timezone/tzdata.bb | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-extended/timezone/tzdata.bb b/meta/recipes-extended/timezone/tzdata.bb
> index 7542ce52d2..e419296530 100644
> --- a/meta/recipes-extended/timezone/tzdata.bb
> +++ b/meta/recipes-extended/timezone/tzdata.bb
> @@ -82,7 +82,14 @@ pkg_postinst_${PN} () {
>
>  PACKAGES = "tzdata tzdata-misc tzdata-posix tzdata-right tzdata-africa \
>      tzdata-americas tzdata-antarctica tzdata-arctic tzdata-asia \
> -    tzdata-atlantic tzdata-australia tzdata-europe tzdata-pacific"
> +    tzdata-atlantic tzdata-australia tzdata-europe tzdata-pacific tzdata-all"
> +
> +ALLOW_EMPTY_tzdata-all = "1"
> +RDEPENDS_tzdata-all = " \
> +    tzdata tzdata-misc tzdata-posix tzdata-right tzdata-africa \
> +    tzdata-americas tzdata-antarctica tzdata-arctic tzdata-asia \
> +    tzdata-atlantic tzdata-australia tzdata-europe tzdata-pacific \
> +    "
>
>  FILES_tzdata-africa += "${datadir}/zoneinfo/Africa/*"
>  RPROVIDES_tzdata-africa = "tzdata-africa"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

