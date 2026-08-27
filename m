Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D601AC61DB9
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 06:38:36 +0000 (UTC)
Subject: Re: [scarthgap][PATCH 1/4] wget: Fix CVE-2026-58469
To: openembedded-core@lists.openembedded.org
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
X-Originating-Location: Mumbai, Maharashtra, IN (151.186.177.83)
X-Originating-Platform: Windows Edge 151
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 26 Aug 2026 23:38:27 -0700
References: <20260722101230.34771-1-hthakar@cisco.com> <DK5AB0SRDKFY.7NIL8TCKZUUN@smile.fr> <18C4DECEC4DDFC1A.1355869@lists.openembedded.org> <PH7PR11MB85986421972394BF2C2D53E8ADA42@PH7PR11MB8598.namprd11.prod.outlook.com> <CAMSfU+6-0HABPr=nm0kjkj=ByF1_PbU+O-ZrGyQ4zVp-OGgCqA@mail.gmail.com> <2716314.1787663222100636520@lists.openembedded.org> <DKY24Z052ZHW.1DIVWIX99A1N5@smile.fr>
In-Reply-To: <DKY24Z052ZHW.1DIVWIX99A1N5@smile.fr>
Message-ID: <2326647.1787812707530663348@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0oL0hELKkIcB43TihXcw"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2026 06:38:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244458

--0oL0hELKkIcB43TihXcw
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 25, 2026 at 06:56 PM, Yoann Congal wrote:

