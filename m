Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f196.google.com (mail-io0-f196.google.com
	[209.85.223.196])
	by mail.openembedded.org (Postfix) with ESMTP id 9C05677318
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jun 2016 22:19:17 +0000 (UTC)
Received: by mail-io0-f196.google.com with SMTP id k19so8243590ioi.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Jun 2016 15:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=VrAUIeVXyL+v/ay0anIIL+DJzUqOGRaTNBt5fZAHkZI=;
	b=hFSXZMy82v5UcZdqQDkvWO4TFd7fDfpwQdClB4Fd9JfQzoVIERYxJvzm2qCP53O0W6
	cj0WFXX/90L1AEE3e52eSmh4iuEbbX7iTr2BPRA+Tg+1zFHFTl1lETqolUQ7feLdEl3t
	2yzew4wQuWkoXqkjpBlJZxtrVpgx/UFaDBaIiFEQKwmTOr5qBi6kx0BGxU6Hs6+fwDdZ
	1z8ZJeEcPGkUTNs4ien6X9wKnqpOdB5GPK7VUsSJwRm//ktMrYuZWQ7PpAs0yHtcHfwj
	QKkenp5QHRnXlxm/vBs0KmUgjcWN6ZK+3gLea7ZGX5w/d5tATPWqjLTAOMEWZ4uLkfIr
	yHlw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mentor-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=VrAUIeVXyL+v/ay0anIIL+DJzUqOGRaTNBt5fZAHkZI=;
	b=IR7KjCmRik9T5PwFwDtD4yZu48V/ANqid20Gr8UsXHbe0AqtClzvDu791ciVd+QwT6
	QK+92WObWs8Cw4aTlf/2Su8uMKoCIcXaIPaps/SqZheGdVJublNoAvKNlRjeLQ4uZXss
	LkucHXXAEManchvYmID/3eA5HsH3BgIaPN5U7rDbHDsh4ow/aTC10PU1jfaP9lcRRjH/
	owKamjE4vSYaLxmGkVSbnSaxs4Qi6SGb8ZgCemK2p6S2/hYNyTto+e6/yuK3x7TNvDoK
	4v4EdMZodqsm+vQ4JhRBni5FHDkgMBBw1OM/b9ThP0WkAEkyauWIx7zbpoZxngzDDJBZ
	Piaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=VrAUIeVXyL+v/ay0anIIL+DJzUqOGRaTNBt5fZAHkZI=;
	b=iShzwfGoMnxGrVwgRTiuw6N9CVAwMjncqM+bZ3G1QyQfYLjmEKrt+BrVj4KhH1wy1e
	fDsXTZJOSAX8/IO6cRbq6r/3ZHol3HQVXqPJJZ21DpUQ/+7UXSinljZvYZpXtYj0xRUO
	onCX5GxayXfrh6qP+5SYNfHteXK+/rFoAtsAy/XaRII0ybSk3/P+bi8h/q5SRpmun18V
	MmUMtGJD0va7gol/BMupyE/X3BtjPX9Ip/3qV1HIBo2FR8v4yx8PqYzFkrfZgKKYtouC
	MyrZM+eyAHc7Kc60gR3xtMHSFHb/11oubxXUawajeeTPVaeAM4i+kPfHFG3iLwcMiFYD
	OeLg==
X-Gm-Message-State: ALyK8tIF+FvEvMMwWnWsqBpM/hoaiNs9yGidLDdmVbmhpA0htzn27pgfcZVbHehwvhz9ZsczaIbYDeg8DJq5eg==
X-Received: by 10.107.131.222 with SMTP id n91mr1230455ioi.126.1464905957784; 
	Thu, 02 Jun 2016 15:19:17 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.100.5 with HTTP; Thu, 2 Jun 2016 15:18:58 -0700 (PDT)
In-Reply-To: <16461829.3PMlXGZ7eP@peggleto-mobl.ger.corp.intel.com>
References: <cover.1462987863.git.raj.khem@gmail.com>
	<8934616.REGKCHSCIX@peggleto-mobl.ger.corp.intel.com>
	<2b2ba358-1012-e27a-4b52-502673c218cc@windriver.com>
	<16461829.3PMlXGZ7eP@peggleto-mobl.ger.corp.intel.com>
From: Christopher Larson <chris_larson@mentor.com>
Date: Thu, 2 Jun 2016 15:18:58 -0700
X-Google-Sender-Auth: t5Du5d-ID12Z9rZ-xOvEds1K3FM
Message-ID: <CABcZANmEPWQcfoCT2mQUJHWemPUG5V9-suomGzfT4y4JQt_+mw@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/42] gcc: Add gcc6 recipes
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
X-List-Received-Date: Thu, 02 Jun 2016 22:19:20 -0000
Content-Type: multipart/alternative; boundary=001a113ebd8c3ea861053452ff16

