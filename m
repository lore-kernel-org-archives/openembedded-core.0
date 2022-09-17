Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16784ECAAD3
	for <webhook@archiver.kernel.org>; Sat, 17 Sep 2022 06:21:38 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web09.3393.1663395689522626491
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Sep 2022 23:21:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.20,
 mailfrom: f_l_k@t-online.de)
Received: from fwd85.dcpf.telekom.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout08.t-online.de (Postfix) with SMTP id 2316CA32D;
	Sat, 17 Sep 2022 08:20:52 +0200 (CEST)
Received: from [192.168.178.83] ([84.163.47.29]) by fwd85.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1oZRC2-2rsAQi0; Sat, 17 Sep 2022 08:20:46 +0200
Date: Sat, 17 Sep 2022 08:20:40 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [OE-core] wic/wks boot using labels instead of partitions
To: Mark Hatle <mark.hatle@kernel.crashing.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-Id: <GACCIR.4ITKNYY5Z8AC3@t-online.de>
In-Reply-To: <28322394-c2dd-fc69-be32-466d0cf14906@kernel.crashing.org>
References: <28322394-c2dd-fc69-be32-466d0cf14906@kernel.crashing.org>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-2qUTiOx5uMvhirRvSsej"
X-TOI-EXPURGATEID: 150726::1663395646-2D0B8EA1-200E2822/0/0 CLEAN NORMAL
X-TOI-MSGID: 56ed118d-932d-45ab-9710-74e9af395d1d
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 17 Sep 2022 06:21:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170825

--=-2qUTiOx5uMvhirRvSsej
Content-Type: text/plain; charset=us-ascii; format=flowed

--use-label

This should do it.

Am Fr, 16. Sep 2022 um 16:41:48 -0500 schrieb Mark Hatle 
<mark.hatle@kernel.crashing.org>:
> Is there a way to tell the _generated_ fstab to use labels to boot 
> and not hard coded partitions?
> 
> If I remove the --ondisk <device> attribute from the wks file it 
> defaults to /dev/sda.
> 
> What I tried was:
> 
> part /boot --source bootimg-partition --fstype=vfat --label boot 
> --active --align 4 size 16
> part / --source rootfs --fstype=ext4 --label root --align 4
> 
> 
> If I manually add --no-fstab-update to the wks entries and add the 
> following to the system default fstab:
> 
> LABEL=boot   /boot  vfat  default  0  2
> 
> 
> This works.  But I'd like to automate it within the wks.
> 
> (Alternatively I could use uuid instead of label booting, but either 
> case, I need to only boot with the uuid or label -- not the partition 
> as the location of the disk can change.)
> 
> --Mark
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#170823): 
> <https://lists.openembedded.org/g/openembedded-core/message/170823>
> Mute This Topic: <https://lists.openembedded.org/mt/93732744/3618223>
> Group Owner: openembedded-core+owner@lists.openembedded.org 
> <mailto:openembedded-core+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-core/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-2qUTiOx5uMvhirRvSsej
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>--use-label</div><div><br></div><div>This should do it.</div></div><div id="geary-quote" dir="auto"><br>Am Fr, 16. Sep 2022 um 16:41:48 -0500 schrieb Mark Hatle &lt;mark.hatle@kernel.crashing.org&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Is there a way to tell the _generated_ fstab to use labels to boot and not hard coded partitions?

If I remove the --ondisk &lt;device&gt; attribute from the wks file it defaults to /dev/sda.

What I tried was:

part /boot --source bootimg-partition --fstype=vfat --label boot --active --align 4 size 16
part / --source rootfs --fstype=ext4 --label root --align 4


If I manually add --no-fstab-update to the wks entries and add the following to the system default fstab:

LABEL=boot   /boot  vfat  default  0  2


This works.  But I'd like to automate it within the wks.

(Alternatively I could use uuid instead of label booting, but either case, I need to only boot with the uuid or label -- not the partition as the location of the disk can change.)

--Mark
</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#170823): <a href="https://lists.openembedded.org/g/openembedded-core/message/170823">https://lists.openembedded.org/g/openembedded-core/message/170823</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/93732744/3618223">https://lists.openembedded.org/mt/93732744/3618223</a>
Group Owner: <a href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-2qUTiOx5uMvhirRvSsej--


