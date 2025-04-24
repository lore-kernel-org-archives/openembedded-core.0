Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F92FC369AB
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 22:56:30 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web11.1783.1745535385829831614
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Apr 2025 15:56:26 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout04.t-online.de (Postfix) with SMTP id C909A1C3B;
	Fri, 25 Apr 2025 00:56:23 +0200 (CEST)
Received: from [192.168.178.20] ([84.154.166.69]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1u85UV-1aNerY0; Fri, 25 Apr 2025 00:56:23 +0200
Date: Fri, 25 Apr 2025 00:56:18 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCHv2] default-providers.inc: add entries for
 virtual/libsdl2
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Message-Id: <UPV8VS.UUSELDRXFPCO1@t-online.de>
In-Reply-To: <CAMKF1so=LdPAFO3cuYV_xsOHtqfNAXXmxGzBCgEKScuHS9sSgA@mail.gmail.com>
References: <18395F03D66275F9.31387@lists.openembedded.org>
	<W7S8VS.FQ12W4BJV1TZ1@t-online.de>
	<CAMKF1so=LdPAFO3cuYV_xsOHtqfNAXXmxGzBCgEKScuHS9sSgA@mail.gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-lB7p1MqoTGctvSUonmuG"
X-TOI-EXPURGATEID: 150726::1745535383-AE7FB9F0-1874DC67/0/0 CLEAN NORMAL
X-TOI-MSGID: 4bebf29d-9950-4527-b2ba-acc6e803bdba
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 22:56:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215409

--=-lB7p1MqoTGctvSUonmuG
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

> +PREFERRED_PROVIDER_virtual/nativesdk-libsdl2 ?=3D "nativesdk-libsdl2"

I think the entry for ntivesdk is correct ?

