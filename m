Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-it0-f54.google.com (mail-it0-f54.google.com
	[209.85.214.54])
	by mail.openembedded.org (Postfix) with ESMTP id 366EE6FF9F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 07:57:39 +0000 (UTC)
Received: by mail-it0-f54.google.com with SMTP id b205so11318941itg.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 00:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=DCGrKp2WrlYlBNvl8Z6kmufbyM1DBkH21XVLVUkceZk=;
	b=vI+6euYoHoHoOnUceBzECX3E9ejY87xotx6hj6Ubk8CGtxaXm6/UFvTEilu+ZjgJdk
	36HrJMC8dSYlKNcnbGMjIa70N96Dx1L1khRW5P8jSIBjvG/15ORBwTigbUH/LAjDTWU5
	kM2rsG/pOpEcHckce0R3yIIAxHXZHemTtUP3gTuqy2CXiMd6Y7wXNTrhIEWGmZOFe6Fd
	6ba79zUthpw3aeXdHh/0KC42j94gsiyEsHS3Vv7fma9EEk07eQpF8UW8p4VujTVpXh5Z
	Dt7xTIpgJigBUoIsONeMHAUU9rImHB3FAdDsx2bIdgoA1Lq4uccNYpQx4Cx98rSNCfXB
	jk2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=DCGrKp2WrlYlBNvl8Z6kmufbyM1DBkH21XVLVUkceZk=;
	b=sjzRj6eDBjSUQJddQVsvvugdGP4NAHYlmRj6b5TNOOBzr0F5FRKMk433esoQkZSqpZ
	k8EIOOhnlJ9N+ocGPEnB4Q+RKrxlNILOwQmoF9T2r2DG78T137TmqYeDqgu6uJ/j4Pq9
	gw3sEKMkrkRU98DmyTfqV4uogMm6mvSGe62XgxE+ITG5eQgnJfgh9stYMtt6xfU7pLDD
	5rIA6DhDBUXpFQtkSj+REJUNgGX34hCao64Q/0at60x6hL15/tdbO9sb1FZVaR1XDI2P
	+oW01TAXlh7e/IU60z0kemY1Y9MnWnOH3Xp5AMbVnXr/vaBzseSVKrMRKmEkbj8guitE
	AR4Q==
X-Gm-Message-State: AKS2vOzmPEqnC/Y40bD3YjXm/KkuA9BcCjG2PsGXQitYq/VuWhnBdsla
	fM0HH6e9rGyK3x8OHCgxWMdxxD8sUo7N
X-Received: by 10.36.219.197 with SMTP id c188mr2044566itg.17.1498550261045;
	Tue, 27 Jun 2017 00:57:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.44.87 with HTTP; Tue, 27 Jun 2017 00:57:10 -0700 (PDT)
In-Reply-To: <20170626215132.GA11747@mbedesk.sonatest.net>
References: <1498502034-13181-1-git-send-email-maxime.roussinbelanger@gmail.com>
	<CAP9ODKp+-fKQSM97AcqDe5Tm9r256LFg_fgDdiuzCFnk5TB_Xw@mail.gmail.com>
	<20170626215132.GA11747@mbedesk.sonatest.net>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Tue, 27 Jun 2017 10:57:10 +0300
Message-ID: <CAHiDW_Eg+_+QZyLAvwh7a83noThH=-oO+ph4jE0LeuEc7v8J6Q@mail.gmail.com>
To: Maxime Roussin-Belanger <maxime.roussinbelanger@gmail.com>
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cmake: Use find_program if find_host_program is not available
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
X-List-Received-Date: Tue, 27 Jun 2017 07:57:40 -0000
Content-Type: multipart/alternative; boundary="94eb2c05f4d6fcf45c0552ec6bf9"

--94eb2c05f4d6fcf45c0552ec6bf9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 27 June 2017 at 00:51, Maxime Roussin-Belanger <
maxime.roussinbelanger@gmail.com> wrote:

> On Mon, Jun 26, 2017 at 04:41:34PM -0300, Otavio Salvador wrote:
> > On Mon, Jun 26, 2017 at 3:33 PM, Maxime Roussin-B=C3=A9langer
> > <maxime.roussinbelanger@gmail.com> wrote:
> > > CMake does not define the `find_host_program` command we've
> > > been using in the cross-compiling code path.  It was
> > > provided by a widely used Android toolchain file.  For
> > > compatibility, continue to use `find_host_program` if
> > > available, but otherwise use just `find_program`.
> > >
> > > Signed-off-by: Maxime Roussin-B=C3=A9langer <maxime.roussinbelanger@g=
mail.
> com>
> >
> > It sounds fine to me; the backward compatibility is maintained and it
> > fixes a real use-case so I see no reason to not apply EXCEPT:
> >
> > - lack of Upstream-Status field
> > - lack of upstream bug about the issue, ideally the proposed patch
> > should be send to upstream so we can drop it in next releases
> >
>
> I just got r/w access to the poky-contrib repository. Do I have to create
> a pull-request/send-pull-request to get an upstream-status field?
>
> Can we ignore this email and just use the pull-request script instead?
>
> If so, do I have to resend the same patch (V2 ?) to the same recipients?
>

You should send a V2 with Upstream-Status (see below). You can use
poky-contrib and the pull-request scripts but you can also just send the
patch, it's up to you.


