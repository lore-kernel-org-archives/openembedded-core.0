Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DB37C433F5
	for <webhook@archiver.kernel.org>; Fri, 21 Jan 2022 13:34:17 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web11.11904.1642772056030970289
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jan 2022 05:34:16 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.83,
 mailfrom: f_l_k@t-online.de)
Received: from fwd79.dcpf.telekom.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout07.t-online.de (Postfix) with SMTP id 95FD0F1BC
	for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jan 2022 14:34:14 +0100 (CET)
Received: from [192.168.178.83] ([84.163.45.199]) by fwd79.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nAu3R-0l4O3N0; Fri, 21 Jan 2022 14:34:14 +0100
Subject: Re: [OE-core] [meta-oe][PATCH 2/2] gspell: inherit vala
To: openembedded-core@lists.openembedded.org
References: <20220119142457.2974185-1-f_l_k@t-online.de>
 <20220119142457.2974185-2-f_l_k@t-online.de>
 <07cfb791-5fd8-9d47-5a39-e93188c768b8@windriver.com>
From: Markus Volk <f_l_k@t-online.de>
Message-ID: <2a5b0e38-b9ff-0e74-b6d2-26dd19e79b3b@t-online.de>
Date: Fri, 21 Jan 2022 14:34:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <07cfb791-5fd8-9d47-5a39-e93188c768b8@windriver.com>
Content-Type: multipart/alternative;
 boundary="------------E9E3DCE6930E1C98F2D002AF"
Content-Language: en-US
X-TOI-EXPURGATEID: 150726::1642772054-00010BFA-C5D04A17/0/0 CLEAN NORMAL
X-TOI-MSGID: 02ac4512-4dec-4cb4-bdd3-385ec421b16c
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jan 2022 13:34:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160825

This is a multi-part message in MIME format.
--------------E9E3DCE6930E1C98F2D002AF
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi Randy,

thanks. I've sent the patches again to the correct mailinglist

Am 21.01.22 um 02:46 schrieb Randy MacLeod:
> Markus,
>
> Thanks for the patch, seems sensible to me but please resend to:
>
> =C2=A0=C2=A0 openembedded-devel@lists.openembedded.org
>
> as documented in the README:
>
> $ grep send-email meta-gnome/README
>
> git send-email -M -1 --to openembedded-devel@lists.openembedded.org=20
> --subject-prefix=3D'meta-gnome][PATCH'
>
>
> Oh it seems that Khem already suggested that for another thread so
> I'm not sure if he picked this up. It's not in master or master-next.
>
> ../Randy
>
> On 2022-01-19 09:24, Markus Volk wrote:
>> This is needed to get the vala gir files created (needed e.g. to=20
>> build geary).
>>
>> Signed-off-by: Markus Volk <f_l_k@t-online.de>
>> ---
>> =C2=A0 meta-gnome/recipes-gnome/gspell/gspell_1.9.1.bb | 2 +-
>> =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-gnome/recipes-gnome/gspell/gspell_1.9.1.bb=20
>> b/meta-gnome/recipes-gnome/gspell/gspell_1.9.1.bb
>> index d6de146b1..aba9be87a 100644
>> --- a/meta-gnome/recipes-gnome/gspell/gspell_1.9.1.bb
>> +++ b/meta-gnome/recipes-gnome/gspell/gspell_1.9.1.bb
>> @@ -5,6 +5,6 @@ LIC_FILES_CHKSUM =3D=20
>> "file://COPYING;md5=3D8c2e1ec1540fb3e0beb68361344cba7e"
>> =C2=A0 =C2=A0 DEPENDS =3D "gtk+3 iso-codes enchant2"
>> =C2=A0 -inherit gnomebase gettext gobject-introspection
>> +inherit gnomebase gettext gobject-introspection vala
>> =C2=A0 =C2=A0 SRC_URI[archive.sha256sum] =3D=20
>> "dcbb769dfdde8e3c0a8ed3102ce7e661abbf7ddf85df08b29915e92cd723abdd"
>>
>>
>>
>>
>>
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#160810): https://lists.openembedded.org/g/openembed=
ded-core/message/160810
> Mute This Topic: https://lists.openembedded.org/mt/88534924/3618223
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
f_l_k@t-online.de]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--------------E9E3DCE6930E1C98F2D002AF
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    <p>Hi Randy,</p>
    <p>thanks. I've sent the patches again to the correct mailinglist<br>
    </p>
    <div class=3D"moz-cite-prefix">Am 21.01.22 um 02:46 schrieb Randy
      MacLeod:<br>
    </div>
    <blockquote type=3D"cite"
      cite=3D"mid:07cfb791-5fd8-9d47-5a39-e93188c768b8@windriver.com">Mar=
