Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4E31C79FB6
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 13:56:28 +0000 (UTC)
Subject: Re: [wrynose][PATCH] cmake-native: use bundled nghttp2 with bundled curl
To: openembedded-core@lists.openembedded.org
From: "Deepak Rathore" <deeratho@cisco.com>
X-Originating-Location: Mumbai, Maharashtra, IN (151.186.177.21)
X-Originating-Platform: Windows Edge 152
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 09 Sep 2026 06:56:25 -0700
References: <20260827062638.2141533-1-deeratho@cisco.com> <DLA05T4FXBZA.XQMLIGWXGB2D@smile.fr> <DM4SPRMB0074DC4B1793C496D1C03271C4B02@DM4SPRMB0074.namprd11.prod.outlook.com>
In-Reply-To: <DM4SPRMB0074DC4B1793C496D1C03271C4B02@DM4SPRMB0074.namprd11.prod.outlook.com>
Message-ID: <280196.1788962185069229362@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="42L42PfMz9RTKueFf43B"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 13:56:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245475

--42L42PfMz9RTKueFf43B
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Yoann,

I have sent the updated v2 patch: openembedded-core@lists.openembedded.org =
| [wrynose][PATCH v2] cmake-native: use bundled nghttp2 with bundled curl (=
 https://lists.openembedded.org/g/openembedded-core/topic/121162511 )

Regards,
Deepak
On Wed, Sep 9, 2026 at 11:29 AM, Deepak Rathore wrote:

>=20
> Hi Yoann,
>=20
> Thanks for your review.
>=20
> Let me check your comment and send the v2 patch.
>=20
> Regards,
> Deepak
>=20
> *From:* Yoann Congal <yoann.congal@smile.fr>
> *Sent:* Tuesday, September 8, 2026 7:55 PM
> *To:* Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)
> <deeratho@cisco.com>; openembedded-core@lists.openembedded.org
> <openembedded-core@lists.openembedded.org>
> *Subject:* Re: [OE-core][wrynose][PATCH] cmake-native: use bundled nghttp=
2
> with bundled curl
>=20
> On Thu Aug 27, 2026 at 8:26 AM CEST, Deepak Rathore via
> lists.openembedded.org wrote:
> > From: Himanshu Jadon <hjadon@cisco.com>
> >
> > cmake.inc enables system library lookup through
> > CMAKE_USE_SYSTEM_LIBRARIES=3D1. cmake-native already keeps curl bundled=
,
> > but it did not also disable system nghttp2 lookup. With CMake 4.4.x,
> > the bundled cmcurl configure can enable nghttp2 when headers are found
> > on the host. The later compile uses only the OE native sysroot, so the
> > build can fail with:
> >
> >=C2=A0=C2=A0 fatal error: nghttp2/nghttp2.h: No such file or directory
>=20
> Hello,
>=20
> Wrynose is in 4.3.1, not 4.4.x. Do we still need this patch? If so, can
> you add a backport note (below the "cherry picked" line) explaining why,
> in a v2?
>=20
> Thanks!
>=20
> >
> > Disable system nghttp2 lookup for cmake-native also. This keeps it
> > consistent with the existing bundled curl setting instead of adding a
> > new native dependency because the host happened to expose nghttp2
> > during configure.
> >
> > Add the bundled cmnghttp2 license checksum because the native build now
> > uses that copy explicitly.
> >
> > Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > (cherry picked from commit 0b20ba549d6f17af40b9877eb9ab0c52ca62a18c)
> > Signed-off-by: Deepak Rathore <deeratho@cisco.com>
> > ---
> >=C2=A0 meta/recipes-devtools/cmake/cmake-native_4.3.1.bb | 2 ++
> >=C2=A0 1 file changed, 2 insertions(+)
>=20
> Regards,
> --
> Yoann Congal
> Smile ECS
>=20
>=20
>

