Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 956CEC61DB9
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 13:07:05 +0000 (UTC)
Subject: Re: [scarthgap][PATCH 1/4] wget: Fix CVE-2026-58469
To: openembedded-core@lists.openembedded.org
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
X-Originating-Location: Mumbai, Maharashtra, IN (151.186.177.83)
X-Originating-Platform: Windows Edge 151
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 25 Aug 2026 06:07:02 -0700
References: <20260722101230.34771-1-hthakar@cisco.com> <DK5AB0SRDKFY.7NIL8TCKZUUN@smile.fr> <18C4DECEC4DDFC1A.1355869@lists.openembedded.org> <PH7PR11MB85986421972394BF2C2D53E8ADA42@PH7PR11MB8598.namprd11.prod.outlook.com> <CAMSfU+6-0HABPr=nm0kjkj=ByF1_PbU+O-ZrGyQ4zVp-OGgCqA@mail.gmail.com>
In-Reply-To: <CAMSfU+6-0HABPr=nm0kjkj=ByF1_PbU+O-ZrGyQ4zVp-OGgCqA@mail.gmail.com>
Message-ID: <2716314.1787663222100636520@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="WUTTotChENwLTJ46ajJV"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 13:07:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244237

--WUTTotChENwLTJ46ajJV
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 25, 2026 at 05:01 PM, Yoann Congal wrote:

>=20
>=20
>=20
> Le=C2=A0jeu. 20 ao=C3=BBt 2026 =C3=A0=C2=A011:11, Hetvi Thakar -X (hthaka=
r - E INFOCHIPS
> PRIVATE LIMITED at Cisco) < hthakar@cisco.com > a =C3=A9crit=C2=A0:
>=20
>> Hi Yoann,
>> I hope you're doing well.
>> I wanted to follow up on the patch below. It appears it may have been
>> missed during the review process. Could you please take a look when you
>> have a chance and share your feedback?
>> Thank you for your time.
>>=20
>=20
> Hello,
>=20
> It was not missed. I've answered that it lacked a master equivalent befor=
e
> I can consider it for wrynose.
> Has this changed? In that case, can you provide a link to the master
> commit equivalent to this patch?
>=20
> Regards,
>=20
>=20
>> Regards,
>> Hetvi
>>=20
>>=20
>> *From:* openembedded-core@lists.openembedded.org < openembedded-core@lis=
ts.openembedded.org
>> > on behalf of Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at
>> Cisco) via lists.openembedded.org ( http://lists.openembedded.org ) <hth=
akar=3D
>> cisco.com@lists.openembedded.org >
>> *Sent:* 23 July 2026 14:15
>> *To:* Yoann Congal < yoann.congal@smile.fr >; openembedded-core@lists.op=
enembedded.org
>> < openembedded-core@lists.openembedded.org >
>> *Cc:* xe-linux-external (Internal Group) < xe-linux-external@cisco.com >
>> *Subject:* Re: [OE-core][scarthgap][PATCH 1/4] wget: Fix CVE-2026-58469
>>=20
>> Hi,
>>=20
>> I reviewed the earlier series.
>> It looks like the follow-up upstream regression fixes for
>> CVE-2026-58469 and CVE-2026-58472 were not included in the backport.
>> These follow-up commits are required to complete the backport, and I
>> have included them in my series .
>> I kindly request you to review my series as well.
>>=20
>> Thanks,
>> Hetvi Thakar
>>=20
>> *From:* Yoann Congal < yoann.congal@smile.fr >
>> *Sent:* 22 July 2026 23:13
>> *To:* Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco) <=
 hthakar@cisco.com
