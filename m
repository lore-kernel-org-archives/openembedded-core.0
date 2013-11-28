Return-Path: <kergoth@gmail.com>
Received: from mail-lb0-f169.google.com (mail-lb0-f169.google.com
	[209.85.217.169])
	by mail.openembedded.org (Postfix) with ESMTP id 7C5496D4FC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Nov 2013 20:29:53 +0000 (UTC)
Received: by mail-lb0-f169.google.com with SMTP id y6so6469795lbh.14
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Nov 2013 12:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=FxqZ4vspPCgxsu+ye6JdUedfNyciLiKRQUdj3O3PkZ8=;
	b=wq1nY19k8Htn5eI7RevANvMJJBxzKGOtALAkbp4gYR0mVZ1e45Ur8uHvbvWvSMWfcJ
	1th5jC1k8QOGVGc0A4A1pYnM5bXPc0MV4wy/0JxRzX6Ycu/HlTLII7il26HnIK05n7iQ
	d92NS1mtONWhH0Cr5wgjuOuNRmd7DhHK0ew0R1jkytXnCMVm2HsFNgfdLODZyXa+MsXx
	ZxOARs9/N4bZZ8zMuqUKlAGAQfuPI6jQUv9cvU2dTe/wg9JzGQyPE79tL1c3QXjntUt+
	UXuleLpfVW+/YuUitCv2HpB1e3S2BOddRbIz6nsoPZ9r/dO8Okz4S8/FkiVuD1XZEyYZ
	pCLQ==
X-Received: by 10.112.151.103 with SMTP id up7mr3057756lbb.14.1385670592244;
	Thu, 28 Nov 2013 12:29:52 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.53.197 with HTTP; Thu, 28 Nov 2013 12:29:32 -0800 (PST)
In-Reply-To: <1438663.kjvipZjc12@helios>
References: <cover.1385571298.git.stefanx.stanacar@intel.com>
	<CABcZANmBnxydmGn6OstDVu4TAB1urdN5teb2fAP6z02W5C38fQ@mail.gmail.com>
	<1438663.kjvipZjc12@helios>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 28 Nov 2013 13:29:32 -0700
X-Google-Sender-Auth: ask1O10om2FTfSJSupmgfGCQ4pA
Message-ID: <CABcZAN=Tym_ZkCB4ihdJrQ0sqU-Kw9GU6vER5f2viKoxBWntdg@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] Script and layer for running tests
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
X-List-Received-Date: Thu, 28 Nov 2013 20:29:54 -0000
Content-Type: multipart/alternative; boundary=047d7b343e1e6d326104ec429303

--047d7b343e1e6d326104ec429303
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 28, 2013 at 3:17 AM, Paul Eggleton <
paul.eggleton@linux.intel.com> wrote:

> On Wednesday 27 November 2013 11:42:06 Chris Larson wrote:
> > On Wed, Nov 27, 2013 at 10:08 AM, Stefan Stanacar <
> > stefanx.stanacar@intel.com> wrote:
> > > This series adds an oe-selftest script, some modules and a new layer
> > > meta-selftest.
> > > which are meant to help in writing tests (using python unittest) for
> > > various
> > > bitbake tools/scripts as well as simple output checks or do
> > > complete builds with different options (with the emphasis that
> everything
> > > checked
> > > is done outside of bitbake context, just like a human would do.) For
> more
> > > details,
> > > please see YOCTO #4740.
> >
> > Will this have its own repository like all the other poky integrated
> > layers? It really should, in my opinion.
>
> It really needs to stay in the same place as the tests that rely on it;
> they
> can't work without it. It might be suggested that the tests should go
> elsewhere with them; but I don't think that would make sense - we want
> people
> to be able to run these tests easily if they make changes to OE-Core to
> check
> if they have caused any regressions.
>
> If you have a look at the layer, there's not a lot in it, and I wouldn't
> expect a lot to be added in future. One possible change would be to just
> have
> the layer created on the fly in some temporary directory by the tests
> themselves, rather than having it in the repository; on the other hand it
> does
> make it a bit more difficult to look into outside of the test environment=
.


I understand what you=E2=80=99re saying, but if this script is supposed to =
be
generally useful for OE/Yocto, not just Poky, then the poky repository
shouldn=E2=80=99t be its definitive location. Further, patches against oe-c=
ore
should be submitted against the oe-core repository, not the poky
repository, and anything poky specific should go to the poky list.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--047d7b343e1e6d326104ec429303
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">On Thu, Nov 28, 2013 at 3:17 AM=
, Paul Eggleton <span dir=3D"ltr">&lt;<a href=3D"mailto:paul.eggleton@linux=
.intel.com" target=3D"_blank">paul.eggleton@linux.intel.com</a>&gt;</span> =
wrote:<br>

<div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"im"=
>On Wednesday 27 November 2013 11:42:06 Chris Larson wrote:<br>
&gt; On Wed, Nov 27, 2013 at 10:08 AM, Stefan Stanacar &lt;<br>
&gt; <a href=3D"mailto:stefanx.stanacar@intel.com">stefanx.stanacar@intel.c=
om</a>&gt; wrote:<br>
&gt; &gt; This series adds an oe-selftest script, some modules and a new la=
yer<br>
&gt; &gt; meta-selftest.<br>
&gt; &gt; which are meant to help in writing tests (using python unittest) =
for<br>
&gt; &gt; various<br>
&gt; &gt; <span class=3D"il">bitbake</span> tools/scripts as well as simple=
 output checks or do<br>
&gt; &gt; complete builds with different options (with the emphasis that ev=
erything<br>
&gt; &gt; checked<br>
&gt; &gt; is done outside of <span class=3D"il">bitbake</span> context, jus=
t like a human would do.) For more<br>
&gt; &gt; details,<br>
&gt; &gt; please see YOCTO #4740.<br>
&gt;<br>
&gt; Will this have its own repository like all the other poky integrated<b=
r>
&gt; layers? It really should, in my opinion.<br>
<br>
</div>It really needs to stay in the same place as the tests that rely on i=
t; they<br>
can&#39;t work without it. It might be suggested that the tests should go<b=
r>
elsewhere with them; but I don&#39;t think that would make sense - we want =
people<br>
to be able to run these tests easily if they make changes to OE-Core to che=
ck<br>
if they have caused any regressions.<br>
<br>
If you have a look at the layer, there&#39;s not a lot in it, and I wouldn&=
#39;t<br>
expect a lot to be added in future. One possible change would be to just ha=
ve<br>
the layer created on the fly in some temporary directory by the tests<br>
themselves, rather than having it in the repository; on the other hand it d=
oes<br>
make it a <span class=3D"il">bit</span> more difficult to look into outside=
 of the test environment.</blockquote></div><br>I understand what you=E2=80=
=99re saying, but if this script is supposed to be generally useful for OE/=
Yocto, not just Poky, then the poky repository shouldn=E2=80=99t be its def=
initive location. Further, patches against oe-core should be submitted agai=
nst the oe-core repository, not the poky repository, and anything poky spec=
ific should go to the poky list.<br>

-- <br>Christopher Larson<br>clarson at kergoth dot com<br>Founder - BitBak=
e, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engine=
er, Mentor Graphics
</div></div>

--047d7b343e1e6d326104ec429303--
