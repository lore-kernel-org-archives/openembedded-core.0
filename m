Return-Path: <ross.burton@intel.com>
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
	[209.85.167.195])
	by mail.openembedded.org (Postfix) with ESMTP id 120C3745B4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Oct 2018 20:42:45 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id s69-v6so2676117oie.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Oct 2018 13:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=da0J/sWdZ/1Qe9aRFWKQX7ZggNkUjjVWgplkvET5Ce8=;
	b=ynz/NXmfFcpVj5rZ62v6ohjCBxCtysi4ozf1oc9nvwrxYEzHOBdXra/HCjbaUaylNu
	2+EERl7HuvX444whuK7E1KJ10F/8WOxtAo2o5/NmEZkIxuycnpg40T5AfViNrWjR/DMq
	Fb+ra3qoAurZwvqWlgGxPIpbY7K2CKWAvTGil1xv2VGIHKtwDdYM5/UCuHVxRK1EFc7x
	awpTavxTfLp5gCf6yIYf3jB5paPppmGveJRFzD/dkiCjZF2sdRBd5ywk/4mvW0dFhmal
	zI3YSZam8ic+ip3yWqE+UM+azjcPiM4nAktYPOKJbk5x/DN+8+RpgOJjCzDtzBdrCnX0
	EpPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=da0J/sWdZ/1Qe9aRFWKQX7ZggNkUjjVWgplkvET5Ce8=;
	b=EhaN4ORZb7GakkP9KZowWQKmAV0s7ea3wXiIGT+wqWJOlfsLEweoJrpy/oss2dmmV9
	QFyq0AorMUVTT3LUKh8GWTP8qze5W728fc1tRMynxyTrE3SXcUSdPNaI/qL9X07R4Org
	7bdWnqt7sWWEQe1eYRtXoa+qPBXSiOpQYR4pcWi/nRLJnAHaDzJ3TyTIg0UmwOhMLHyL
	WhBbc4G6UbRRNLyhZqHa8iQ4wVTsAt5uRhXTCZ6NOLA2SdupBaw5t9CToO0GuaWR3ACz
	M64dhDtXsW+I3IK5gPYP6+/ZPbKe6j2n4BiVAhblc5ii3K76l9ld77tshN/+FJ3rYa/o
	fx/Q==
X-Gm-Message-State: ABuFfog0PIZRpOJQKIIehqDFiHmVel+wfClr+K4Yj+6qLy6Gt0xwEMaC
	viDq2xF5MpY/dpMQ5dL9xyKY+kZVpWzbohzBO3TN2g==
X-Google-Smtp-Source: ACcGV60ynAlG3gdGxClwJsXXBsFlCP9R4B9+7b/hPewGtYVzpx5h2pi6KnrLphas7fz+IGVQmZwNc/jeGWTcPQNhFUc=
X-Received: by 2002:aca:5511:: with SMTP id
	j17-v6mr7927513oib.17.1538512966975; 
	Tue, 02 Oct 2018 13:42:46 -0700 (PDT)
MIME-Version: 1.0
References: <20181002191136.8792-1-raj.khem@gmail.com>
	<CAJTo0LaN2cjd6o67epNgi0+8g1VE+1GnLCGdYDVsFLj01b_Oww@mail.gmail.com>
	<CAMKF1sq4xUqHtSVOB_C8Gt6Op_6MNmjrxxEzGTtC5R1eoT4MPw@mail.gmail.com>
In-Reply-To: <CAMKF1sq4xUqHtSVOB_C8Gt6Op_6MNmjrxxEzGTtC5R1eoT4MPw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 2 Oct 2018 21:42:35 +0100
Message-ID: <CAJTo0LYAWwjocAccnV10ppx8JQ+and=qxqJ0=AqUu56jg_iyUA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa: Disable asm on musl
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
X-List-Received-Date: Tue, 02 Oct 2018 20:42:46 -0000
Content-Type: text/plain; charset="UTF-8"

Can you file a bug with mesa so we don't forget and Mesa knows?

Ross
On Tue, 2 Oct 2018 at 20:37, Khem Raj <raj.khem@gmail.com> wrote:
>
> I think it is. The way th calls are set for performance reasons seems to be causing this
> Ideally we should ensure to use right dialect for  tls calls I think musl is exposing a bug in Mesa
> Which we covered by disabling tls in Glx once we disable that then this problem pops up so we disable ASM
>
> So this is a workaround until then
>
> On Tue, Oct 2, 2018 at 12:28 PM Burton, Ross <ross.burton@intel.com> wrote:
>>
>> Isn't this a bit overkill?  Is the assembler actually broken?
>>
>> Ross
>> On Tue, 2 Oct 2018 at 20:21, Khem Raj <raj.khem@gmail.com> wrote:
>> >
>> > some unknown part of mesa's x86 assembly
>> > code is broken by readonly text segments
>> >
>> > [ YOCTO #12918 ]
>> >
>> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> > ---
>> >  meta/recipes-graphics/mesa/mesa.inc | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
>> > index 8d0e2cb67c..e6f3712706 100644
>> > --- a/meta/recipes-graphics/mesa/mesa.inc
>> > +++ b/meta/recipes-graphics/mesa/mesa.inc
>> > @@ -107,7 +107,7 @@ PACKAGECONFIG[osmesa] = "--enable-${OSMESA},--disable-${OSMESA}"
>> >  PACKAGECONFIG[unwind] = "--enable-libunwind,--disable-libunwind,libunwind"
>> >
>> >  EXTRA_OECONF_remove_libc-musl = "--enable-glx-tls"
>> > -EXTRA_OECONF_append_libc-musl = " --disable-glx-tls"
>> > +EXTRA_OECONF_append_libc-musl = " --disable-asm --disable-glx-tls"
>> >  # llvmpipe is slow if compiled with -fomit-frame-pointer (e.g. -O2)
>> >  FULL_OPTIMIZATION_append = " -fno-omit-frame-pointer"
>> >
>> > --
>> > 2.19.0
>> >
>> > --
>> > _______________________________________________
>> > Openembedded-core mailing list
>> > Openembedded-core@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