>=20
> On Tue Aug 25, 2026 at 3:07 PM CEST, Hetvi Thakar -X (hthakar - E
> INFOCHIPS PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
>=20
>> On Tue, Aug 25, 2026 at 05:01 PM, Yoann Congal wrote:
>>=20
>>> Le=C2=A0jeu. 20 ao=C3=BBt 2026 =C3=A0=C2=A011:11, Hetvi Thakar -X (htha=
kar - E INFOCHIPS
>>> PRIVATE LIMITED at Cisco) < hthakar@cisco.com > a =C3=A9crit=C2=A0:
>>>=20
>>>=20
>>>> Hi Yoann,
>>>> I hope you're doing well.
>>>> I wanted to follow up on the patch below. It appears it may have been
>>>> missed during the review process. Could you please take a look when yo=
u
>>>> have a chance and share your feedback?
>>>> Thank you for your time.
>>>=20
>>> It was not missed. I've answered that it lacked a master equivalent bef=
ore
>>>=20
>>> I can consider it for wrynose.
>>> Has this changed? In that case, can you provide a link to the master
>>> commit equivalent to this patch?
>>=20
>> Hi,
>=20
> Hello,
>=20
>=20
>> This was a series of four CVE fixes. The patches for the following
>> three CVEs have already been merged into master:
>>=20
>> CVE-2026-58469:
>> https://git.openembedded.org/openembedded-core/commit/?id=3Df55c2f60daa1=
a125fd36aa254abb16d431b55042
>>=20
>>=20
>> CVE-2026-58471:
>> https://git.openembedded.org/openembedded-core/commit/?id=3Df910a8beb7bb=
8fb3b41a240dfdad36f76d6b482e
>>=20
>>=20
>> CVE-2026-58472:
>> https://git.openembedded.org/openembedded-core/commit/?id=3D8a77e738458a=
75186c3bff6c4a97cd87d3aee632
>>=20
>=20
> I can consider those 3 (hoping for not conflict).
>=20
>=20
>> The remaining patch for CVE-2026-58470 has also been proposed for
>> master:
>>=20
>> https://patchwork.yoctoproject.org/project/oe-core/patch/20260722081735.=
14807-1-amaury.couderc@est.tech/
>>=20
>>=20
>> May you please review the remaining patch?
>=20
> This patch is in the "Superseeded" state and is from a month ago. You
> can answer on it asking for its status.
>=20
>=20
>> Once it is reviewed, could you also proceed with the review of the
>> corresponding wrynose and Scarthgap patches?
>=20
> I regularly re-evaluate the "Awaiting Upstream" patches but you can
> expedite this process by pinging here when you see the patch landing on
> master.
> In this case, we wait for "wget: fix CVE-2026-58470" landing on master.
>=20
> Regards,
> --
> Yoann Congal
> Smile ECS

Hi Yoann,

Thanks for the review.
I have submitted the master patch for CVE-2026-58470
wget: Fix CVE-2026-58470 - Patchwork ( https://patchwork.yoctoproject.org/p=
roject/oe-core/patch/20260827062321.3825085-1-hthakar@cisco.com/ )
Could you please take a look at it at your convenience?

Regards,
Hetvi

--0oL0hELKkIcB43TihXcw
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>On Tue, Aug 25, 2026 at 06:56 PM, Yoann Congal wrote:</div>
<div>
<blockquote>On Tue Aug 25, 2026 at 3:07 PM CEST, Hetvi Thakar -X (hthakar -=
 E INFOCHIPS PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:<br=
 />
<blockquote>On Tue, Aug 25, 2026 at 05:01 PM, Yoann Congal wrote:<br />
<blockquote>Le&nbsp;jeu. 20 ao&ucirc;t 2026 &agrave;&nbsp;11:11, Hetvi Thak=
ar -X (hthakar - E INFOCHIPS<br />PRIVATE LIMITED at Cisco) &lt; hthakar@ci=
sco.com &gt; a &eacute;crit&nbsp;:<br /><br />
<blockquote>Hi Yoann,<br />I hope you're doing well.<br />I wanted to follo=
w up on the patch below. It appears it may have been<br />missed during the=
 review process. Could you please take a look when you<br />have a chance a=
nd share your feedback?<br />Thank you for your time.</blockquote>
It was not missed. I've answered that it lacked a master equivalent before<=
br />I can consider it for wrynose.<br />Has this changed? In that case, ca=
n you provide a link to the master<br />commit equivalent to this patch?</b=
lockquote>
Hi,</blockquote>
Hello,<br /><br />
<blockquote>This was a series of four CVE fixes. The patches for the follow=
ing<br />three CVEs have already been merged into master:<br /><br />CVE-20=
26-58469:<br /><a href=3D"https://git.openembedded.org/openembedded-core/co=
mmit/?id=3Df55c2f60daa1a125fd36aa254abb16d431b55042" target=3D"_blank" rel=
=3D"noopener">https://git.openembedded.org/openembedded-core/commit/?id=3Df=
55c2f60daa1a125fd36aa254abb16d431b55042</a><br /><br />CVE-2026-58471:<br /=
><a href=3D"https://git.openembedded.org/openembedded-core/commit/?id=3Df91=
0a8beb7bb8fb3b41a240dfdad36f76d6b482e" target=3D"_blank" rel=3D"noopener">h=
ttps://git.openembedded.org/openembedded-core/commit/?id=3Df910a8beb7bb8fb3=
b41a240dfdad36f76d6b482e</a><br /><br />CVE-2026-58472:<br /><a href=3D"htt=
ps://git.openembedded.org/openembedded-core/commit/?id=3D8a77e738458a75186c=
3bff6c4a97cd87d3aee632" target=3D"_blank" rel=3D"noopener">https://git.open=
embedded.org/openembedded-core/commit/?id=3D8a77e738458a75186c3bff6c4a97cd8=
7d3aee632</a></blockquote>
I can consider those 3 (hoping for not conflict).<br /><br />
<blockquote>The remaining patch for CVE-2026-58470 has also been proposed f=
or<br />master:<br /><br /><a href=3D"https://patchwork.yoctoproject.org/pr=
oject/oe-core/patch/20260722081735.14807-1-amaury.couderc@est.tech/" target=
=3D"_blank" rel=3D"noopener">https://patchwork.yoctoproject.org/project/oe-=
core/patch/20260722081735.14807-1-amaury.couderc@est.tech/</a><br /><br />M=
ay you please review the remaining patch?</blockquote>
This patch is in the "Superseeded" state and is from a month ago. You<br />=
can answer on it asking for its status.<br /><br />
<blockquote>Once it is reviewed, could you also proceed with the review of =
the<br />corresponding wrynose and Scarthgap patches?</blockquote>
I regularly re-evaluate the "Awaiting Upstream" patches but you can<br />ex=
pedite this process by pinging here when you see the patch landing on<br />=
master.<br />In this case, we wait for "wget: fix CVE-2026-58470" landing o=
n master.<br /><br />Regards,<br />-- <br />Yoann Congal<br />Smile ECS</bl=
ockquote>
Hi Yoann,<br /><br />Thanks for the review.<br />I have submitted the maste=
r patch for CVE-2026-58470&nbsp;<br /><a href=3D"https://patchwork.yoctopro=
ject.org/project/oe-core/patch/20260827062321.3825085-1-hthakar@cisco.com/"=
>wget: Fix CVE-2026-58470 - Patchwork</a><br />Could you please take a look=
 at it at your convenience?<br /><br />Regards,<br />Hetvi</div>

--0oL0hELKkIcB43TihXcw--

