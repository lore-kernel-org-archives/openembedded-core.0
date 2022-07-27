Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A37A0C19F2B
	for <webhook@archiver.kernel.org>; Wed, 27 Jul 2022 16:31:51 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web08.22090.1658939507626975341
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jul 2022 09:31:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.21,
 mailfrom: f_l_k@t-online.de)
Received: from fwd84.dcpf.telekom.de (fwd84.aul.t-online.de [10.223.144.110])
	by mailout10.t-online.de (Postfix) with SMTP id 88CF2193F2;
	Wed, 27 Jul 2022 18:31:45 +0200 (CEST)
Received: from [192.168.178.83] ([84.163.44.9]) by fwd84.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1oGjwm-3eT9JA0; Wed, 27 Jul 2022 18:31:44 +0200
Date: Wed, 27 Jul 2022 18:31:38 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [OE-core] [meta-oe][PATCH] wic/direct.py: ignore root mountpoint
 in fstab updater
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <QWTOFR.3UW7PSRDH9903@t-online.de>
In-Reply-To: <A08B6BB6-EFD1-425D-AC02-457EF8A40229@arm.com>
References: <20220727134512.4033-1-f_l_k@t-online.de>
	<A08B6BB6-EFD1-425D-AC02-457EF8A40229@arm.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-IP8qxQ8hmvmMN4xoMBF+"
X-TOI-EXPURGATEID: 150726::1658939504-0144CFA9-6DFD5172/0/0 CLEAN NORMAL
X-TOI-MSGID: b3a26e01-29df-4c2b-a0bb-7bf41c6beb78
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Jul 2022 16:31:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168574

--=-IP8qxQ8hmvmMN4xoMBF+
Content-Type: text/plain; charset=us-ascii; format=flowed

Yes. With the patch the warning disappears from dmesg

Am Mi, 27. Jul 2022 um 15:44:48 +0000 schrieb Ross Burton 
<ross.burton@arm.com>:
> This looks like a fix for 
> <https://bugzilla.yoctoproject.org/show_bug.cgi?id=14865>, can you 
> confirm that?
> 
> Ross
> 
>>  On 27 Jul 2022, at 14:45, Markus Volk via lists.openembedded.org 
>> <f_l_k=t-online.de@lists.openembedded.org 
>> <mailto:f_l_k=t-online.de@lists.openembedded.org>> wrote:
>> 
>>  We already have a root entry in fstab. This commit prevents 
>> processing root
>>  mountpoint in fstab_updater and thus avoids duplicate entries for 
>> root in fstab.
>> 
>>  Signed-off-by: Markus Volk <f_l_k@t-online.de 
>> <mailto:f_l_k@t-online.de>>
>>  ---
>>  scripts/lib/wic/plugins/imager/direct.py | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>> 
>>  diff --git a/scripts/lib/wic/plugins/imager/direct.py 
>> b/scripts/lib/wic/plugins/imager/direct.py
>>  index c44159b235..75004ab320 100644
>>  --- a/scripts/lib/wic/plugins/imager/direct.py
>>  +++ b/scripts/lib/wic/plugins/imager/direct.py
>>  @@ -117,7 +117,8 @@ class DirectPlugin(ImagerPlugin):
>>          updated = False
>>          for part in self.parts:
>>              if not part.realnum or not part.mountpoint \
>>  -               or not part.mountpoint.startswith('/'):
>>  +               or not part.mountpoint.startswith('/') \
>>  +               or part.mountpoint == "/":
>>                  continue
>> 
>>              if part.use_uuid:
>>  --
>>  2.34.1
>> 
>> 
>> 
>> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#168572): 
> <https://lists.openembedded.org/g/openembedded-core/message/168572>
> Mute This Topic: <https://lists.openembedded.org/mt/92649199/3618223>
> Group Owner: openembedded-core+owner@lists.openembedded.org 
> <mailto:openembedded-core+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-core/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-IP8qxQ8hmvmMN4xoMBF+
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>Yes. With the patch the warning disappears from dmesg</div></div><div id="geary-quote" dir="auto"><br>Am Mi, 27. Jul 2022 um 15:44:48 +0000 schrieb Ross Burton &lt;ross.burton@arm.com&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">This looks like a fix for <a href="https://bugzilla.yoctoproject.org/show_bug.cgi?id=14865">https://bugzilla.yoctoproject.org/show_bug.cgi?id=14865</a>, can you confirm that?

Ross

<blockquote> On 27 Jul 2022, at 14:45, Markus Volk via lists.openembedded.org &lt;<a href="mailto:f_l_k=t-online.de@lists.openembedded.org">f_l_k=t-online.de@lists.openembedded.org</a>&gt; wrote:
 
 We already have a root entry in fstab. This commit prevents processing root
 mountpoint in fstab_updater and thus avoids duplicate entries for root in fstab.
 
 Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
 ---
 scripts/lib/wic/plugins/imager/direct.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
 index c44159b235..75004ab320 100644
 --- a/scripts/lib/wic/plugins/imager/direct.py
 +++ b/scripts/lib/wic/plugins/imager/direct.py
 @@ -117,7 +117,8 @@ class DirectPlugin(ImagerPlugin):
         updated = False
         for part in self.parts:
             if not part.realnum or not part.mountpoint \
 -               or not part.mountpoint.startswith('/'):
 +               or not part.mountpoint.startswith('/') \
 +               or part.mountpoint == "/":
                 continue
 
             if part.use_uuid:
 -- 
 2.34.1
 
 
 
 
</blockquote>
</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#168572): <a href="https://lists.openembedded.org/g/openembedded-core/message/168572">https://lists.openembedded.org/g/openembedded-core/message/168572</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/92649199/3618223">https://lists.openembedded.org/mt/92649199/3618223</a>
Group Owner: <a href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-IP8qxQ8hmvmMN4xoMBF+--