--42L42PfMz9RTKueFf43B
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi Yoann,</div>
<div>&nbsp;</div>
<div>I have sent the updated v2 patch: <a href=3D"https://lists.openembedde=
d.org/g/openembedded-core/topic/121162511">openembedded-core@lists.openembe=
dded.org | [wrynose][PATCH v2] cmake-native: use bundled nghttp2 with bundl=
ed curl</a></div>
<div>&nbsp;</div>
<div>Regards,</div>
<div>Deepak</div>
<div>On Wed, Sep 9, 2026 at 11:29 AM, Deepak Rathore wrote:</div>
<div>
<blockquote>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: #000000;">Hi Yoann,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: #000000;">&nbsp;</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: #000000;">Thanks for your review.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: #000000;">&nbsp;</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: #000000;">Let me check your comment and send the v2 patch.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: #000000;">&nbsp;</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: #000000;">Regards,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: #000000;">Deepak</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display: inline-block; width: 98%;" tabindex=3D"-1" />
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><span style=3D"font-size: 11pt; color=
: #000000; font-family: Calibri, sans-serif;"><strong>From:</strong> Yoann =
Congal &lt;yoann.congal@smile.fr&gt;<br /><strong>Sent:</strong> Tuesday, S=
eptember 8, 2026 7:55 PM<br /><strong>To:</strong> Deepak Rathore -X (deera=
tho - E INFOCHIPS PRIVATE LIMITED at Cisco) &lt;deeratho@cisco.com&gt;; ope=
nembedded-core@lists.openembedded.org &lt;openembedded-core@lists.openembed=
ded.org&gt;<br /><strong>Subject:</strong> Re: [OE-core][wrynose][PATCH] cm=
ake-native: use bundled nghttp2 with bundled curl</span>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment">
<div class=3D"PlainText">On Thu Aug 27, 2026 at 8:26 AM CEST, Deepak Rathor=
e via lists.openembedded.org wrote:<br />&gt; From: Himanshu Jadon &lt;hjad=
on@cisco.com&gt;<br />&gt;<br />&gt; cmake.inc enables system library looku=
p through<br />&gt; CMAKE_USE_SYSTEM_LIBRARIES=3D1. cmake-native already ke=
eps curl bundled,<br />&gt; but it did not also disable system nghttp2 look=
up. With CMake 4.4.x,<br />&gt; the bundled cmcurl configure can enable ngh=
ttp2 when headers are found<br />&gt; on the host. The later compile uses o=
nly the OE native sysroot, so the<br />&gt; build can fail with:<br />&gt;<=
br />&gt;&nbsp;&nbsp; fatal error: nghttp2/nghttp2.h: No such file or direc=
tory<br /><br />Hello,<br /><br />Wrynose is in 4.3.1, not 4.4.x. Do we sti=
ll need this patch? If so, can<br />you add a backport note (below the "che=
rry picked" line) explaining why,<br />in a v2?<br /><br />Thanks!<br /><br=
 />&gt;<br />&gt; Disable system nghttp2 lookup for cmake-native also. This=
 keeps it<br />&gt; consistent with the existing bundled curl setting inste=
ad of adding a<br />&gt; new native dependency because the host happened to=
 expose nghttp2<br />&gt; during configure.<br />&gt;<br />&gt; Add the bun=
dled cmnghttp2 license checksum because the native build now<br />&gt; uses=
 that copy explicitly.<br />&gt;<br />&gt; Signed-off-by: Himanshu Jadon &l=
t;hjadon@cisco.com&gt;<br />&gt; Signed-off-by: Richard Purdie &lt;richard.=
purdie@linuxfoundation.org&gt;<br />&gt; (cherry picked from commit 0b20ba5=
49d6f17af40b9877eb9ab0c52ca62a18c)<br />&gt; Signed-off-by: Deepak Rathore =
&lt;deeratho@cisco.com&gt;<br />&gt; ---<br />&gt;&nbsp; meta/recipes-devto=
ols/cmake/cmake-native_4.3.1.bb | 2 ++<br />&gt;&nbsp; 1 file changed, 2 in=
sertions(+)<br /><br />Regards,<br />-- <br />Yoann Congal<br />Smile ECS<b=
r /><br /></div>
</div>
</blockquote>
</div>

--42L42PfMz9RTKueFf43B--

