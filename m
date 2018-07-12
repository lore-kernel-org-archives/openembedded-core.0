Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f43.google.com (mail-oi0-f43.google.com
	[209.85.218.43])
	by mail.openembedded.org (Postfix) with ESMTP id 2E2D677DE7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2018 16:40:51 +0000 (UTC)
Received: by mail-oi0-f43.google.com with SMTP id s198-v6so56973026oih.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2018 09:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=bftg+AABYL3EQrX0YX5y/yPpGEQuukDI+SrYR9ArmUM=;
	b=AKcStMun6CfEX0dme+YI4Ehon9aLY7+1Y4hYqEakqnlP4X2jL/i3NThn0HSXyWUmPV
	zTDE29Fwtj7IpakEL66WUcFh3cPa6mm6B5DXzDqSkkL8swrTazUQ7wvAV23N60q0GTil
	HNM9j8XA3ghhsqsMCNZilonkv/IU+8ZiWjlR6eY/nO/+OQ3ZA7SZfspOK7JMeGct11kr
	38qBLFTTi0lc8OdJxzeebAM99b47oLjuNrC7Td+kUPutW/C3KCNcjSUmLwq9sqBeXfNn
	alpOx3OHY4CP7BbUKSBuNsR8aUCVbbBJ7JM+SFopHe9sOaDxBlg4/dGdAysf6TArxHnj
	Rwcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=bftg+AABYL3EQrX0YX5y/yPpGEQuukDI+SrYR9ArmUM=;
	b=dW/6bmVAzXMKj3N3RMDhDHhzXcTqXsciXl2YIvRn6dDhofSFnnOGUo0v9cZAm/1kXA
	U5rQv29WZk6knixHUX9e9CfUXMDyiCcpRAjqmfqOOWsiAgj1t+FdPynj2+Jz6KpCFUqG
	IYnfTG4iF07AW2DhRGDr30AN7LV7td9OGM9nChoIKUpYQ/CMivvK+YFHiu1dsqGjqHfq
	bYOZAuj1Hz86kwcDKNH17oxs4NWh4xf1sybdaKZUm77Hdi7SvAqhKBCipihA806/snN5
	XyGS8dGSARbBLV6CCqWkoD1sJrGXzKw1TPTdBC1DPDbJqvJ2hJT4D54Zrt9NhJbKrSCx
	Hj6g==
X-Gm-Message-State: AOUpUlHfIu54UGEEMWVX1DKyC38k/mF6U6f2PnSHWi14OFkC1s8jw1iF
	0A7fXDK2eFnAwoQ5xLpQSnUtqjsgsswU7guozv8IXw==
X-Google-Smtp-Source: AAOMgpfaq9z/sB47wqxgcB/ZeGtibDDixecxj0+RcBdKl9lTth8njP8F8yjugdUUFzyOLoLzJLDBB6PDp6yiIcnGtik=
X-Received: by 2002:aca:f409:: with SMTP id
	s9-v6mr3356933oih.102.1531413652237; 
	Thu, 12 Jul 2018 09:40:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:6845:0:0:0:0:0 with HTTP; Thu, 12 Jul 2018 09:40:31
	-0700 (PDT)
In-Reply-To: <007BD92917A2324FA403BCF9A464CF84F350882A@ALA-MBD.corp.ad.wrs.com>
References: <20180710230346.156994-1-joe.slater@windriver.com>
	<5ae15c76-ddaf-fbe5-4fac-1149af924b41@gmail.com>
	<007BD92917A2324FA403BCF9A464CF84F3508181@ALA-MBD.corp.ad.wrs.com>
	<007BD92917A2324FA403BCF9A464CF84F350882A@ALA-MBD.corp.ad.wrs.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 12 Jul 2018 17:40:31 +0100
Message-ID: <CAJTo0LbT3SBSHBDKx164PrPraBh8NVHj5ZbT-Tjm9JCtotsM6A@mail.gmail.com>
To: "Slater, Joseph" <joe.slater@windriver.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] tiff: security fix CVE-2018-10963
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
X-List-Received-Date: Thu, 12 Jul 2018 16:40:51 -0000
Content-Type: text/plain; charset="UTF-8"

Please.

Ross

