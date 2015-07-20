Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ie0-f182.google.com (mail-ie0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 8E85A75EEA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jul 2015 14:10:58 +0000 (UTC)
Received: by iehx8 with SMTP id x8so38237988ieh.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jul 2015 07:10:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=ev+kRzSuGuQ1pD7PEStHd2TOWC6gdn7x0A6sQmUBsiw=;
	b=GzGyH/z2ieqCOE9udaghIJw2Fi6eGjEdCH4R60TrT06GBugWiasbbwGJewLnJdlwjW
	4HeWYIq3UW8FoSnUeTCj5N4aY30F6ceIkqOJcCzNuOQHbAymqUfcTcG/H1JNoXiY0MT8
	rmyOucLnMwcEYLiCFcU1KZoDkXAC7v9xLw1IQ/bnfIq5me6Wr+8sTLTqlb5V070TcL/G
	RJblr83c8oHl0fC2g2W+26lm+bB6gNskcDrQYDjeyR5twpcEQQbIM72f9dQT4sU1ogN0
	9/RMEBE2WwWYD7ezUL/AoXX6db5YKSNts1O82heGiyLIhJw9EeDknKQ3keRp/BFA+PJK
	Q1Zg==
X-Gm-Message-State: ALoCoQl+PoLqa7qFQhAA11dYPJAiiVmvNfnLFyk6ZHjyd9laCqwaX7w0lvB/1SVQZYK6P/iY3Ahe
X-Received: by 10.107.25.84 with SMTP id 81mr35320698ioz.169.1437401458423;
	Mon, 20 Jul 2015 07:10:58 -0700 (PDT)
Received: from mail-ie0-f171.google.com (mail-ie0-f171.google.com.
	[209.85.223.171])
	by smtp.gmail.com with ESMTPSA id g3sm5305505igi.10.2015.07.20.07.10.56
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Jul 2015 07:10:57 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by iebmu5 with SMTP id mu5so118156473ieb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jul 2015 07:10:56 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.50.72.98 with SMTP id c2mr15352756igv.72.1437401456272; Mon,
	20 Jul 2015 07:10:56 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Mon, 20 Jul 2015 07:10:56 -0700 (PDT)
In-Reply-To: <CAJTo0LZgGsOv-rK20BSvJ-SFPycT0_WyT6zA_7FgRdrXOQjDDQ@mail.gmail.com>
References: <1437136453-28323-1-git-send-email-otavio@ossystems.com.br>
	<CAJTo0LZgGsOv-rK20BSvJ-SFPycT0_WyT6zA_7FgRdrXOQjDDQ@mail.gmail.com>
Date: Mon, 20 Jul 2015 11:10:56 -0300
Message-ID: <CAP9ODKqrZ+wDx4m=J4Df9TxcMFX+s0_cfmJV_T54PDhykX9VYQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] u-boot: Upgrade to 2015.07 release
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
X-List-Received-Date: Mon, 20 Jul 2015 14:10:58 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jul 20, 2015 at 7:59 AM, Burton, Ross <ross.burton@intel.com> wrote:
> On 17 July 2015 at 13:34, Otavio Salvador <otavio@ossystems.com.br> wrote:
>> This upgrades the U-Boot and its related recipes for the 2015.07
>> release.
>>
>> The following recipes has been upgraded:
>>
>>  - u-boot
>>  - u-boot-mkimage
>>  - u-boot-fw-utils
>>
>> The patches which were applied on top of the 2015.01 release are
>> dropped as those are not needed in this release.
>>
>> The license checksum update was due minimal changes in the text, those
>> have no impact in the license terms.
>
> This breaks on the autobuilder
> (http://errors.yoctoproject.org/Errors/Details/13435/):
>
> powerpc-poky-linux-ld.bfd: _GLOBAL_OFFSET_TABLE_ not defined in linker
> created .got
> powerpc-poky-linux-ld.bfd: final link failed: Bad value
> Makefile:1141: recipe for target 'u-boot' failed

Sent a v3.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

