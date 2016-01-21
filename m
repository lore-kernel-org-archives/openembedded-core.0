Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 96FD360017
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 14:39:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0LEdB2E022941; Thu, 21 Jan 2016 14:39:11 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 8loFoXef-WCT; Thu, 21 Jan 2016 14:39:11 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0LEd9R3022936
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 21 Jan 2016 14:39:11 GMT
Message-ID: <1453387149.27999.171.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Yuqing Zhu <b54851@freescale.com>, openembedded-core@lists.openembedded.org
Date: Thu, 21 Jan 2016 14:39:09 +0000
In-Reply-To: <1453283501-3982-1-git-send-email-b54851@freescale.com>
References: <1453283501-3982-1-git-send-email-b54851@freescale.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [poky][PATCH v2 0/7] Add patches for gstreamer 1.6
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
X-List-Received-Date: Thu, 21 Jan 2016 14:39:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2016-01-20 at 17:51 +0800, Yuqing Zhu wrote:
> ---gstreamer1.0
>    Correct the setting for FLAG_DISCONT when push to adapter,
>    in case audio decoder subclass can not get enough data.
> 
> ---gstreamer1.0-plugins-base
>    Send taglist if no valid frame is decoded util EOS.
>    Add video crop supporting when convert frame.
> 
> ---gstreamer1.0-plugins-bad
>    Need to set right pid if pid is 0 when create streams.
>    Add detecting picture coding type when drain.
>    Fix memory leak of navigation thread.

The questions asked about the original patches still stand. Why this
particular set of patches rather than some of the other fixes in the
gstreamer master branch? 

Would we be better off with a git recipe for gstreamer that some BSPs
could use?

This does look like the result of some particular product focused work
and looks more BSP focused than OE-Core specific. Backports might be ok
but I particularly worry about patches that have not been accepted
upstream.

I think we need more explanation about the intent here, currently there
has been none.

Cheers,

Richard

