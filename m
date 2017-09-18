Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id D782477ACB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Sep 2017 15:18:14 +0000 (UTC)
Received: by mail-io0-f173.google.com with SMTP id w94so2912609ioi.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Sep 2017 08:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xkllyRsVs4RTjwVUzAMai59lTbJmVGp2cKyyW0S3zek=;
	b=rOPER5IobvPR9wFx4HC+nnljcIsrbILPgx0sp6rAlr98SWJdiQaWJzrQ1MfzI0/1oV
	LTYwaqmKmIhS/ewLggYP/0tbxUa95mqa0JTy71Wz87VV52AQnfdj/jk0DpE6iB08xMt9
	vme2pW55ynrhbMmZ97l8bVWeEYUUMT8ANuX4cDu5h4hyVGsd+SuUK4shtNM/mt/m+YfA
	doSL5JxNzCouZeRBx97tZkbBhBgUE+koDG1LqAzTUABawD3OEVfrhTmw25MHTzMwlPaX
	+sEYco36ShVJFu0C+OT/5/MYrYy0NHwCiJn4tbAwhizfiaEPXaJCRVU+KQvAaW138Fbp
	HDAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xkllyRsVs4RTjwVUzAMai59lTbJmVGp2cKyyW0S3zek=;
	b=RvgeqlhRHZl+bHFXMweBYrlTt9LleUczjhP7IHmZSUMxEFziR7kx/4hYezvU/SSj/m
	oGwPRW6l74zmKqPTXuR/WjG97Xu9dkYAX6SW9vM3lvp/MzlN8kFgvnGuF1m1LQ2u9wgp
	daAJ2XCIlQIMa6+XNfryMEhVfCPMGGUByobFF3KmSV70ysJ0UsshEoBrfKkvC4ygpX8x
	CfNDvWRRYH4XhPC1mV7zAOQ92oD2jPYvt4E0q0kAv8gTzaGo6P9VbgdhjhaPgn2972Ng
	soiu0fAbKc5gcaR7x9YiIpPdoFwRRaxG7Oc9FYpp/a9iyEqJv2gpI3Fn0wpK/tk9pFLu
	ONFQ==
X-Gm-Message-State: AHPjjUjzJIbGOkBSefFLQsyREVufd6VMgeyUYC5yN/HOaxIh0DvX1Zoa
	xCMXVXdcjk17M+1hVeeLyXK1Le61fZCeJATW7i54qQ==
X-Google-Smtp-Source: AOwi7QCbZOa9HE2d/h5t9Hq1boaCR2xra63Zk+N+XpF4JcWjHiNyMrW0qGHp4lwtHWQgKcEOmxDwufyamexKJcbGJpc=
X-Received: by 10.107.135.72 with SMTP id j69mr21421348iod.210.1505747895858; 
	Mon, 18 Sep 2017 08:18:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.19.68 with HTTP; Mon, 18 Sep 2017 08:17:55 -0700 (PDT)
In-Reply-To: <a6389819751745fb864af89806f86b5d@XBOX02.axis.com>
References: <1505723966-17120-1-git-send-email-mike.looijmans@topic.nl>
	<da35387ee5e44bd0a4248c41b79d1512@XBOX02.axis.com>
	<660382f7-55b7-39cc-ae2a-afab46301b3c@topic.nl>
	<CAJTo0LY=JnUkd7XMvkpNppc2drcSB8AF9dj_CyxHJRjixZ1uFA@mail.gmail.com>
	<1505743634-13500-1-git-send-email-mike.looijmans@topic.nl>
	<a6389819751745fb864af89806f86b5d@XBOX02.axis.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 18 Sep 2017 16:17:55 +0100
Message-ID: <CAJTo0LaZo2Jhh7Jj=RAUzOzXq_FcXnobu-idL7RFnbq84iR_VA@mail.gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Mike Looijmans <mike.looijmans@topic.nl>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base-files: profile: Get rid of "resize"
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
X-List-Received-Date: Mon, 18 Sep 2017 15:18:15 -0000
Content-Type: multipart/alternative; boundary="001a113f8e70744cfc05597840df"

