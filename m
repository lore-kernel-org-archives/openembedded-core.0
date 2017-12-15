Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f45.google.com (mail-it0-f45.google.com
	[209.85.214.45])
	by mail.openembedded.org (Postfix) with ESMTP id A186072F42
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Dec 2017 12:34:26 +0000 (UTC)
Received: by mail-it0-f45.google.com with SMTP id r6so18613682itr.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Dec 2017 04:34:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=V3pYWbF2+487lHsG7eqOfnU4weiEwSPM5A6RRXFdbmM=;
	b=SxPDM2goq5tAEkzS3+kf19gDiPhk1YD4Jvvxnagpv9RPA9sM/L6yRZ3Uc1U+DBdnLs
	X2P/s1hcibmlBUR8Ozv5omBi9YwFGh2E2W1ZugFfF0tIStQYZAVB1R4sMcu0r0U3uW7e
	f2JoLEWhfmKnqgOTLWbXuthl/J0uqMexDDpQcf5g6EfVVP6QvbffDCNLBvisqPHjq0i9
	Rc/pPN3WGChg3sxuqWtc48SqIvJieg7GE8O6sQu0T4TlIsH6mSIhdkiaosS/5tMpdf67
	FDwVid/gzSZQDcefYqV9Brl2zRsaXklrO8CwD344OTddIM3Tzkc86AlNaem+11EOu9Me
	dXdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=V3pYWbF2+487lHsG7eqOfnU4weiEwSPM5A6RRXFdbmM=;
	b=UlOHHNRV6RzvWskY/aYXFvutfDbAkjumSztHQgF5BK6J8JLs2/b8IwVUrx8JS7c656
	l/XyHioXKyRyQ3zxB7w/MPnCDWVRpeYqPJeFB9kkIUnHxiY75DMLxyMp9ybdB4oMg591
	JY+tY7lJF9yHrSR2y0uTBmwpDwrpAv8qL8uTJjwQ+DNlsZfUyh9TDW7r1olhTZKJD6kS
	5KsxLR+IwQKBsOZG68x1k30boMaHxqiNvl/NsZNhcvZycKqmyev8jeCw027MF8OH0tF8
	2f684Ly5BV9rF3iwUyyJJeOD0MpKHAtjR5+E2JRRln2YamSGMtp48sPtr/+XM1DF8yU9
	WfKQ==
X-Gm-Message-State: AKGB3mJBAc4v95Nrmx5396TH+OrTk2hIHi0jaiMd3CWYR4/mu+kReNJu
	UMk/y9CzAeINSPJgut/Z/hE8JNrdRIdmgnU4tmwcPQ==
X-Google-Smtp-Source: ACJfBot9on+p+qP59sdZcKrVxNmMLgHvofEkKfRNxi2v4+pYcp1cSlgt03Z/ORqX6mGXjP0Sd803Re3ryG1zJLRJ/a8=
X-Received: by 10.36.120.11 with SMTP id p11mr7859246itc.10.1513341267563;
	Fri, 15 Dec 2017 04:34:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.59.10 with HTTP; Fri, 15 Dec 2017 04:34:06 -0800 (PST)
In-Reply-To: <1513209861.16507.15.camel@linuxfoundation.org>
References: <1513168490.19417.183.camel@linuxfoundation.org>
	<694b540b-1fc8-0388-5419-01c6e3f100c6@windriver.com>
	<1513173904.16507.1.camel@linuxfoundation.org>
	<85f7c521-01c4-7870-0f57-7ca217fce8e3@windriver.com>
	<1513174448.16507.8.camel@linuxfoundation.org>
	<2df34489-8c8f-bd76-3972-7ab648aeffee@windriver.com>
	<1513209861.16507.15.camel@linuxfoundation.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 15 Dec 2017 12:34:06 +0000
