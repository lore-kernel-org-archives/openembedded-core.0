Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id 47C0760107
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Oct 2016 14:22:44 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id d132so8405633oib.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Oct 2016 07:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=IL+BlXGMnm75dpzQz4vRgwGxs6I3AT60FapozKdxdjc=;
	b=NW5kv6H7t7q/X0GFGTmIQdMXFAMQgFCVN8Uv2pXuETtO8xj8WvcsOvdBSI4DsgylMR
	uwLaJXWYCA8qODv86yEFDJRmFlIAxJEbWWh++dMXixBvplIMHT+TtvfPqzyx76JouGfV
	fJ9dZTNPqEbyyxh9AqVzLiERrBsJMhROvV8mYtlc1LXUyyZKV1CPrYkzeyd88Lgn8BlR
	hZ8Q/eL5DtjCdOL32q1TM9MnAp4U0Ru0kxkcHigdl6hyZwvHJQrCBrQm19S1DVzJqHgU
	GpNEI2GvhEEqKyFmGAcUqexfD9HQhFnrmnV8BUydIWryh/agpbbne+yPgRBHHa+stljD
	Yrcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=IL+BlXGMnm75dpzQz4vRgwGxs6I3AT60FapozKdxdjc=;
	b=mLw1/W40vJ0o/SBYY8sFVOeafi1A7jVXnNgVpKvu4QTmtxS/lYdrSf6AhW69ODECek
	v4b9B9OXMyf/wER+IzX9VB17VQ+uwvN2u1xQzSY2Ot+ybBh3SharL+CFs35N0Zo0mqW7
	tPzV9m3OGekoB4hpa/J2LA3ZobRhhSwAOFCqdVO2dBPLyavyhyGmU+CbnBbcpMRtzfro
	xpW1CmifyKvE7EBjXBxHDgbf3ocnE6asKADxBv90AHaK3PYSIECxn8HDyJ0Ol6ODoynG
	TrIlOSCxiwwqy8t5Rd0ULRQdjZLJP/lzZ4wNKLWOcT1IPxOitQyYiRwIhQWAwZ3YhkbL
	4mBg==
X-Gm-Message-State: AA6/9Rl46CjFajgY1aLCFqSw/NLT5K0XrLK4tqEzmaUFS9MsyNbnl13uOLG5n0srgVy+BkH1l6elGpl7cVurZw==
X-Received: by 10.157.31.48 with SMTP id x45mr17055488otd.29.1476109365617;
	Mon, 10 Oct 2016 07:22:45 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.157.13.194 with HTTP; Mon, 10 Oct 2016 07:22:25 -0700 (PDT)
In-Reply-To: <1476013468.30475.681.camel@linuxfoundation.org>
References: <20161007030947.12602-1-stephano.cetola@linux.intel.com>
	<20161007030947.12602-2-stephano.cetola@linux.intel.com>
	<1476013468.30475.681.camel@linuxfoundation.org>
From: Christopher Larson <clarson@kergoth.com>
Date: Mon, 10 Oct 2016 07:22:25 -0700
X-Google-Sender-Auth: YnmOXPzr_jzBw9JQtHHxj2oNWT8
Message-ID: <CABcZAN=CtQcckJz4B1FjsNZV=arczmLhFBK4VWo2xDOJ_w7pvg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] subprocess: remove strings and migrate to direct arrays
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
X-List-Received-Date: Mon, 10 Oct 2016 14:22:45 -0000
Content-Type: multipart/alternative; boundary=001a113e391c632c6c053e837eea

