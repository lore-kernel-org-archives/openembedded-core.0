Return-Path: <ticotimo@gmail.com>
Received: from mail-it1-f193.google.com (mail-it1-f193.google.com
	[209.85.166.193])
	by mail.openembedded.org (Postfix) with ESMTP id A1CD67D9E5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 02:54:52 +0000 (UTC)
Received: by mail-it1-f193.google.com with SMTP id h20so7553270itk.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 19:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=PeyBLQng4+SXgqqyrpekxXjqKjdAr7NDGXIp6Wjg19M=;
	b=Ntwfln5GJdlIIqga4EKDqetCQYen3I1WnoCZRIyc1LgGVjmbhqDx0BwJeL+KbFbpzC
	rq//PtS/zt3Z6P0T8ilrDo2wYBwpYvvqOCTkvrT7iw416gad1eQ6h4HxvpBFbn+NC9bw
	AMg7rXDVvA9VtqCP09OEqhc0lU4TlRi70ES+W9A9uwhg7aEwSiArqUiah7cVJsblJtYB
	JAUnpenV+9ngxloXO+8B9Y4cu93sRKNHu49R2uSGZG/czmzU81mgJln9XAUyZWmOj8Jl
	GKd2SubjsMc5AXtuCLYpreAnozx3rSDswk5LfmmCxvVWpXTrG2iEHfkCbw4akjSNrnoo
	WMPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=PeyBLQng4+SXgqqyrpekxXjqKjdAr7NDGXIp6Wjg19M=;
	b=ELl2fL9h1DgBJOYl937zGjFLujZwMmZVHpWNYzSnFbvGMgepwgfRHGfJNWUKhPBDy7
	SDEM+hNhI/h1uYLI/7HDgLm3CxfxxznQL3pI6V5Vdej2lCc0pg9HTaNSGmkwkCd91Nbg
	xMEYUaR+UKystAK1gGUQJH5XZGVzqfpiXDnmFVZtFadHLmgBAPJye+Nz/xUmVUQRYK/e
	3GoeWCpSNiT4ncTrblFJgYuybtkUUUFtBsEhHSkbhFPNFKz+SPTQb8QdnNfNm2uR+rWl
	6hS4Br26lnY2TJBf1K9EhgAGDXvr6LPClvkyL3L69pqn9+N6dRxyqm15k20UJne0xyul
	NYZw==
X-Gm-Message-State: APjAAAVxQ1XZWp1/PN4xx3zkKRUHWtmBOPj3OccTmIQlIFza6vSRFUb+
	Eo1GR+4tl8FIdxlZTKlDJc9U4/4aC6YF8Dlxau4=
X-Google-Smtp-Source: APXvYqzX5CLgBm5AY1zLWTWqVN0P+9fHDmUtFANfBIHve+ZmhDH6/YYfXSoTKJjkkpYh3wNy8MdoH/VUJTGeyAHPIIU=
X-Received: by 2002:a24:f644:: with SMTP id u65mr1179355ith.51.1559184893484; 
	Wed, 29 May 2019 19:54:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190529184328.28470-1-richard.purdie@linuxfoundation.org>
	<20190529184328.28470-2-richard.purdie@linuxfoundation.org>
	<4c62af9f-8bff-726e-db35-6f6ed7ebafc2@gmail.com>
	<8798dc0e5d91991953720388b601c9c5b3174c42.camel@linuxfoundation.org>
	<321f3cb8-a101-49ad-07c4-64fc82d2c7f8@gmail.com>
	<d5b41b11583c78cd16d6393736fafd8e733c48a9.camel@linuxfoundation.org>
	<20190529212556.GO20781@bill-the-cat>
	<4571b3c03fb83ee01492dd1891e410becb72b0e5.camel@linuxfoundation.org>
	<20190529221726.GA16075@localhost>
	<20190529222920.GP20781@bill-the-cat>
In-Reply-To: <20190529222920.GP20781@bill-the-cat>
From: Tim Orling <ticotimo@gmail.com>
Date: Wed, 29 May 2019 19:54:42 -0700
Message-ID: <CANx9H-DOw4D2_Ges3NBJtiNi3MCXuNYSyJbMLW2reudjmrb8KQ@mail.gmail.com>
To: Tom Rini <trini@konsulko.com>
Cc: openembedded-core@lists.openembedded.org, Adrian Bunk <bunk@stusta.de>
Subject: Re: [PATCH 2/2] uninative: Switch from bz2 to xz
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 30 May 2019 02:54:52 -0000
Content-Type: multipart/alternative; boundary="000000000000b72222058a120517"

--000000000000b72222058a120517
Content-Type: text/plain; charset="UTF-8"

On Wed, May 29, 2019 at 3:29 PM Tom Rini <trini@konsulko.com> wrote:

