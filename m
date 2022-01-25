Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00870C433F5
	for <webhook@archiver.kernel.org>; Tue, 25 Jan 2022 06:25:26 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web08.3798.1643091924512869261
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jan 2022 22:25:24 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.84,
 mailfrom: f_l_k@t-online.de)
Received: from fwd79.dcpf.telekom.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout09.t-online.de (Postfix) with SMTP id 08FBC141CD
	for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jan 2022 07:25:23 +0100 (CET)
Received: from [192.168.178.83] ([84.163.43.159]) by fwd79.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nCFGc-0NQBHN0; Tue, 25 Jan 2022 07:25:22 +0100
Subject: Re: [OE-core] [PATCH] python3-dbusmock: Add native recipe
To: openembedded-core@lists.openembedded.org
References: <20220124181219.2764108-1-raj.khem@gmail.com>
 <CAAnfSTvR3oeghGh8aDJmGkM2eWvgGqeAyYtvZSd8uOJ0KiYGuQ@mail.gmail.com>
 <16CD6DAF232F9743.31937@lists.openembedded.org>
From: Markus Volk <f_l_k@t-online.de>
Message-ID: <b1c00ec1-86e2-b24c-4b80-25b2938ca2d0@t-online.de>
Date: Tue, 25 Jan 2022 07:25:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <16CD6DAF232F9743.31937@lists.openembedded.org>
Content-Type: multipart/alternative;
 boundary="------------1271181D7867765A8E2E4C7D"
Content-Language: en-US
X-TOI-EXPURGATEID: 150726::1643091922-00010BFA-2A28FC29/0/0 CLEAN NORMAL
X-TOI-MSGID: 8bcddbe4-ae8f-4b1c-9bdd-4cbc5e6ab8d9
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Jan 2022 06:25:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160911

This is a multi-part message in MIME format.
--------------1271181D7867765A8E2E4C7D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

The python3-dbusmock dependency could be dropped if folks is build with

EXTRA_OEMESON += "-Dtests=false"

Am 25.01.22 um 06:53 schrieb Markus Volk:
>
> https://gitlab.gnome.org/GNOME/folks/-/blob/master/meson.build#L112
>
> it's needed for the bluez test
>
> Am 24.01.22 um 20:38 schrieb Ross Burton:
>> Seems like a workaround for a bad dependency.  Can this be disabled in folks?
>>
>> Ross
>>
>> On Mon, 24 Jan 2022 at 18:12, Khem Raj<raj.khem@gmail.com>  wrote:
>>> Needed by apps like folks
>>>
>>> Signed-off-by: Khem Raj<raj.khem@gmail.com>
>>> ---
>>>   meta/recipes-devtools/python/python3-dbusmock_0.25.0.bb | 2 ++
>>>   1 file changed, 2 insertions(+)
>>>
>>> diff --git a/meta/recipes-devtools/python/python3-dbusmock_0.25.0.bb b/meta/recipes-devtools/python/python3-dbusmock_0.25.0.bb
>>> index e64e343a1e0..4a857eaf5ae 100644
>>> --- a/meta/recipes-devtools/python/python3-dbusmock_0.25.0.bb
>>> +++ b/meta/recipes-devtools/python/python3-dbusmock_0.25.0.bb
>>> @@ -16,3 +16,5 @@ RDEPENDS:${PN} += "\
>>>       ${PYTHON_PN}-unittest \
>>>       ${PYTHON_PN}-xml \
>>>       "
>>> +
>>> +BBCLASSEXTEND = "native"
>>> --
>>> 2.34.1
>>>
>>>
>>>
>>>
>>>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#160910): https://lists.openembedded.org/g/openembedded-core/message/160910
> Mute This Topic: https://lists.openembedded.org/mt/88653359/3618223
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [f_l_k@t-online.de]
> -=-=-=-=-=-=-=-=-=-=-=-
>

--------------1271181D7867765A8E2E4C7D
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>The python3-dbusmock dependency could be dropped if folks is
      build with<br>
    </p>
    <p>EXTRA_OEMESON += "-Dtests=false"<br>
    </p>
    <div class="moz-cite-prefix">Am 25.01.22 um 06:53 schrieb Markus
      Volk:<br>
    </div>
    <blockquote type="cite"
      cite="mid:16CD6DAF232F9743.31937@lists.openembedded.org">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <p><a class="moz-txt-link-freetext"
href="https://gitlab.gnome.org/GNOME/folks/-/blob/master/meson.build#L112"
          moz-do-not-send="true">https://gitlab.gnome.org/GNOME/folks/-/blob/master/meson.build#L112</a></p>
      <p>it's needed for the bluez test<br>
      </p>
      <div class="moz-cite-prefix">Am 24.01.22 um 20:38 schrieb Ross
        Burton:<br>
      </div>
      <blockquote type="cite"
cite="mid:CAAnfSTvR3oeghGh8aDJmGkM2eWvgGqeAyYtvZSd8uOJ0KiYGuQ@mail.gmail.com">
        <pre class="moz-quote-pre" wrap="">Seems like a workaround for a bad dependency.  Can this be disabled in folks?

Ross

On Mon, 24 Jan 2022 at 18:12, Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com" moz-do-not-send="true">&lt;raj.khem@gmail.com&gt;</a> wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Needed by apps like folks

Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com" moz-do-not-send="true">&lt;raj.khem@gmail.com&gt;</a>
---
 meta/recipes-devtools/python/python3-dbusmock_0.25.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-dbusmock_0.25.0.bb b/meta/recipes-devtools/python/python3-dbusmock_0.25.0.bb
index e64e343a1e0..4a857eaf5ae 100644
--- a/meta/recipes-devtools/python/python3-dbusmock_0.25.0.bb
+++ b/meta/recipes-devtools/python/python3-dbusmock_0.25.0.bb
@@ -16,3 +16,5 @@ RDEPENDS:${PN} += "\
     ${PYTHON_PN}-unittest \
     ${PYTHON_PN}-xml \
     "
+
+BBCLASSEXTEND = "native"
--
2.34.1




</pre>
          <br>
          <fieldset class="mimeAttachmentHeader"></fieldset>
        </blockquote>
      </blockquote>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#160910): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/160910">https://lists.openembedded.org/g/openembedded-core/message/160910</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/88653359/3618223">https://lists.openembedded.org/mt/88653359/3618223</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
  </body>
</html>

--------------1271181D7867765A8E2E4C7D--

