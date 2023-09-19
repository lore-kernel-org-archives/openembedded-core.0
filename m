Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C9BDCD5BBC
	for <webhook@archiver.kernel.org>; Tue, 19 Sep 2023 13:23:45 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web10.8295.1695129822257430736
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Sep 2023 06:23:42 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd70.aul.t-online.de (fwd70.aul.t-online.de [10.223.144.96])
	by mailout12.t-online.de (Postfix) with SMTP id C398A1E0A3;
	Tue, 19 Sep 2023 15:23:38 +0200 (CEST)
Received: from [192.168.178.62] ([79.219.233.37]) by fwd70.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qiahV-1io7mq0; Tue, 19 Sep 2023 15:23:38 +0200
Date: Tue, 19 Sep 2023 15:23:34 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCH] vte: upgrade 2.72.2 -> 2.74.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <AJI81S.IWBE7P5X9A4J@t-online.de>
In-Reply-To: <CANNYZj967eyFsoO2uuQ0U185MFe9Dk9NXwDMWdp3Z-FYrPQkfA@mail.gmail.com>
References: <20230919114941.1819808-1-f_l_k@t-online.de>
	<CANNYZj_+k_AjWNXMK-uPFpH3uNL_aYFeCkXw=+3UCUKnmnGMcg@mail.gmail.com>
	<9RH81S.9NI7WQZ7L6QX@t-online.de>
	<CANNYZj967eyFsoO2uuQ0U185MFe9Dk9NXwDMWdp3Z-FYrPQkfA@mail.gmail.com>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-bFj/oojeZTnD0FF4oVAw"
X-TOI-EXPURGATEID: 150726::1695129818-1C968A80-8FA11D0A/0/0 CLEAN NORMAL
X-TOI-MSGID: 74b228c5-53a5-4e83-92b6-ba1432a90312
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Sep 2023 13:23:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187866

--=-bFj/oojeZTnD0FF4oVAw
Content-Type: text/plain; charset=us-ascii; format=flowed

would it be desirable to additionally activate gtk4 in vte to support 
gnome-console?

On Tue, Sep 19 2023 at 03:20:59 PM +02:00:00, Alexander Kanavin 
<alex.kanavin@gmail.com> wrote:
> Having gpl3-only recipes in core is not a problem. Ability to build
> basic images without gpl3 items is tested, since that kind of thing is
> important to certain industries, but otherwise there are no hard
> feelings towards gpl3. It is open source, and products do ship with
> gpl3, with all gpl3 license obligations fulfilled.
> 
> Alex
> 
> On Tue, 19 Sept 2023 at 15:06, Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>> wrote:
>> 
>>  On Tue, Sep 19 2023 at 02:02:48 PM +02:00:00, Alexander Kanavin 
>> <alex.kanavin@gmail.com <mailto:alex.kanavin@gmail.com>> wrote:
>> 
>>  we need to find a different terminal (rxvt or indeed 
>> gnome-terminal).
>> 
>> 
>>  gnome-console is a simple thing. but it is necessary to build vte 
>> with gtk4 support (by the way, the default of vte is to build gtk3 
>> and gtk4 support). Maybe the problem with both gnome-console and 
>> gnome-terminal is that they are GPL-3.0-only.
>> 
>>  SUMMARY = "GNOME Console"
>>  LICENSE = "GPL-3.0-only"
>>  LIC_FILES_CHKSUM = 
>> "file://COPYING;md5=8f0e2cd40e05189ec81232da84bd6e1a" 
>> <file://copying;md5=8f0e2cd40e05189ec81232da84bd6e1a/>
>> 
>>  GNOMEBASEBUILDCLASS = "meson"
>>  inherit gtk-icon-cache gnomebase pkgconfig meson gsettings 
>> gnome-help upstream-version-is-even
>> 
>>  DEPENDS = " \
>>      desktop-file-utils-native \
>>      gtk4-native \
>>      gtk4 \
>>      libadwaita \
>>      vte \
>>      libgtop \
>>      pcre2 \
>>      gsettings-desktop-schemas \
>>  "
>> 
>>  SRC_URI[archive.sha256sum] = 
>> "24cbd5680e525c2c0c57ad8d8c1ad199ef5b45b1ff1c80be22a37848e46e93ac"
>> 
>>  FILES:${PN} += "${datadir}"
>> 
>>  RRECOMMENDS:${PN} += "gsettings-desktop-schemas hicolor-icon-theme"
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#187865): 
> <https://lists.openembedded.org/g/openembedded-core/message/187865>
> Mute This Topic: <https://lists.openembedded.org/mt/101454079/3618223>
> Group Owner: openembedded-core+owner@lists.openembedded.org 
> <mailto:openembedded-core+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-core/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-bFj/oojeZTnD0FF4oVAw
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>would it be desirable to additionally activate gtk4 in vte to support gnome-console?</div></div><div id="geary-quote" dir="auto"><br>On Tue, Sep 19 2023 at 03:20:59 PM +02:00:00, Alexander Kanavin &lt;alex.kanavin@gmail.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Having gpl3-only recipes in core is not a problem. Ability to build
basic images without gpl3 items is tested, since that kind of thing is
important to certain industries, but otherwise there are no hard
feelings towards gpl3. It is open source, and products do ship with
gpl3, with all gpl3 license obligations fulfilled.

Alex

On Tue, 19 Sept 2023 at 15:06, Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt; wrote:
<blockquote>
 On Tue, Sep 19 2023 at 02:02:48 PM +02:00:00, Alexander Kanavin &lt;<a href="mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:

 we need to find a different terminal (rxvt or indeed gnome-terminal).


 gnome-console is a simple thing. but it is necessary to build vte with gtk4 support (by the way, the default of vte is to build gtk3 and gtk4 support). Maybe the problem with both gnome-console and gnome-terminal is that they are GPL-3.0-only.

 SUMMARY = "GNOME Console"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "<a href="file://COPYING;md5=8f0e2cd40e05189ec81232da84bd6e1a" "="">file://COPYING;md5=8f0e2cd40e05189ec81232da84bd6e1a"</a>

 GNOMEBASEBUILDCLASS = "meson"
 inherit gtk-icon-cache gnomebase pkgconfig meson gsettings gnome-help upstream-version-is-even

 DEPENDS = " \
     desktop-file-utils-native \
     gtk4-native \
     gtk4 \
     libadwaita \
     vte \
     libgtop \
     pcre2 \
     gsettings-desktop-schemas \
 "

 SRC_URI[archive.sha256sum] = "24cbd5680e525c2c0c57ad8d8c1ad199ef5b45b1ff1c80be22a37848e46e93ac"

 FILES:${PN} += "${datadir}"

 RRECOMMENDS:${PN} += "gsettings-desktop-schemas hicolor-icon-theme"
</blockquote></div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#187865): <a href="https://lists.openembedded.org/g/openembedded-core/message/187865">https://lists.openembedded.org/g/openembedded-core/message/187865</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/101454079/3618223">https://lists.openembedded.org/mt/101454079/3618223</a>
Group Owner: <a href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-bFj/oojeZTnD0FF4oVAw--


