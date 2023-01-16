Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E00BDC46467
	for <webhook@archiver.kernel.org>; Mon, 16 Jan 2023 16:50:08 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web11.172109.1673887805427974223
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jan 2023 08:50:05 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd79.dcpf.telekom.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout05.t-online.de (Postfix) with SMTP id B43321F60A;
	Mon, 16 Jan 2023 17:50:02 +0100 (CET)
Received: from [192.168.178.83] ([79.219.233.67]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pHSgM-29v5l20; Mon, 16 Jan 2023 17:50:02 +0100
Date: Mon, 16 Jan 2023 17:49:56 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCH] neard: dont pull in wpa-supplicant
 unconditionally
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <838LOR.7MMYBGDJNPM51@t-online.de>
In-Reply-To: 
	<ca881583fdf1906bb5828607c19a11113cbd895d.camel@linuxfoundation.org>
References: <20230116164325.289867-1-f_l_k@t-online.de>
	<ca881583fdf1906bb5828607c19a11113cbd895d.camel@linuxfoundation.org>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-oqLmv24HpQeKYFc9k0ef"
X-TOI-EXPURGATEID: 150726::1673887802-BEFF89DF-09C3ED4D/0/0 CLEAN NORMAL
X-TOI-MSGID: 50973312-5928-4a8f-bae1-9c07fa69f1ab
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 16:50:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176005

--=-oqLmv24HpQeKYFc9k0ef
Content-Type: text/plain; charset=us-ascii; format=flowed

We have it set here

<https://git.yoctoproject.org/poky/commit/?id=1eaf64fbe16d2ceb472623c65c961b36aee33608>

Am Mo, 16. Jan 2023 um 16:47:16 +0000 schrieb Richard Purdie 
<richard.purdie@linuxfoundation.org>:
> On Mon, 2023-01-16 at 17:43 +0100, Markus Volk wrote:
>>  Signed-off-by: Markus Volk <f_l_k@t-online.de 
>> <mailto:f_l_k@t-online.de>>
>>  ---
>>   meta/recipes-connectivity/neard/neard_0.18.bb | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>>  diff --git a/meta/recipes-connectivity/neard/neard_0.18.bb 
>> b/meta/recipes-connectivity/neard/neard_0.18.bb
>>  index 23e999acc4..17dbfc4378 100644
>>  --- a/meta/recipes-connectivity/neard/neard_0.18.bb
>>  +++ b/meta/recipes-connectivity/neard/neard_0.18.bb
>>  @@ -42,7 +42,7 @@ RDEPENDS:${PN} = "dbus"
>>   # Bluez & Wifi are not mandatory except for handover
>>   RRECOMMENDS:${PN} = "\
>>                        ${@bb.utils.contains 
>> <mailto:${@bb.utils.contains>('DISTRO_FEATURES', 'bluetooth', 
>> 'bluez5', '', d)} \
>>  -                     ${@bb.utils.contains 
>> <mailto:${@bb.utils.contains>('DISTRO_FEATURES', 
>> 'wifi','wpa-supplicant', '', d)} \
>>  +                     ${@bb.utils.contains 
>> <mailto:${@bb.utils.contains>('DISTRO_FEATURES', 
>> 'wifi','${WIRELESS_DAEMON}', '', d)} \
>>                       "
>> 
>>   INITSCRIPT_NAME = "neard"
> 
> That isn't going to work as there is no default value for
> WIRELESS_DAEMON ?
> 
> Cheers,
> 
> Richard
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#176004): 
> <https://lists.openembedded.org/g/openembedded-core/message/176004>
> Mute This Topic: <https://lists.openembedded.org/mt/96310274/3618223>
> Group Owner: openembedded-core+owner@lists.openembedded.org 
> <mailto:openembedded-core+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-core/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-oqLmv24HpQeKYFc9k0ef
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>We have it set here</div><div><br></div><div><a href="https://git.yoctoproject.org/poky/commit/?id=1eaf64fbe16d2ceb472623c65c961b36aee33608">https://git.yoctoproject.org/poky/commit/?id=1eaf64fbe16d2ceb472623c65c961b36aee33608</a></div></div><div id="geary-quote" dir="auto"><br>Am Mo, 16. Jan 2023 um 16:47:16 +0000 schrieb Richard Purdie &lt;richard.purdie@linuxfoundation.org&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">On Mon, 2023-01-16 at 17:43 +0100, Markus Volk wrote:
<blockquote> Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
 ---
  meta/recipes-connectivity/neard/neard_0.18.bb | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/meta/recipes-connectivity/neard/neard_0.18.bb b/meta/recipes-connectivity/neard/neard_0.18.bb
 index 23e999acc4..17dbfc4378 100644
 --- a/meta/recipes-connectivity/neard/neard_0.18.bb
 +++ b/meta/recipes-connectivity/neard/neard_0.18.bb
 @@ -42,7 +42,7 @@ RDEPENDS:${PN} = "dbus"
  # Bluez &amp; Wifi are not mandatory except for handover
  RRECOMMENDS:${PN} = "\
                       <a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('DISTRO_FEATURES', 'bluetooth', 'bluez5', '', d)} \
 -                     <a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('DISTRO_FEATURES', 'wifi','wpa-supplicant', '', d)} \
 +                     <a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('DISTRO_FEATURES', 'wifi','${WIRELESS_DAEMON}', '', d)} \
                      "
  
  INITSCRIPT_NAME = "neard"
</blockquote>
That isn't going to work as there is no default value for
WIRELESS_DAEMON ?

Cheers,

Richard

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#176004): <a href="https://lists.openembedded.org/g/openembedded-core/message/176004">https://lists.openembedded.org/g/openembedded-core/message/176004</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/96310274/3618223">https://lists.openembedded.org/mt/96310274/3618223</a>
Group Owner: <a href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-oqLmv24HpQeKYFc9k0ef--


