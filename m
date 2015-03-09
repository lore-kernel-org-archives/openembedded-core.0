Return-Path: <mike.looijmans@topic.nl>
Received: from smtp06.online.nl (smtp06.online.nl [194.134.42.51])
	by mail.openembedded.org (Postfix) with ESMTP id B365F73956
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Mar 2015 18:18:03 +0000 (UTC)
Received: from smtp06.online.nl (localhost [127.0.0.1])
	by smtp06.online.nl (Postfix) with ESMTP id 80351965CD;
	Mon,  9 Mar 2015 19:18:03 +0100 (CET)
Received: from [192.168.1.4] (s55969068.adsl.online.nl [85.150.144.104])
	by smtp06.online.nl (Postfix) with ESMTP;
	Mon,  9 Mar 2015 19:18:03 +0100 (CET)
Message-ID: <54FDE3DB.6080803@topic.nl>
Date: Mon, 09 Mar 2015 19:18:03 +0100
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: Topic
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <54F9E933.9070508@topic.nl>
	<CAJTo0LaCP4mqxdKEnd-mB3sTGCC8PhbkYQgz-kdc9NoLceGMyQ@mail.gmail.com>
	<CAJTo0LamzLa+FE0oEejxfW838HWpURUZquyG=f9KoToEY8Gkuw@mail.gmail.com>
In-Reply-To: <CAJTo0LamzLa+FE0oEejxfW838HWpURUZquyG=f9KoToEY8Gkuw@mail.gmail.com>
X-Online-Scanned: by Cloudmark authority (on smtp06.online.nl)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: gst-ffmpeg is broken since the libav-9 introduction
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
X-List-Received-Date: Mon, 09 Mar 2015 18:18:06 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09-03-15 16:26, Burton, Ross wrote:
> Oh and FWIW the Sato images in master just flipped from GStreamer 0.10
> to 1.4 by default, so I do hope that GStreamer 0.10 will disappear from
> oe-core after the next release (moving to meta-multimedia).
>
> Can I ask why you're still using GStreamer 0.10?  If there's a good
> reason to keep 0.10 in oe-core during the next cycle we can, but
> otherwise the sooner it can be removed entirely as it's no longer tested
> the better.

It works, and we're stuck with vendors providing no support for 1.x, and 
we've been trying to get the 1.x version integrated but that's a rather 
big task and the total lack of decent "how to migrate from 0.1 to 1.x" 
guides isn't doing much to speed that up either.

The current situation is so bad (and has been for many years) that we 
have our own copies of the gstreamer 0.1 recipes in OpenPLi.


> Ross
>
> On 9 March 2015 at 15:24, Burton, Ross <ross.burton@intel.com
> <mailto:ross.burton@intel.com>> wrote:
>
>
>     On 6 March 2015 at 17:51, Mike Looijmans <mike.looijmans@topic.nl
>     <mailto:mike.looijmans@topic.nl>> wrote:
>
>         Commit 4ceff7d0a1f28eb1ce5d288111015b__ff8d5e9a7e "libav: drop
>         older 0.8.* and use libav-9 by default" removed libav 0.8 in
>         favor of the "9" edition. However, after compiling this for a
>         MIPS box, the gst-ffmpeg plugin now refuses to load and displays
>         the following at runtime:
>
>
>     Hm, bad testing, sorry.  This would be why gstreamer-libav 1.0
>     defaults to using it's own internal copy of libav then. :/
>
>     I see that gstreamer-ffmpeg_0.10 defaults to using the internal
>     libav, and as the API clearly changed we need to do that.  Can you
>     verify that removing external-libav from the PACKAGECONFIG fixes
>     this problem?
>
>     Ross
>
>


-- 
Mike Looijmans