--001a113ebd8c3ea861053452ff16
Content-Type: text/plain; charset=UTF-8

On Thu, Jun 2, 2016 at 12:24 PM, Paul Eggleton <
paul.eggleton@linux.intel.com> wrote:

> On Thu, 02 Jun 2016 15:19:37 Bruce Ashfield wrote:
> > On 2016-06-02 3:15 PM, Paul Eggleton wrote:
> > > On Thu, 02 Jun 2016 18:05:35 Martin Jansa wrote:
> > >> On Wed, Jun 01, 2016 at 10:23:35AM +1200, Paul Eggleton wrote:
> > >>> On Wed, 01 Jun 2016 10:20:23 Paul Eggleton wrote:
> > >>>> On Tue, 31 May 2016 11:12:21 Jussi Kukkonen wrote:
> > >>>>> On 11 May 2016 at 20:35, Khem Raj <raj.khem@gmail.com> wrote:
> > >>>>>> +#BASEURI ?= "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2"
> > >>>>>> +BASEURI ?= "git://
> > >>>>>> github.com/gcc-mirror/gcc;branch=gcc-6-branch;protocol=git"
> > >>>>>
> > >>>>> I guess this is where git2_github.com.gcc-mirror.gcc.tar.gz
> download
> > >>>>> comes from? It increased the size of my downloads-directory by
> >30% --
> > >>>>> and I must have quite a bit of old junk in that directory already.
> > >>>>>
> > >>>>> Is there no other solution to this than a 2.5G git copy (honest
> > >>>>> question, I don't know gcc)?
> > >>>>
> > >>>> We went down this road before and it wasn't great for users. There
> is
> > >>>> at
> > >>>> least a tarball for 6.1, we'd presumably need some patches on top of
> > >>>> that (~43 if we were to simply take what's in the gcc-6-branch
> between
> > >>>> 6.1 and bd9a826, minus the "daily bumps").
> > >>>
> > >>> Perhaps that was a little unclear - when I say "we went down this
> road
> > >>> before" I'm agreeing with Jussi - we pointed to a git branch in a
> > >>> previous release with the same resulting huge download for everyone,
> > >>> something I think we should avoid if at all possible.
> > >>
> > >> Maybe it's biggest but at least there is only one copy of it:
> > >>
> > >> top 10 in my downloads (archives and then git clones).
> > >>
> > >> 823M
> > >> /OE/downloads/git2_git.yoctoproject.org.linux-yocto-3.14.git.tar.gz
> > >> 831M
> > >> /OE/downloads/git2_git.yoctoproject.org.linux-yocto-3.10.git.tar.gz
> > >> 893M
> > >> /OE/downloads/git2_git.yoctoproject.org.linux-yocto-3.17.git.tar.gz
> > >> 934M
> > >> /OE/downloads/git2_git.yoctoproject.org.linux-yocto-3.19.git.tar.gz
> > >> 969M
> > >> /OE/downloads/git2_git.yoctoproject.org.linux-yocto-4.1.git.tar.gz
> > >> 1.2G
> > >> /OE/downloads/git2_git.yoctoproject.org.linux-yocto-dev.git.tar.gz
> > >>
> > >> 2.4G    /OE/downloads/git2_github.com.gcc-mirror.gcc.tar.gz
> > >>
> > >> 854M
> /OE/downloads/git2/github.com.qtproject.qtwebengine-chromium.git
> > >>
> > >> 877M    /OE/downloads/git2/git.yoctoproject.org.linux-yocto-3.10.git
> > >> 900M    /OE/downloads/git2/git.yoctoproject.org.linux-yocto-3.14.git
> > >> 921M    /OE/downloads/git2/git.yoctoproject.org.linux-yocto-3.17.git
> > >> 964M    /OE/downloads/git2/git.yoctoproject.org.linux-yocto-3.19.git
> > >> 999M    /OE/downloads/git2/git.yoctoproject.org.linux-yocto-4.1.git
> > >> 1.3G    /OE/downloads/git2/git.yoctoproject.org.linux-yocto-dev.git
> > >> 2.3G    /OE/downloads/git2/git.yoctoproject.org.linux-yocto-4.4.git
> > >
> > > No argument from me there - it does seem a little wasteful given that
> > > there must be a huge overlap between those repos.
> >
> > In other build systems, I've simply been able to reference a common
> > repository for the majority of the blobs. That isn't an option with
> > oe/bitbake (as far as I know).
>
> It's possible we could add functionality along those lines to at least save
> download time; disk usage would probably be unaffected though.
>
> > We could also do shallow clones, but I'm also unsure of how well that
> > is supported.
>
> I know Chris looked into adding this, I don't recall how far he got.


I did work on shallow support, yes.

Shallow mirror tarball support is on the bitbake list awaiting Richard's
review and merge for 2.2, assuming there are no major objections. There is
a caveat, however. Since git's shallow clone capability is limited to
specifying the depth, we can't really do shallow *clones*, as we don't know
the distance from branch HEAD to SRCREV at the time we're going to clone.

What we can support is shallow mirror tarballs, where a mirror is populated
with shallow mirror tarballs which the user's build will fetch, if
available, instead of full mirror tarballs, and this is what my patch
series implements. Of course, each time the recipe SRCREVs change, we'd get
new shallow tarballs that'd need fetching, enough of those would outweigh
the benefits vs just doing a straight up front clone, but I think the
benefit is clear. A shallow kernel tarball for a repo of this sort is
around 100 megs instead of a gig.

We've been using it at mentor for a while now with good results, so far.
I'd love to see someone other than us test out the patches, though, or give
some feedback on either the concept or the code :) See "[master][PATCH 0/3]
Implement support for shallow git mirror tarballs" on the bitbake-devel
list.
-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a113ebd8c3ea861053452ff16
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Thu, Jun 2, 2016 at 12:24 PM, Paul Eggleton <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:paul.eggleton@linux.intel.com" target=3D"_blank">paul.eggleton@=
linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:s=
olid;border-left-color:rgb(204,204,204);padding-left:1ex"><div><div>On Thu,=
 02 Jun 2016 15:19:37 Bruce Ashfield wrote:<br>
