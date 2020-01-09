Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com
	[209.85.221.173])
	by mail.openembedded.org (Postfix) with ESMTP id 7A2647FD4E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jan 2020 19:50:00 +0000 (UTC)
Received: by mail-vk1-f173.google.com with SMTP id t129so2295513vkg.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jan 2020 11:50:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=f7adLnKdrp1vCR90HRnjf3KgdY+xXhPJQLY9JoVr/YM=;
	b=rlHQpSRkTpt2EwfFjtNZHyNcymZfB1RMa3DqEJIyVitY/bD+cZK3nSRHT9YydDQboq
	q5Hn2MoRBI02eKk2aXD95QBSvsDwIhFdwjwfC00AoCRzxyvgliL1y7pce+JAOFB9XREb
	dNijwLGagV65/Ycb+6vFiuG54TS6Cxz/FbNPmJ8PFTos9vHh2evvpb5DeZ/Kb6PEvg/W
	MXyBR9aiM8qxCIXl9qFsLMhRT0SufURBNCQk9VC8k5sciKx79UwPCfwBpEfj8dq1DO69
	KWCoPVZgCRQEwHyamjcZY1PJnTXzrcbXFKP+NH9MhKSfxI+nLAD8lXpKZZDvv5jmgjWz
	klpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=f7adLnKdrp1vCR90HRnjf3KgdY+xXhPJQLY9JoVr/YM=;
	b=NaJ+RCpOkz0eaUHxgh8C2powLHB4tJxvu848/M8On8xwr7/LpoOLdl5uMxHoFcNQdo
	gVPFWBAzm58HzAhg63nZUcW37dvrTUKo8HDZyGVVvcK4ZjajwerJwE2QeKQuXU4c6PHF
	qsj2/Z6DW+LS67+xnhiKZ3ejmocuF1Se2LaMFdcwzsZA61YX7F20An0yNGk7dlMtmCpQ
	Fg5DwOir+zZp0TSXIojREKYm4Bde1ut4XUiZhcO8852j71WBg/f+QnyH2W6VBbQsPcyp
	m5n6DAQ/o6VOpk+S88FOdYD4ZAWyG2YCs9KnDXd1HIizjIXyfJ4JF14muuBhOzwdk0pD
	78Ug==
X-Gm-Message-State: APjAAAUhR0GWNwQ77dKSlIwsXK16qWm21sQIVMHUrsu2c6suZNgFtDM2
	o0BchcC+Pq6kycJNk2FAAr1tIsnOCpRJvmL5LrjG4g==
X-Google-Smtp-Source: APXvYqxlomrZp4KRvxFAftcVfW1ob+jcok3y7C2NDQ0EFoHLGv5rvuGlCNMO4keO54APYYqCEuozLIqto3mmSQHq/Ms=
X-Received: by 2002:a1f:7cc2:: with SMTP id x185mr7872006vkc.1.1578599401184; 
	Thu, 09 Jan 2020 11:50:01 -0800 (PST)
MIME-Version: 1.0
References: <20200108132759.95603-1-alex.kanavin@gmail.com>
	<20200108132759.95603-5-alex.kanavin@gmail.com>
	<492572ea126b424def780911c58230941842dd91.camel@linuxfoundation.org>
	<CANNYZj-=HOtgRiTh9xcnt9Q7c+gcm-Le26dfJeY0f3+Pt2HQsQ@mail.gmail.com>
	<8f8e989f2e630df2fcbee68f1ea18034549e069d.camel@andred.net>
	<b264b9d4f20106585d8a3daa6da6652f6ec90873.camel@andred.net>
In-Reply-To: <b264b9d4f20106585d8a3daa6da6652f6ec90873.camel@andred.net>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 9 Jan 2020 20:49:49 +0100
Message-ID: <CANNYZj96gxDZnxLKzEZUy+qehNQirO87hrUeKOR9KCrPmnWsOQ@mail.gmail.com>
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 05/28] python3: update to 3.8.1
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
X-List-Received-Date: Thu, 09 Jan 2020 19:50:00 -0000
Content-Type: multipart/alternative; boundary="0000000000008ce25c059bba50ca"

