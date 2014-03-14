Return-Path: <kergoth@gmail.com>
Received: from mail-lb0-f170.google.com (mail-lb0-f170.google.com
	[209.85.217.170])
	by mail.openembedded.org (Postfix) with ESMTP id 1C8776E9D8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Mar 2014 19:06:57 +0000 (UTC)
Received: by mail-lb0-f170.google.com with SMTP id s7so2117148lbd.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Mar 2014 12:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=mexQ78CMXOekvpiYEXeJcj3PmM/kkcKoZK5wE9KM1zM=;
	b=IRYIH4ScGwe1pl+GMZsXdDMSeJD/9/DAc83BTjJkwWp+e4eXt5e3FSoublzFaezWOH
	qQM3NL3sgjeGJVmxeoJnOa5OESh6RinH/xwAJSWxHturwWmxTbld/CHKMf3iRXb3Qusj
	7jEuhJP/uQf0xzivWdkjaPFbd8cl+OcRcCdEU6FQ83SM4kkFKtvfZ2pTjpTOaN2l60rp
	hSnyL26N5cDSo8SaaTROFjcnVhSljFvXsKHQWmahIQNNBGKUJ38OxjyZ2LhbJzm1b9a/
	/o0WIApKy5+sqzcOqe+fz6pdVNKOwd0vfwfMDL4XW1rX/FOKYDIz3KMtn3+3WVywKzT1
	U/RQ==
X-Received: by 10.152.210.70 with SMTP id ms6mr6525982lac.5.1394824017330;
	Fri, 14 Mar 2014 12:06:57 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.35.200 with HTTP; Fri, 14 Mar 2014 12:06:37 -0700 (PDT)
In-Reply-To: <CAMKF1sp0WUMyC8zsnQEei8=azDsy5xpM9UWUUsnw5rNqjytWVQ@mail.gmail.com>
References: <CANyK_8dJY0nbt6aNeLYeRggTHXj9qiGbSemngbZAdf7LU_KzCQ@mail.gmail.com>
	<CAMKF1so_=HgkVWr4ftsFny+9ipZ-Yy4PSRXx+=b=Z9NQAq1GaQ@mail.gmail.com>
	<CANyK_8euVvKOgKbKGmYwwGnYwC+w=L8EFEfCdMy==+qBEnhrTA@mail.gmail.com>
	<CAMKF1sp0WUMyC8zsnQEei8=azDsy5xpM9UWUUsnw5rNqjytWVQ@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 14 Mar 2014 12:06:37 -0700
X-Google-Sender-Auth: 75Gx9hiUGx4RD7_tNYavtiusUHw
Message-ID: <CABcZANkrJYK7xgf=A=WcL9+xHbX1=jTkcDGs=pC3wjpwS-G3sw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [dylan] Backport request
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
X-List-Received-Date: Fri, 14 Mar 2014 19:06:58 -0000
Content-Type: multipart/alternative; boundary=001a11380ac413ca7204f495c6cf

--001a11380ac413ca7204f495c6cf
Content-Type: text/plain; charset=UTF-8

On Fri, Mar 14, 2014 at 11:46 AM, Khem Raj <raj.khem@gmail.com> wrote:

> On Fri, Mar 14, 2014 at 11:44 AM, Paul Barker <paul@paulbarker.me.uk>
> wrote:
> > On 14 March 2014 18:37, Khem Raj <raj.khem@gmail.com> wrote:
> >> On Fri, Mar 14, 2014 at 11:34 AM, Paul Barker <paul@paulbarker.me.uk>
> wrote:
> >>> I'm stuck using Dylan for a project as I need a 3.2 series kernel.
> >>> Building on my current development machine I ran into two failures:
> >>>
> >>> eglibc-initial, do_configure: Make 4.0 isn't recognised
> >>>
> >>> This can be fixed by backporting
> >>> a678243d6e4add90c1e9459da42de34d3724db5d (already in Dora).
> >>>
> >>> linux-yocto_3.2: do_patch: Unsupported version of git (1.9.0)
> >>>
> >>> I fixed this by removing git-native from ASSUME_PROVIDED in
> >>> meta/conf/bitbake.conf so that git-native-1.8.1.4 was built and used.
> >>> That isn't something we should commit in Dylan but may be useful for
> >>> others to know the solution if they run into the same problem.
> >>
> >> I think if you also lock your build machine OS along with yocto
> >> release, it is less painful.
> >
> > It is definitely less painful. I'm lacking the spare hardware though
> > and I want to avoid building inside a VM if I can as I'll be limited
> > on how much RAM I can allocate to it and I think the performance will
> > take a hit. Thankfully this project isn't far off end-of-life now.
>
> I use containers. systemd-nspawn goes long way


Yeah, containers (systemd-nspawn, docker) or even a chroot can be
invaluable. schroot on a debian machine works quite well too for something
as simple as builds. I end up aliasing bb and bitbake to transparently run
in the chroot at all times.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a11380ac413ca7204f495c6cf
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Fri, Mar 14, 2014 at 11:46 AM, Khem Raj <span dir=3D"ltr">&lt;<a href=3D=
"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</s=
pan> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"">On Fri, Mar 14, 2014 at 11:4=
4 AM, Paul Barker &lt;<a href=3D"mailto:paul@paulbarker.me.uk">paul@paulbar=
ker.me.uk</a>&gt; wrote:<br>


&gt; On 14 March 2014 18:37, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.=
com">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;&gt; On Fri, Mar 14, 2014 at 11:34 AM, Paul Barker &lt;<a href=3D"mailt=
o:paul@paulbarker.me.uk">paul@paulbarker.me.uk</a>&gt; wrote:<br>
&gt;&gt;&gt; I&#39;m stuck using Dylan for a project as I need a 3.2 series=
 kernel.<br>
&gt;&gt;&gt; Building on my current development machine I ran into two fail=
ures:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; eglibc-initial, do_configure: Make 4.0 isn&#39;t recognised<br=
>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; This can be fixed by backporting<br>
&gt;&gt;&gt; a678243d6e4add90c1e9459da42de34d3724db5d (already in Dora).<br=
>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; linux-yocto_3.2: do_patch: Unsupported version of git (1.9.0)<=
br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I fixed this by removing git-native from ASSUME_PROVIDED in<br=
>
&gt;&gt;&gt; meta/conf/bitbake.conf so that git-native-1.8.1.4 was built an=
d used.<br>
&gt;&gt;&gt; That isn&#39;t something we should commit in Dylan but may be =
useful for<br>
&gt;&gt;&gt; others to know the solution if they run into the same problem.=
<br>
&gt;&gt;<br>
&gt;&gt; I think if you also lock your build machine OS along with yocto<br=
>
&gt;&gt; release, it is less painful.<br>
&gt;<br>
&gt; It is definitely less painful. I&#39;m lacking the spare hardware thou=
gh<br>
&gt; and I want to avoid building inside a VM if I can as I&#39;ll be limit=
ed<br>
&gt; on how much RAM I can allocate to it and I think the performance will<=
br>
&gt; take a hit. Thankfully this project isn&#39;t far off end-of-life now.=
<br>
<br>
</div>I use containers. systemd-nspawn goes long way</blockquote></div><br>=
</div><div class=3D"gmail_extra">Yeah, containers (systemd-nspawn, docker) =
or even a chroot can be invaluable. schroot on a debian machine works quite=
 well too for something as simple as builds. I end up aliasing bb and bitba=
ke to transparently run in the chroot at all times.<br>

-- <br>Christopher Larson<br>clarson at kergoth dot com<br>Founder - BitBak=
e, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engine=
er, Mentor Graphics
</div></div>

--001a11380ac413ca7204f495c6cf--