> On Thu, May 30, 2019 at 01:17:26AM +0300, Adrian Bunk wrote:
> > On Wed, May 29, 2019 at 10:29:31PM +0100,
> richard.purdie@linuxfoundation.org wrote:
> > > On Wed, 2019-05-29 at 17:25 -0400, Tom Rini wrote:
> > > > On Wed, May 29, 2019 at 09:50:22PM +0100,
> > > > richard.purdie@linuxfoundation.org wrote:
> > > > > On Wed, 2019-05-29 at 13:39 -0700, akuster808 wrote:
> > > > > > On 5/29/19 12:26 PM, richard.purdie@linuxfoundation.org wrote:
> > > > > > > On Wed, 2019-05-29 at 12:21 -0700, akuster808 wrote:
> > > > > > > > On 5/29/19 11:43 AM, Richard Purdie wrote:
> > > > > > > > > (From OE-Core rev:
> > > > > > > > > 29fc9210b973be68de474e75068e4c72371afe5a)
> > > > > > > > >
> > > > > > > > > Signed-off-by: Richard Purdie <
> > > > > > > > > richard.purdie@linuxfoundation.org>
> > > > > > > > With back port to warrior and Thud too?
> > > > > > > Yes, we'll need to do that if we bring fedora 30 workers online
> > > > > > > on
> > > > > > > the
> > > > > > > autobuilder.
> > > > > > I know the uninative update is required for FC30 but changing the
> > > > > > compression does not.
> > > > > >
> > > > > > This question is about the compression extension question.
> > > > > >
> > > > > > Does this mean YP will no longer be providing bz2 uninatives?
> > > > >
> > > > > Correct, the patch should be straight forward to include with the
> > > > > upgrade.
> > > >
> > > > Does that in turn mean we must have host xz-utils?
> > >
> > > It will mean you need a tar which supports the -J option. The tests
> > > I've see so far suggest all our oldest supported distros do...
> >
> > For thud tar >= 1.27 is required, -J was added in 1.22.
> >
> > But Tom is asking about something different:
> > tar calls "xz -d" for decompression, which needs xz-utils installed.
> >
> >
> https://www.yoctoproject.org/docs/2.6/ref-manual/ref-manual.html#required-packages-for-the-build-host
> > documents that xz has to be installed, but looking at
> > meta/conf/bitbake.conf it might be missing in HOSTTOOLS.
>
> I think it's also missing in for example the crops containers.


We can add it to the crops containers.

So if
> we're going to backport it, I think maybe we should keep it bz2?  The
> size difference can't be that much.
>
> --
> Tom
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000b72222058a120517
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, May 29, 2019 at 3:29 PM Tom Rini &lt;<a href=3D"mai=
lto:trini@konsulko.com">trini@konsulko.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">On Thu, May 30, 2019 at 01:17:26AM +0300, Adrian Bun=
k wrote:<br>
&gt; On Wed, May 29, 2019 at 10:29:31PM +0100, <a href=3D"mailto:richard.pu=
rdie@linuxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.=
org</a> wrote:<br>
&gt; &gt; On Wed, 2019-05-29 at 17:25 -0400, Tom Rini wrote:<br>
&gt; &gt; &gt; On Wed, May 29, 2019 at 09:50:22PM +0100, <br>
&gt; &gt; &gt; <a href=3D"mailto:richard.purdie@linuxfoundation.org" target=
=3D"_blank">richard.purdie@linuxfoundation.org</a> wrote:<br>
&gt; &gt; &gt; &gt; On Wed, 2019-05-29 at 13:39 -0700, akuster808 wrote:<br=
>
&gt; &gt; &gt; &gt; &gt; On 5/29/19 12:26 PM, <a href=3D"mailto:richard.pur=
die@linuxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.o=
rg</a> wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt; On Wed, 2019-05-29 at 12:21 -0700, akuster808=
 wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; On 5/29/19 11:43 AM, Richard Purdie wrot=
e:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; (From OE-Core rev:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; 29fc9210b973be68de474e75068e4c72371=
afe5a)<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; Signed-off-by: Richard Purdie &lt;<=
br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; <a href=3D"mailto:richard.purdie@li=
nuxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>=
&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; With back port to warrior and Thud too?<=
br>
&gt; &gt; &gt; &gt; &gt; &gt; Yes, we&#39;ll need to do that if we bring fe=
dora 30 workers online<br>
&gt; &gt; &gt; &gt; &gt; &gt; on<br>
&gt; &gt; &gt; &gt; &gt; &gt; the<br>
&gt; &gt; &gt; &gt; &gt; &gt; autobuilder.<br>
&gt; &gt; &gt; &gt; &gt; I know the uninative update is required for FC30 b=
ut changing the<br>
&gt; &gt; &gt; &gt; &gt; compression does not.<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; This question is about the compression extension q=
uestion.<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; Does this mean YP will no longer be providing bz2 =
uninatives?<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; Correct, the patch should be straight forward to includ=
e with the<br>
&gt; &gt; &gt; &gt; upgrade.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Does that in turn mean we must have host xz-utils?<br>
&gt; &gt; <br>
&gt; &gt; It will mean you need a tar which supports the -J option. The tes=
ts<br>
&gt; &gt; I&#39;ve see so far suggest all our oldest supported distros do..=
.<br>
&gt; <br>
&gt; For thud tar &gt;=3D 1.27 is required, -J was added in 1.22.<br>
&gt; <br>
&gt; But Tom is asking about something different:<br>
&gt; tar calls &quot;xz -d&quot; for decompression, which needs xz-utils in=
stalled.<br>
&gt; <br>
&gt; <a href=3D"https://www.yoctoproject.org/docs/2.6/ref-manual/ref-manual=
.html#required-packages-for-the-build-host" rel=3D"noreferrer" target=3D"_b=
lank">https://www.yoctoproject.org/docs/2.6/ref-manual/ref-manual.html#requ=
ired-packages-for-the-build-host</a> <br>
&gt; documents that xz has to be installed, but looking at <br>
&gt; meta/conf/bitbake.conf it might be missing in HOSTTOOLS.<br>
<br>
I think it&#39;s also missing in for example the crops containers.</blockqu=
ote><div dir=3D"auto"><br></div><div dir=3D"auto">We can add it to the crop=
s containers.</div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x">So if<br>
we&#39;re going to backport it, I think maybe we should keep it bz2?=C2=A0 =
The<br>
size difference can&#39;t be that much.<br>
<br>
-- <br>
Tom<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--000000000000b72222058a120517--
