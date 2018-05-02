Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f52.google.com (mail-it0-f52.google.com
	[209.85.214.52])
	by mail.openembedded.org (Postfix) with ESMTP id 9E42660603
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 May 2018 09:26:50 +0000 (UTC)
Received: by mail-it0-f52.google.com with SMTP id p3-v6so16699203itc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 May 2018 02:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=yamWYG+fe5QsLkfDjDs9OqQI1PSXitFT2TlkMAW1obs=;
	b=FEDM1P9JxbB8xKesjdGxHXlq0hC9MUkH6RIkFWVYyBTlKULk0IuIYmXUN37+nwqxrr
	G22CIIrCk9ehRvj/1gcYdEs2QrJeoP+CsphiZ2QJCXcTGt8TFmgYEWYy4e8te+JpOufU
	LLkAAL+bnHyVPRS4lrJGGMdo0VIaA8FZHCGgXLxqVWG9wSYO7BWbBPrVIAIKXkWcEABO
	Meoi1GTMLN2VepWYPIykiu4jhXFONDXBR8rDUN/lnuKwGM+rYMocF+298c3tJH3eu9dv
	LdEleWB7uMOm7hB5ovhOn8Yu1mE1f4PnhRje39m4odyhrR3OmXZYq9MvKMrLi+E5VpOs
	1O0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=yamWYG+fe5QsLkfDjDs9OqQI1PSXitFT2TlkMAW1obs=;
	b=dop4GkqTvCN43nsaOQFZKCvcCw1BfaGe2ZpoGh23/R3wq8/yvDNdABkECailNg+TRR
	24yGS8vaNCE2O2U5iDm37GnGo0S4kvK9ZDD3uhh4DuKjHjtbNzHT82Qbalfie+T1sG74
	N1nCd7AfuLuLJ4fzi563OKl7+qer9k9sEcloYmdzXHvlQOmtxt8qEKVNcX0Q2pCItoBU
	FM0xWOz2m7m4wQwObmZZdHB8CUqWboqlvWa/2ji7RAIStX8dKDqQyo+EwOludxl6i9Ub
	lUDnRscrc7tsFvubIY4H6x01suCI6bd7jCYsuM527VfqefuiIwAmjSCImTB0RLNXUS3M
	9NFA==
X-Gm-Message-State: ALQs6tBUFeBzLv3f3Wp+7zuEcIeSxQB+e3EKJMQokTzpDpZ7DTpnAopQ
	jumf19rfjLjNe4YNOTqiY0MdphgjxFwv4dJkWbr2Yw==
X-Google-Smtp-Source: AB8JxZo1/O43WKh9qhI5TH4/M1Fo+EHIFy+pRpDXRSeQxro/FwVAR7I3/pclXbpEnuT7tX/lqkHtscdRqomj0Xd12Po=
X-Received: by 2002:a24:a00a:: with SMTP id
	o10-v6mr19405266ite.34.1525253211282; 
	Wed, 02 May 2018 02:26:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.29.203 with HTTP; Wed, 2 May 2018 02:26:30 -0700 (PDT)
In-Reply-To: <1f6c9477-d9f1-df66-eefe-058a643a2684@intel.com>
References: <cover.1524640773.git.kai.kang@windriver.com>
	<47c479f97f5141b022f0e8f55015116a3af39b29.1524640773.git.kai.kang@windriver.com>
	<1f6c9477-d9f1-df66-eefe-058a643a2684@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 2 May 2018 10:26:30 +0100
Message-ID: <CAJTo0Lb=vGJAZMNBTrUuOapr6zn42in+fcFhM=7cktDUfwiWrA@mail.gmail.com>
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 5/8] gstreamer1.0-plugins-good: 1.12.4 -> 1.14.0
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
X-List-Received-Date: Wed, 02 May 2018 09:26:51 -0000
Content-Type: text/plain; charset="UTF-8"

Anuj, it sounds like your series is a more comprehensive upgrade, can
you submit your patches now?  We'll be reopening master shortly.

Thanks,
Ross