&gt; On 2016-06-02 3:15 PM, Paul Eggleton wrote:<br>
&gt; &gt; On Thu, 02 Jun 2016 18:05:35 Martin Jansa wrote:<br>
&gt; &gt;&gt; On Wed, Jun 01, 2016 at 10:23:35AM +1200, Paul Eggleton wrote=
:<br>
&gt; &gt;&gt;&gt; On Wed, 01 Jun 2016 10:20:23 Paul Eggleton wrote:<br>
&gt; &gt;&gt;&gt;&gt; On Tue, 31 May 2016 11:12:21 Jussi Kukkonen wrote:<br=
>
&gt; &gt;&gt;&gt;&gt;&gt; On 11 May 2016 at 20:35, Khem Raj &lt;<a href=3D"=
mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wro=
te:<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; +#BASEURI ?=3D &quot;${GNU_MIRROR}/gcc/gcc-${=
PV}/gcc-${PV}.tar.bz2&quot;<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; +BASEURI ?=3D &quot;git://<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; <a href=3D"http://github.com/gcc-mirror/gcc;b=
ranch=3Dgcc-6-branch;protocol=3Dgit" rel=3D"noreferrer" target=3D"_blank">g=
ithub.com/gcc-mirror/gcc;branch=3Dgcc-6-branch;protocol=3Dgit</a>&quot;<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt; I guess this is where git2_github.com.gcc-mirror.=
gcc.tar.gz download<br>
&gt; &gt;&gt;&gt;&gt;&gt; comes from? It increased the size of my downloads=
-directory by &gt;30% --<br>
&gt; &gt;&gt;&gt;&gt;&gt; and I must have quite a bit of old junk in that d=
irectory already.<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt; Is there no other solution to this than a 2.5G gi=
t copy (honest<br>
&gt; &gt;&gt;&gt;&gt;&gt; question, I don&#39;t know gcc)?<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt; We went down this road before and it wasn&#39;t great=
 for users. There is<br>
&gt; &gt;&gt;&gt;&gt; at<br>
&gt; &gt;&gt;&gt;&gt; least a tarball for 6.1, we&#39;d presumably need som=
e patches on top of<br>
&gt; &gt;&gt;&gt;&gt; that (~43 if we were to simply take what&#39;s in the=
 gcc-6-branch between<br>
&gt; &gt;&gt;&gt;&gt; 6.1 and bd9a826, minus the &quot;daily bumps&quot;).<=
br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; Perhaps that was a little unclear - when I say &quot;we w=
ent down this road<br>
&gt; &gt;&gt;&gt; before&quot; I&#39;m agreeing with Jussi - we pointed to =
a git branch in a<br>
&gt; &gt;&gt;&gt; previous release with the same resulting huge download fo=
r everyone,<br>
&gt; &gt;&gt;&gt; something I think we should avoid if at all possible.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Maybe it&#39;s biggest but at least there is only one copy of=
 it:<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; top 10 in my downloads (archives and then git clones).<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; 823M<br>
&gt; &gt;&gt; /OE/downloads/git2_git.yoctoproject.org.linux-yocto-3.14.git.=
tar.gz<br>
&gt; &gt;&gt; 831M<br>
&gt; &gt;&gt; /OE/downloads/git2_git.yoctoproject.org.linux-yocto-3.10.git.=
tar.gz<br>
&gt; &gt;&gt; 893M<br>
&gt; &gt;&gt; /OE/downloads/git2_git.yoctoproject.org.linux-yocto-3.17.git.=
tar.gz<br>
&gt; &gt;&gt; 934M<br>
&gt; &gt;&gt; /OE/downloads/git2_git.yoctoproject.org.linux-yocto-3.19.git.=
tar.gz<br>
&gt; &gt;&gt; 969M<br>
&gt; &gt;&gt; /OE/downloads/git2_git.yoctoproject.org.linux-yocto-4.1.git.t=
ar.gz<br>
&gt; &gt;&gt; 1.2G<br>
&gt; &gt;&gt; /OE/downloads/git2_git.yoctoproject.org.linux-yocto-dev.git.t=
ar.gz<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; 2.4G=C2=A0 =C2=A0 /OE/downloads/git2_github.com.gcc-mirror.gc=
c.tar.gz<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; 854M=C2=A0 =C2=A0 /OE/downloads/git2/github.com.qtproject.qtw=
ebengine-chromium.git<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; 877M=C2=A0 =C2=A0 /OE/downloads/git2/git.yoctoproject.org.lin=
ux-yocto-3.10.git<br>
&gt; &gt;&gt; 900M=C2=A0 =C2=A0 /OE/downloads/git2/git.yoctoproject.org.lin=
ux-yocto-3.14.git<br>
&gt; &gt;&gt; 921M=C2=A0 =C2=A0 /OE/downloads/git2/git.yoctoproject.org.lin=
ux-yocto-3.17.git<br>
&gt; &gt;&gt; 964M=C2=A0 =C2=A0 /OE/downloads/git2/git.yoctoproject.org.lin=
ux-yocto-3.19.git<br>
&gt; &gt;&gt; 999M=C2=A0 =C2=A0 /OE/downloads/git2/git.yoctoproject.org.lin=
ux-yocto-4.1.git<br>
&gt; &gt;&gt; 1.3G=C2=A0 =C2=A0 /OE/downloads/git2/git.yoctoproject.org.lin=
ux-yocto-dev.git<br>
&gt; &gt;&gt; 2.3G=C2=A0 =C2=A0 /OE/downloads/git2/git.yoctoproject.org.lin=
ux-yocto-4.4.git<br>
&gt; &gt;<br>
&gt; &gt; No argument from me there - it does seem a little wasteful given =
that<br>
&gt; &gt; there must be a huge overlap between those repos.<br>
&gt;<br>
&gt; In other build systems, I&#39;ve simply been able to reference a commo=
n<br>
&gt; repository for the majority of the blobs. That isn&#39;t an option wit=
h<br>
&gt; oe/bitbake (as far as I know).<br>
<br>
</div></div>It&#39;s possible we could add functionality along those lines =
to at least save<br>
download time; disk usage would probably be unaffected though.<br>
<span><br>
&gt; We could also do shallow clones, but I&#39;m also unsure of how well t=
hat<br>
&gt; is supported.<br>
<br>
</span>I know Chris looked into adding this, I don&#39;t recall how far he =
got.</blockquote></div><div class=3D"gmail_extra"><br></div>I did work on s=
hallow support, yes.</div><div class=3D"gmail_extra"><br>Shallow mirror tar=
ball support is on the bitbake list awaiting Richard&#39;s review and merge=
 for 2.2, assuming there are no major objections. There is a caveat, howeve=
r. Since git&#39;s shallow clone capability is limited to specifying the de=
pth, we can&#39;t really do shallow *clones*, as we don&#39;t know the dist=
ance from branch HEAD to SRCREV at the time we&#39;re going to clone.</div>=
<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">What we can=
 support is shallow mirror tarballs, where a mirror is populated with shall=
ow mirror tarballs which the user&#39;s build will fetch, if available, ins=
tead of full mirror tarballs, and this is what my patch series implements. =
Of course, each time the recipe SRCREVs change, we&#39;d get new shallow ta=
rballs that&#39;d need fetching, enough of those would outweigh the benefit=
s vs just doing a straight up front clone, but I think the benefit is clear=
. A shallow kernel tarball for a repo of this sort is around 100 megs inste=
ad of a gig.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_=
extra">We&#39;ve been using it at mentor for a while now with good results,=
 so far. I&#39;d love to see someone other than us test out the patches, th=
ough, or give some feedback on either the concept or the code :) See &quot;=
[master][PATCH 0/3] Implement support for shallow git mirror tarballs&quot;=
 on the bitbake-devel list.=C2=A0<br>-- <br><div data-smartmail=3D"gmail_si=
gnature"><div dir=3D"ltr">Christopher Larson<br>kergoth at gmail dot com<br=
>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senio=
r Software Engineer, Mentor Graphics</div></div>
</div></div>

--001a113ebd8c3ea861053452ff16--