--001a113f8e70744cfc05597840df
Content-Type: text/plain; charset="UTF-8"

On 18 September 2017 at 16:07, Peter Kjellerstedt <
peter.kjellerstedt@axis.com> wrote:

> > -----Original Message-----
> > From: openembedded-core-bounces@lists.openembedded.org
> > [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> > Mike Looijmans
> > Sent: den 18 september 2017 16:07
> > To: openembedded-core@lists.openembedded.org
> > Cc: Mike Looijmans <mike.looijmans@topic.nl>; Peter Kjellerstedt
> > <peter.kjellerstedt@axis.com>
> > Subject: [OE-core] [PATCH] base-files: profile: Get rid of "resize"
> >
> > The "resize" command actually outputs shell commands to be executed, for
> > example:
> >
> > $ resize
> > COLUMNS=102;
> > LINES=27;
> > export COLUMNS LINES;
> >
> > The output of "resize" is being discarded to /dev/null so the call has no
> > effect whatsoever, and does not change the environment (it cannot change
> the
> > environment of its parent). Remove the call and hence solve the messages
> > about shells missing "command" or "tty" or "resize".
> >
> > Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
> > ---
> >  meta/recipes-core/base-files/base-files/profile | 9 ---------
> >  1 file changed, 9 deletions(-)
> >
> > diff --git a/meta/recipes-core/base-files/base-files/profile
> b/meta/recipes-core/base-files/base-files/profile
> > index a062028..cfd0d69 100644
> > --- a/meta/recipes-core/base-files/base-files/profile
> > +++ b/meta/recipes-core/base-files/base-files/profile
> > @@ -20,15 +20,6 @@ if [ -d /etc/profile.d ]; then
> >       unset i
> >  fi
> >
> > -if command -v resize >/dev/null && command -v tty >/dev/null; then
> > -     # Make sure we are on a serial console (i.e. the device used
> starts with
> > -     # /dev/tty[A-z]), otherwise we confuse e.g. the eclipse launcher
> which
> > -     # tries do use ssh
> > -     case $(tty) in
> > -             /dev/tty[A-z]*) resize >/dev/null;;
> > -     esac
> > -fi
> > -
> >  export PATH PS1 OPIEDIR QPEDIR QTDIR EDITOR TERM
> >
> >  umask 022
> > --
> > 1.9.1
>
> Hold on. Looking at busybox' source code for resize, it seems that
> it actually does something besides outputting the shell code to
> set the variables (which is actually enabled by a separate feature
> called ENABLE_FEATURE_RESIZE_PRINT). It also calls
> ioctl(STDERR_FILENO, TIOCSWINSZ, &w) where w contains the
> calculated sizes.
>

My knowledge of ANSI escapes is incredibly sketchy, but isn't that the code
to *get* the size of the screen?  Put the cursor at 999,999, then ask where
it is?

Ross