> If not, how do I get an upstream-status? I just pushed my branch to contr=
ib
> repository (mroussin/fix_cmake_find_cuda_not_android), does that mean
> pending?
>

Upstream-Status refers to what's happening in _upstream project_, not in
yocto: you should decide what the appropriate value is -- but everyone
would like if it was "submitted"  (in other words you have sent a patch to
the cmake project using whatever method they prefer). At the very least you
should file a bug upstream. Please add a link to the upstream pull request
or bug report into the yocto patch: that way it's easy to check later on if
the patch is still needed.

There's no tooling to add the tag if that was what you were wondering, just
write it by hand.

See also: https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines


Jussi



>
>
> > --
> > Otavio Salvador                             O.S. Systems
> > http://www.ossystems.com.br        http://code.ossystems.com.br
> > Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--94eb2c05f4d6fcf45c0552ec6bf9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 2=
7 June 2017 at 00:51, Maxime Roussin-Belanger <span dir=3D"ltr">&lt;<a href=
=3D"mailto:maxime.roussinbelanger@gmail.com" target=3D"_blank">maxime.rouss=
inbelanger@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex"><span class=3D"gmail-">On Mon, Jun 26, 2017 at 04:41:3=
4PM -0300, Otavio Salvador wrote:<br>
&gt; On Mon, Jun 26, 2017 at 3:33 PM, Maxime Roussin-B=C3=A9langer<br>
&gt; &lt;<a href=3D"mailto:maxime.roussinbelanger@gmail.com">maxime.roussin=
belanger@gmail.<wbr>com</a>&gt; wrote:<br>
&gt; &gt; CMake does not define the `find_host_program` command we&#39;ve<b=
r>
&gt; &gt; been using in the cross-compiling code path.=C2=A0 It was<br>
&gt; &gt; provided by a widely used Android toolchain file.=C2=A0 For<br>
&gt; &gt; compatibility, continue to use `find_host_program` if<br>
&gt; &gt; available, but otherwise use just `find_program`.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Maxime Roussin-B=C3=A9langer &lt;<a href=3D"mailto=
:maxime.roussinbelanger@gmail.com">maxime.roussinbelanger@gmail.<wbr>com</a=
>&gt;<br>
&gt;<br>
&gt; It sounds fine to me; the backward compatibility is maintained and it<=
br>
&gt; fixes a real use-case so I see no reason to not apply EXCEPT:<br>
&gt;<br>
&gt; - lack of Upstream-Status field<br>
&gt; - lack of upstream bug about the issue, ideally the proposed patch<br>
&gt; should be send to upstream so we can drop it in next releases<br>
&gt;<br>
<br>
</span>I just got r/w access to the poky-contrib repository. Do I have to c=
reate<br>
a pull-request/send-pull-request to get an upstream-status field?<br>
<br>
Can we ignore this email and just use the pull-request script instead?<br>
<br>
If so, do I have to resend the same patch (V2 ?) to the same recipients?<br=
></blockquote><div><br></div><div>You should send a V2 with Upstream-Status=
 (see below). You can use poky-contrib and the pull-request scripts but you=
 can also just send the patch, it&#39;s up to you.=C2=A0</div><div>=C2=A0</=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
If not, how do I get an upstream-status? I just pushed my branch to contrib=
<br>
repository (mroussin/fix_cmake_find_cuda_<wbr>not_android), does that mean =
pending?<br></blockquote><div><br></div><div>Upstream-Status refers to what=
&#39;s happening in _upstream project_, not in yocto: you should decide wha=
t the appropriate value is -- but everyone would like if it was &quot;submi=
tted&quot; =C2=A0(in other words you have sent a patch to the cmake project=
 using whatever method they prefer). At the very least you should file a bu=
g upstream. Please add a link to the upstream pull request or bug report in=
to the yocto patch: that way it&#39;s easy to check later on if the patch i=
s still needed.</div><div><br></div><div>There&#39;s no tooling to add the =
tag if that was what you were wondering, just write it by hand.</div><div><=
br></div><div>See also: <a href=3D"https://www.openembedded.org/wiki/Commit=
_Patch_Message_Guidelines">https://www.openembedded.org/wiki/Commit_Patch_M=
essage_Guidelines</a><br></div><div><br></div><div><br></div><div>Jussi</di=
v><div>=C2=A0</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<div class=3D"gmail-HOEnZb"><div class=3D"gmail-h5"><br>
<br>
&gt; --<br>
&gt; Otavio Salvador=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0O.S. Systems<br>
&gt; <a href=3D"http://www.ossystems.com.br" rel=3D"noreferrer" target=3D"_=
blank">http://www.ossystems.com.br</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=
=3D"http://code.ossystems.com.br" rel=3D"noreferrer" target=3D"_blank">http=
://code.ossystems.com.br</a><br>
&gt; Mobile: <a href=3D"tel:%2B55%20%2853%29%209981-7854" value=3D"+5553998=
17854">+55 (53) 9981-7854</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Mobi=
le: <a href=3D"tel:%2B1%20%28347%29%20903-9750" value=3D"+13479039750">+1 (=
347) 903-9750</a><br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br></div></div>

--94eb2c05f4d6fcf45c0552ec6bf9--