On Thu, Apr 24 2025 at 15:53:09 -07:00:00, Khem Raj=20
<raj.khem@gmail.com> wrote:
>=20
>=20
> On Thu, Apr 24, 2025 at 2:40=E2=80=AFPM Markus Volk via=20
> lists.openembedded.org <http://lists.openembedded.org/>=20
> <f_l_k=3Dt-online.de@lists.openembedded.org=20
> <mailto:t-online.de@lists.openembedded.org>> wrote:
>> v2: add missing -native
>=20
> How about nativesdk
>>=20
>> On Thu, Apr 24 2025 at 23:39:51 +02:00:00, Markus Volk=20
>> <f_l_k@t-online.de <mailto:f_l_k@t-online.de>> wrote:
>>> virtual/libsdl2 can be provided by 'libsdl2' and 'libsdl2-compat'=20
>>> where the latter
>>> is a replacement for libsdl2 that uses libsdl3 behind the scenes=20
>>> and should
>>> be favored if applicable.
>>>=20
>>> Signed-off-by: Markus Volk <f_l_k@t-online.de=20
>>> <mailto:f_l_k@t-online.de>>
>>> ---
>>>  meta/conf/distro/include/default-providers.inc | 4 ++++
>>>  1 file changed, 4 insertions(+)
>>>=20
>>> diff --git a/meta/conf/distro/include/default-providers.inc=20
>>> b/meta/conf/distro/include/default-providers.inc
>>> index cebd0400f4..ee91af8796 100644
>>> --- a/meta/conf/distro/include/default-providers.inc
>>> +++ b/meta/conf/distro/include/default-providers.inc
>>> @@ -4,6 +4,8 @@
>>>  BB_RECIPE_VIRTUAL_PROVIDERS =3D "virtual/cross-cc virtual/cross-c++=20
>>> virtual/cross-binutils virtual/nativesdk-cross-cc=20
>>> virtual/nativesdk-cross-c++ virtual/nativesdk-cross-binutils"
>>>  PREFERRED_PROVIDER_virtual/xserver ?=3D "xserver-xorg"
>>>  PREFERRED_PROVIDER_virtual/xserver-xf86 ?=3D "xserver-xorg"
>>> +PREFERRED_PROVIDER_virtual/libsdl2 ?=3D "libsdl2"
>>> +PREFERRED_PROVIDER_virtual/libsdl2-native ?=3D "libsdl2-native"
>>>  PREFERRED_PROVIDER_virtual/egl ?=3D "mesa"
>>>  PREFERRED_PROVIDER_virtual/libgl ?=3D "mesa"
>>>  PREFERRED_PROVIDER_virtual/libglx ?=3D "mesa"
>>> @@ -32,6 +34,7 @@ VIRTUAL-RUNTIME_base-utils-hwclock ?=3D=20
>>> "busybox-hwclock"
>>>  VIRTUAL-RUNTIME_base-utils-syslog ?=3D "busybox-syslog"
>>>  VIRTUAL-RUNTIME_keymaps ?=3D "keymaps"
>>>  VIRTUAL-RUNTIME_dbus ?=3D "dbus"
>>> +VIRTUAL-RUNTIME_libsdl2 ?=3D "libsdl2"
>>>=20
>>>  #
>>>  # Default recipe providers
>>> @@ -62,5 +65,6 @@ PREFERRED_PROVIDER_pkgconfig-native ?=3D=20
>>> "pkgconfig-native"
>>>  PREFERRED_RPROVIDER_initd-functions ?=3D "initscripts"
>>>=20
>>>  PREFERRED_PROVIDER_nativesdk-mesa ?=3D "nativesdk-mesa"
>>> +PREFERRED_PROVIDER_virtual/nativesdk-libsdl2 ?=3D "nativesdk-libsdl2"
>>>=20
>>>  PREFERRED_RPROVIDER_virtual-x-terminal-emulator ?=3D "rxvt-unicode"
>>> --
>>> 2.49.0
>>>=20
>>>=20
>>>=20
>>>=20
>>=20
>>  -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>  Links: You receive all messages sent to this group.
>>  View/Reply Online (#215407):=20
>> <https://lists.openembedded.org/g/openembedded-core/message/215407>
>>  Mute This Topic:=20
>> <https://lists.openembedded.org/mt/112441574/1997914>
>>  Group Owner: openembedded-core+owner@lists.openembedded.org=20
>> <mailto:openembedded-core%2Bowner@lists.openembedded.org>
>>  Unsubscribe:=20
>> <https://lists.openembedded.org/g/openembedded-core/unsub>=20
>> [raj.khem@gmail.com <mailto:raj.khem@gmail.com>]
>>  -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>=20


--=-lB7p1MqoTGctvSUonmuG
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div><blockquote type=3D"cite" style=3D=
"caret-color: rgb(48, 48, 48); color: rgb(48, 48, 48);"><div class=3D"plain=
text" style=3D"white-space: break-spaces;">+PREFERRED_PROVIDER_virtual/nati=
vesdk-libsdl2 ?=3D "nativesdk-libsdl2"</div></blockquote><div><font color=
=3D"#303030"><span style=3D"caret-color: rgb(48, 48, 48); white-space-colla=
pse: break-spaces;"><br></span></font></div></div><div><font color=3D"#3030=
30"><span style=3D"caret-color: rgb(48, 48, 48); white-space-collapse: brea=
k-spaces;">I think the entry for ntivesdk is correct ?</span></font></div><=
/div><div id=3D"geary-quote" dir=3D"auto"><br>On Thu, Apr 24 2025 at 15:53:=
09 -07:00:00, Khem Raj &lt;raj.khem@gmail.com&gt; wrote:<br><blockquote typ=
e=3D"cite"><div><br></div><div><br><div class=3D"gmail_quote gmail_quote_co=
ntainer"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Apr 24, 2025 at 2:40=
=E2=80=AFPM Markus Volk via <a href=3D"http://lists.openembedded.org">lists=
.openembedded.org</a> &lt;f_l_k=3D<a href=3D"mailto:t-online.de@lists.opene=
mbedded.org">t-online.de@lists.openembedded.org</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex"><div id=3D"m_6904681702273415015geary-body" dir=
=3D"auto"><div>v2: add missing -native</div></div></blockquote><div dir=3D"=
auto"><br></div><div dir=3D"auto">How about nativesdk&nbsp;</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex"><div id=3D"m_6904681702273415015geary-body" dir=3D"aut=
o"><div dir=3D"auto"></div></div><div id=3D"m_6904681702273415015geary-quot=
e" dir=3D"auto"><br>On Thu, Apr 24 2025 at 23:39:51 +02:00:00, Markus Volk =
&lt;<a href=3D"mailto:f_l_k@t-online.de" target=3D"_blank">f_l_k@t-online.d=
e</a>&gt; wrote:<br><blockquote type=3D"cite"><div style=3D"white-space:bre=
ak-spaces">virtual/libsdl2 can be provided by 'libsdl2' and 'libsdl2-compat=
' where the latter
is a replacement for libsdl2 that uses libsdl3 behind the scenes and should
be favored if applicable.

Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=
=3D"_blank">f_l_k@t-online.de</a>&gt;
---
 meta/conf/distro/include/default-providers.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/dis=
tro/include/default-providers.inc
index cebd0400f4..ee91af8796 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -4,6 +4,8 @@
 BB_RECIPE_VIRTUAL_PROVIDERS =3D "virtual/cross-cc virtual/cross-c++ virtua=
l/cross-binutils virtual/nativesdk-cross-cc virtual/nativesdk-cross-c++ vir=
tual/nativesdk-cross-binutils"
 PREFERRED_PROVIDER_virtual/xserver ?=3D "xserver-xorg"
 PREFERRED_PROVIDER_virtual/xserver-xf86 ?=3D "xserver-xorg"
+PREFERRED_PROVIDER_virtual/libsdl2 ?=3D "libsdl2"
+PREFERRED_PROVIDER_virtual/libsdl2-native ?=3D "libsdl2-native"
 PREFERRED_PROVIDER_virtual/egl ?=3D "mesa"
 PREFERRED_PROVIDER_virtual/libgl ?=3D "mesa"
 PREFERRED_PROVIDER_virtual/libglx ?=3D "mesa"
@@ -32,6 +34,7 @@ VIRTUAL-RUNTIME_base-utils-hwclock ?=3D "busybox-hwclock"
 VIRTUAL-RUNTIME_base-utils-syslog ?=3D "busybox-syslog"
 VIRTUAL-RUNTIME_keymaps ?=3D "keymaps"
 VIRTUAL-RUNTIME_dbus ?=3D "dbus"
+VIRTUAL-RUNTIME_libsdl2 ?=3D "libsdl2"
=20
 #
 # Default recipe providers
@@ -62,5 +65,6 @@ PREFERRED_PROVIDER_pkgconfig-native ?=3D "pkgconfig-nativ=
e"
 PREFERRED_RPROVIDER_initd-functions ?=3D "initscripts"
=20
 PREFERRED_PROVIDER_nativesdk-mesa ?=3D "nativesdk-mesa"
+PREFERRED_PROVIDER_virtual/nativesdk-libsdl2 ?=3D "nativesdk-libsdl2"
=20
 PREFERRED_RPROVIDER_virtual-x-terminal-emulator ?=3D "rxvt-unicode"
<div>--=20
</div>2.49.0

</div><div style=3D"white-space:break-spaces">


</div></blockquote></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#215407): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/215407" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/215407</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/112441574/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/112441574/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>
</blockquote></div>
--=-lB7p1MqoTGctvSUonmuG--


