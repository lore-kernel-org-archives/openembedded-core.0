Return-Path: <kergoth@gmail.com>
Received: from mail-la0-f48.google.com (mail-la0-f48.google.com
	[209.85.215.48])
	by mail.openembedded.org (Postfix) with ESMTP id 8931160289
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2013 13:28:24 +0000 (UTC)
Received: by mail-la0-f48.google.com with SMTP id lx15so6643790lab.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2013 06:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=WgPCvd9+xj12ZLcoLg7+HJND4GxKN/jHCRtZAdC2GvY=;
	b=xe+jFW/8FnyP+vPNmJB0B5kZE5xupY9YPRq5ZHoyrs7zswur59Ft+/SAIs87LbzWg6
	Zq+PO1yEQLJIup8y7ZPtoDvUZFWVhHc7cK2masnEPHu4DTAOQXM8O+gT7bY72jkChcAX
	PwfD1GDfp7f2yatxynYuY0hFycZfZ+q/TzzWVpW7X//mHiL3MzHb8onJI4kZJgRAf+k8
	oJrXhPjSQR9PzUAf4sXjzso7RudFsUnWr3Pj3JBLVjrkxaCYAA9Qbw8EnAcEWnSW7pv6
	MgG/CpCaDlh+9wPL1ORmrXpT4I0MjbEh6eJ7j75LxA+qJlq2125u1Ti1G9eT9m3qjhKj
	7ANw==
X-Received: by 10.112.140.231 with SMTP id rj7mr17622190lbb.16.1373549304574; 
	Thu, 11 Jul 2013 06:28:24 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.3.5 with HTTP; Thu, 11 Jul 2013 06:28:04 -0700 (PDT)
In-Reply-To: <20130711123810.GJ3288@jama>
References: <20130706213931.GD3288@jama>
	<1373459893-23611-1-git-send-email-Martin.Jansa@gmail.com>
	<20130711123810.GJ3288@jama>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 11 Jul 2013 06:28:04 -0700
X-Google-Sender-Auth: CEUjPzgwZyWNKYduNG_xknGb5gw
Message-ID: <CABcZANmtvgEeJNoXe_E1CrmoCVn2CZ_kto6CE5UAXix05=Vchg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2] test-dependencies: add simple script to detect missing or autoenabled dependencies
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
X-List-Received-Date: Thu, 11 Jul 2013 13:28:25 -0000
Content-Type: multipart/alternative; boundary=001a11c26a30617c2504e13c5e7d

--001a11c26a30617c2504e13c5e7d
Content-Type: text/plain; charset=UTF-8

On Thu, Jul 11, 2013 at 5:38 AM, Martin Jansa <martin.jansa@gmail.com>wrote:

> On Wed, Jul 10, 2013 at 02:38:13PM +0200, Martin Jansa wrote:
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  scripts/test-dependencies.sh | 253
> +++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 253 insertions(+)
> >  create mode 100755 scripts/test-dependencies.sh
> >
> > +    echo "!!!Removing tmpdir \"$tmpdir\"!!!"
> > +    rm -rf $tmpdir/cache $tmpdir/deploy $tmpdir/pkgdata
> $tmpdir/sstate-control $tmpdir/stamps $tmpdir/sysroots $tmpdir/work
> $tmpdir/work-shared 2>/dev/null
>
> I'll send v3 which doesn't remove $tmpdir/cache between the builds, it
> takes too long already without reparsing all recipes every time.
>
> Originally I was removing it as work around for
> http://lists.openembedded.org/pipermail/bitbake-devel/2013-July/003624.html
> but that's not needed for master and people probably won't be changing
> PNBLACKLIST while this script is running.
>

This is quite an interesting script. It looks quite similar to my
greedy-deps-tests[1] script, though you've taken it a step further in
adding builds #3 and #4.

1. https://github.com/kergoth/oe-test-scripts#oe-test-scripts
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a11c26a30617c2504e13c5e7d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Thu, Jul 11, 2013 at 5:38 AM, Martin Jansa <span dir=3D"ltr">&lt;<a href=
=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com=
</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><div class=3D"im">On Wed, Jul 10, 2013 at 02:38:13PM +0200=
, Martin Jansa wrote:<br>


</div><div class=3D"im">&gt; Signed-off-by: Martin Jansa &lt;<a href=3D"mai=
lto:Martin.Jansa@gmail.com">Martin.Jansa@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0scripts/test-dependencies.sh | 253 +++++++++++++++++++++++++++++=
++++++++++++++<br>
&gt; =C2=A01 file changed, 253 insertions(+)<br>
&gt; =C2=A0create mode 100755 scripts/test-dependencies.sh<br>
&gt;<br>
</div><div class=3D"im">&gt; + =C2=A0 =C2=A0echo &quot;!!!Removing tmpdir \=
&quot;$tmpdir\&quot;!!!&quot;<br>
&gt; + =C2=A0 =C2=A0rm -rf $tmpdir/cache $tmpdir/deploy $tmpdir/pkgdata $tm=
pdir/sstate-control $tmpdir/stamps $tmpdir/sysroots $tmpdir/work $tmpdir/wo=
rk-shared 2&gt;/dev/null<br>
<br>
</div>I&#39;ll send v3 which doesn&#39;t remove $tmpdir/cache between the b=
uilds, it<br>
takes too long already without reparsing all recipes every time.<br>
<br>
Originally I was removing it as work around for<br>
<a href=3D"http://lists.openembedded.org/pipermail/bitbake-devel/2013-July/=
003624.html" target=3D"_blank">http://lists.openembedded.org/pipermail/bitb=
ake-devel/2013-July/003624.html</a><br>
but that&#39;s not needed for master and people probably won&#39;t be chang=
ing<br>
PNBLACKLIST while this script is running.<br>
<div class=3D""></div></blockquote></div><br>This is quite an interesting s=
cript. It looks quite similar to my greedy-deps-tests[1] script, though you=
&#39;ve taken it a step further in adding builds #3 and #4.<br><br clear=3D=
"all">

<div>1.=C2=A0<a href=3D"https://github.com/kergoth/oe-test-scripts#oe-test-=
scripts">https://github.com/kergoth/oe-test-scripts#oe-test-scripts</a></di=
v>-- <br>Christopher Larson<br>clarson at kergoth dot com<br>Founder - BitB=
ake, OpenEmbedded, OpenZaurus<br>

Maintainer - Tslib<br>Senior Software Engineer, Mentor Graphics
</div></div>

--001a11c26a30617c2504e13c5e7d--