>> >; openembedded-core@lists.openembedded.org < openembedded-core@lists.op=
enembedded.org
>> >
>> *Cc:* xe-linux-external (Internal Group) < xe-linux-external@cisco.com >
>> *Subject:* Re: [OE-core][scarthgap][PATCH 1/4] wget: Fix CVE-2026-58469
>>=20
>> On Wed Jul 22, 2026 at 12:12 PM CEST, Hetvi Thakar -X (hthakar - E
>> INFOCHIPS PRIVATE LIMITED at Cisco) via lists.openembedded.org (
>> http://lists.openembedded.org ) wrote:
>> > From: Hetvi Thakar < hthakar@cisco.com >
>> >
>> > This patch applies the upstream fix as referenced in [2],
>> > using the commit shown in [1].
>> >
>> > It also includes the upstream follow-up fixes referenced in [3]
>> > and [4]. These correct the trailing whitespace check introduced
>> > by the original fix and add the required <ctype.h> include for
>> > isspace().
>> >
>> > [1] https://gitlab.com/gnuwget/wget/-/commit/37a40fcb450153f69537c7cbc=
2a7a4fb0b6f7826
>> (
>> https://gitlab.com/gnuwget/wget/-/commit/37a40fcb450153f69537c7cbc2a7a4f=
b0b6f7826
>> )
>> > [2] https://nvd.nist.gov/vuln/detail/CVE-2026-58469
>> > [3] https://gitlab.com/gnuwget/wget/-/commit/7b1cdecc49bc77bde220fc575=
c8a00386c3f3bcf
>> (
>> https://gitlab.com/gnuwget/wget/-/commit/7b1cdecc49bc77bde220fc575c8a003=
86c3f3bcf
>> )
>> > [4] https://gitlab.com/gnuwget/wget/-/commit/82d945ff5dc9942b78b2bf736=
aac298c24fe00a1
>> (
>> https://gitlab.com/gnuwget/wget/-/commit/82d945ff5dc9942b78b2bf736aac298=
c24fe00a1
>> )
>> >
>> > Signed-off-by: Hetvi Thakar < hthakar@cisco.com >
>>=20
>> Hello,
>>=20
>> I received another similar series 2 hours before yours:
>> https://patchwork.yoctoproject.org/project/oe-core/list/?series=3D48993
>> Can you help review it?
>>=20
>> Regards,
>> --
>> Yoann Congal
>> Smile ECS
>>=20
>>=20
>>=20
>=20
>=20
>=20
> --
> Yoann Congal
> Smile ECS
>=20
>=20

Hi,

This was a series of four CVE fixes. The patches for the following
three CVEs have already been merged into master:

CVE-2026-58469:
https://git.openembedded.org/openembedded-core/commit/?id=3Df55c2f60daa1a12=
5fd36aa254abb16d431b55042 ( https://git.openembedded.org/openembedded-core/=
commit/?id=3Df55c2f60daa1a125fd36aa254abb16d431b55042 )

CVE-2026-58471:
https://git.openembedded.org/openembedded-core/commit/?id=3Df910a8beb7bb8fb=
3b41a240dfdad36f76d6b482e ( https://git.openembedded.org/openembedded-core/=
commit/?id=3Df910a8beb7bb8fb3b41a240dfdad36f76d6b482e )

CVE-2026-58472:
https://git.openembedded.org/openembedded-core/commit/?id=3D8a77e738458a751=
86c3bff6c4a97cd87d3aee632 ( https://git.openembedded.org/openembedded-core/=
commit/?id=3D8a77e738458a75186c3bff6c4a97cd87d3aee632 )

The remaining patch for CVE-2026-58470 has also been proposed for
master:

https://patchwork.yoctoproject.org/project/oe-core/patch/20260722081735.148=
07-1-amaury.couderc@est.tech/ ( https://patchwork.yoctoproject.org/project/=
oe-core/patch/20260722081735.14807-1-amaury.couderc@est.tech/ )

May you please review the remaining patch?
Once it is reviewed, could you also proceed with the review of the
corresponding wrynose and Scarthgap patches?

Regards,
Hetvi

>=20
>=20
>

--WUTTotChENwLTJ46ajJV
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>On Tue, Aug 25, 2026 at 05:01 PM, Yoann Congal wrote:</div>
<div>
<blockquote>
<div dir=3D"ltr">
<div dir=3D"ltr">&nbsp;</div>
<br />
<div class=3D"gmail_quote gmail_quote_container">
<div class=3D"gmail_attr" dir=3D"ltr">Le&nbsp;jeu. 20 ao&ucirc;t 2026 &agra=
ve;&nbsp;11:11, Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at C=
isco) &lt;<a href=3D"mailto:hthakar@cisco.com">hthakar@cisco.com</a>&gt; a =
&eacute;crit&nbsp;:</div>
<blockquote class=3D"gmail_quote" style=3D"margin: 0px 0px 0px 0.8ex; borde=
r-left: 1px solid #cccccc; padding-left: 1ex;">
<div class=3D"msg-6246323116425286917">
<div dir=3D"ltr">
<div style=3D"text-align: left; text-indent: 0px; line-height: 20px; margin=
-top: 1em; margin-bottom: 1em; font-family: Aptos,Aptos_EmbeddedFont,Aptos_=
MSFontService,Calibri,Helvetica,sans-serif; font-size: 11pt; color: #000000=
;">Hi Yoann,</div>
<div style=3D"text-align: left; text-indent: 0px; line-height: 20px; margin=
-top: 1em; margin-bottom: 1em; font-family: Aptos,Aptos_EmbeddedFont,Aptos_=
MSFontService,Calibri,Helvetica,sans-serif; font-size: 11pt; color: #000000=
;">I hope you're doing well.</div>
<div style=3D"text-align: left; text-indent: 0px; line-height: 20px; margin=
-top: 1em; margin-bottom: 1em; font-family: Aptos,Aptos_EmbeddedFont,Aptos_=
MSFontService,Calibri,Helvetica,sans-serif; font-size: 11pt; color: #000000=
;">I wanted to follow up on the patch below. It appears it may have been mi=
ssed during the review process. Could you please take a look when you have =
a chance and share your feedback?</div>
<div style=3D"text-align: left; text-indent: 0px; line-height: 20px; margin=
-top: 1em; margin-bottom: 1em; font-family: Aptos,Aptos_EmbeddedFont,Aptos_=
MSFontService,Calibri,Helvetica,sans-serif; font-size: 11pt; color: #000000=
;">Thank you for your time.</div>
</div>
</div>
</blockquote>
<div>Hello,</div>
<div>&nbsp;</div>
<div>It was not missed. I've answered that it lacked a master equivalent be=
fore I can consider it for wrynose.</div>
<div>Has this changed? In that case, can you provide a link to the master c=
ommit equivalent to this patch?</div>
<div>&nbsp;</div>
<div>Regards,</div>
<div>&nbsp;</div>
<blockquote class=3D"gmail_quote" style=3D"margin: 0px 0px 0px 0.8ex; borde=
r-left: 1px solid #cccccc; padding-left: 1ex;">
<div class=3D"msg-6246323116425286917">
<div dir=3D"ltr">
<div style=3D"text-align: left; text-indent: 0px; line-height: 20px; margin=
-top: 1em; margin-bottom: 1em; font-family: Aptos,Aptos_EmbeddedFont,Aptos_=
MSFontService,Calibri,Helvetica,sans-serif; font-size: 11pt; color: #000000=
;">Regards,<br />Hetvi</div>
<div style=3D"font-family: Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cal=
ibri,Helvetica,sans-serif; font-size: 11pt; color: #000000;">&nbsp;</div>
<div id=3D"m_-6246323116425286917appendonsend"></div>
<hr style=3D"display: inline-block; width: 98%;" />
<div id=3D"m_-6246323116425286917divRplyFwdMsg" dir=3D"ltr"><span style=3D"=
font-size: 11pt; color: #000000; font-family: Calibri, sans-serif;"><strong=
>From:</strong> <a href=3D"mailto:openembedded-core@lists.openembedded.org"=
 target=3D"_blank" rel=3D"noopener">openembedded-core@lists.openembedded.or=
