Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BAE7CA600A
	for <webhook@archiver.kernel.org>; Thu,  8 Oct 2026 08:40:28 +0000 (UTC)
Subject: Re: [wrynose][patch] rsync: Security fixes from v3.4.1-sec-patches3
To: openembedded-core@lists.openembedded.org
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
X-Originating-Location: Mumbai, Maharashtra, IN (151.186.177.21)
X-Originating-Platform: Windows Edge 154
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 08 Oct 2026 01:40:22 -0700
References: <20260917105551.76512-1-vanusuri@mvista.com> <DLHK8G1OWTE8.394FSK4TR0VS5@smile.fr> <DLHLDE6HLTRH.2AFGSZ80URG52@smile.fr> <9faaa5bbc70d619058d8abecda9cd235d210d422.camel@pbarker.dev> <CANQUz1_hMwrLp4tuVS4+cEXXaj71-L0Nijw6n+pjzGpAKh=prw@mail.gmail.com> <546192.1789655591562202413@lists.openembedded.org> <CANQUz19S86jm7H3aoNKvm3NwEZ_L=QEmt53g4i2j=fgOz=e8jw@mail.gmail.com> <4ccc62a34b7c0ff418951a62c873daa589e45683.camel@pbarker.dev>
In-Reply-To: <4ccc62a34b7c0ff418951a62c873daa589e45683.camel@pbarker.dev>
Message-ID: <1614257.1791448822431275973@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="kLBwNdgxJ5IrsRJKv9RO"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Oct 2026 08:40:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247419

--kLBwNdgxJ5IrsRJKv9RO
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 01:23 AM, Paul Barker wrote:

>=20
> On Mon, 2026-09-21 at 15:56 +0530, Vijay Anusuri wrote:
>=20
>> Hi Yoann, Paul,
>>=20
>> I checked with the rsync upstream maintainers regarding the security pat=
ch
>>=20
>> branches and the possibility of an archive/tarball.
>>=20
>> They confirmed that v3.4.1-sec-patches3 and v3.2.7-sec-patches3 are
>> official rsync security-maintenance branches. They have now also
>> published:
>>=20
>> - v3.4.1-sec-patches4
>> - v3.2.7-sec-patches4
>>=20
>> These branches contain the security and compatibility fixes applicable t=
o
>> the respective older release lines after *-sec-patches3. Both branches
>> have
>> been tested against the refreshed stable testsuite.
>>=20
>> Regarding the archive/tarball, the maintainer clarified that they do not
>> plan to provide release tarballs for these security branches. The branch=
es
>>=20
>> are intended to be used as reviewable Git sources from which downstream
>> maintainers can cherry-pick commits or construct their own patch series.
>>=20
>> Based on this, can we switch the rsync recipe to Git and use the
>> v3.4.1-sec-patches4 & v3.2.7-sec-patches4 branches for Wrynose/Scarthgap=
?
>>=20
>> This would allow us to consume the upstream security and compatibility
>> fixes directly from the maintained security branch instead of carrying t=
he
>>=20
>> large 34KLOC patch series.
>>=20
>>=20
>> The discussion with the rsync maintainers is here:
>> https://github.com/RsyncProject/rsync/discussions/1095
>=20
> Hi Vijay,
>=20
> Thanks for checking with upstream. It seems a bit of a strange way of
> doing things to me - I am surprised these aren't further releases in the
> 3.4.x and 3.2.x series. Or at least they could be 3.4.1.x and 3.2.7.x
> releases. But if this is the way upstream want to handle things then
> that's their call.
>=20
> We do need to discuss how this fits in with our policies on LTS
> maintenance. We will get back to you soon.
>=20
> Best regards,
>=20
> --
> Paul Barker

Hi Paul, Yoann,
Could you please share if there are any updates on this?

Regards,
Hetvi Thakar

--kLBwNdgxJ5IrsRJKv9RO
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>On Tue, Sep 22, 2026 at 01:23 AM, Paul Barker wrote:</div>
<div>
<blockquote>On Mon, 2026-09-21 at 15:56 +0530, Vijay Anusuri wrote:<br />
<blockquote>Hi Yoann, Paul,<br /><br />I checked with the rsync upstream ma=
intainers regarding the security patch<br />branches and the possibility of=
 an archive/tarball.<br /><br />They confirmed that v3.4.1-sec-patches3 and=
 v3.2.7-sec-patches3 are<br />official rsync security-maintenance branches.=
 They have now also published:<br /><br />- v3.4.1-sec-patches4<br />- v3.2=
.7-sec-patches4<br /><br />These branches contain the security and compatib=
ility fixes applicable to<br />the respective older release lines after *-s=
ec-patches3. Both branches have<br />been tested against the refreshed stab=
le testsuite.<br /><br />Regarding the archive/tarball, the maintainer clar=
ified that they do not<br />plan to provide release tarballs for these secu=
rity branches. The branches<br />are intended to be used as reviewable Git =
sources from which downstream<br />maintainers can cherry-pick commits or c=
onstruct their own patch series.<br /><br />Based on this, can we switch th=
e rsync recipe to Git and use the<br />v3.4.1-sec-patches4 &amp; v3.2.7-sec=
-patches4 branches for Wrynose/Scarthgap?<br /><br />This would allow us to=
 consume the upstream security and compatibility<br />fixes directly from t=
he maintained security branch instead of carrying the<br />large 34KLOC pat=
ch series.<br /><br /><br />The discussion with the rsync maintainers is he=
re:<br /><a href=3D"https://github.com/RsyncProject/rsync/discussions/1095"=
 target=3D"_blank" rel=3D"noopener">https://github.com/RsyncProject/rsync/d=
iscussions/1095</a></blockquote>
Hi Vijay,<br /><br />Thanks for checking with upstream. It seems a bit of a=
 strange way of<br />doing things to me - I am surprised these aren't furth=
er releases in the<br />3.4.x and 3.2.x series. Or at least they could be 3=
.4.1.x and 3.2.7.x<br />releases. But if this is the way upstream want to h=
andle things then<br />that's their call.<br /><br />We do need to discuss =
how this fits in with our policies on LTS<br />maintenance. We will get bac=
k to you soon.<br /><br />Best regards,<br /><br />-- <br />Paul Barker</bl=
ockquote>
<p data-pm-slice=3D"1 1 []"><span>Hi Paul, Yoann,<br />Could you please sha=
re if there are any updates on this?<br /><br />Regards,<br />Hetvi Thakar<=
/span></p>
</div>

--kLBwNdgxJ5IrsRJKv9RO--

