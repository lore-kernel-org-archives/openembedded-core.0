Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id BE8B360657
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 21:57:33 +0000 (UTC)
Received: from [192.168.178.14] (chello062178118086.5.14.vie.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id 657F037AF6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 23:57:15 +0200 (CEST)
Message-ID: <55D79ECC.9070308@pseudoterminal.org>
Date: Fri, 21 Aug 2015 23:57:32 +0200
From: Carlos Rafael Giani <dv@pseudoterminal.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1440167394-20065-1-git-send-email-b54851@freescale.com>
In-Reply-To: <1440167394-20065-1-git-send-email-b54851@freescale.com>
Subject: Re: [poky][PATCH v4 0/2] gstreamer1.0: Add patches for Gstreamer 1.4.5
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
X-List-Received-Date: Fri, 21 Aug 2015 21:57:36 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

These are backports, so I do not see a problem with them. However, keep 
in mind that GStreamer 1.6 will be out in a few days, so I recommend 
hold off any patches that are not backports. I have recipes prepared for 
1.5.90 (= 1.6 release candidate) that I will then send to the mailing 
list. New patches should be applied on top of that, not 1.4.5.


Am 2015-08-21 um 16:29 schrieb Yuqing Zhu:
> Fix sticky events haven't been sent out when active track reach EOS
>
> Fix QoS/lateness checking if subclass implements prepare/prepare_list vfuncs
>
>
> Yuqing Zhu (2):
>    gstreamer1.0: Fix ticky events haven't been sent out when active track
>      reach EOS
>    gstreamer1.0: Fix QoS/lateness checking if subclass implements
>      prepare/prepare_list vfuncs
>
>   ...x-QoS-lateness-checking-if-subclass-imple.patch |  70 +++++++++
>   ...cky-events-haven-t-send-out-when-ac-1-4-1.patch | 167 +++++++++++++++++++++
>   .../gstreamer/gstreamer1.0_1.4.5.bb                |   2 +
>   3 files changed, 239 insertions(+)
>   create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-basesink-Fix-QoS-lateness-checking-if-subclass-imple.patch
>   create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0/inputselector-sticky-events-haven-t-send-out-when-ac-1-4-1.patch
>