g</a> &lt;<a href=3D"mailto:openembedded-core@lists.openembedded.org" targe=
t=3D"_blank" rel=3D"noopener">openembedded-core@lists.openembedded.org</a>&=
gt; on behalf of Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at =
Cisco) via <a href=3D"http://lists.openembedded.org" target=3D"_blank" rel=
=3D"noopener">lists.openembedded.org</a> &lt;hthakar=3D<a href=3D"mailto:ci=
sco.com@lists.openembedded.org" target=3D"_blank" rel=3D"noopener">cisco.co=
m@lists.openembedded.org</a>&gt;<br /><strong>Sent:</strong> 23 July 2026 1=
4:15<br /><strong>To:</strong> Yoann Congal &lt;<a href=3D"mailto:yoann.con=
gal@smile.fr" target=3D"_blank" rel=3D"noopener">yoann.congal@smile.fr</a>&=
gt;; <a href=3D"mailto:openembedded-core@lists.openembedded.org" target=3D"=
_blank" rel=3D"noopener">openembedded-core@lists.openembedded.org</a> &lt;<=
a href=3D"mailto:openembedded-core@lists.openembedded.org" target=3D"_blank=
" rel=3D"noopener">openembedded-core@lists.openembedded.org</a>&gt;<br /><s=
trong>Cc:</strong> xe-linux-external (Internal Group) &lt;<a href=3D"mailto=
:xe-linux-external@cisco.com" target=3D"_blank" rel=3D"noopener">xe-linux-e=
xternal@cisco.com</a>&gt;<br /><strong>Subject:</strong> Re: [OE-core][scar=
thgap][PATCH 1/4] wget: Fix CVE-2026-58469</span>
<div>&nbsp;</div>
</div>
<div dir=3D"ltr">
<div style=3D"font-family: Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cal=
ibri,Helvetica,sans-serif; font-size: 11pt; color: #000000;">Hi,</div>
<div style=3D"font-family: Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cal=
ibri,Helvetica,sans-serif; font-size: 11pt; color: #000000;">&nbsp;</div>
<div style=3D"font-family: Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cal=
ibri,Helvetica,sans-serif; font-size: 11pt; color: #000000;">I reviewed the=
 earlier series.</div>
