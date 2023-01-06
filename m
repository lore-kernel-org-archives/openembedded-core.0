Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C95BBC3DA7A
	for <webhook@archiver.kernel.org>; Fri,  6 Jan 2023 14:10:00 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web10.14198.1673014192280692665
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jan 2023 06:09:52 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd76.dcpf.telekom.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout10.t-online.de (Postfix) with SMTP id 7D10810518;
	Fri,  6 Jan 2023 15:09:49 +0100 (CET)
Received: from [192.168.178.83] ([79.219.229.129]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pDnPp-3jWM0u0; Fri, 6 Jan 2023 15:09:49 +0100
Date: Fri, 06 Jan 2023 15:09:43 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [OE-core] [PATCH] libportal: add opengl to
 REQUIRED_DISTRO_FEATURES
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: "Yu, Mingli" <mingli.yu@eng.windriver.com>,
	openembedded-core@lists.openembedded.org
Message-Id: <70I2OR.1GRVLP9YUW9F@t-online.de>
In-Reply-To: 
	<CANNYZj_cxDBBbe3mz3R5qiiqeSaiQp-Q6Sj_druYWbXcxeFDVQ@mail.gmail.com>
References: <20230106100806.838732-1-mingli.yu@eng.windriver.com>
	<CANNYZj_cxDBBbe3mz3R5qiiqeSaiQp-Q6Sj_druYWbXcxeFDVQ@mail.gmail.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-uoWhIlSusJmIXcbqcahI"
X-TOI-EXPURGATEID: 150726::1673014189-EDFF0A26-9ABE7806/0/0 CLEAN NORMAL
X-TOI-MSGID: aa903bfe-cc9d-4ba1-b498-7bfdc3b49010
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jan 2023 14:10:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175592

--=-uoWhIlSusJmIXcbqcahI
Content-Type: text/plain; charset=us-ascii; format=flowed

Maybe the REQUIRED_DISTRO_FEATURES = "opengl" line should just be 
removed from gtk4.bb ?

Am Fr, 6. Jan 2023 um 11:31:30 +0100 schrieb Alexander Kanavin 
<alex.kanavin@gmail.com>:
> Please stop. What problem does adding this solve?
> 
> Alex
> 
> On Fri 6. Jan 2023 at 11.08, Yu, Mingli <mingli.yu@eng.windriver.com 
> <mailto:mingli.yu@eng.windriver.com>> wrote:
>> From: Mingli Yu <mingli.yu@windriver.com 
>> <mailto:mingli.yu@windriver.com>>
>> 
>>  libportal depends on gtk4 which needs opengl DISTRO_FEATURES, so
>>  add opengl DISTRO_FEATURES requirement for libportal too.
>> 
>>  Signed-off-by: Mingli Yu <mingli.yu@windriver.com 
>> <mailto:mingli.yu@windriver.com>>
>>  ---
>>   meta/recipes-gnome/libportal/libportal_0.6.bb 
>> <http://libportal_0.6.bb/> | 1 +
>>   1 file changed, 1 insertion(+)
>> 
>>  diff --git a/meta/recipes-gnome/libportal/libportal_0.6.bb 
>> <http://libportal_0.6.bb/> 
>> b/meta/recipes-gnome/libportal/libportal_0.6.bb 
>> <http://libportal_0.6.bb/>
>>  index ca58ef4138..cb3c5631d9 100644
>>  --- a/meta/recipes-gnome/libportal/libportal_0.6.bb 
>> <http://libportal_0.6.bb/>
>>  +++ b/meta/recipes-gnome/libportal/libportal_0.6.bb 
>> <http://libportal_0.6.bb/>
>>  @@ -14,6 +14,7 @@ inherit meson gi-docgen gobject-introspection 
>> vala features_check pkgconfig
>>   GIDOCGEN_MESON_OPTION = 'docs'
>> 
>>   ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
>>  +REQUIRED_DISTRO_FEATURES = "opengl"
>> 
>>   DEPENDS += "glib-2.0 glib-2.0-native gtk+3 gtk4"
>> 
>>  --
>>  2.25.1
>> 
>> 
>> 
>> 


--=-uoWhIlSusJmIXcbqcahI
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>Maybe the&nbsp;REQUIRED_DISTRO_FEATURES = "opengl" line should just be removed from gtk4.bb ?</div></div><div id="geary-quote" dir="auto"><br>Am Fr, 6. Jan 2023 um 11:31:30 +0100 schrieb Alexander Kanavin &lt;alex.kanavin@gmail.com&gt;:<br><blockquote type="cite"><div dir="auto">Please stop. What problem does adding this solve?</div><div dir="auto"><br></div><div dir="auto">Alex</div><div><br><div class="gmail_quote"><div dir="ltr" class="gmail_attr">On Fri 6. Jan 2023 at 11.08, Yu, Mingli &lt;<a href="mailto:mingli.yu@eng.windriver.com">mingli.yu@eng.windriver.com</a>&gt; wrote:<br></div><blockquote class="gmail_quote" style="margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">From: Mingli Yu &lt;<a href="mailto:mingli.yu@windriver.com" target="_blank">mingli.yu@windriver.com</a>&gt;<br>
<br>
libportal depends on gtk4 which needs opengl DISTRO_FEATURES, so<br>
add opengl DISTRO_FEATURES requirement for libportal too.<br>
<br>
Signed-off-by: Mingli Yu &lt;<a href="mailto:mingli.yu@windriver.com" target="_blank">mingli.yu@windriver.com</a>&gt;<br>
---<br>
&nbsp;meta/recipes-gnome/libportal/<a href="http://libportal_0.6.bb" rel="noreferrer" target="_blank">libportal_0.6.bb</a> | 1 +<br>
&nbsp;1 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta/recipes-gnome/libportal/<a href="http://libportal_0.6.bb" rel="noreferrer" target="_blank">libportal_0.6.bb</a> b/meta/recipes-gnome/libportal/<a href="http://libportal_0.6.bb" rel="noreferrer" target="_blank">libportal_0.6.bb</a><br>
index ca58ef4138..cb3c5631d9 100644<br>
--- a/meta/recipes-gnome/libportal/<a href="http://libportal_0.6.bb" rel="noreferrer" target="_blank">libportal_0.6.bb</a><br>
+++ b/meta/recipes-gnome/libportal/<a href="http://libportal_0.6.bb" rel="noreferrer" target="_blank">libportal_0.6.bb</a><br>
@@ -14,6 +14,7 @@ inherit meson gi-docgen gobject-introspection vala features_check pkgconfig<br>
&nbsp;GIDOCGEN_MESON_OPTION = 'docs'<br>
<br>
&nbsp;ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"<br>
+REQUIRED_DISTRO_FEATURES = "opengl"<br>
<br>
&nbsp;DEPENDS += "glib-2.0 glib-2.0-native gtk+3 gtk4"<br>
<br>
-- <br>
2.25.1<br>
<br>
<br>
<br>
<br>
</blockquote></div></div>
</blockquote></div>
--=-uoWhIlSusJmIXcbqcahI--


