Return-Path: <armccurdy@gmail.com>
Received: from mail-vk0-f51.google.com (mail-vk0-f51.google.com
	[209.85.213.51])
	by mail.openembedded.org (Postfix) with ESMTP id E711977AAE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2018 16:56:40 +0000 (UTC)
Received: by mail-vk0-f51.google.com with SMTP id e139-v6so15257338vkf.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2018 09:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=UczqBVjJLM5O3IS3Qhv0OBt5AXhe7a6Ka6TbNLImB5E=;
	b=AyRz0F+MrS+SLb/eFyMLJ+ar92AOOg8DmieJt6JSrwX1D1qQKFlcnJIsfr5s8dpZ6o
	ST1dvXH+ja1FvnhNcgaeeUCHEyxPU4DK2zkaEiIPKtAMV2kGsUgYP8UFq7IE6iehbEcd
	4U+cbxldWJlM8DICUB/RWkuX86cDBCoIRZdJgZebtiqEMwqWrmLvfpBQDivZQzRsZsqd
	37FAuI311ix3oFZOC9toAl+aY1T7m3Li9XyZ2HU6gb3zKAGzaMX0inH3kqTE/lqGnYl3
	LxErkllSDb63y3pk5lp7DOgYQ81fkduu0zaSwwMrkFwRCQ4KNwaRg3B/Bvy3GW98n2Qv
	28Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=UczqBVjJLM5O3IS3Qhv0OBt5AXhe7a6Ka6TbNLImB5E=;
	b=eQCd1Zc6K2mmtavt1zrwXz2DApMP2nZwdnPFBq2F79juVU5uvf+g1lqzLQBASlG52y
	nFHy6bavNqnXwftDHmUAA6VMqVHEnMzh6/XatihTVSULRhtXAYa9R2ri+AC4s+esMAef
	QUr+htgXdeWZjSlaSEPNjohGh2jS6Vyv8qtgzWs7p+37KF4qg2t4t+0VEDISV85UEXYa
	NHMDL7dcRFc5J8N3TT+kpJmtqlEFv+9Smpwu55t6/ZdLSfTJ/b6YUEgYgFfGaLGc2X4+
	GAsIyFf3C2cygtQirZewSLF6PEhxx9JUTw+5VmDBunNl5WCITp9t+/Eo3xJy42fQ38PU
	sPVg==
X-Gm-Message-State: AOUpUlEVelkbPtxw2hwz4/hEAU0FUDDUmQU3RJj4Qfxybr/e2li8D3dX
	sfEg65HYldtre7EiydADSI5sLBNwYbR/TF2UVSQ=
X-Google-Smtp-Source: AAOMgpeDnIoHafTJ0czj+qFomMsTkKE/e6pUbZw9kXmNDnlSK1QOcn+m1IkpueCW8gWgd24oqtoZYkPz0FquXQ53bxs=
X-Received: by 2002:a1f:9d16:: with SMTP id g22-v6mr1693949vke.5.1531414601635;
	Thu, 12 Jul 2018 09:56:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:2a5:0:0:0:0:0 with HTTP;
	Thu, 12 Jul 2018 09:56:41 -0700 (PDT)
In-Reply-To: <CAJTo0LbT3SBSHBDKx164PrPraBh8NVHj5ZbT-Tjm9JCtotsM6A@mail.gmail.com>
References: <20180710230346.156994-1-joe.slater@windriver.com>
	<5ae15c76-ddaf-fbe5-4fac-1149af924b41@gmail.com>
	<007BD92917A2324FA403BCF9A464CF84F3508181@ALA-MBD.corp.ad.wrs.com>
	<007BD92917A2324FA403BCF9A464CF84F350882A@ALA-MBD.corp.ad.wrs.com>
	<CAJTo0LbT3SBSHBDKx164PrPraBh8NVHj5ZbT-Tjm9JCtotsM6A@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 12 Jul 2018 09:56:41 -0700
