Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id 7407576D07
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Aug 2015 08:43:57 +0000 (UTC)
Received: by wicfv10 with SMTP id fv10so24090380wic.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Aug 2015 01:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=YUHo3zjUzwnEH0lz+6b/13Glc7kme243d63AKwWqslQ=;
	b=D3jeFqq4ySZ8SgX3z2n4pZlT1py33RNlvt7FcAv3xX3X1To1hlgJdCGfCmFUpMYmgl
	MC5Knh1/rZl0aCurvYi/NbUDRu/aWyLZHKcz6AdM1+Z/aEfqNZtQYv2hn9DWkskfp0pY
	yzp+XELdYpTkqpc3ttJc1j6ll8wg8tCJ4/TKh+UCk7UZYzfX+YmRvZIHAEvK0hDS9yRb
	fJKCOlvPTmvbLgxeKLKzKfTIvLZOOUtnRarbK/NRZwCGUFAE5y8dKxIwAE9b8ZvXzgWJ
	pZ/v5wBH9kMfoEFluIHqB2GgAXdFTnhOirdafbJ6mSG9iriJypcICblNm0v3yHODwnNX
	3FjA==
MIME-Version: 1.0
X-Received: by 10.194.172.130 with SMTP id bc2mr17217893wjc.85.1440837837650; 
	Sat, 29 Aug 2015 01:43:57 -0700 (PDT)
Received: by 10.28.64.196 with HTTP; Sat, 29 Aug 2015 01:43:57 -0700 (PDT)
In-Reply-To: <CAHiDW_FTdPR1gP12VLfVtijg5NVpYPCm_3vmDga-O_8KoHkDag@mail.gmail.com>
References: <ac5380e48da5a3385086887d8a7bd5cf5478112b.1440680489.git.jussi.kukkonen@intel.com>
	<cover.1440680489.git.jussi.kukkonen@intel.com>
	<694e679ee04cff2ca5029720b316cf1c6fb55496.1440680489.git.jussi.kukkonen@intel.com>
	<7D73CC7E-2609-4B6F-8E92-6A71CB25983F@gmail.com>
	<CAHiDW_GULRgXqOMkAyPFFEU0ROdTmL+tc93w40eLwOvnrFsd2A@mail.gmail.com>
	<CAHiDW_FTdPR1gP12VLfVtijg5NVpYPCm_3vmDga-O_8KoHkDag@mail.gmail.com>
Date: Sat, 29 Aug 2015 10:43:57 +0200
Message-ID: <CA+chaQe6ayG9k1Hh9sqN+EaBr8GskHMWVQ_L9LqycVhSJN3YqA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/6] gmp: Bring back version 4.2.1 (LGPL 2.1+)
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
X-List-Received-Date: Sat, 29 Aug 2015 08:44:01 -0000
Content-Type: multipart/alternative; boundary=089e013c63427e0a11051e6f3379

--089e013c63427e0a11051e6f3379
Content-Type: text/plain; charset=UTF-8

Did you enable thumb in that qemuarm build?

It's disabled by default and multiple components are broken when you enable
it, see:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717

On Sat, Aug 29, 2015 at 8:17 AM, Jussi Kukkonen <jussi.kukkonen@intel.com>
wrote:

