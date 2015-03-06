Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 1CB4B738F6
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Mar 2015 19:54:48 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 9E70EF811E3; Fri,  6 Mar 2015 12:54:49 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=10.0 tests=ALL_TRUSTED,BAYES_00,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 23620F811E3;
	Fri,  6 Mar 2015 12:54:49 -0700 (MST)
Message-ID: <54FA0610.5000805@mlbassoc.com>
Date: Fri, 06 Mar 2015 12:54:56 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <54F9E933.9070508@topic.nl>
In-Reply-To: <54F9E933.9070508@topic.nl>
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
X-List-Received-Date: Fri, 06 Mar 2015 19:54:49 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2015-03-06 10:51, Mike Looijmans wrote:
> Commit 4ceff7d0a1f28eb1ce5d288111015bff8d5e9a7e "libav: drop older 0.8.* and use libav-9 by default" removed libav 0.8 in favor of the "9" edition. However, after compiling this
> for a MIPS box, the gst-ffmpeg plugin now refuses to load and displays the following at runtime:
>
> (gst-plugin-scanner:971): GStreamer-WARNING **: Failed to load plugin '/usr/lib/gstreamer-0.10/libgstffmpeg.so': /usr/lib/gstreamer-0.10/libgstffmpeg.so: undefined symbol:
> avcodec_get_context_defaults
>
> The "avcodec_get_context_defaults" method is mentioned even in libav-9.patch.
>
> Reverting to the 0.8 version "resolves" it.
>
> I wonder if we're the only ones getting this?
>

I get a different error, but surely just as deadly since it
fails to register the whole ffmpeg plugin:
(gst-plugin-scanner:1108): GStreamer-WARNING **: Failed to load plugin '/usr/lib/gstreamer-0.10/libgstffmpeg.so': /usr/li
b/gstreamer-0.10/libgstffmpeg.so: undefined symbol: av_get_bits_per_sample_format
(gst-plugin-scanner:1108): GLib-GObject-WARNING **: cannot register existing type 'GstVorbisDec'

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

