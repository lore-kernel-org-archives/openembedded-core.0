Return-Path: <w.egorov@phytec.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F385C3DA59
	for <webhook@archiver.kernel.org>; Mon, 22 Jul 2024 06:09:23 +0000 (UTC)
Subject: Re: [scarthgap+][PATCH] watchdog: Set watchdog_module in default config
To: openembedded-core@lists.openembedded.org
From: "Wadim Egorov" <w.egorov@phytec.de>
X-Originating-Location: Limassol, Limassol District, CY (62.228.96.197)
X-Originating-Platform: Linux Firefox 127
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sun, 21 Jul 2024 23:09:18 -0700
References: <CAOSpxda3332UEOtH2ypoeJnpt4ehZpjFbaq4er_25PdT_caV7w@mail.gmail.com>
In-Reply-To: <CAOSpxda3332UEOtH2ypoeJnpt4ehZpjFbaq4er_25PdT_caV7w@mail.gmail.com>
Message-ID: <31107.1721628558851428697@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="tlArGXKZX5emPACmjMGS"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jul 2024 06:09:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202305

--tlArGXKZX5emPACmjMGS
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 19, 2024 at 06:00 AM, Steve Sakoman wrote:

>=20
> Is this also an issue in master? If so, then this will need to be
> submitted first for master and then I can backport.

Yes, do you want me to resend without the scarthgap tag?
This patch also applies to master.

>=20
>=20
> Steve
>=20
> On Thu, Jul 18, 2024 at 11:21=E2=80=AFPM Wadim Egorov via
> lists.openembedded.org <w.egorov=3Dphytec.de@lists.openembedded.org>
> wrote:
>=20
>> systemd started to warn about used but unset environment variables.
>> Let us set watchdog_module=3Dnone which is used by the watchdog.service =
to
>> get
>> rid of the following warning:
>>=20
>> watchdog.service: Referenced but unset environment variable evaluates to
>> an empty string: watchdog_module
>>=20
>> Signed-off-by: Wadim Egorov <w.egorov@phytec.de>
>> ---
>> meta/recipes-extended/watchdog/watchdog-config/watchdog.default | 1 +
>> 1 file changed, 1 insertion(+)
>>=20
>> diff --git
>> a/meta/recipes-extended/watchdog/watchdog-config/watchdog.default
>> b/meta/recipes-extended/watchdog/watchdog-config/watchdog.default
>> index 647d5abca5bd..cee5fdc2b6f7 100644
>> --- a/meta/recipes-extended/watchdog/watchdog-config/watchdog.default
>> +++ b/meta/recipes-extended/watchdog/watchdog-config/watchdog.default
>> @@ -1,2 +1,3 @@
>> # Start watchdog at boot time? 0 or 1
>> run_watchdog=3D1
>> +watchdog_module=3Dnone
>> --
>> 2.25.1
>>=20
>>=20
>>=20
>=20
>

--tlArGXKZX5emPACmjMGS
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>On Fri, Jul 19, 2024 at 06:00 AM, Steve Sakoman wrote:</div>
<div>
<blockquote>Is this also an issue in master? If so, then this will need to =
be<br />submitted first for master and then I can backport.</blockquote>
</div>
<div>Yes, do you want me to resend without the scarthgap tag?</div>
<div>This patch also applies to master.</div>
<div><br />
<blockquote><br />Steve<br /><br />On Thu, Jul 18, 2024 at 11:21=E2=80=AFPM=
 Wadim Egorov via<br />lists.openembedded.org &lt;w.egorov=3Dphytec.de@list=
s.openembedded.org&gt;<br />wrote:<br />
<blockquote>systemd started to warn about used but unset environment variab=
les.<br />Let us set watchdog_module=3Dnone which is used by the watchdog.s=
ervice to get<br />rid of the following warning:<br /><br />watchdog.servic=
e: Referenced but unset environment variable evaluates to an empty string: =
watchdog_module<br /><br />Signed-off-by: Wadim Egorov &lt;w.egorov@phytec.=
de&gt;<br />---<br />meta/recipes-extended/watchdog/watchdog-config/watchdo=
g.default | 1 +<br />1 file changed, 1 insertion(+)<br /><br />diff --git a=
/meta/recipes-extended/watchdog/watchdog-config/watchdog.default b/meta/rec=
ipes-extended/watchdog/watchdog-config/watchdog.default<br />index 647d5abc=
a5bd..cee5fdc2b6f7 100644<br />--- a/meta/recipes-extended/watchdog/watchdo=
g-config/watchdog.default<br />+++ b/meta/recipes-extended/watchdog/watchdo=
g-config/watchdog.default<br />@@ -1,2 +1,3 @@<br /># Start watchdog at boo=
t time? 0 or 1<br />run_watchdog=3D1<br />+watchdog_module=3Dnone<br />--<b=
r />2.25.1<br /><br /><br /></blockquote>
</blockquote>
</div>

--tlArGXKZX5emPACmjMGS--