kus,
      <br>
      <br>
      Thanks for the patch, seems sensible to me but please resend to:
      <br>
      <br>
      =C2=A0=C2=A0 <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:o=
penembedded-devel@lists.openembedded.org">openembedded-devel@lists.openem=
bedded.org</a>
      <br>
      <br>
      as documented in the README:
      <br>
      <br>
      $ grep send-email meta-gnome/README
      <br>
      <br>
      git send-email -M -1 --to
      <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openembedded-d=
evel@lists.openembedded.org">openembedded-devel@lists.openembedded.org</a=
>
      --subject-prefix=3D'meta-gnome][PATCH'
      <br>
      <br>
      <br>
      Oh it seems that Khem already suggested that for another thread so
      <br>
      I'm not sure if he picked this up. It's not in master or
      master-next.
      <br>
      <br>
      ../Randy
      <br>
      <br>
      On 2022-01-19 09:24, Markus Volk wrote:
      <br>
      <blockquote type=3D"cite">This is needed to get the vala gir files
        created (needed e.g. to build geary).
        <br>
        <br>
        Signed-off-by: Markus Volk <a class=3D"moz-txt-link-rfc2396E" hre=
f=3D"mailto:f_l_k@t-online.de">&lt;f_l_k@t-online.de&gt;</a>
        <br>
        ---
        <br>
        =C2=A0 meta-gnome/recipes-gnome/gspell/gspell_1.9.1.bb | 2 +-
        <br>
        =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
        <br>
        <br>
        diff --git a/meta-gnome/recipes-gnome/gspell/gspell_1.9.1.bb
        b/meta-gnome/recipes-gnome/gspell/gspell_1.9.1.bb
        <br>
        index d6de146b1..aba9be87a 100644
        <br>
        --- a/meta-gnome/recipes-gnome/gspell/gspell_1.9.1.bb
        <br>
        +++ b/meta-gnome/recipes-gnome/gspell/gspell_1.9.1.bb
        <br>
        @@ -5,6 +5,6 @@ LIC_FILES_CHKSUM =3D
        <a class=3D"moz-txt-link-rfc2396E" href=3D"file://COPYING;md5=3D8=
c2e1ec1540fb3e0beb68361344cba7e">"file://COPYING;md5=3D8c2e1ec1540fb3e0be=
b68361344cba7e"</a>
        <br>
        =C2=A0 =C2=A0 DEPENDS =3D "gtk+3 iso-codes enchant2"
        <br>
        =C2=A0 -inherit gnomebase gettext gobject-introspection
        <br>
        +inherit gnomebase gettext gobject-introspection vala
        <br>
        =C2=A0 =C2=A0 SRC_URI[archive.sha256sum] =3D
        "dcbb769dfdde8e3c0a8ed3102ce7e661abbf7ddf85df08b29915e92cd723abdd=
"
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
      </blockquote>
      <br>
      <br>
      <br>
      <fieldset class=3D"mimeAttachmentHeader"></fieldset>
      <pre class=3D"moz-quote-pre" wrap=3D"">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#160810): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-core/message/160810">https:/=
/lists.openembedded.org/g/openembedded-core/message/160810</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/88534924/3618223">https://lists.openembedded.org/mt/=
88534924/3618223</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.op=
enembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g=
/openembedded-core/unsub</a> [<a class=3D"moz-txt-link-abbreviated" href=3D=
"mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
    </blockquote>
  </body>
</html>

--------------E9E3DCE6930E1C98F2D002AF--