On 2 May 2018 at 04:17, Anuj Mittal <anuj.mittal@intel.com> wrote:
> On 04/25/2018 03:23 PM, kai.kang@windriver.com wrote:
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> Upgrade gstreamer1.0-plugins-good from 1.12.4 to 1.14.0.
>>
>> * add packageconfig 'gtk' and configure option '--disable-qt' from -bad
>> * add packageconfig 'lame', 'mpg123' and configure option
>>   '--disable-twolame' from -ugly
>> * remove configure option '--disable-sunaudio' since plugin sunaudio has
>>   been removed
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>  .../gstreamer/gstreamer1.0-plugins-good.inc               | 15 +++++++++++++--
>>  ...good_1.12.4.bb => gstreamer1.0-plugins-good_1.14.0.bb} |  4 ++--
>>  2 files changed, 15 insertions(+), 4 deletions(-)
>>  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.12.4.bb => gstreamer1.0-plugins-good_1.14.0.bb} (85%)
>>
>> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
>> index 14c3d61848..ed14ed56c2 100644
>> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
>> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
>> @@ -6,10 +6,12 @@ DEPENDS += "gstreamer1.0-plugins-base libcap zlib bzip2"
>>
>>  inherit gettext
>>
>> +# gtk is not in the PACKAGECONFIG variable by default until
>> +# the transition to gtk+3 is finished
>>  PACKAGECONFIG ??= " \
>>      ${GSTREAMER_ORC} \
>>      ${@bb.utils.filter('DISTRO_FEATURES', 'pulseaudio x11', d)} \
>> -    cairo flac gdk-pixbuf gudev jpeg libpng soup speex taglib v4l2 \
>> +    cairo flac gdk-pixbuf gudev jpeg lame libpng mpg123 soup speex taglib v4l2 \
>>  "
>>
>>  X11DEPENDS = "virtual/libx11 libsm libxrender libxfixes libxdamage"
>> @@ -18,11 +20,14 @@ PACKAGECONFIG[cairo]      = "--enable-cairo,--disable-cairo,cairo"
>>  PACKAGECONFIG[dv1394]     = "--enable-dv1394,--disable-dv1394,libiec61883 libavc1394 libraw1394"
>>  PACKAGECONFIG[flac]       = "--enable-flac,--disable-flac,flac"
>>  PACKAGECONFIG[gdk-pixbuf] = "--enable-gdk_pixbuf,--disable-gdk_pixbuf,gdk-pixbuf"
>> +PACKAGECONFIG[gtk]             = "--enable-gtk3,--disable-gtk3,gtk+3"
>>  PACKAGECONFIG[gudev]      = "--with-gudev,--without-gudev,libgudev"
>>  PACKAGECONFIG[jack]       = "--enable-jack,--disable-jack,jack"
>>  PACKAGECONFIG[jpeg]       = "--enable-jpeg,--disable-jpeg,jpeg"
>> +PACKAGECONFIG[lame]       = "--enable-lame,--disable-lame,lame"
>>  PACKAGECONFIG[libpng]     = "--enable-libpng,--disable-libpng,libpng"
>>  PACKAGECONFIG[libv4l2]    = "--with-libv4l2,--without-libv4l2,v4l-utils"
>> +PACKAGECONFIG[mpg123]     = "--enable-mpg123,--disable-mpg123,mpg123"
>>  PACKAGECONFIG[pulseaudio] = "--enable-pulse,--disable-pulse,pulseaudio"
>>  PACKAGECONFIG[soup]       = "--enable-soup,--disable-soup,libsoup-2.4"
>>  PACKAGECONFIG[speex]      = "--enable-speex,--disable-speex,speex"
>> @@ -32,6 +37,11 @@ PACKAGECONFIG[vpx]        = "--enable-vpx,--disable-vpx,libvpx"
>>  PACKAGECONFIG[wavpack]    = "--enable-wavpack,--disable-wavpack,wavpack"
>>  PACKAGECONFIG[x11]        = "--enable-x,--disable-x,${X11DEPENDS}"
>>
>> +# qt5 support is disabled, because it is not present in OE core, and requires more work than
>> +# just adding a packageconfig (it requires access to moc, uic, rcc, and qmake paths).
>> +# This is better done in a separate qt5 layer (which then should add a "qt5" packageconfig
>> +# in a gstreamer1.0-plugins-bad bbappend).
>> +
>>  EXTRA_OECONF += " \
>>      --enable-bz2 \
>
> bz2 and zlib are optional and perhaps should be moved to PACKAGECONFIG
> instead.
>
> I had done a similar upgrade but was waiting for the release before
> submitting:
>
> https://github.com/anujm1/poky/commit/83204baaa9023e1514132534acbb4ec3968c1a15
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

