Return-Path: <mike.looijmans@topic.nl>
Received: from smtp07.online.nl (smtp07.online.nl [194.134.42.52])
	by mail.openembedded.org (Postfix) with ESMTP id C0CEE6017E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Mar 2015 17:51:48 +0000 (UTC)
Received: from smtp07.online.nl (localhost [127.0.0.1])
	by smtp07.online.nl (Postfix) with ESMTP id A0EA7982F5;
	Fri,  6 Mar 2015 18:51:47 +0100 (CET)
Received: from [192.168.1.4] (s55969068.adsl.online.nl [85.150.144.104])
	by smtp07.online.nl (Postfix) with ESMTP;
	Fri,  6 Mar 2015 18:51:47 +0100 (CET)
Message-ID: <54F9E933.9070508@topic.nl>
Date: Fri, 06 Mar 2015 18:51:47 +0100
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: Topic
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: OE-core <openembedded-core@lists.openembedded.org>
X-Online-Scanned: by Cloudmark authority (on smtp07.online.nl)
Subject: gst-ffmpeg is broken since the libav-9 introduction
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
X-List-Received-Date: Fri, 06 Mar 2015 17:51:50 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Commit 4ceff7d0a1f28eb1ce5d288111015bff8d5e9a7e "libav: drop older 0.8.* 
and use libav-9 by default" removed libav 0.8 in favor of the "9" 
edition. However, after compiling this for a MIPS box, the gst-ffmpeg 
plugin now refuses to load and displays the following at runtime:

(gst-plugin-scanner:971): GStreamer-WARNING **: Failed to load plugin 
'/usr/lib/gstreamer-0.10/libgstffmpeg.so': 
/usr/lib/gstreamer-0.10/libgstffmpeg.so: undefined symbol: 
avcodec_get_context_defaults

The "avcodec_get_context_defaults" method is mentioned even in 
libav-9.patch.

Reverting to the 0.8 version "resolves" it.

I wonder if we're the only ones getting this?

-- 
Mike Looijmans

