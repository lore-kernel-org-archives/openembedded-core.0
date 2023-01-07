Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DECFC46467
	for <webhook@archiver.kernel.org>; Sat,  7 Jan 2023 03:51:31 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web11.13764.1673063481952850310
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jan 2023 19:51:22 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd83.dcpf.telekom.de (fwd83.aul.t-online.de [10.223.144.109])
	by mailout11.t-online.de (Postfix) with SMTP id 895C111607;
	Sat,  7 Jan 2023 04:51:09 +0100 (CET)
Received: from [192.168.178.83] ([79.219.226.225]) by fwd83.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pE0Ec-0UiWjQ0; Sat, 7 Jan 2023 04:51:06 +0100
Date: Sat, 07 Jan 2023 04:51:00 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCHv3] gcr3: update 3.40.0 -> 3.41.1
To: alexandre.belloni@bootlin.com
Cc: openembedded-core@lists.openembedded.org
Message-Id: <01K3OR.UMYRJFSIOCNE@t-online.de>
In-Reply-To: <Y7hL0YQK00Cdva/T@mail.local>
References: <20230106133300.2762884-1-f_l_k@t-online.de>
	<Y7hL0YQK00Cdva/T@mail.local>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-/uWb0+fpBqYf+0bZWvK1"
X-TOI-EXPURGATEID: 150726::1673063466-60A0E2DC-AB86B2EF/0/0 CLEAN NORMAL
X-TOI-MSGID: aa6e2930-a65b-4b55-aa30-e41b10f18187
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 07 Jan 2023 03:51:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175614

--=-/uWb0+fpBqYf+0bZWvK1
Content-Type: text/plain; charset=us-ascii; format=flowed

sorry, i don't know what happened. Hopefully v4 will apply

Am Fr, 6. Jan 2023 um 17:26:57 +0100 schrieb Alexandre Belloni via 
lists.openembedded.org 
<alexandre.belloni=bootlin.com@lists.openembedded.org>:
> Hello,
> 
> On 06/01/2023 14:33:00+0100, Markus Volk wrote:
>>  diff --git a/meta/recipes-gnome/gcr/gcr3_3.40.0.bb 
>> b/meta/recipes-gnome/gcr/gcr3_3.41.1.bb
>>  similarity index 63%
>>  rename from meta/recipes-gnome/gcr/gcr3_3.40.0.bb
>>  rename to meta/recipes-gnome/gcr/gcr3_3.41.1.bb
>>  index 5318768db6..6cbf8671f5 100644
>>  --- a/meta/recipes-gnome/gcr/gcr3_3.40.0.bb
>>  +++ b/meta/recipes-gnome/gcr/gcr3_3.41.1.bb
>>  @@ -17,27 +17,30 @@ CFLAGS += "-D_GNU_SOURCE"
>> 
>>   GNOMEBASEBUILDCLASS = "meson"
>>   GTKDOC_MESON_OPTION = "gtk_doc"
>>  -inherit gnomebase gtk-icon-cache gtk-doc features_check 
>> upstream-version-is-even vala gobject-introspection gettext mime 
>> mime-xdg
>>  +inherit gnomebase gtk-icon-cache gi-docgen features_check 
>> upstream-version-is-even vala gobject-introspection gettext mime 
>> mime-xdg
>>   UPSTREAM_CHECK_REGEX = 
>> "[^\d\.](?P<pver>\d+\.(?!9\d+)(\d*[02468])+(\.\d+)+)\.tar"
> 
> This part still doesn't apply on top of master, did you pull?
> 
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com <https://bootlin.com/>
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#175600): 
> <https://lists.openembedded.org/g/openembedded-core/message/175600>
> Mute This Topic: <https://lists.openembedded.org/mt/96093032/3618223>
> Group Owner: openembedded-core+owner@lists.openembedded.org 
> <mailto:openembedded-core+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-core/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-/uWb0+fpBqYf+0bZWvK1
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>sorry, i don't know what happened. Hopefully v4 will apply</div></div><div id="geary-quote" dir="auto"><br>Am Fr, 6. Jan 2023 um 17:26:57 +0100 schrieb Alexandre Belloni via lists.openembedded.org &lt;alexandre.belloni=bootlin.com@lists.openembedded.org&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Hello,

On 06/01/2023 14:33:00+0100, Markus Volk wrote:
<blockquote> diff --git a/meta/recipes-gnome/gcr/gcr3_3.40.0.bb b/meta/recipes-gnome/gcr/gcr3_3.41.1.bb
 similarity index 63%
 rename from meta/recipes-gnome/gcr/gcr3_3.40.0.bb
 rename to meta/recipes-gnome/gcr/gcr3_3.41.1.bb
 index 5318768db6..6cbf8671f5 100644
 --- a/meta/recipes-gnome/gcr/gcr3_3.40.0.bb
 +++ b/meta/recipes-gnome/gcr/gcr3_3.41.1.bb
 @@ -17,27 +17,30 @@ CFLAGS += "-D_GNU_SOURCE"
  
  GNOMEBASEBUILDCLASS = "meson"
  GTKDOC_MESON_OPTION = "gtk_doc"
 -inherit gnomebase gtk-icon-cache gtk-doc features_check upstream-version-is-even vala gobject-introspection gettext mime mime-xdg
 +inherit gnomebase gtk-icon-cache gi-docgen features_check upstream-version-is-even vala gobject-introspection gettext mime mime-xdg
  UPSTREAM_CHECK_REGEX = "[^\d\.](?P&lt;pver&gt;\d+\.(?!9\d+)(\d*[02468])+(\.\d+)+)\.tar"
</blockquote>
This part still doesn't apply on top of master, did you pull?

<div>-- 
</div>Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
<a href="https://bootlin.com">https://bootlin.com</a>
</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#175600): <a href="https://lists.openembedded.org/g/openembedded-core/message/175600">https://lists.openembedded.org/g/openembedded-core/message/175600</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/96093032/3618223">https://lists.openembedded.org/mt/96093032/3618223</a>
Group Owner: <a href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-/uWb0+fpBqYf+0bZWvK1--


