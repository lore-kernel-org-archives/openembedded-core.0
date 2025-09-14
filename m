Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD594CAC582
	for <webhook@archiver.kernel.org>; Sun, 14 Sep 2025 06:47:36 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web10.4566.1757832454063666731
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Sep 2025 23:47:34 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd80.aul.t-online.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout05.t-online.de (Postfix) with SMTP id C7FBF755;
	Sun, 14 Sep 2025 08:47:29 +0200 (CEST)
Received: from [192.168.178.36] ([84.163.41.171]) by fwd80.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uxgWH-2UJBaK0; Sun, 14 Sep 2025 08:47:29 +0200
Date: Sun, 14 Sep 2025 08:47:23 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCH] glib-2.0: update 2.84.4 -> 2.86.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	"Khem Raj via lists.openembedded.org"
	<raj.khem=gmail.com@lists.openembedded.org>
Message-Id: <Z6GK2T.M9EPL86M9FWA3@t-online.de>
In-Reply-To: <CANNYZj8=Le1Eod6NfcmSFNiOuLafD4WoC9qSU4yRRpCz3So4nQ@mail.gmail.com>
References: <186275A42D34EEAB.19063@lists.openembedded.org>
	<5I7F2T.KIGKW1QUPNT51@t-online.de>
	<CANNYZj89e_Q80kSO-E7_iByBw72=0TuJNgoyPV1DzM=Q73irJg@mail.gmail.com>
	<J9PG2T.NK5VSUKA3AQO3@t-online.de>
	<CANNYZj8=Le1Eod6NfcmSFNiOuLafD4WoC9qSU4yRRpCz3So4nQ@mail.gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-IWdH44iN3e086O9HbADE"
X-TOI-EXPURGATEID: 150726::1757832449-F7FFC9EC-83205961/0/0 CLEAN NORMAL
X-TOI-MSGID: a33d92f5-c267-4071-9707-50febb3e895b
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Sep 2025 06:47:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223343

--=-IWdH44iN3e086O9HbADE
Content-Type: text/plain; charset=us-ascii; format=flowed

I have looked at the gjs code and believe that this is missing.

<https://gitlab.gnome.org/GNOME/gjs/-/commit/85695f23fe655b397a0a53190f0d83eacd626fa8>

A simple port to gjs 1.84.2 is not enough. It has an effect, but 
there's more, as a new error message appears. Instead of dealing with 
this, I would rather try to make glycin compilable. But it turns out 
that I have to do some homework first, as my last attempt ended in a 
rage quit

Help with this would therefore be very welcome.

On Fri, Sep 12 2025 at 11:58:10 +02:00:00, Alexander Kanavin 
<alex.kanavin@gmail.com> wrote:
> On Fri, 12 Sept 2025 at 08:13, Markus Volk via lists.openembedded.org
> <f_l_k=t-online.de@lists.openembedded.org 
> <mailto:f_l_k=t-online.de@lists.openembedded.org>> wrote:
>> 
>>  On Thu, Sep 11 2025 at 18:00:43 +02:00:00, Alexander Kanavin via 
>> lists.openembedded.org 
>> <alex.kanavin=gmail.com@lists.openembedded.org 
>> <mailto:alex.kanavin=gmail.com@lists.openembedded.org>> wrote:
>> 
>>  so can we identify what is specifically broken with current gnome 
>> shell 48 and see if it can be fixed?
>> 
>> 
>>  
>> <https://gitlab.gnome.org/GNOME/glib/-/commit/cb074a65c79a3b4ae4f3ae0e36775af46bcc8009>
>> 
>>  Here's the problem. This commit breaks gir at least in gjs, causing 
>> gnome-shell to crash.
>>  Reverting the commit fixed the runtime issue. Maybe we can adopt 
>> this patch until we're ready to switch to gnome49?
>> 
>>  I'll send a RFC patch for it
> 
> I saw the patch on oe-devel. It looks like a simple rename of
> methods/properties/etc? Maybe it's possible to extract and backport
> the fix to gnome-shell rather?
> 
> Alex


--=-IWdH44iN3e086O9HbADE
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div><div>I have looked at the gjs code=
 and believe that this is missing.</div><div><br></div><div><a href=3D"http=
s://gitlab.gnome.org/GNOME/gjs/-/commit/85695f23fe655b397a0a53190f0d83eacd6=
26fa8">https://gitlab.gnome.org/GNOME/gjs/-/commit/85695f23fe655b397a0a5319=
0f0d83eacd626fa8</a></div><div><br></div><div>A simple port to gjs 1.84.2 i=
s not enough. It has an effect, but there's more, as a new error message ap=
pears. Instead of dealing with this, I would rather try to make glycin comp=
ilable. But it turns out that I have to do some homework first, as my last =
attempt ended in a rage quit</div><div><br></div><div>Help with this would =
therefore be very welcome.</div></div></div><div id=3D"geary-quote" dir=3D"=
auto"><br>On Fri, Sep 12 2025 at 11:58:10 +02:00:00, Alexander Kanavin &lt;=
alex.kanavin@gmail.com&gt; wrote:<br><blockquote type=3D"cite"><div class=
=3D"plaintext" style=3D"white-space: break-spaces;">On Fri, 12 Sept 2025 at=
 08:13, Markus Volk via lists.openembedded.org
&lt;<a href=3D"mailto:f_l_k=3Dt-online.de@lists.openembedded.org">f_l_k=3Dt=
-online.de@lists.openembedded.org</a>&gt; wrote:
<blockquote>
 On Thu, Sep 11 2025 at 18:00:43 +02:00:00, Alexander Kanavin via lists.ope=
nembedded.org &lt;<a href=3D"mailto:alex.kanavin=3Dgmail.com@lists.openembe=
dded.org">alex.kanavin=3Dgmail.com@lists.openembedded.org</a>&gt; wrote:

 so can we identify what is specifically broken with current gnome shell 48=
 and see if it can be fixed?


 <a href=3D"https://gitlab.gnome.org/GNOME/glib/-/commit/cb074a65c79a3b4ae4=
f3ae0e36775af46bcc8009">https://gitlab.gnome.org/GNOME/glib/-/commit/cb074a=
65c79a3b4ae4f3ae0e36775af46bcc8009</a>

 Here's the problem. This commit breaks gir at least in gjs, causing gnome-=
shell to crash.
 Reverting the commit fixed the runtime issue. Maybe we can adopt this patc=
h until we're ready to switch to gnome49?

 I'll send a RFC patch for it
</blockquote>
I saw the patch on oe-devel. It looks like a simple rename of
methods/properties/etc? Maybe it's possible to extract and backport
the fix to gnome-shell rather?

Alex
</div></blockquote></div>
--=-IWdH44iN3e086O9HbADE--