--0000000000008ce25c059bba50ca
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The problem is, I couldn't reproduce this locally at all. Random glitch?

Alex

On Thu, 9 Jan 2020 at 20:37, Andr=C3=A9 Draszik <git@andred.net> wrote:

> On Thu, 2020-01-09 at 19:28 +0000, Andr=C3=A9 Draszik wrote:
> > On Thu, 2020-01-09 at 16:31 +0100, Alexander Kanavin wrote:
> > > On Thu, 9 Jan 2020 at 00:02, Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
> > > > On Wed, 2020-01-08 at 14:27 +0100, Alexander Kanavin wrote:
> > > > > Drop backports, rebase other patches.
> > > > >
> > > > > One patch I wasn't able to rebase as upstream code changed too
> much:
> > > > > 0003-setup.py-pass-missing-libraries-to-Extension-for-mul.patch
> > > > > Please determine if it is still needed, produce a new version,
> > > > > and work with upstream to get it merged.
> > > > >
> > > > > 0001-main.c-if-OEPYTHON3HOME-is-set-use-instead-of-PYTHON.patch
> > > > > is removed as the use case (allowing python 2 and 3 to coexist
> > > > > in SDKs) is no longer relevant with Python 2.x reaching end of li=
ne
> > > > > and upstream has refactored the code making a rebase difficult.
> > > > > If needed, please re-add the patch to py2, rather than py3.
> > > > >
> > > > > Python 3.8 no longer adds "m" to "3.8" in paths, so adjust the
> > > > > recipes
> > > > > and classes accordingly.
> > > > >
> > > > > The manifest for the 3.8.0 version is updated; particularly pkgut=
il
> > > > > module is now packaged in -core (as other things in core need it)=
;
> > > > > this also necessitates allowing empty -pkgutil package to avoid
> > > > > breakage across layers.
> > > >
> > > >
> https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/1442
> > >
> > > This is a weird one, and I can't reproduce it locally. Hints?
> > >
> > > File:
> '/home/pokybuild/yocto-worker/beaglebone/build/meta/lib/oe/sstatesig.py',
> lineno: 544, function: process
> > >      0540:                else:
> > >      0541:                    add_perm(stat.S_IXOTH, 'x')
> > >      0542:
> > >      0543:                if include_owners:
> > >  *** 0544:                    update_hash(" %10s" %
> pwd.getpwuid(s.st_uid).pw_name)
> > >      0545:                    update_hash(" %10s" %
> grp.getgrgid(s.st_gid).gr_name)
> > >      0546:
> > >      0547:                update_hash(" ")
> > >      0548:                if stat.S_ISBLK(s.st_mode) or
> stat.S_ISCHR(s.st_mode):
> > > Exception: KeyError: 'getpwuid(): uid not found: 6000'
> >
> > I believe this typically means that the file is owned by the user
> running bitbake.
>
> ... or more generally that it's owned by a user not known inside the buil=
d
> environment.
>
> A
>
> >
> > It could be useful to add the file in question to the exception trace,
> for easier
> > debug / fixing.
> >
> > This will happen if
> > * files were installed outside do_install() in a different task
> >   that is not running under pseudo (fakeroot), or alternatively:
> > * cp without --no-preserve=3Downership
> > * tar without --no-same-owner
> > * cpio without --no-preserve-owner
> >
> >
> > HTH,
> > A.
> >
> >
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000008ce25c059bba50ca
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>The problem is, I couldn&#39;t reproduce this locally=
 at all. Random glitch?</div><div><br></div><div>Alex<br></div></div><br><d=