Message-ID: <CAJTo0Lb7KXLe+RBxcHHF0HBeQOTH1HmnUhkDY--9ib4CMBdZww@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>, "Lock,
	Joshua" <joshua.g.lock@intel.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Fix for the APIC hangs in qemux86-64
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
X-List-Received-Date: Fri, 15 Dec 2017 12:34:26 -0000
Content-Type: multipart/alternative; boundary="001a114a9b5ead753e0560603820"

--001a114a9b5ead753e0560603820
Content-Type: text/plain; charset="UTF-8"

Whoops.  Maybe I should have been clearer... Sorry!

Ross

On 14 December 2017 at 00:04, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Wed, 2017-12-13 at 19:01 -0500, Bruce Ashfield wrote:
> > On 2017-12-13 9:14 AM, Richard Purdie wrote:
> > >
> > > On Wed, 2017-12-13 at 09:07 -0500, Bruce Ashfield wrote:
> > > >
> > > > On 12/13/2017 09:05 AM, Richard Purdie wrote:
> > > > >
> > > > >
> > > > > On Wed, 2017-12-13 at 08:38 -0500, Bruce Ashfield wrote:
> > > > > >
> > > > > >
> > > > > > On 12/13/2017 07:34 AM, Richard Purdie wrote:
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > > > Hi Bruce,
> > > > > > >
> > > > > > > https://bugzilla.yoctoproject.org/show_bug.cgi?id=12301
> > > > > > >
> > > > > > > We've root caused the hangs we're seeing in qemux86-64 on
> > > > > > > our
> > > > > > > autobuilder workers. We've identified a commit on 4.15-rc3
> > > > > > > which
> > > > > > > fixes
> > > > > > > the issue but backporting it to the autobuilder's host
> > > > > > > kernels
> > > > > > > will
> > > > > > > be
> > > > > > > a pain.
> > > > > > >
> > > > > > > As a workaround I'd like to enable x2apic on qemux86-64.
> > > > > > > Since
> > > > > > > that
> > > > > > > works via MSRs it avoids the problem.
> > > > > > >
> > > > > > > Would it be a big issue to set CONFIG_X86_X2APIC=y for
> > > > > > > qemux86-
> > > > > > > 64?
> > > > > > Nope. No big deal at all. I've used the same config i the
> > > > > > past
> > > > > > when doing work with rt-KVM, so I know it well.
> > > > > >
> > > > > > I'll prep a commit, and send it along as part of a rebased
> > > > > > set
> > > > > > of kernel patches.
> > > > > Thanks, much appreciated.
> > > > >
> > > > > Did we get to the bottom of the 4.12 selftest failures?
> > > > >
> > > > Not yet no. I was distracted for a day, but need to learn how
> > > > to run them myself. I was able to log in via serial in my normal
> > > > boot flow, so that didn't get me anywhere.
> > > >
> > > > Is the selftest HOWO in the yocto docs ? I'll google it up this
> > > > morning.
> > > No HOWTO but I did give you the command. In a poky checkout run:
> > >
> > > oe-selftest -r runqemu.RunqemuTests.test_boot_deploy
> > >
> > > which runs a single test that fails (setup DL_DIR/SSTATE_MIRRORS
> > > first
> > > to speed it up a bit).
> > >
> > > It may tell you to clear SANITY_TESTED_DISTROS, I think it auto
> > > adds
> > > meta-selftest now. You may also need to set DISPLAY to something
> > > (e.g.
> > > a dummy vncserver).
> > >
> > With the cleanup that Ross gave me, I'm now able to see the issue.
> >
> > I'll start debugging on Thursday.
> >
> > One additional question: what's the right way to find the logs of
> > that
> > run ?
> >
> > I'm getting a bit of noise from:
> >
> > ----------------
> >       0155:            else:
> > Exception: FileNotFoundError: [Errno 2] No such file or directory:
> > '/home/bruce/poky/build/tmp/sysroots-components/x86_64/python3-
> > native/usr/lib/python3.5/sqlite3/__pycache__/dump.cpython-35.opt-
> > 1.pyc'
> > ->
> > '/home/bruce/poky/build/tmp/work/core2-64-poky-linux/gnu-efi/3.0.6-
> > r0/recipe-sysroot-
> > native/usr/lib/python3.5/sqlite3/__pycache__/dump.cpython-35.opt-
> > 1.pyc'
> >
> > ERROR: gnu-efi-3.0.6-r0 do_package: Function failed:
> > extend_recipe_sysroot
> > ERROR: Logfile of failure stored in:
> > /home/bruce/poky/build/tmp/work/core2-64-poky-linux/gnu-efi/3.0.6-
> > r0/temp/log.do_package.10495
>
> You've deleted pyc files from python itself which is bad. I'd
> cleansstate python-native and rebuilt it to fix that. Ross meant onto
> to run it on the poky meta directory...
>
> Cheers,
>
> Richard
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a114a9b5ead753e0560603820
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Whoops.=C2=A0 Maybe I should have been clearer... Sorry!<d=
iv><br></div><div>Ross</div></div><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote">On 14 December 2017 at 00:04, Richard Purdie <span dir=3D"=
ltr">&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_b=
lank">richard.purdie@linuxfoundation.org</a>&gt;</span> wrote:<br><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex"><div class=3D"HOEnZb"><div class=3D"h5">On Wed, 2017-=
12-13 at 19:01 -0500, Bruce Ashfield wrote:<br>
&gt; On 2017-12-13 9:14 AM, Richard Purdie wrote:<br>
&gt; &gt;<br>
&gt; &gt; On Wed, 2017-12-13 at 09:07 -0500, Bruce Ashfield wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On 12/13/2017 09:05 AM, Richard Purdie wrote:<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; On Wed, 2017-12-13 at 08:38 -0500, Bruce Ashfield wrote=
:<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; On 12/13/2017 07:34 AM, Richard Purdie wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; Hi Bruce,<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; <a href=3D"https://bugzilla.yoctoproject.org/=
show_bug.cgi?id=3D12301" rel=3D"noreferrer" target=3D"_blank">https://bugzi=
lla.yoctoproject.<wbr>org/show_bug.cgi?id=3D12301</a><br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; We&#39;ve root caused the hangs we&#39;re see=
ing in qemux86-64 on<br>
&gt; &gt; &gt; &gt; &gt; &gt; our<br>
&gt; &gt; &gt; &gt; &gt; &gt; autobuilder workers. We&#39;ve identified a c=
ommit on 4.15-rc3<br>
&gt; &gt; &gt; &gt; &gt; &gt; which<br>
&gt; &gt; &gt; &gt; &gt; &gt; fixes<br>
&gt; &gt; &gt; &gt; &gt; &gt; the issue but backporting it to the autobuild=
er&#39;s host<br>
&gt; &gt; &gt; &gt; &gt; &gt; kernels<br>
&gt; &gt; &gt; &gt; &gt; &gt; will<br>
&gt; &gt; &gt; &gt; &gt; &gt; be<br>
&gt; &gt; &gt; &gt; &gt; &gt; a pain.<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; As a workaround I&#39;d like to enable x2apic=
 on qemux86-64.<br>