<div style=3D"font-family: Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cal=
ibri,Helvetica,sans-serif; font-size: 11pt; color: #000000;">It looks like =
the follow-up upstream regression fixes for</div>
<div style=3D"font-family: Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cal=
ibri,Helvetica,sans-serif; font-size: 11pt; color: #000000;">CVE-2026-58469=
 and CVE-2026-58472 were not included in the backport.</div>
<div style=3D"font-family: Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cal=
ibri,Helvetica,sans-serif; font-size: 11pt; color: #000000;">These follow-u=
p commits are required to complete the backport, and I</div>
<div style=3D"font-family: Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cal=
ibri,Helvetica,sans-serif; font-size: 11pt; color: #000000;">have included =
them in my series .</div>
<div style=3D"font-family: Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cal=
ibri,Helvetica,sans-serif; font-size: 11pt; color: #000000;">I kindly reque=
st you to review my series as well.</div>
<div style=3D"font-family: Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cal=
ibri,Helvetica,sans-serif; font-size: 11pt; color: #000000;">&nbsp;</div>
<div style=3D"font-family: Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cal=
ibri,Helvetica,sans-serif; font-size: 11pt; color: #000000;">Thanks,</div>
<div style=3D"font-family: Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cal=
ibri,Helvetica,sans-serif; font-size: 11pt; color: #000000;">Hetvi Thakar</=
div>
<div id=3D"m_-6246323116425286917x_appendonsend"></div>
<hr style=3D"display: inline-block; width: 98%;" />
<div id=3D"m_-6246323116425286917x_divRplyFwdMsg" dir=3D"ltr"><span style=
=3D"font-size: 11pt; color: #000000; font-family: Calibri, sans-serif;"><st=
rong>From:</strong> Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.f=
r" target=3D"_blank" rel=3D"noopener">yoann.congal@smile.fr</a>&gt;<br /><s=
trong>Sent:</strong> 22 July 2026 23:13<br /><strong>To:</strong> Hetvi Tha=
kar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco) &lt;<a href=3D"mail=
to:hthakar@cisco.com" target=3D"_blank" rel=3D"noopener">hthakar@cisco.com<=
/a>&gt;; <a href=3D"mailto:openembedded-core@lists.openembedded.org" target=
=3D"_blank" rel=3D"noopener">openembedded-core@lists.openembedded.org</a> &=
lt;<a href=3D"mailto:openembedded-core@lists.openembedded.org" target=3D"_b=
lank" rel=3D"noopener">openembedded-core@lists.openembedded.org</a>&gt;<br =
/><strong>Cc:</strong> xe-linux-external (Internal Group) &lt;<a href=3D"ma=
ilto:xe-linux-external@cisco.com" target=3D"_blank" rel=3D"noopener">xe-lin=
ux-external@cisco.com</a>&gt;<br /><strong>Subject:</strong> Re: [OE-core][=
scarthgap][PATCH 1/4] wget: Fix CVE-2026-58469</span>
<div>&nbsp;</div>
</div>
<div>
<div>On Wed Jul 22, 2026 at 12:12 PM CEST, Hetvi Thakar -X (hthakar - E INF=
OCHIPS PRIVATE LIMITED at Cisco) via <a href=3D"http://lists.openembedded.o=
rg" target=3D"_blank" rel=3D"noopener">lists.openembedded.org</a> wrote:<br=
 />&gt; From: Hetvi Thakar &lt;<a href=3D"mailto:hthakar@cisco.com" target=