--001a113f8e70744cfc05597840df
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 18 September 2017 at 16:07, Peter Kjellerstedt <span di=
r=3D"ltr">&lt;<a href=3D"mailto:peter.kjellerstedt@axis.com" target=3D"_bla=
nk">peter.kjellerstedt@axis.com</a>&gt;</span> wrote:<br><div class=3D"gmai=
l_extra"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div cla=
ss=3D"HOEnZb"><div class=3D"h5">&gt; -----Original Message-----<br>
&gt; From: <a href=3D"mailto:openembedded-core-bounces@lists.openembedded.o=
rg">openembedded-core-bounces@<wbr>lists.openembedded.org</a><br>
&gt; [mailto:<a href=3D"mailto:openembedded-core-bounces@lists.openembedded=
.org">openembedded-core-<wbr>bounces@lists.openembedded.org</a><wbr>] On Be=
half Of<br>
&gt; Mike Looijmans<br>
&gt; Sent: den 18 september 2017 16:07<br>
&gt; To: <a href=3D"mailto:openembedded-core@lists.openembedded.org">openem=
bedded-core@lists.<wbr>openembedded.org</a><br>
&gt; Cc: Mike Looijmans &lt;<a href=3D"mailto:mike.looijmans@topic.nl">mike=
.looijmans@topic.nl</a>&gt;; Peter Kjellerstedt<br>
&gt; &lt;<a href=3D"mailto:peter.kjellerstedt@axis.com">peter.kjellerstedt@=
axis.com</a>&gt;<br>
&gt; Subject: [OE-core] [PATCH] base-files: profile: Get rid of &quot;resiz=
e&quot;<br>
&gt;<br>
&gt; The &quot;resize&quot; command actually outputs shell commands to be e=
xecuted, for<br>
&gt; example:<br>
&gt;<br>
&gt; $ resize<br>
&gt; COLUMNS=3D102;<br>
&gt; LINES=3D27;<br>
&gt; export COLUMNS LINES;<br>
&gt;<br>
&gt; The output of &quot;resize&quot; is being discarded to /dev/null so th=
e call has no<br>
&gt; effect whatsoever, and does not change the environment (it cannot chan=
ge the<br>
&gt; environment of its parent). Remove the call and hence solve the messag=
es<br>
&gt; about shells missing &quot;command&quot; or &quot;tty&quot; or &quot;r=
esize&quot;.<br>
&gt;<br>
&gt; Signed-off-by: Mike Looijmans &lt;<a href=3D"mailto:mike.looijmans@top=
ic.nl">mike.looijmans@topic.nl</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-core/base-files/<wbr>base-files/profile | 9 -------=
--<br>
&gt;=C2=A0 1 file changed, 9 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-core/base-<wbr>files/base-files/profile b/me=
ta/recipes-core/base-<wbr>files/base-files/profile<br>
&gt; index a062028..cfd0d69 100644<br>
&gt; --- a/meta/recipes-core/base-<wbr>files/base-files/profile<br>
&gt; +++ b/meta/recipes-core/base-<wbr>files/base-files/profile<br>
&gt; @@ -20,15 +20,6 @@ if [ -d /etc/profile.d ]; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0unset i<br>
&gt;=C2=A0 fi<br>
&gt;<br>
&gt; -if command -v resize &gt;/dev/null &amp;&amp; command -v tty &gt;/dev=
/null; then<br>
&gt; -=C2=A0 =C2=A0 =C2=A0# Make sure we are on a serial console (i.e. the =
device used starts with<br>
&gt; -=C2=A0 =C2=A0 =C2=A0# /dev/tty[A-z]), otherwise we confuse e.g. the e=
clipse launcher which<br>
&gt; -=C2=A0 =C2=A0 =C2=A0# tries do use ssh<br>
&gt; -=C2=A0 =C2=A0 =C2=A0case $(tty) in<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/dev/tty[A-z]*) resiz=
e &gt;/dev/null;;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0esac<br>
&gt; -fi<br>
&gt; -<br>
&gt;=C2=A0 export PATH PS1 OPIEDIR QPEDIR QTDIR EDITOR TERM<br>
&gt;<br>
&gt;=C2=A0 umask 022<br>
&gt; --<br>
&gt; 1.9.1<br>
<br>
</div></div>Hold on. Looking at busybox&#39; source code for resize, it see=
ms that<br>
it actually does something besides outputting the shell code to<br>
set the variables (which is actually enabled by a separate feature<br>
called ENABLE_FEATURE_RESIZE_PRINT). It also calls<br>
ioctl(STDERR_FILENO, TIOCSWINSZ, &amp;w) where w contains the<br>
calculated sizes.<br></blockquote><div><br></div><div>My knowledge of ANSI =
escapes is incredibly sketchy, but isn&#39;t that the code to *get* the siz=
e of the screen?=C2=A0 Put the cursor at 999,999, then ask where it is?</di=
v><div><br></div><div>Ross=C2=A0</div></div></div></div>

--001a113f8e70744cfc05597840df--
