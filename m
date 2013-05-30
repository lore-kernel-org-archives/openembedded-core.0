Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id D44BE6A44E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 20:08:20 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r4UKAVbn013706; Thu, 30 May 2013 21:12:36 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id qUVYA-B8VBby; Thu, 30 May 2013 21:12:35 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r4UKCTS6013728
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Thu, 30 May 2013 21:12:31 +0100
Message-ID: <1369944478.14887.331.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Thu, 30 May 2013 21:07:58 +0100
In-Reply-To: <3311603.tBhLUzvcSX@helios>
References: <3311603.tBhLUzvcSX@helios>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: RFC: libav, ffmpeg, and OE-Core
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
X-List-Received-Date: Thu, 30 May 2013 20:08:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-05-30 at 20:59 +0100, Paul Eggleton wrote:
> Hi all,
> 
> Video decoding is an important function for a lot of devices. We currently
> have gst-ffmpeg, which includes the ffmpeg sources, in OE-Core but we don't have
> ffmpeg or libav itself that is a bit more re-usable outside of GStreamer. This
> brings up a few questions:
> 
> 1) Which is the preferred option for OE; ffmpeg or its "fork" libav? libav
> seems to be better suited to use as a library but on the other hand ffmpeg
> isn't exactly dead. Some background:
> 
> http://aballier.wordpress.com/2013/01/18/ffmpeg-vs-libav-a-distribution-maintainer-point-of-view-almost-two-years-after-the-split/
> 
> http://blog.pkh.me/p/13-the-ffmpeg-libav-situation.html
> 
> 2) Following on from that, should we pull the preferred library into OE-Core
> and avoid the need for the current bbappend in meta-oe for gst-ffmpeg? (One of
> my personal motivations for sorting this out). This would of course be
> protected by LICENSE_FLAGS as we currently do with gst-ffmpeg.
> 
> Thoughts?

I think having ffmpeg in core might be a good idea since it allows us to
test various video playback and also allows us to test LICENSE_FLAGS in
the core...

Cheers,

Richard