> On 28 August 2015 at 10:44, Jussi Kukkonen <jussi.kukkonen@intel.com>
> wrote:
> > On 28 August 2015 at 09:03, Khem Raj <raj.khem@gmail.com> wrote:
> > > > On Aug 27, 2015, at 6:05 AM, Jussi Kukkonen <
> jussi.kukkonen@intel.com> wrote:
> > > >
> > > > gmp 4.2.1 was removed in f181c6ce8b apparently accidentally: It
> > > > was not noticed that 4.2.1 is LGPL 2.1 (and not GPL) so provides
> > > > a useful alternative to the newer "GPLv2 | LGPLv3" version.
> > > >
> > > > * Reintroduce 4.2.1. The source includes files that are GPL but the
> > > >  library package is LGPL 2.1+
> > > > * Also reintroduce the two patches removed in f181c6ce8b.
> > > > * Refactor gmp.inc: gmp 6.0.0 build should not be affected in any
> way.
> > > > * Update 6.0.0 license from "GPLv2 | LGPLv3" to "GPLv2+ | LGPLv3+".
> > > >
> > > > [YOCTO #8197]
> > >
> > > there are issues with gmp on arm especially thumb mode. What kind of
> testing have you done on this ?
> >
> > I have not tested on arm and at don't really have means to do so.
> Suggestions to limit the possible harm are welcome.
>
> Ok, that was sent before morning coffee, not really the whole story...
> What I should have said is: Can you expand on the possible problems
> (keeping in mind that I don't know much about arm in general or how thumb
> might relate to this)?
>
> I did build 4.2.1 successfully for qemuarm and it seems ok in a very quick
> test.
>
>  - Jussi
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

--089e013c63427e0a11051e6f3379
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Did you enable thumb in that qemuarm build?<div><br></div>=
<div>It&#39;s disabled by default and multiple components are broken when y=
ou enable it, see:</div><div><a href=3D"https://bugzilla.yoctoproject.org/s=
how_bug.cgi?id=3D7717">https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D=
7717</a><br></div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_=
quote">On Sat, Aug 29, 2015 at 8:17 AM, Jussi Kukkonen <span dir=3D"ltr">&l=
t;<a href=3D"mailto:jussi.kukkonen@intel.com" target=3D"_blank">jussi.kukko=
nen@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div =
dir=3D"ltr"><span class=3D"">On 28 August 2015 at 10:44, Jussi Kukkonen &lt=
;<a href=3D"mailto:jussi.kukkonen@intel.com" target=3D"_blank">jussi.kukkon=
en@intel.com</a>&gt; wrote:<br>&gt; On 28 August 2015 at 09:03, Khem Raj &l=
t;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.co=
m</a>&gt; wrote:<br>&gt; &gt; &gt; On Aug 27, 2015, at 6:05 AM, Jussi Kukko=
nen &lt;<a href=3D"mailto:jussi.kukkonen@intel.com" target=3D"_blank">jussi=
.kukkonen@intel.com</a>&gt; wrote:<br>&gt; &gt; &gt;<br>&gt; &gt; &gt; gmp =
4.2.1 was removed in f181c6ce8b apparently accidentally: It<br>&gt; &gt; &g=
t; was not noticed that 4.2.1 is LGPL 2.1 (and not GPL) so provides<br>&gt;=
 &gt; &gt; a useful alternative to the newer &quot;GPLv2 | LGPLv3&quot; ver=
sion.<br>&gt; &gt; &gt;<br>&gt; &gt; &gt; * Reintroduce 4.2.1. The source i=
ncludes files that are GPL but the<br>&gt; &gt; &gt; =C2=A0library package =
is LGPL 2.1+<br>&gt; &gt; &gt; * Also reintroduce the two patches removed i=
n f181c6ce8b.<br>&gt; &gt; &gt; * Refactor gmp.inc: gmp 6.0.0 build should =
not be affected in any way.<br>&gt; &gt; &gt; * Update 6.0.0 license from &=
quot;GPLv2 | LGPLv3&quot; to &quot;GPLv2+ | LGPLv3+&quot;.<br>&gt; &gt; &gt=
;<br>&gt; &gt; &gt; [YOCTO #8197]<br>&gt; &gt;<br>&gt; &gt; there are issue=
s with gmp on arm especially thumb mode. What kind of testing have you done=
 on this ?<br>&gt;<br>&gt; I have not tested on arm and at don&#39;t really=
 have means to do so. Suggestions to limit the possible harm are welcome.<b=
r><br></span><div>Ok, that was sent before morning coffee, not really the w=
hole story... What I should have said is: Can you expand on the possible pr=
oblems (keeping in mind that I don&#39;t know much about arm in general or =
how thumb might relate to this)?</div><div><br></div><div>I did build 4.2.1=
 successfully for qemuarm and it seems ok in a very quick test.</div><span =
class=3D"HOEnZb"><font color=3D"#888888"><div><br></div><div>=C2=A0- Jussi<=
/div><div><br></div></font></span></div>
<br>--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
<br></blockquote></div><br></div>

--089e013c63427e0a11051e6f3379--
