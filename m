Return-Path: <gary@mlbassoc.com>
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id 505656078D
	for <openembedded-core@lists.openembedded.org>;
	Sun,  2 Oct 2016 07:28:04 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id CD1DE68A01A; Sun,  2 Oct 2016 08:28:04 +0100 (BST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=ALL_TRUSTED,BAYES_05,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id 639CA68A019;
	Sun,  2 Oct 2016 08:28:04 +0100 (BST)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id DB87F674023C;
	Sun,  2 Oct 2016 09:28:03 +0200 (CEST)
To: OE-core <openembedded-core@lists.openembedded.org>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <4dd9e59c-8ba5-29a3-5128-05c0cba9fcde@mlbassoc.com>
Date: Sun, 2 Oct 2016 09:28:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
Subject: Taskhash mismatch?
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
X-List-Received-Date: Sun, 02 Oct 2016 07:28:05 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Can someone explain this error?

ERROR: video-demo-image-1.0-r0 do_image_rpi_sdimg: Taskhash mismatch 7b8eab500890bd7cd6a00b70740800f1 versus 
9471c988c4adee881554263bd10f7196 for 
/local/poky-cutting-edge/meta-rpi/packages/images/video-demo-image.bb.do_image_rpi_sdimg
ERROR: Taskhash mismatch 7b8eab500890bd7cd6a00b70740800f1 versus 9471c988c4adee881554263bd10f7196 for 
/local/poky-cutting-edge/meta-rpi/packages/images/video-demo-image.bb.do_image_rpi_sdimg

I'm building with Poky/Yocto + meta-raspberrypi:
meta              = "master:725e66e1d08ae000d8f68455ddca0e192080dc1f"
meta-raspberrypi  = "master:4817e2c087097c02755d6309304878e42cf61d3c"

As far as I can tell, the image was created even though the error.

Thanks for any pointers

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

