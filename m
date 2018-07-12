Return-Path: <zboszor@pr.hu>
Received: from mail9.pr.hu (mail9.pr.hu [87.242.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 19FF66FFA1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2018 15:42:40 +0000 (UTC)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1fddjm-0005JH-DQ; Thu, 12 Jul 2018 17:42:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=oWCqlGPtILLDuQ02ciUtbYH23c/hMx0iW7fKYdRo+L0=;
	b=BAV3+oPB8xrZcGP0604cs+aIGs
	hUY7IjfYqR1j8Esz4nhsBpFga7nGeTYy3XSJNPY0XrTT2JlxB1bSTWR99bnrPeM9X4LUtYKTkiOXm
	1hqeIhkC1g1cAYjeKBXA8Hv2xn9vgTiVH8jlfap9k3FQaxOTRs0Xl/SMb2vuu/UjYN3t5jR0EgSFb
	LK3dkEzGOLirmpSxkvOWzKw4feJn3W+ZBoE7R6krwdjgHP6xVBmAsoQkYuvpY2+O3JrTqkP9VjOf6
	Nfgqb8A8H531COrQkI4iYCMr3X1izvULsTP4v/jx20+xwiKp7NYfWzg8tw+qqLzU3HK69fCx+9n77
	JSZZ8WSQ==;
Received: from host-87-242-51-253.prtelecom.hu ([87.242.51.253]
	helo=localhost.localdomain)
	by mail.pr.hu with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89) (envelope-from <zboszor@pr.hu>)
	id 1fddji-0000K5-1Z; Thu, 12 Jul 2018 17:42:32 +0200
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1522806183.git.akuster808@gmail.com>
	<e929e83164630add80ba28f44d1d34afc2f197c9.1522806183.git.akuster808@gmail.com>
	<6169db63-d6a3-2953-5770-c7f29dbe67cb@pr.hu>
	<CAJTo0Lb+eHnDVa+QzVmhRUcAmUx3mddoRCevwO0NsWZBCGuLbQ@mail.gmail.com>
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@pr.hu>
Message-ID: <fd8740e4-a481-dd96-fc13-b2589ff4bee6@pr.hu>
Date: Thu, 12 Jul 2018 17:42:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0Lb+eHnDVa+QzVmhRUcAmUx3mddoRCevwO0NsWZBCGuLbQ@mail.gmail.com>
X-Spam-Score: 1.0 (+)
X-Scan-Signature: f38f4f91aa9d67a621f2150e8515f130
X-Spam-Tracer: backend.mail.pr.hu 1.0 20180712154232Z
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 18/21] *proto: remove depricated xorg proto header recipes and replace by xorgproto
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
X-List-Received-Date: Thu, 12 Jul 2018 15:42:41 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

2018-07-12 16:54 keltezéssel, Burton, Ross írta:
> I guess that tells us how many people actually use xcalibrate...

The breakage depends on whether you are using a repository to
upgrade your machines running Yocto or bring them in and reflash
with a new complete build.

But anyway, it's the maintainer's call. The previous patch itself
was an incompatible deviation from upstream and xinput_calibrator
is usually running locally, not remotely, so it's only an obscure
corner case.

> 
> On 12 July 2018 at 15:07, Böszörményi Zoltán via Openembedded-core
> <openembedded-core@lists.openembedded.org> wrote:
>> Hi,
>>
>> 2018-04-04 03:49 keltezéssel, Armin Kuster írta:
>>>
>>> From: Armin Kuster <akuster@mvista.com>
>>>
>>> Signed-off-by: Armin Kuster <akuster@mvista.com>
>>> ---
>>>    .../xorg-proto/bigreqsproto_1.1.2.bb               | 16 ---------
>>>    .../xorg-proto/calibrateproto/fix.patch            | 42
>>> ----------------------
>>
>> ...
>>>
>>> diff --git a/meta/recipes-graphics/xorg-proto/calibrateproto/fix.patch
>>> b/meta/recipes-graphics/xorg-proto/calibrateproto/fix.patch
>>>
>>> deleted file mode 100644
>>> index ff8cb25..0000000
>>> --- a/meta/recipes-graphics/xorg-proto/calibrateproto/fix.patch
>>> +++ /dev/null
>>> @@ -1,42 +0,0 @@
>>> -Upstream-Status: Pending
>>> -
>>> -Add missing length fields to the replies. Without these, sanity checking
>>> in recent X
>>> -breaks things.
>>> -
>>> -RP 11/2/10
>>> -
>>> -
>>> -Index: git/xcalibrateproto.h
>>> -===================================================================
>>> ---- git.orig/xcalibrateproto.h 2010-02-11 11:47:45.711985932 +0000
>>> -+++ git/xcalibrateproto.h      2010-02-11 11:40:21.000000000 +0000
>>> -@@ -67,13 +67,13 @@
>>> -     BYTE    type;   /* X_Reply */
>>> -     BYTE    pad1;
>>> -     CARD16  sequenceNumber B16;
>>> -+    CARD32  length;
>>> -     CARD32  status;
>>> -     CARD32  pad2 B32;
>>> -     CARD32  pad3 B32;
>>> -     CARD32  pad4 B32;
>>> -     CARD32  pad5 B32;
>>> -     CARD32  pad6 B32;
>>> --    CARD32  pad7 B32;
>>> - } xXCalibrateRawModeReply;
>>> -
>>> - #define sz_xXCalibrateRawModeReply    32
>>> -@@ -92,13 +92,13 @@
>>> -     BYTE    type;   /* X_Reply */
>>> -     BYTE    pad1;
>>> -     CARD16  sequenceNumber B16;
>>> -+    CARD32  length;
>>> -     CARD32  x;
>>> -     CARD32  y;
>>> -     CARD32  pad2 B32;
>>> -     CARD32  pad3 B32;
>>> -     CARD32  pad4 B32;
>>> -     CARD32  pad5 B32;
>>> --    CARD32  pad6 B32;
>>> - } xXCalibrateScreenToCoordReply;
>>> -
>>> - #define sz_xXCalibrateScreenToCoordReply      32
>>
>>
>> Haven't you just introduced an incompatible change by not adding the
>> identical
>> patch to [PATCH 17/21] xorgproto: add replacement for depricated
>> calibrateproto ?
>>
>> Best regards,
>> Zoltán Böszörményi
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 


