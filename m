Return-Path: <armccurdy@gmail.com>
Received: from mail-ua0-f193.google.com (mail-ua0-f193.google.com
	[209.85.217.193])
	by mail.openembedded.org (Postfix) with ESMTP id 5A9E678A2A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2018 18:49:08 +0000 (UTC)
Received: by mail-ua0-f193.google.com with SMTP id o11-v6so1342114uak.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2018 11:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=sLp4vYxRMbFW17hEW2X780IUEZVlVECFQuwXeQWXQj8=;
	b=XaC/xxX6wnsD8JzYIhPyQCqdo68cWRde8czuY8VHDSjwP5zrLVtFAkkygLvTlUSV+m
	8gGw39EWXHslcZjJlWmbC2BdheUs9QGgN9/cYdALFh3xUM67I8QZpIDoG3sCgPnZCpGM
	TUQNKMDqFBIg2UoVMndRrsuFtcKnhHqUEiRBHHNqMBK1QAhVqEaN5ULoNY9GakfCLi/R
	zL9+bHYaNbmZQgLxuHw/EuXOGf653UyTHpHSvzzw6w5Edsc5KpY9mHZXwpSaLh8U/r1+
	xDHEzywGDjP8GcIJGwYytpeWkJCPi1rExYyzuTxP5YLyhr7vL6KXMS3bGJDNOy9OLLpX
	dBUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=sLp4vYxRMbFW17hEW2X780IUEZVlVECFQuwXeQWXQj8=;
	b=PUu/yyOqUhaNB0uP9VadKPvSt0ID5vvu+U+BfqyGifLqLymg+zkriWX0Z+sptCdJWe
	Iikg+ZFfj2mnZcH7Wr4iQ0PPehRas0mOfsm0uZ5UONK04Kn3fbdCprNgGiHGUicuiOdJ
	+01KLiuzGc7xwyTPBlX8wWxD23pw1yD46TtqWNpxVNtdgCXUNDfcxINM6mQaoQ7PEtj2
	jBab6FMtvKxsvbcKh7HKdSU/qm7Zwrliqzck358VM+HhKYP41N3vP4O5H0yRYJrAHOWB
	YaXl5jtz3dBIXYhWtQ3YoNdAVOeasHelBF3odsg45PQ1FYUcZOnG9g8vNaYAcqwbQ9pz
	ju7Q==
X-Gm-Message-State: AOUpUlHQgyRJhYJHn6qZ5s1UoZuqcYN7eNGsPmSXXq6d2W6DxPKsk0aa
	spofOI1u0HFjQ2FjxXDGkO7OlZb18ybs85qg3GM=
X-Google-Smtp-Source: AAOMgpfJ6Gj9K6tEvBDQZa4uMT1y5RAUmUIZc8opJw/rPjYfvvPVsF0am5MHzCQT5Y8ErFsphBT4BrH5IPRvqq9Qg3E=
X-Received: by 2002:ab0:6654:: with SMTP id
	b20-v6mr1940094uaq.193.1531853349168; 
	Tue, 17 Jul 2018 11:49:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:2a5:0:0:0:0:0 with HTTP;
	Tue, 17 Jul 2018 11:49:08 -0700 (PDT)
In-Reply-To: <CAMKF1spGseSt53y4jON1S0sX8VFn4MfuQhyfPNfh3zK0Jt4asQ@mail.gmail.com>
References: <1531850817-26274-1-git-send-email-armccurdy@gmail.com>
	<CAMKF1sp3z1n+t5QKgbiWn6MkXEGOEFF_8G_X=1dYFTcx48U3RQ@mail.gmail.com>
	<CAJ86T=WYor_Gf2dpio37Yu86bmCfeDht9s6p02XFgH_2QDOv9w@mail.gmail.com>
	<CAMKF1spGseSt53y4jON1S0sX8VFn4MfuQhyfPNfh3zK0Jt4asQ@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 17 Jul 2018 11:49:08 -0700
Message-ID: <CAJ86T=XhVww9055CC8dcyySHPhiRfK1bDPdoyQwzFCXorep6yg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] curl: disable C source code generator
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
X-List-Received-Date: Tue, 17 Jul 2018 18:49:08 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 17, 2018 at 11:37 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Tue, Jul 17, 2018 at 11:34 AM Andre McCurdy <armccurdy@gmail.com> wrote:
>>
>> On Tue, Jul 17, 2018 at 11:29 AM, Khem Raj <raj.khem@gmail.com> wrote:
>> > On Tue, Jul 17, 2018 at 11:07 AM Andre McCurdy <armccurdy@gmail.com> wrote:
>> >>
>> >> The --libcurl command line option causes curl to generate C source
>> >> code which, when compiled and linked with libcurl, creates a binary
>> >> which behaves in the same way as curl when run with the other options
>> >> passed on the curl command line.
>> >>
>> >>   https://curl.haxx.se/docs/manpage.html#--libcurl
>> >>
>> >> It's a development tool and not generally useful on the target,
>> >> especially if the target doesn't contain a toolchain etc.
>> >>
>> >
>> > probably better to have it controlled via packageconfig knob
>>
>> Really? Why?
>
> We do have people building SDKs for SBCs which ship development
> environments on targets and I believe
> it does not hurt to use packageconfig. Do you see downsides ?

It's an extremely obscure feature and I think PACKAGECONFIG options
should be reserved for stuff which we want to advertise as being
something a general user might want or need to control.

Of course there are targets which have toolchains, but I think the
chance that someone wants or needs to develop fixed function curl
replacement binaries on the target is close to zero.

>> >> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>> >> ---
>> >>  meta/recipes-support/curl/curl_7.61.0.bb | 1 +
>> >>  1 file changed, 1 insertion(+)
>> >>
>> >> diff --git a/meta/recipes-support/curl/curl_7.61.0.bb b/meta/recipes-support/curl/curl_7.61.0.bb
>> >> index 03d627e..cc983fd 100644
>> >> --- a/meta/recipes-support/curl/curl_7.61.0.bb
>> >> +++ b/meta/recipes-support/curl/curl_7.61.0.bb
>> >> @@ -49,6 +49,7 @@ PACKAGECONFIG[verbose] = "--enable-verbose,--disable-verbose"
>> >>  PACKAGECONFIG[zlib] = "--with-zlib=${STAGING_LIBDIR}/../,--without-zlib,zlib"
>> >>
>> >>  EXTRA_OECONF = " \
>> >> +    --disable-libcurl-option \
>> >>      --disable-ntlm-wb \
>> >>      --enable-crypto-auth \
>> >>      --with-ca-bundle=${sysconfdir}/ssl/certs/ca-certificates.crt \
>> >> --
>> >> 1.9.1
>> >>
>> >> --
>> >> _______________________________________________
>> >> Openembedded-core mailing list
>> >> Openembedded-core@lists.openembedded.org
>> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core

