Return-Path: <gary@mlbassoc.com>
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id B9135760A3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Feb 2016 11:03:38 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id B089F68A01B; Fri, 12 Feb 2016 11:03:38 +0000 (GMT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=ALL_TRUSTED,BAYES_20,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id E050968A019;
	Fri, 12 Feb 2016 11:03:35 +0000 (GMT)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id 8B62367400F0;
	Fri, 12 Feb 2016 12:03:35 +0100 (CET)
To: "Burton, Ross" <ross.burton@intel.com>
References: <1455249507-30989-1-git-send-email-gary@mlbassoc.com>
	<CAJTo0LaveuPmPrhLf9bc4H0PkyEz-cVGfiH+fjxqk=ynxJkhew@mail.gmail.com>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <56BDBC07.3060907@mlbassoc.com>
Date: Fri, 12 Feb 2016 12:03:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaveuPmPrhLf9bc4H0PkyEz-cVGfiH+fjxqk=ynxJkhew@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ffmpeg: Add -dbg packages for all libraries
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
X-List-Received-Date: Fri, 12 Feb 2016 11:03:39 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-02-12 11:49, Burton, Ross wrote:
>
> On 12 February 2016 at 03:58, Gary Thomas <gary@mlbassoc.com <mailto:gary@mlbassoc.com>> wrote:
>
>     Improve the packaging of the libraries built by this recipe.  These
>     are created using special code in the recipe and the debug (-dbg)
>     packages were not being created.  Adding these packages allow the
>     libraries in question to be debugged using GDB.
>
>
> oe-pkgdata-utils says:
>
> ffmpeg-dbg:
>          /usr/bin/.debug/ffmpeg
>          /usr/bin/.debug/ffprobe
>          /usr/bin/.debug/ffserver
>          /usr/lib/.debug/libavcodec.so.56.60.100
>          /usr/lib/.debug/libavdevice.so.56.4.100
>          /usr/lib/.debug/libavfilter.so.5.40.101
>          /usr/lib/.debug/libavformat.so.56.40.101
>          /usr/lib/.debug/libavutil.so.54.31.100
>          /usr/lib/.debug/libpostproc.so.53.3.100
>          /usr/lib/.debug/libswresample.so.1.2.101
>          /usr/lib/.debug/libswscale.so.3.1.101
>
> So I'm not sure why this would be needed.
>

I'll check again, maybe it's as simple as ffmpeg-dbg wasn't
brought in as an automatic dependency of mplayer2-dbg although
a bunch of others were.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