&gt; &gt; &gt; &gt; &gt; &gt; Since<br>
&gt; &gt; &gt; &gt; &gt; &gt; that<br>
&gt; &gt; &gt; &gt; &gt; &gt; works via MSRs it avoids the problem.<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; Would it be a big issue to set CONFIG_X86_X2A=
PIC=3Dy for<br>
&gt; &gt; &gt; &gt; &gt; &gt; qemux86-<br>
&gt; &gt; &gt; &gt; &gt; &gt; 64?<br>
&gt; &gt; &gt; &gt; &gt; Nope. No big deal at all. I&#39;ve used the same c=
onfig i the<br>
&gt; &gt; &gt; &gt; &gt; past<br>
&gt; &gt; &gt; &gt; &gt; when doing work with rt-KVM, so I know it well.<br=
>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; I&#39;ll prep a commit, and send it along as part =
of a rebased<br>
&gt; &gt; &gt; &gt; &gt; set<br>
&gt; &gt; &gt; &gt; &gt; of kernel patches.<br>
&gt; &gt; &gt; &gt; Thanks, much appreciated.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Did we get to the bottom of the 4.12 selftest failures?=
<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; Not yet no. I was distracted for a day, but need to learn ho=
w<br>
&gt; &gt; &gt; to run them myself. I was able to log in via serial in my no=
rmal<br>
&gt; &gt; &gt; boot flow, so that didn&#39;t get me anywhere.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Is the selftest HOWO in the yocto docs ? I&#39;ll google it =
up this<br>
&gt; &gt; &gt; morning.<br>
&gt; &gt; No HOWTO but I did give you the command. In a poky checkout run:<=
br>
&gt; &gt;<br>
&gt; &gt; oe-selftest -r runqemu.RunqemuTests.test_<wbr>boot_deploy<br>
&gt; &gt;<br>
&gt; &gt; which runs a single test that fails (setup DL_DIR/SSTATE_MIRRORS<=
br>
&gt; &gt; first<br>
&gt; &gt; to speed it up a bit).<br>
&gt; &gt;<br>
&gt; &gt; It may tell you to clear SANITY_TESTED_DISTROS, I think it auto<b=
r>
&gt; &gt; adds<br>
&gt; &gt; meta-selftest now. You may also need to set DISPLAY to something<=
br>
&gt; &gt; (e.g.<br>
&gt; &gt; a dummy vncserver).<br>
&gt; &gt;<br>
&gt; With the cleanup that Ross gave me, I&#39;m now able to see the issue.=
<br>
&gt;<br>
&gt; I&#39;ll start debugging on Thursday.<br>
&gt;<br>
&gt; One additional question: what&#39;s the right way to find the logs of<=
br>
&gt; that<br>
&gt; run ?<br>
&gt;<br>
&gt; I&#39;m getting a bit of noise from:<br>
&gt;<br>
&gt; ----------------<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00155:=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0else:<br>
&gt; Exception: FileNotFoundError: [Errno 2] No such file or directory:=C2=
=A0<br>
&gt; &#39;/home/bruce/poky/build/tmp/<wbr>sysroots-components/x86_64/<wbr>p=
ython3-<br>
&gt; native/usr/lib/python3.5/<wbr>sqlite3/__pycache__/dump.<wbr>cpython-35=
.opt-<br>
&gt; 1.pyc&#39;=C2=A0<br>
&gt; -&gt;=C2=A0<br>
&gt; &#39;/home/bruce/poky/build/tmp/<wbr>work/core2-64-poky-linux/gnu-<wbr=
>efi/3.0.6-<br>
&gt; r0/recipe-sysroot-<br>
&gt; native/usr/lib/python3.5/<wbr>sqlite3/__pycache__/dump.<wbr>cpython-35=
.opt-<br>
&gt; 1.pyc&#39;<br>
&gt;<br>
&gt; ERROR: gnu-efi-3.0.6-r0 do_package: Function failed:<br>
&gt; extend_recipe_sysroot<br>
&gt; ERROR: Logfile of failure stored in:=C2=A0<br>
&gt; /home/bruce/poky/build/tmp/<wbr>work/core2-64-poky-linux/gnu-<wbr>efi/=
3.0.6-<br>
&gt; r0/temp/log.do_package.10495<br>
<br>
</div></div>You&#39;ve deleted pyc files from python itself which is bad. I=
&#39;d<br>
cleansstate python-native and rebuilt it to fix that. Ross meant onto<br>
to run it on the poky meta directory...<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br></div>

--001a114a9b5ead753e0560603820--
