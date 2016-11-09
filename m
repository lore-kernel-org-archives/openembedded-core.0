Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 3F7C460017
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Nov 2016 10:43:14 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id a197so298624341wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Nov 2016 02:43:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=NLL3qwSgV5ny8Cj2MQl7+xoINVoz85x+nXJ0iZxkuoE=;
	b=d7Q8O5BrSTCdNeEi21clh+xV/AXlJm2Rx8v1MIOzPSKEn9+iYZgUTfYr9//TB1fgu7
	1aKIx3wVlCnvX+YlFHbXPMu/Dv7oGfY6rFpELhKDmt/YOxZ339qIIFLheGVu8sOc5DVz
	jkXTnquvqJ15/kr3f5Ou2IoJD6vob/Q70sb/XY/WL69gRM9n8Tq0KXqNDMyvIv1pEp/i
	i38VuGAxI6GjFBaUSMvriyEEbAtgDrj31Yrsg6+6Zl0T/MwZQfXccwTNa5Eb4hYyG1O6
	y9Dtouh3Lumqk4c7nub2nKlT4vv27iDU90rXrjsrfQDcJ2ThH+Z6xdJjUWkxzUSTein2
	+dYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=NLL3qwSgV5ny8Cj2MQl7+xoINVoz85x+nXJ0iZxkuoE=;
	b=jNix1aUiBIOc4Om/cmJERmcwOXwxCroDtQ4XS6o/xC+f603wG4F3ofxadtzWNYc7cd
	5+Mr7DKKONg4XlkI4Hw6HY9ZIiqY5mq66IPxlMlyaTrncbMsXSIuyneDWcvtKrMOMI0D
	6clmiWl0KLTDO4n5/NLNCxzigNMSPf+M2vCre3XQrRY753Iz+bcIJrzhK4d+H1o7UhMF
	pvvHCojQeGDzTsHa+LqqLOA1tFaRH0HCM0bRc9OsuKrR/h8Ykg6KJSG4Ud9aBCvCFM4x
	OY3BB5UoHbaReDxnsjurmLOduu22mLsClpJAU2if1Tj9NYejWqDnB+zvdqFGTzAL3vdl
	pgcA==
X-Gm-Message-State: ABUngvc3C1VMl5S2fsELLb0HOxDhrdshwIN/8jwPEJkeOiMqTUpB4Wg0Co6yHacOYTLhmJkRx+WcsauVBP8kCw==
X-Received: by 10.28.21.1 with SMTP id 1mr18725508wmv.133.1478688195794; Wed,
	09 Nov 2016 02:43:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.5.141 with HTTP; Wed, 9 Nov 2016 02:42:55 -0800 (PST)
In-Reply-To: <20161109094451.GD10823@linux.intel.com>
References: <cover.1478619682.git.maciej.borzecki@rndity.com>
	<9d17d4a574a0a2b809f832b33a0af41fb7682ea4.1478619682.git.maciej.borzecki@rndity.com>
	<20161109094451.GD10823@linux.intel.com>
From: =?UTF-8?Q?Maciej_Borz=C4=99cki?= <maciej.borzecki@rndity.com>
Date: Wed, 9 Nov 2016 11:42:55 +0100
Message-ID: <CAD4b0_K-B66AEBGtvx0J7_n-+mNKOpez3rWL0ouJw+9w-q8JFw@mail.gmail.com>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Cc: Maciej Borzecki <maciek.borzecki@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/5] wic: check that filesystem is specified for a rootfs partition
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
X-List-Received-Date: Wed, 09 Nov 2016 10:43:15 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Nov 9, 2016 at 10:44 AM, Ed Bartosh <ed.bartosh@linux.intel.com> wrote:
> On Tue, Nov 08, 2016 at 04:56:09PM +0100, Maciej Borzecki wrote:
>> Signed-off-by: Maciej Borzecki <maciej.borzecki@rndity.com>
>> ---
>>  scripts/lib/wic/partition.py | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
>> index 8adc698240c8e3bd9f4118663a5d7a167e0bb4a4..24e657592738dc7c5cdff78e3740d7c373021e9d 100644
>> --- a/scripts/lib/wic/partition.py
>> +++ b/scripts/lib/wic/partition.py
>> @@ -184,6 +184,10 @@ class Partition():
>>          if os.path.isfile(rootfs):
>>              os.remove(rootfs)
>>
>> +        if not self.fstype:
>> +            msger.error("File system for partition %s not specified in kickstart, " \
>> +                        "use --fstype option" % (self.mountpoint))
>> +
> Would it make sense to make --fstype mandatory in ksparser?

I'm afraid that would make fstype mandatory in all cases, while we only
need it for rootfs source plugin.


-- 
Maciej Borzecki
RnDity