=3D"_blank" rel=3D"noopener">hthakar@cisco.com</a>&gt;<br />&gt;<br />&gt; =
This patch applies the upstream fix as referenced in [2],<br />&gt; using t=
he commit shown in [1].<br />&gt;<br />&gt; It also includes the upstream f=
ollow-up fixes referenced in [3]<br />&gt; and [4]. These correct the trail=
ing whitespace check introduced<br />&gt; by the original fix and add the r=
equired &lt;ctype.h&gt; include for<br />&gt; isspace().<br />&gt;<br />&gt=
; [1] <a href=3D"https://gitlab.com/gnuwget/wget/-/commit/37a40fcb450153f69=
537c7cbc2a7a4fb0b6f7826" target=3D"_blank" rel=3D"noopener"> https://gitlab=
.com/gnuwget/wget/-/commit/37a40fcb450153f69537c7cbc2a7a4fb0b6f7826</a><br =
/>&gt; [2] <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2026-58469" targ=
et=3D"_blank" rel=3D"noopener">https://nvd.nist.gov/vuln/detail/CVE-2026-58=
469</a><br />&gt; [3] <a href=3D"https://gitlab.com/gnuwget/wget/-/commit/7=
b1cdecc49bc77bde220fc575c8a00386c3f3bcf" target=3D"_blank" rel=3D"noopener"=
> https://gitlab.com/gnuwget/wget/-/commit/7b1cdecc49bc77bde220fc575c8a0038=
6c3f3bcf</a><br />&gt; [4] <a href=3D"https://gitlab.com/gnuwget/wget/-/com=
mit/82d945ff5dc9942b78b2bf736aac298c24fe00a1" target=3D"_blank" rel=3D"noop=
ener"> https://gitlab.com/gnuwget/wget/-/commit/82d945ff5dc9942b78b2bf736aa=
c298c24fe00a1</a><br />&gt;<br />&gt; Signed-off-by: Hetvi Thakar &lt;<a hr=
ef=3D"mailto:hthakar@cisco.com" target=3D"_blank" rel=3D"noopener">hthakar@=
cisco.com</a>&gt;<br /><br />Hello,<br /><br />I received another similar s=
eries 2 hours before yours:<br /><a href=3D"https://patchwork.yoctoproject.=
org/project/oe-core/list/?series=3D48993" target=3D"_blank" rel=3D"noopener=
">https://patchwork.yoctoproject.org/project/oe-core/list/?series=3D48993</=
a><br />Can you help review it?<br /><br />Regards,<br />-- <br />Yoann Con=
gal<br />Smile ECS<br /><br /></div>
</div>
</div>
</div>
</div>
</blockquote>
</div>
<div>&nbsp;</div>
<br /><span class=3D"gmail_signature_prefix">-- </span><br />
<div class=3D"gmail_signature" dir=3D"ltr">
<div dir=3D"ltr"><span style=3D"font-family: Raleway, regular;">Yoann Conga=
l</span>
<div><span style=3D"font-family: Raleway, regular;">Smile ECS<br /></span><=
/div>
</div>
</div>
</div>
</blockquote>
<p class=3D"isSelectedEnd"><span>Hi,</span></p>
<p class=3D"isSelectedEnd"><span>This was a series of four CVE fixes. The p=
atches for the following</span><br /><span>three CVEs have already been mer=
ged into master:</span></p>
<p class=3D"isSelectedEnd"><span>CVE-2026-58469:</span><br /><a href=3D"htt=
ps://git.openembedded.org/openembedded-core/commit/?id=3Df55c2f60daa1a125fd=
36aa254abb16d431b55042" data-rich-text-autolink=3D""><span>https://git.open=
embedded.org/openembedded-core/commit/?id=3Df55c2f60daa1a125fd36aa254abb16d=
431b55042</span></a></p>
<p class=3D"isSelectedEnd"><span>CVE-2026-58471:</span><br /><a href=3D"htt=
ps://git.openembedded.org/openembedded-core/commit/?id=3Df910a8beb7bb8fb3b4=
1a240dfdad36f76d6b482e" data-rich-text-autolink=3D""><span>https://git.open=
embedded.org/openembedded-core/commit/?id=3Df910a8beb7bb8fb3b41a240dfdad36f=
76d6b482e</span></a></p>
<p class=3D"isSelectedEnd"><span>CVE-2026-58472:</span><br /><a href=3D"htt=
ps://git.openembedded.org/openembedded-core/commit/?id=3D8a77e738458a75186c=
3bff6c4a97cd87d3aee632" data-rich-text-autolink=3D""><span>https://git.open=
embedded.org/openembedded-core/commit/?id=3D8a77e738458a75186c3bff6c4a97cd8=
7d3aee632</span></a></p>
<p class=3D"isSelectedEnd"><span>The remaining patch for CVE-2026-58470 has=
 also been proposed for</span><br /><span>master:</span></p>
<p class=3D"isSelectedEnd"><a href=3D"https://patchwork.yoctoproject.org/pr=
oject/oe-core/patch/20260722081735.14807-1-amaury.couderc@est.tech/" data-r=
ich-text-autolink=3D""><span>https://patchwork.yoctoproject.org/project/oe-=
core/patch/20260722081735.14807-1-amaury.couderc@est.tech/</span></a></p>
<p><span>May you please review the remaining patch?</span><br /><span>Once =
it is reviewed, could you also proceed with the review of the</span><br /><=
span>corresponding wrynose and Scarthgap patches?</span></p>
<p><span>Regards,</span><br /><span>Hetvi</span></p>
<blockquote>
<div dir=3D"ltr">
<div class=3D"gmail_signature" dir=3D"ltr">
<div dir=3D"ltr">
<div><span style=3D"font-family: Raleway, regular;">&nbsp;</span></div>
</div>
</div>
</div>
</blockquote>
</div>

--WUTTotChENwLTJ46ajJV--

