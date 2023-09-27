Return-Path: <sweng5080@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83CDAE7F14F
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 13:07:12 +0000 (UTC)
Subject: Re: [PATCH 1/2] distcc: Fix groupname gid change warning
To: openembedded-core@lists.openembedded.org
From: "JD Schroeder" <sweng5080@gmail.com>
X-Originating-Location: US (204.77.163.55)
X-Originating-Platform: Linux Chrome 116
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 27 Sep 2023 06:07:10 -0700
References: <D7F71619-5603-498D-AF15-8AB767ED150F@arm.com>
In-Reply-To: <D7F71619-5603-498D-AF15-8AB767ED150F@arm.com>
Message-ID: <15368.1695820030017039130@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="E0LQatGd3dWCTTjgZvcQ"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Sep 2023 13:07:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188319

--E0LQatGd3dWCTTjgZvcQ
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 12, 2023 at 06:03 AM, Ross Burton wrote:

>=20
> On 1 Sep 2023, at 11:03, Alexandre Belloni via lists.openembedded.org
> <alexandre.belloni=3Dbootlin.com@lists.openembedded.org> wrote:
>=20
>>=20
>> Hello,
>>=20
>> This fails on the autobuilders:
>>=20
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/3449/=
steps/12/logs/stdio
>>=20
>>=20
>> ERROR: Nothing RPROVIDES 'distcc' (but
>> /home/pokybuild/yocto-worker/reproducible/build/meta/recipes-core/packag=
egroups/packagegroup-self-hosted.bb,
>> /home/pokybuild/yocto-worker/reproducible/build/meta/recipes-devtools/de=
vel-config/distcc-config.bb
>> RDEPENDS on or otherwise requires it)
>> distcc was skipped: Recipe distcc, package distcc-server: system groupna=
me
>> "nogroup" does not have a static ID defined. Add nogroup to one of these
>> files:
>> /home/pokybuild/yocto-worker/reproducible/build/build-st/meta-selftest/f=
iles/static-group
>>=20
>=20
> The same problem would hit the ppp-dialin but that recipe doesn=E2=80=99t=
 get
> built in the AB in an environment that has static IPs.
>=20
> Ross

I'm seeing the the warnings being generated in a multi-config Yocto build e=
nvironment. Is there another way to address and fix the warnings I am havin=
g with the distcc and ppp-dialin recipes (possibly during parsing) even if =
they aren't being built in the AB with static IPs?

--E0LQatGd3dWCTTjgZvcQ
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 12, 2023 at 06:03 AM, Ross Burton wrote:<br />
<blockquote>On 1 Sep 2023, at 11:03, Alexandre Belloni via lists.openembedd=
ed.org &lt;alexandre.belloni=3Dbootlin.com@lists.openembedded.org&gt; wrote=
:<br />
<blockquote><br />Hello,<br /><br />This fails on the autobuilders:<br /><b=
r /><a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/117/=
builds/3449/steps/12/logs/stdio" target=3D"_blank" rel=3D"noopener">https:/=
/autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/3449/steps/12/l=
ogs/stdio</a><br /><br />ERROR: Nothing RPROVIDES 'distcc' (but /home/pokyb=
uild/yocto-worker/reproducible/build/meta/recipes-core/packagegroups/packag=
egroup-self-hosted.bb, /home/pokybuild/yocto-worker/reproducible/build/meta=
/recipes-devtools/devel-config/distcc-config.bb RDEPENDS on or otherwise re=
quires it)<br />distcc was skipped: Recipe distcc, package distcc-server: s=
ystem groupname "nogroup" does not have a static ID defined. Add nogroup to=
 one of these files: /home/pokybuild/yocto-worker/reproducible/build/build-=
st/meta-selftest/files/static-group</blockquote>
The same problem would hit the ppp-dialin but that recipe doesn&rsquo;t get=
 built in the AB in an environment that has static IPs.<br /><br />Ross</bl=
ockquote>
I'm seeing the the warnings being generated in a multi-config Yocto build e=
nvironment. Is there another way to address and fix the warnings I am havin=
g with the distcc and ppp-dialin recipes (possibly during parsing) even if =
they aren't being built in the AB with static IPs?

--E0LQatGd3dWCTTjgZvcQ--

