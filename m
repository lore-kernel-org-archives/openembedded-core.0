Return-Path: <gary@mlbassoc.com>
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id DA7E46011A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Feb 2016 15:36:10 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id CBCA068A01A; Fri, 12 Feb 2016 15:36:09 +0000 (GMT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=ALL_TRUSTED,BAYES_20,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id 5DFDF68A019;
	Fri, 12 Feb 2016 15:36:07 +0000 (GMT)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id 9889667400F0;
	Fri, 12 Feb 2016 16:36:06 +0100 (CET)
To: "Burton, Ross" <ross.burton@intel.com>
References: <1455249507-30989-1-git-send-email-gary@mlbassoc.com>
	<CAJTo0LaveuPmPrhLf9bc4H0PkyEz-cVGfiH+fjxqk=ynxJkhew@mail.gmail.com>
	<56BDBC07.3060907@mlbassoc.com> <56BDBDF8.8020605@mlbassoc.com>
	<CAJTo0LYnyFbwdF_8u5Fnx=ejU62huTnDYa7fDrS76LdJKJvYNg@mail.gmail.com>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <56BDFBE6.5060004@mlbassoc.com>
Date: Fri, 12 Feb 2016 16:36:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYnyFbwdF_8u5Fnx=ejU62huTnDYa7fDrS76LdJKJvYNg@mail.gmail.com>
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
X-List-Received-Date: Fri, 12 Feb 2016 15:36:12 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-02-12 12:15, Burton, Ross wrote:
>
> On 12 February 2016 at 11:11, Gary Thomas <gary@mlbassoc.com <mailto:gary@mlbassoc.com>> wrote:
>
>     # opkg install mplayer2-dbg
>     Installing mplayer2-dbg (2.0+gitr0+2c378c71a4-r13.1) on root.
>     mplayer2-dbg: unsatisfied recommendation for libavformat-dbg
>     mplayer2-dbg: unsatisfied recommendation for libavutil-dbg
>     mplayer2-dbg: unsatisfied recommendation for libfaad-dbg
>     mplayer2-dbg: unsatisfied recommendation for libasound-dbg
>     mplayer2-dbg: unsatisfied recommendation for libavcodec-dbg
>     mplayer2-dbg: unsatisfied recommendation for libswresample-dbg
>     mplayer2-dbg: unsatisfied recommendation for libpostproc-dbg
>     mplayer2-dbg: unsatisfied recommendation for ncurses-libtinfo-dbg
>     mplayer2-dbg: unsatisfied recommendation for libswscale-dbg
>     ...
>
>     So, how should this have worked, or is it a little broken?
>
>
> Well it *should* have worked, but clearly isn't!  Can you file a bug?

I already had, albeit with slightly different wording:
   https://bugzilla.yoctoproject.org/show_bug.cgi?id=9104

I don't have one at hand, but maybe I'll try using different packaging,
e.g. RPM, to see if there is a difference in how this is handled.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

