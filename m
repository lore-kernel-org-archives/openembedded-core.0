Return-Path: <koen.kooi@linaro.org>
Received: from mail-lb0-f179.google.com (mail-lb0-f179.google.com
	[209.85.217.179])
	by mail.openembedded.org (Postfix) with ESMTP id 954FB6FF01
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 07:44:17 +0000 (UTC)
Received: by mail-lb0-f179.google.com with SMTP id cl12so18446144lbc.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 23:44:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=NwoNek7eC58T8jBmT4FotdS/6qCA8+/DXZnXOPJF9ZQ=;
	b=d1QxxGmmQrjKMYOJtryH1QCLCQAOgVtvlVD5MJIpEXPGBzMuFwQBU0qNLapHiLmxOR
	h8l00j6W+Z0kJ/MutkpaukerC1vJfwOeJ0J7TLw2T1ZxJVg0ihatslbw0jkyKz+bJdui
	dLhhCVxX0XhMrXz0TfD7sGVIGaPEUhVUVD3Lg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=NwoNek7eC58T8jBmT4FotdS/6qCA8+/DXZnXOPJF9ZQ=;
	b=m19m6I8GGKSbu0Q65mPhtf/uc9HWdGXs4CaaoUmLdRBw6s0gLjvUegssPzBZbw+8m5
	9d6Auj6/LVmrNJw8J1N9EM/7oOl+w5qpF4zId4ryPOp4Pmc/wzLnIjFciYWIGOUSmx2O
	u+GFzca65AvVUFtnScNDAyED/RK9k2ulTMVYkh/fhyhoPsDOVrt/D6XimHAnZQW9JzZA
	FilPNd5a1o5aBoQ85AGoVL0q71PPE6pCddQ6YdRsfhLXqhhYWE2U5cNROBUc2hsB2ClS
	Fu3aQWSN6F7RbyP19e1opbapMBiWixjjUL+HCp7m3OUFJCoWzJxbwsQOAtPsjqpgikHr
	T70w==
X-Gm-Message-State: ALoCoQmG9W7+2xFP5a26TQV3kmGyulQgo/546XqXH0tDxY2KrQbItswG5BQpayR7E60IJUhDNsV4+UHyypfStKxHxYyRdZUTICs1OCwf/BZsDTjiU7DmaAo=
MIME-Version: 1.0
X-Received: by 10.112.198.72 with SMTP id ja8mr14877360lbc.142.1453362257076; 
	Wed, 20 Jan 2016 23:44:17 -0800 (PST)
Received: by 10.112.204.200 with HTTP; Wed, 20 Jan 2016 23:44:17 -0800 (PST)
In-Reply-To: <56A08BE4.1090306@windriver.com>
References: <1453360859-16992-1-git-send-email-koen.kooi@linaro.org>
	<56A08BE4.1090306@windriver.com>
Date: Thu, 21 Jan 2016 08:44:17 +0100
Message-ID: <CAP0W-R=Nqx=eqhvXD6Ex=RB8NxiPZcpwWqSMA+RvT1W3CMct2g@mail.gmail.com>
From: Koen Kooi <koen.kooi@linaro.org>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] e2fsprogs: disable libblkid again
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
X-List-Received-Date: Thu, 21 Jan 2016 07:44:17 -0000
Content-Type: text/plain; charset=UTF-8

On 21 January 2016 at 08:42, Robert Yang <liezhi.yang@windriver.com> wrote:
>
>
> On 01/21/2016 03:20 PM, Koen Kooi wrote:
>>
>> We use the util-linux one and do_install deletes it anyway.
>>
>> See OE-core commit fb8e776ea91c39d586b46400ad30aeea8dead1c4 for more info.
>>
>> Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
>> ---
>>   meta/recipes-devtools/e2fsprogs/e2fsprogs_git.bb | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_git.bb
>> b/meta/recipes-devtools/e2fsprogs/e2fsprogs_git.bb
>> index c82e99a..f244473 100644
>> --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_git.bb
>> +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_git.bb
>> @@ -14,7 +14,7 @@ UPSTREAM_CHECK_GITTAGREGEX =
>> "v(?P<pver>\d+\.\d+(\.\d+)*)$"
>>
>>   EXTRA_OECONF += "--libdir=${base_libdir} --sbindir=${base_sbindir} \
>>                   --enable-elf-shlibs --disable-libuuid --disable-uuidd \
>> -                --enable-libblkid --enable-verbose-makecmds"
>> +                --disable-libblkid --enable-verbose-makecmds"
>
>
> Thanks, maybe we also need cleanup other codes like:
>
>     # We use blkid from util-linux now so remove from here
>     rm -f ${D}${base_libdir}/libblkid*

That one should stay in, because we *really* don't want it to end up
in packages.

>
> And:
>
> ALTERNATIVE_${PN}-doc = "libblkid.3 blkid.8"
> ALTERNATIVE_LINK_NAME[libblkid.3] = "${mandir}/man3/libblkid.3"
> ALTERNATIVE_LINK_NAME[blkid.8] = "${mandir}/man8/blkid.8"

I don't have a strong opinion on those, RP?

>
> // Robert
>
>
>>
>>   EXTRA_OECONF_darwin = "--libdir=${base_libdir} --sbindir=${base_sbindir}
>> --enable-bsd-shlibs"
>>
>>
>



-- 
Koen Kooi

Builds and Baselines | Release Manager
Linaro.org | Open source software for ARM SoCs