--001a113e391c632c6c053e837eea
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 9, 2016 at 4:44 AM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Thu, 2016-10-06 at 20:09 -0700, Stephano Cetola wrote:
> >
> > When using subprocess call and check_output, it is better to use
> > arrays
> > rather than strings when possible to avoid whitespace and quoting
> > problems.
> >
> > [ YOCTO #9342 ]
> >
> > Signed-off-by: Stephano Cetola <stephano.cetola@linux.intel.com>
> > ---
> >  meta/lib/oe/distro_check.py    |   2 +-
> >  meta/lib/oe/package.py         |  13 +--
> >  meta/lib/oe/package_manager.py | 218 ++++++++++++++++++++-----------
> > ----------
> >  3 files changed, 114 insertions(+), 119 deletions(-)
> This triggered a lot of errors on the autobuilder:
>
> http://autobuilder.yocto.io:8010/builders/build-appliance/builds/70
> http://autobuilder.yocto.io:8010/builders/nightly-x86/builds/75
> http://autobuilder.yocto.io:8010/builders/nightly-x86-64/builds/73
> http://autobuilder.yocto.io:8010/builders/nightly-x86-64-lsb/builds/72
> http://autobuilder.yocto.io:8010/builders/nightly-x86-lsb/builds/73
> http://autobuilder.yocto.io:8010/builders/nightly-wic/builds/73
> http://autobuilder.yocto.io:8010/builders/nightly-qa-extras/builds/55
> http://autobuilder.yocto.io:8010/builders/nightly-oe-selftest/builds/70
> http://autobuilder.yocto.io:8010/builders/nightly-multilib/builds/78
>
> and similar errors on the main AB. I've confirmed it is this patch
> which causes the issue. Presumably some errors are occurring but are
> currently silently being ignored?
>
> Its probably worth looking into what is going on in case there is some
> real issue here but at this point given the complexity of the changes
> I'm leaning towwards deferring this for 2.3.


I=E2=80=99m a bit curious about why this was queued for 2.2 anyway, given i=
t=E2=80=99s not
a clear bugfix. Are we not past the feature freeze date?
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a113e391c632c6c053e837eea
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Sun, Oct 9, 2016 at 4:44 AM, Richard Purdie <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.p=
urdie@linuxfoundation.org</a>&gt;</span> wrote:<br><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex"><span class=3D"">On Thu, 2016-10-06 at 20:09 -0700, Stephano Cetola =
wrote:<br>
&gt;<br>
</span><span class=3D"">&gt; When using subprocess call and check_output, i=
t is better to use<br>
&gt; arrays<br>
&gt; rather than strings when possible to avoid whitespace and quoting<br>
&gt; problems.<br>
&gt;<br>
&gt; [ YOCTO #9342 ]<br>
&gt;<br>
&gt; Signed-off-by: Stephano Cetola &lt;<a href=3D"mailto:stephano.cetola@l=
inux.intel.com">stephano.cetola@linux.intel.<wbr>com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0meta/lib/oe/distro_check.py=C2=A0=C2=A0<wbr>=C2=A0=C2=A0|=C2=A0=
=C2=A0=C2=A02 +-<br>
&gt; =C2=A0meta/lib/oe/package.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
<wbr>=C2=A0=C2=A0|=C2=A0=C2=A013 +--<br>
&gt; =C2=A0meta/lib/oe/package_manager.<wbr>py | 218 ++++++++++++++++++++--=
--------<wbr>-<br>
&gt; ----------<br>
&gt; =C2=A03 files changed, 114 insertions(+), 119 deletions(-)<br>
</span><span class=3D"">This triggered a lot of errors on the autobuilder:<=
br>
<br>
<a href=3D"http://autobuilder.yocto.io:8010/builders/build-appliance/builds=
/70" rel=3D"noreferrer" target=3D"_blank">http://autobuilder.yocto.io:<wbr>=
8010/builders/build-appliance/<wbr>builds/70</a><br>
<a href=3D"http://autobuilder.yocto.io:8010/builders/nightly-x86/builds/75"=
 rel=3D"noreferrer" target=3D"_blank">http://autobuilder.yocto.io:<wbr>8010=
/builders/nightly-x86/<wbr>builds/75</a><br>
<a href=3D"http://autobuilder.yocto.io:8010/builders/nightly-x86-64/builds/=
73" rel=3D"noreferrer" target=3D"_blank">http://autobuilder.yocto.io:<wbr>8=
010/builders/nightly-x86-64/<wbr>builds/73</a><br>
<a href=3D"http://autobuilder.yocto.io:8010/builders/nightly-x86-64-lsb/bui=
lds/72" rel=3D"noreferrer" target=3D"_blank">http://autobuilder.yocto.io:<w=
br>8010/builders/nightly-x86-64-<wbr>lsb/builds/72</a><br>
<a href=3D"http://autobuilder.yocto.io:8010/builders/nightly-x86-lsb/builds=
/73" rel=3D"noreferrer" target=3D"_blank">http://autobuilder.yocto.io:<wbr>=
8010/builders/nightly-x86-lsb/<wbr>builds/73</a><br>
<a href=3D"http://autobuilder.yocto.io:8010/builders/nightly-wic/builds/73"=
 rel=3D"noreferrer" target=3D"_blank">http://autobuilder.yocto.io:<wbr>8010=
/builders/nightly-wic/<wbr>builds/73</a><br>
</span><a href=3D"http://autobuilder.yocto.io:8010/builders/nightly-qa-extr=
as/builds/55" rel=3D"noreferrer" target=3D"_blank">http://autobuilder.yocto=
.io:<wbr>8010/builders/nightly-qa-<wbr>extras/builds/55</a><br>
<a href=3D"http://autobuilder.yocto.io:8010/builders/nightly-oe-selftest/bu=
ilds/70" rel=3D"noreferrer" target=3D"_blank">http://autobuilder.yocto.io:<=
wbr>8010/builders/nightly-oe-<wbr>selftest/builds/70</a><br>
<a href=3D"http://autobuilder.yocto.io:8010/builders/nightly-multilib/build=
s/78" rel=3D"noreferrer" target=3D"_blank">http://autobuilder.yocto.io:<wbr=
>8010/builders/nightly-<wbr>multilib/builds/78</a><br>
<br>
and similar errors on the main AB. I&#39;ve confirmed it is this patch<br>
which causes the issue. Presumably some errors are occurring but are<br>
currently silently being ignored?<br>
<br>
Its probably worth looking into what is going on in case there is some<br>
real issue here but at this point given the complexity of the changes<br>
I&#39;m leaning towwards deferring this for 2.3.</blockquote></div><br>I=E2=
=80=99m a bit curious about why this was queued for 2.2 anyway, given it=E2=
=80=99s not a clear bugfix. Are we not past the feature freeze date?<br>-- =
<br><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">Chris=
topher Larson<br>clarson at kergoth dot com<br>Founder - BitBake, OpenEmbed=
ded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engineer, Mentor G=
raphics</div>
</div></div>

--001a113e391c632c6c053e837eea--