On 12 July 2018 at 17:29, Slater, Joseph <joe.slater@windriver.com> wrote:
> Should this be resubmitted?  I could always remove the comment about 4.0.8.    Joe
> ________________________________________
> From: Slater, Joseph
> Sent: Tuesday, July 10, 2018 4:56 PM
> To: akuster808; openembedded-core@lists.openembedded.org
> Subject: RE: [OE-core] [oe-core][PATCH 1/1] tiff: security fix CVE-2018-10963
>
> Yes, it is not clear.  What it means is that the patch was applied to 4.0.8 code, but not, I think, 4.0.8 code as seen on openembedded-core before 4.0.8 was obsolete.  It still applies for 4.0.9.
>
> Joe
>
> -----Original Message-----
> From: akuster808 [mailto:akuster808@gmail.com]
> Sent: Tuesday, July 10, 2018 4:48 PM
> To: Slater, Joseph; openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [oe-core][PATCH 1/1] tiff: security fix CVE-2018-10963
>
>
>
> On 07/10/2018 04:03 PM, Joe Slater wrote:
>> Denial of service described at https://nvd.nist.gov/vuln/detail/CVE-2018-10963.
>>
>> Signed-off-by: Joe Slater <joe.slater@windriver.com>
>> ---
>>  .../libtiff/files/CVE-2018-10963.patch             | 41 ++++++++++++++++++++++
>>  meta/recipes-multimedia/libtiff/tiff_4.0.9.bb      |  1 +
>>  2 files changed, 42 insertions(+)
>>  create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2018-10963.patch
>>
>> diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2018-10963.patch b/meta/recipes-multimedia/libtiff/files/CVE-2018-10963.patch
>> new file mode 100644
>> index 0000000..13a1eb5
>> --- /dev/null
>> +++ b/meta/recipes-multimedia/libtiff/files/CVE-2018-10963.patch
>> @@ -0,0 +1,41 @@
>> +From de144fd228e4be8aa484c3caf3d814b6fa88c6d9 Mon Sep 17 00:00:00 2001
>> +From: Even Rouault <even.rouault@spatialys.com>
>> +Date: Sat, 12 May 2018 14:24:15 +0200
>> +Subject: [PATCH] TIFFWriteDirectorySec: avoid assertion. Fixes
>> + http://bugzilla.maptools.org/show_bug.cgi?id=2795.
>> + CVE-2018-10963
>> +
>> +---
>> +CVE: CVE-2018-10963
>> +
>> +Same patch as applied to 4.0.8.
> I don't know what that means. The fix is in 4.0.8 or this patch applies
> cleanly to 4.0.8 or affects < 4.0.8.
> - armin
>
>> +
>> +Upstream-Status: Backport [gitlab.com/libtiff/libtiff/commit/de144f...]
>> +
>> +Signed-off-by: Joe Slater <joe.slater@windriver.com>
>> +
>> +---
>> + libtiff/tif_dirwrite.c |    7 +++++--
>> + 1 file changed, 5 insertions(+), 2 deletions(-)
>> +
>> +diff --git a/libtiff/tif_dirwrite.c b/libtiff/tif_dirwrite.c
>> +index 2430de6..c15a28d 100644
>> +--- a/libtiff/tif_dirwrite.c
>> ++++ b/libtiff/tif_dirwrite.c
>> +@@ -695,8 +695,11 @@ TIFFWriteDirectorySec(TIFF* tif, int isimage, int imagedone, uint64* pdiroff)
>> +                                                             }
>> +                                                             break;
>> +                                                     default:
>> +-                                                            assert(0);   /* we should never get here */
>> +-                                                            break;
>> ++                                                            TIFFErrorExt(tif->tif_clientdata,module,
>> ++                                                                        "Cannot write tag %d (%s)",
>> ++                                                                        TIFFFieldTag(o),
>> ++                                                                            o->field_name ? o->field_name : "unknown");
>> ++                                                            goto bad;
>> +                                             }
>> +                                     }
>> +                             }
>> +--
>> +1.7.9.5
>> +
>> diff --git a/meta/recipes-multimedia/libtiff/tiff_4.0.9.bb b/meta/recipes-multimedia/libtiff/tiff_4.0.9.bb
>> index 8c3bba5..e8e2a11 100644
>> --- a/meta/recipes-multimedia/libtiff/tiff_4.0.9.bb
>> +++ b/meta/recipes-multimedia/libtiff/tiff_4.0.9.bb
>> @@ -9,6 +9,7 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
>>             file://CVE-2017-9935.patch \
>>             file://CVE-2017-18013.patch \
>>             file://CVE-2018-5784.patch \
>> +           file://CVE-2018-10963.patch \
>>            "
>>
>>  SRC_URI[md5sum] = "54bad211279cc93eb4fca31ba9bfdc79"
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