Message-ID: <CAJ86T=XFv4w0Bnkok1K_UTzfT9akrorG+U7A-T08pB0domq0dQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
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
X-List-Received-Date: Thu, 12 Jul 2018 16:56:41 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 12, 2018 at 9:40 AM, Burton, Ross <ross.burton@intel.com> wrote:
> Please.
>
> Ross
>
> On 12 July 2018 at 17:29, Slater, Joseph <joe.slater@windriver.com> wrote:
>> Should this be resubmitted?  I could always remove the comment about 4.0.8.    Joe
>> ________________________________________
>> From: Slater, Joseph
>> Sent: Tuesday, July 10, 2018 4:56 PM
>> To: akuster808; openembedded-core@lists.openembedded.org
>> Subject: RE: [OE-core] [oe-core][PATCH 1/1] tiff: security fix CVE-2018-10963
>>
>> Yes, it is not clear.  What it means is that the patch was applied to 4.0.8 code, but not, I think, 4.0.8 code as seen on openembedded-core before 4.0.8 was obsolete.  It still applies for 4.0.9.
>>
>> Joe
>>
>> -----Original Message-----
>> From: akuster808 [mailto:akuster808@gmail.com]
>> Sent: Tuesday, July 10, 2018 4:48 PM
>> To: Slater, Joseph; openembedded-core@lists.openembedded.org
>> Subject: Re: [OE-core] [oe-core][PATCH 1/1] tiff: security fix CVE-2018-10963
>>
>> On 07/10/2018 04:03 PM, Joe Slater wrote:
>>> Denial of service described at https://nvd.nist.gov/vuln/detail/CVE-2018-10963.
>>>
>>> Signed-off-by: Joe Slater <joe.slater@windriver.com>
>>> ---
>>>  .../libtiff/files/CVE-2018-10963.patch             | 41 ++++++++++++++++++++++
>>>  meta/recipes-multimedia/libtiff/tiff_4.0.9.bb      |  1 +
>>>  2 files changed, 42 insertions(+)
>>>  create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2018-10963.patch
>>>
>>> diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2018-10963.patch b/meta/recipes-multimedia/libtiff/files/CVE-2018-10963.patch
>>> new file mode 100644
>>> index 0000000..13a1eb5
>>> --- /dev/null
>>> +++ b/meta/recipes-multimedia/libtiff/files/CVE-2018-10963.patch
>>> @@ -0,0 +1,41 @@
>>> +From de144fd228e4be8aa484c3caf3d814b6fa88c6d9 Mon Sep 17 00:00:00 2001
>>> +From: Even Rouault <even.rouault@spatialys.com>
>>> +Date: Sat, 12 May 2018 14:24:15 +0200
>>> +Subject: [PATCH] TIFFWriteDirectorySec: avoid assertion. Fixes
>>> + http://bugzilla.maptools.org/show_bug.cgi?id=2795.
>>> + CVE-2018-10963
>>> +
>>> +---
>>> +CVE: CVE-2018-10963
>>> +
>>> +Same patch as applied to 4.0.8.
>> I don't know what that means. The fix is in 4.0.8 or this patch applies
>> cleanly to 4.0.8 or affects < 4.0.8.
>> - armin
>>
>>> +
>>> +Upstream-Status: Backport [gitlab.com/libtiff/libtiff/commit/de144f...]

This link seems to have got corrupted somehow. It would be good to fix that too.

>>> +
>>> +Signed-off-by: Joe Slater <joe.slater@windriver.com>
>>> +
>>> +---
>>> + libtiff/tif_dirwrite.c |    7 +++++--
>>> + 1 file changed, 5 insertions(+), 2 deletions(-)
>>> +
>>> +diff --git a/libtiff/tif_dirwrite.c b/libtiff/tif_dirwrite.c
>>> +index 2430de6..c15a28d 100644
>>> +--- a/libtiff/tif_dirwrite.c
>>> ++++ b/libtiff/tif_dirwrite.c
>>> +@@ -695,8 +695,11 @@ TIFFWriteDirectorySec(TIFF* tif, int isimage, int imagedone, uint64* pdiroff)
>>> +                                                             }
>>> +                                                             break;
>>> +                                                     default:
>>> +-                                                            assert(0);   /* we should never get here */
>>> +-                                                            break;
>>> ++                                                            TIFFErrorExt(tif->tif_clientdata,module,
>>> ++                                                                        "Cannot write tag %d (%s)",
>>> ++                                                                        TIFFFieldTag(o),
>>> ++                                                                            o->field_name ? o->field_name : "unknown");
>>> ++                                                            goto bad;
>>> +                                             }
>>> +                                     }
>>> +                             }
>>> +--
>>> +1.7.9.5
>>> +
>>> diff --git a/meta/recipes-multimedia/libtiff/tiff_4.0.9.bb b/meta/recipes-multimedia/libtiff/tiff_4.0.9.bb
>>> index 8c3bba5..e8e2a11 100644
>>> --- a/meta/recipes-multimedia/libtiff/tiff_4.0.9.bb
>>> +++ b/meta/recipes-multimedia/libtiff/tiff_4.0.9.bb
>>> @@ -9,6 +9,7 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
>>>             file://CVE-2017-9935.patch \
>>>             file://CVE-2017-18013.patch \
>>>             file://CVE-2018-5784.patch \
>>> +           file://CVE-2018-10963.patch \
>>>            "
>>>
>>>  SRC_URI[md5sum] = "54bad211279cc93eb4fca31ba9bfdc79"
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

