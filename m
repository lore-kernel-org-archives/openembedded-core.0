Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f47.google.com (mail-oi0-f47.google.com
	[209.85.218.47])
	by mail.openembedded.org (Postfix) with ESMTP id D5BD97457E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Aug 2018 13:21:42 +0000 (UTC)
Received: by mail-oi0-f47.google.com with SMTP id 8-v6so9820024oip.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Aug 2018 06:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=WyHFyEyBcpA6sKpB0han1GQZvsYywVCbPjp3p7Mh0R0=;
	b=y5gYnOehqSlF+kSeU1c0rLuFgZIlA6fZ2osMW0ZcyXs6PPIPE8ne7LvYRyGKCDzmFj
	exNE9cI7bPfQuWBmuqavV4w+hnCjSFFmmBLaiYiLlWICKVML8+pddJkC6byiycUjgXYo
	bMg40ANO7MACVbCj1VYqOiHH/oZxaQ5RDkk3fSQiipgg3n0tLTocalhJWAO5mO0VwlPx
	njezi8NH7K8mhbbRRdZ71ZfOElo2zRE/Hiucfc6vUDmHM5TiTYyG0ouOi/pxztD+DLO/
	hjdSXoINUyK7J4iwFCWKydfL7dFx+oRri4IvHbbSBUBIIfkSjTgXfVYiwj8cXLJugBMn
	8wug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=WyHFyEyBcpA6sKpB0han1GQZvsYywVCbPjp3p7Mh0R0=;
	b=PhJolC/+z6F7WiocM9Lw8QlYRnARfSO2gsQ+aSi1m00QosgnweTtcSscg4CeLNkH7W
	DMWxQIeRoclPzzICjf5XqgiBbTFcoK9sf0KjGe/Z3pJ3NDapimxdr/uxNtcgwmD8pTgG
	XAi4UYZKj+Hx4Qz7TuDfQ12PigXI8SE6CuEjkpSPwk4/zRVExWEzNy40AsRuiy83R6cg
	vcSsBaPCNnw1c4hua/5mxL/Kn1HGGLGABONoqJJmrsnKwmrK/+6sp8RJXScOUtf+QyyC
	2VgFMdG8MpG0rJk3u1nkFQqD2oqY7j3KKlsG7IJ9epKiAUDdjsK8Dk1vw9tcUUTpKeKh
	FIGQ==
X-Gm-Message-State: AOUpUlHtRNHIKVUiHZ+p+2c0lVBbc53ZqvTkEiZE58/kh9O8TKGFwUB9
	xNPt24wm7qMX4cXJMpAkjdxey5KhFzndrOph2cDlsg==
X-Google-Smtp-Source: AAOMgpdtU8lIAm3/hcDBwpu7Gj5wEYWMCSY0hnCwP4O2rRengvbdmzknLQMi1du1zGq1VLI+qw/wGd3OZwaRhd1U8JQ=
X-Received: by 2002:aca:efd7:: with SMTP id
	n206-v6mr3435766oih.70.1533302503848; 
	Fri, 03 Aug 2018 06:21:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:6845:0:0:0:0:0 with HTTP;
	Fri, 3 Aug 2018 06:21:23 -0700 (PDT)
In-Reply-To: <cf87613f225edd16345d2575996e3c923b3b3b5d.camel@iki.fi>
References: <20180802212200.1522-1-JPEWhacker@gmail.com>
	<cf87613f225edd16345d2575996e3c923b3b3b5d.camel@iki.fi>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 3 Aug 2018 14:21:23 +0100
Message-ID: <CAJTo0LaJaypPCA3v_tQoL0ccuffgm+i2WXvsM8QA8XtK99Ddcg@mail.gmail.com>
To: Tanu Kaskinen <tanuk@iki.fi>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] alsa-lib: Allow empty alsa-lib package for SDK
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
X-List-Received-Date: Fri, 03 Aug 2018 13:21:43 -0000
Content-Type: text/plain; charset="UTF-8"

I agree with Tanu, the packaging in this recipe is non-standard and
instead of making it more non-standard, let's just fix it.

Remove the libasound recipe, the contents of that can go into $PN.
Either way with Debian renaming it gets renamed to libasound2, and
without renaming it's still a sensible name.  The dependency hacks can
then all be removed.

Ross

On 3 August 2018 at 11:39, Tanu Kaskinen <tanuk@iki.fi> wrote:
> On Thu, 2018-08-02 at 16:22 -0500, Joshua Watt wrote:
>> Without ALLOW_EMPTY, the empty alsa-lib package (which gets culled)
>> makes it fairly difficult to create an image that has libasound, then
>> create an SDK from that image that has the proper development files.
>>
>> If there is no alsa-lib package, the only way to get libasound on a
>> target image is to do:
>>
>>  IMAGE_INSTALL += "libasound"
>>
>> This however causes a problem because all of the development files that
>> would be desired in the SDK are located in alsa-lib-dev, which won't be
>> included (because alsa-lib wasn't included). Without ALLOW_EMPTY_${PN},
>> it is not possible to do:
>>
>>  IMAGE_INSTALL += "alsa-lib"
>>
>> because the package is empty and gets culled. Adding the ALLOW_EMPTY and
>> then making alsa-lib RDEPEND on libasound solves this problem and allows
>> alsa-lib to be installed on the target and have the correct development
>> files in the SDK
>>
>> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
>> ---
>>  meta/recipes-multimedia/alsa/alsa-lib_1.1.6.bb | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.1.6.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.1.6.bb
>> index 6364e9eafaa..581655c5349 100644
>> --- a/meta/recipes-multimedia/alsa/alsa-lib_1.1.6.bb
>> +++ b/meta/recipes-multimedia/alsa/alsa-lib_1.1.6.bb
>> @@ -24,6 +24,13 @@ FILES_libasound = "${libdir}/libasound.so.*"
>>  FILES_alsa-server = "${bindir}/*"
>>  FILES_alsa-conf = "${datadir}/alsa/"
>>
>> +# Create an alsa-lib package even though it is empty and make it RDEPEND on
>> +# libasound for target builds. This makes it possible to sanely create a image
>> +# that has libasound and then generate an SDK from that image that has
>> +# alsa-lib-dev
>> +ALLOW_EMPTY_${PN} = "1"
>> +RDEPENDS_${PN}_class-target = "libasound"
>> +
>>  RDEPENDS_libasound = "alsa-conf"
>>
>>  # alsa-lib gets automatically added to alsa-lib-dev dependencies, but the
>
> Looks fine to me, although renaming alsa-lib-dev to libasound-dev would
> seem like a sensible option too.
>
> --
> Tanu
>
> https://www.patreon.com/tanuk
> https://liberapay.com/tanuk
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

