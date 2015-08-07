Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 19876734DA
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Aug 2015 03:26:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t773Q0MW002549; Fri, 7 Aug 2015 04:26:00 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 4YUqyaH2lrJg; Fri,  7 Aug 2015 04:26:00 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t773Ph2F002527
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 7 Aug 2015 04:25:56 +0100
Message-ID: <1438917942.30467.25.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Yuqing Zhu <b54851@freescale.com>
Date: Thu, 06 Aug 2015 22:25:42 -0500
In-Reply-To: <1438856968-9564-1-git-send-email-b54851@freescale.com>
References: <1438856968-9564-1-git-send-email-b54851@freescale.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [poky][PATCH v6 0/3] Add patches for Gstreamer 1.4.5 base
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
X-List-Received-Date: Fri, 07 Aug 2015 03:26:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2015-08-06 at 18:29 +0800, Yuqing Zhu wrote:
> Fix issue about gstreamer1.0-plugins-base
> 
> -ssaparse: Enhance SSA text lines parsing.
> 
> -subparse: Set need_segment after sink pad receive GST_EVENT_SEGMENT.
> 
> -encodebin: Need more buffers in output queue for better performance.
> 
> 
> Yuqing Zhu (3):
>   gstreamer1.0-plugins-base: Add ssaparse related patch
>   gstreamer1.0-plugins-base: Add subparse related patch
>   gstreamer1.0-plugins-base: Add encodebin related patch

I'm afraid I'm completely confused with this patch series. It started as
6 patches, its now 3 and these patches don't apply against master.

Could someone send the complete patch series that you're asking to merge
that applies against master please?

Cheers,

Richard


