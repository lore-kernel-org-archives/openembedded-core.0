Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41201C433EF
	for <webhook@archiver.kernel.org>; Thu, 20 Jan 2022 20:32:53 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web10.1926.1642710772364535125
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jan 2022 12:32:52 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.21,
 mailfrom: f_l_k@t-online.de)
Received: from fwd88.dcpf.telekom.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout10.t-online.de (Postfix) with SMTP id 496C916A6E
	for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jan 2022 21:32:49 +0100 (CET)
Received: from [192.168.178.83] ([84.163.38.111]) by fwd88.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nAe6s-18PtVB0; Thu, 20 Jan 2022 21:32:42 +0100
Subject: Re: [OE-core] [meta-gnome][PATCH 2/2] folks: initial add recipe
To: openembedded-core@lists.openembedded.org
References: <20220120151824.61601-1-f_l_k@t-online.de>
 <20220120151824.61601-2-f_l_k@t-online.de>
 <CAMKF1soam8JqD=T8tD+2gMX4rkdzb790dsOOkPMachEHTsFbnw@mail.gmail.com>
 <e01a9599-42a7-187d-c72a-2b057652b51b@t-online.de>
 <CAMKF1srAs7Xxcr68xo_S4t48_XE6XSq-ne8Gu+d19DPF+ByM9g@mail.gmail.com>
From: Markus Volk <f_l_k@t-online.de>
Message-ID: <ca868782-6242-1796-bf00-fac4c2eee7b9@t-online.de>
Date: Thu, 20 Jan 2022 21:32:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: 
 <CAMKF1srAs7Xxcr68xo_S4t48_XE6XSq-ne8Gu+d19DPF+ByM9g@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------BF9C6C9E743B0BC273294C18"
Content-Language: en-US
X-TOI-EXPURGATEID: 150726::1642710762-00013579-2A9F40ED/0/0 CLEAN NORMAL
X-TOI-MSGID: fcc51f62-143f-4cf7-840c-e4fd658da723
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jan 2022 20:32:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160784

This is a multi-part message in MIME format.
--------------BF9C6C9E743B0BC273294C18
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

sorry, missed that. I'll send a v2 patch for it

Am 20.01.22 um 21:28 schrieb Khem Raj:
> I posted the link with error message the specific error is
>
> Run-time dependency libxml-2.0 found: NO (tried pkgconfig)
>
> ../folks-0.15.4/meson.build:126:2: ERROR: Dependency "libxml-2.0" not
> found, tried pkgconfig
>
> On Thu, Jan 20, 2022 at 12:22 PM Markus Volk <f_l_k@t-online.de> wrote:
>> mmmh. Whats the error message ?
>>
>> I can build folks like this for aarch64 and x86-64
>>
>> Am 20.01.22 um 21:11 schrieb Khem Raj:
>>> +SUMMARY = "Folks is a contact aggregation library."
>>> +LICENSE = "LGPLv2.1"
>>> +LIC_FILES_CHKSUM ="file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
>>> +
>>> +DEPENDS = " \
>>> +    glib-2.0 \
>>> +    libgee \
>>> +    dbus-glib \
>>> +    telepathy-glib \
>>> +"
>>> +
>>> +GNOMEBASEBUILDCLASS = "meson"
>>> +
>>> +# gobject-introspection is mandatory and cannot be configured
>>> +REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
>>> +GIR_MESON_OPTION = ""
>>> +
>>> +EXTRA_OEMESON = "-Deds_backend=false -Dbluez_backend=false -Dofono_backend=false -Dtelepathy_backend=false"
>>> +
>>> +inherit gnomebase gettext gobject-introspection vala features_check
>>> +
>>> +SRC_URI[archive.sha256sum] = "e71099afc9e88fad4e757ae134bc3fd63e12b901ad62b0ed5536afb79124af5f"
>>> +
>>
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#160783): https://lists.openembedded.org/g/openembedded-core/message/160783
>> Mute This Topic: https://lists.openembedded.org/mt/88560749/3618223
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [f_l_k@t-online.de]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

--------------BF9C6C9E743B0BC273294C18
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>sorry, missed that. I'll send a v2 patch for it<br>
    </p>
    <div class="moz-cite-prefix">Am 20.01.22 um 21:28 schrieb Khem Raj:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAMKF1srAs7Xxcr68xo_S4t48_XE6XSq-ne8Gu+d19DPF+ByM9g@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">I posted the link with error message the specific error is

Run-time dependency libxml-2.0 found: NO (tried pkgconfig)

../folks-0.15.4/meson.build:126:2: ERROR: Dependency "libxml-2.0" not
found, tried pkgconfig

On Thu, Jan 20, 2022 at 12:22 PM Markus Volk <a class="moz-txt-link-rfc2396E" href="mailto:f_l_k@t-online.de">&lt;f_l_k@t-online.de&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
mmmh. Whats the error message ?

I can build folks like this for aarch64 and x86-64

Am 20.01.22 um 21:11 schrieb Khem Raj:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">+SUMMARY = "Folks is a contact aggregation library."
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM =<a class="moz-txt-link-rfc2396E" href="file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1">"file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"</a>
+
+DEPENDS = " \
+    glib-2.0 \
+    libgee \
+    dbus-glib \
+    telepathy-glib \
+"
+
+GNOMEBASEBUILDCLASS = "meson"
+
+# gobject-introspection is mandatory and cannot be configured
+REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
+GIR_MESON_OPTION = ""
+
+EXTRA_OEMESON = "-Deds_backend=false -Dbluez_backend=false -Dofono_backend=false -Dtelepathy_backend=false"
+
+inherit gnomebase gettext gobject-introspection vala features_check
+
+SRC_URI[archive.sha256sum] = "e71099afc9e88fad4e757ae134bc3fd63e12b901ad62b0ed5536afb79124af5f"
+
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">


</pre>
        <br>
        <fieldset class="mimeAttachmentHeader"></fieldset>
        <pre class="moz-quote-pre" wrap="">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#160783): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/160783">https://lists.openembedded.org/g/openembedded-core/message/160783</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/88560749/3618223">https://lists.openembedded.org/mt/88560749/3618223</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------BF9C6C9E743B0BC273294C18--