iv class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 9 Ja=
n 2020 at 20:37, Andr=C3=A9 Draszik &lt;<a href=3D"mailto:git@andred.net">g=
it@andred.net</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">On Thu, 2020-01-09 at 19:28 +0000, Andr=C3=A9 Draszik wrote:<b=
r>
&gt; On Thu, 2020-01-09 at 16:31 +0100, Alexander Kanavin wrote:<br>
&gt; &gt; On Thu, 9 Jan 2020 at 00:02, Richard Purdie &lt;<a href=3D"mailto=
:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.purdie@linux=
foundation.org</a>&gt; wrote:<br>
&gt; &gt; &gt; On Wed, 2020-01-08 at 14:27 +0100, Alexander Kanavin wrote:<=
br>
&gt; &gt; &gt; &gt; Drop backports, rebase other patches.<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; One patch I wasn&#39;t able to rebase as upstream code =
changed too much:<br>
&gt; &gt; &gt; &gt; 0003-setup.py-pass-missing-libraries-to-Extension-for-m=
ul.patch<br>
&gt; &gt; &gt; &gt; Please determine if it is still needed, produce a new v=
ersion,<br>
&gt; &gt; &gt; &gt; and work with upstream to get it merged.<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; 0001-main.c-if-OEPYTHON3HOME-is-set-use-instead-of-PYTH=
ON.patch<br>
&gt; &gt; &gt; &gt; is removed as the use case (allowing python 2 and 3 to =
coexist<br>
&gt; &gt; &gt; &gt; in SDKs) is no longer relevant with Python 2.x reaching=
 end of line<br>
&gt; &gt; &gt; &gt; and upstream has refactored the code making a rebase di=
fficult.<br>
&gt; &gt; &gt; &gt; If needed, please re-add the patch to py2, rather than =
py3.<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; Python 3.8 no longer adds &quot;m&quot; to &quot;3.8&qu=
ot; in paths, so adjust the<br>
&gt; &gt; &gt; &gt; recipes<br>
&gt; &gt; &gt; &gt; and classes accordingly.<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; The manifest for the 3.8.0 version is updated; particul=
arly pkgutil<br>
&gt; &gt; &gt; &gt; module is now packaged in -core (as other things in cor=
e need it);<br>
&gt; &gt; &gt; &gt; this also necessitates allowing empty -pkgutil package =
to avoid<br>
&gt; &gt; &gt; &gt; breakage across layers.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/bu=
ilders/65/builds/1442" rel=3D"noreferrer" target=3D"_blank">https://autobui=
lder.yoctoproject.org/typhoon/#/builders/65/builds/1442</a><br>
&gt; &gt; <br>
&gt; &gt; This is a weird one, and I can&#39;t reproduce it locally. Hints?=
<br>
&gt; &gt; <br>
&gt; &gt; File: &#39;/home/pokybuild/yocto-worker/beaglebone/build/meta/lib=
/oe/sstatesig.py&#39;, lineno: 544, function: process<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 0540:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 else:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 0541:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 add_perm(stat.S_IXOTH, &#39;x&#39;)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 0542:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 0543:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 if include_owners:<br>
&gt; &gt;=C2=A0 *** 0544:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 update_hash(&quot; %10s&quot; % pwd.getpwuid(s.st_uid)=
.pw_name)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 0545:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 update_hash(&quot; %10s&quot; % grp.getgrgi=
d(s.st_gid).gr_name)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 0546:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 0547:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 update_hash(&quot; &quot;)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 0548:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 if stat.S_ISBLK(s.st_mode) or stat.S_ISCHR(s.st_mode):<br=
>
&gt; &gt; Exception: KeyError: &#39;getpwuid(): uid not found: 6000&#39;<br=
>
&gt; <br>
&gt; I believe this typically means that the file is owned by the user runn=
ing bitbake.<br>
<br>
... or more generally that it&#39;s owned by a user not known inside the bu=
ild environment.<br>
<br>
A<br>
<br>
&gt; <br>
&gt; It could be useful to add the file in question to the exception trace,=
 for easier<br>
&gt; debug / fixing.<br>
&gt; <br>
&gt; This will happen if<br>
&gt; * files were installed outside do_install() in a different task<br>
&gt;=C2=A0 =C2=A0that is not running under pseudo (fakeroot), or alternativ=
ely:<br>
&gt; * cp without --no-preserve=3Downership<br>
&gt; * tar without --no-same-owner<br>
&gt; * cpio without --no-preserve-owner<br>
&gt; <br>
&gt; <br>
&gt; HTH,<br>
&gt; A.<br>
&gt; <br>
&gt; <br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--0000000000008ce25c059bba50ca--
