Return-Path: <zboszor@pr.hu>
X-Greylist: delayed 2571 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 12 Jul 2018 14:50:47 UTC
Received: from mail9.pr.hu (mail9.pr.hu [87.242.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 73A747606A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2018 14:50:47 +0000 (UTC)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1fdcGC-0000ji-M7; Thu, 12 Jul 2018 16:07:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=OsJ86kmz8ZGS9OSkr0iWErheiXBlL0s5/9NOYZlMNy0=;
	b=MBwfHG9rDNJezVn1udHTve7O51
	wj53ekm7e7+0+mwxed1bW7Ne6mGveDVmQVaBTz564tYV4sCxC4XR9l5NL+pedaU5fZ70RAGnlp43J
	Z16KK5ZgVo1YGjYk65aW2DCmSl8ZKlY/ETuM+qOq2VNsvsex46DPVcbWiapFaba9VSGpEx1gbftKR
	eo/x1JmJXjC1OABn5DdFP7JNO2MfKAGBH3FOCXzdqdvyWhwNlh2m8Yw1509X4B02+9cAKwdz5AoIU
	03pJPp5re5dILZEWDRpLgdLl94k3zzINNwaaOsNfiEPnJDBrW+NWVoKMOxiFzn4cySGUPrnkqHR31
	n0ngXUIw==;
Received: from host-87-242-51-253.prtelecom.hu ([87.242.51.253]
	helo=localhost.localdomain)
	by mail.pr.hu with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89) (envelope-from <zboszor@pr.hu>)
	id 1fdcG8-00006t-Me; Thu, 12 Jul 2018 16:07:54 +0200
To: Armin Kuster <akuster808@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <cover.1522806183.git.akuster808@gmail.com>
	<e929e83164630add80ba28f44d1d34afc2f197c9.1522806183.git.akuster808@gmail.com>
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@pr.hu>
Message-ID: <6169db63-d6a3-2953-5770-c7f29dbe67cb@pr.hu>
Date: Thu, 12 Jul 2018 16:07:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <e929e83164630add80ba28f44d1d34afc2f197c9.1522806183.git.akuster808@gmail.com>
X-Spam-Score: 1.0 (+)
X-Scan-Signature: 1648b59577f8b3aadf4d9290b442aa11
X-Spam-Tracer: backend.mail.pr.hu 1.0 20180712140754Z
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
X-List-Received-Date: Thu, 12 Jul 2018 14:50:48 -0000
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi,

2018-04-04 03:49 keltezéssel, Armin Kuster írta:
> From: Armin Kuster <akuster@mvista.com>
> 
> Signed-off-by: Armin Kuster <akuster@mvista.com>
> ---
>   .../xorg-proto/bigreqsproto_1.1.2.bb               | 16 ---------
>   .../xorg-proto/calibrateproto/fix.patch            | 42 ----------------------
...
> diff --git a/meta/recipes-graphics/xorg-proto/calibrateproto/fix.patch b/meta/recipes-graphics/xorg-proto/calibrateproto/fix.patch
> deleted file mode 100644
> index ff8cb25..0000000
> --- a/meta/recipes-graphics/xorg-proto/calibrateproto/fix.patch
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -Upstream-Status: Pending
> -
> -Add missing length fields to the replies. Without these, sanity checking in recent X
> -breaks things.
> -
> -RP 11/2/10
> -
> -
> -Index: git/xcalibrateproto.h
> -===================================================================
> ---- git.orig/xcalibrateproto.h	2010-02-11 11:47:45.711985932 +0000
> -+++ git/xcalibrateproto.h	2010-02-11 11:40:21.000000000 +0000
> -@@ -67,13 +67,13 @@
> -     BYTE    type;   /* X_Reply */
> -     BYTE    pad1;
> -     CARD16  sequenceNumber B16;
> -+    CARD32  length;
> -     CARD32  status;
> -     CARD32  pad2 B32;
> -     CARD32  pad3 B32;
> -     CARD32  pad4 B32;
> -     CARD32  pad5 B32;
> -     CARD32  pad6 B32;
> --    CARD32  pad7 B32;
> - } xXCalibrateRawModeReply;
> -
> - #define sz_xXCalibrateRawModeReply	32
> -@@ -92,13 +92,13 @@
> -     BYTE    type;   /* X_Reply */
> -     BYTE    pad1;
> -     CARD16  sequenceNumber B16;
> -+    CARD32  length;
> -     CARD32  x;
> -     CARD32  y;
> -     CARD32  pad2 B32;
> -     CARD32  pad3 B32;
> -     CARD32  pad4 B32;
> -     CARD32  pad5 B32;
> --    CARD32  pad6 B32;
> - } xXCalibrateScreenToCoordReply;
> -
> - #define sz_xXCalibrateScreenToCoordReply	32

Haven't you just introduced an incompatible change by not adding the identical
patch to [PATCH 17/21] xorgproto: add replacement for depricated calibrateproto ?

Best regards,
Zoltán Böszörményi

