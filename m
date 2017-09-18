Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 388B971C8A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Sep 2017 18:43:45 +0000 (UTC)
Received: by mail-io0-f179.google.com with SMTP id q11so4420241ioe.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Sep 2017 11:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=TAVQfgufR6uRvqMqMKTU3e3opdWGUIbbQBdtF061oSc=;
	b=SLzDpQlNyoE/vnpFwepQUXZRo+wofZcE7RZOqJS3dGpQCLS8VNDO7O+ZDV2KSDw7su
	teBt7SW1KtgtMCkilfsyrEtPbBxXztLf3zh1DI3rmZpd2dPR5R/2EFLetjq5wo6iscak
	GmUKk/gmli9ySpOWe/lzeSqdUPCdlEpTiDOWdacZdGJ4dHzBjqnKpfqTRzOtzPzUPY1Q
	ZG+7OS+yf5RYIUTVCb6YPXjmacyfyKrU9JSGCz94aMERaKbJ8wIS7Uz6Uy8caK370dzg
	KRnvSiZ70mr6mwqwuHQs4Iii3yXVq5IlLSY/N9t6N6g/Ceux4ZgkvY6cLq9+9XHHqk9Q
	n4JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=TAVQfgufR6uRvqMqMKTU3e3opdWGUIbbQBdtF061oSc=;
	b=O90qWfx/61merazNMS0WyQZn8hE48yfUmtVpvFj6ja1ZbUpYB3D73cIhAXjkq368Df
	hVkfSlZADe6s/K+QwSTCOhHsWCA8KwNTgb/3ZoXIftK+ONvXHeh75KNITZxGL3jWzlQw
	tqh9gFuWeXU2ITURhPZ9wh2nqP7n7Q1Xc6d1TTbTZ1tZUSA0D2tYoNnP1aqr3/eG7RhW
	CPL4WQWmzEq6DNRhQXCgMQwF58XHZASzizpCbZ7OgNkPc30l81naMiJHonW4ndnsyYZj
	Jb7aZJhi4rQpOdDZaB7dPldbXQbl9QlnVbEQXBFXIiw+kDTzTtjKuPx7jeCAJJDO3Ceq
	CtEg==
X-Gm-Message-State: AHPjjUh3AbL7Me/tZRLxC7hrhdZDiN7d0cYJUxL0wuZ3evnxfrh+Lctw
	9RbXIpHEIkw1QclgLngN1cOjfm4jHNjzTVh9HjvulQ==
X-Google-Smtp-Source: AOwi7QDgxB57eAc17nNGVMqVj5g0ZlzO84NrOiYVUsMW09DC/Vd3lgFTnoi/sV8trGGucKyE8BMzjkNOahBLvxqJGm0=
X-Received: by 10.107.133.92 with SMTP id h89mr19215719iod.208.1505760227266; 
	Mon, 18 Sep 2017 11:43:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.19.68 with HTTP; Mon, 18 Sep 2017 11:43:26 -0700 (PDT)
In-Reply-To: <CAJ86T=UqdDrT2ApxMiM=g__pTftCc5g0-gzs20vd-jV06+6x7w@mail.gmail.com>
References: <1505723966-17120-1-git-send-email-mike.looijmans@topic.nl>
	<da35387ee5e44bd0a4248c41b79d1512@XBOX02.axis.com>
	<660382f7-55b7-39cc-ae2a-afab46301b3c@topic.nl>
	<CAJTo0LY=JnUkd7XMvkpNppc2drcSB8AF9dj_CyxHJRjixZ1uFA@mail.gmail.com>
	<1505743634-13500-1-git-send-email-mike.looijmans@topic.nl>
	<a6389819751745fb864af89806f86b5d@XBOX02.axis.com>
	<CAJTo0LaZo2Jhh7Jj=RAUzOzXq_FcXnobu-idL7RFnbq84iR_VA@mail.gmail.com>
	<CAJ86T=UqdDrT2ApxMiM=g__pTftCc5g0-gzs20vd-jV06+6x7w@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 18 Sep 2017 19:43:26 +0100
Message-ID: <CAJTo0LZrPSoVNAX6onFFsGgkD1LEm=2DLdBOecnhNEQBRDnS6A@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Mike Looijmans <mike.looijmans@topic.nl>,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
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
X-List-Received-Date: Mon, 18 Sep 2017 18:43:46 -0000
Content-Type: multipart/alternative; boundary="001a113ff7d076aa7405597b1f92"

--001a113ff7d076aa7405597b1f92
Content-Type: text/plain; charset="UTF-8"

On 18 September 2017 at 19:41, Andre McCurdy <armccurdy@gmail.com> wrote:

> On Mon, Sep 18, 2017 at 8:17 AM, Burton, Ross <ross.burton@intel.com>
> wrote:
> > On 18 September 2017 at 16:07, Peter Kjellerstedt
> > <peter.kjellerstedt@axis.com> wrote:
> >>
> >> > -----Original Message-----
> >> > From: openembedded-core-bounces@lists.openembedded.org
> >> > [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
> Of
> >> > Mike Looijmans
> >> > Sent: den 18 september 2017 16:07
> >> > To: openembedded-core@lists.openembedded.org
> >> > Cc: Mike Looijmans <mike.looijmans@topic.nl>; Peter Kjellerstedt
> >> > <peter.kjellerstedt@axis.com>
> >> > Subject: [OE-core] [PATCH] base-files: profile: Get rid of "resize"
> >> >
> >> > The "resize" command actually outputs shell commands to be executed,
> for
> >> > example:
> >> >
> >> > $ resize
> >> > COLUMNS=102;
> >> > LINES=27;
> >> > export COLUMNS LINES;
> >> >
> >> > The output of "resize" is being discarded to /dev/null so the call has
> >> > no
> >> > effect whatsoever, and does not change the environment (it cannot
> change
> >> > the
> >> > environment of its parent). Remove the call and hence solve the
> messages
> >> > about shells missing "command" or "tty" or "resize".
> >> >
> >> > Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
> >> > ---
> >> >  meta/recipes-core/base-files/base-files/profile | 9 ---------
> >> >  1 file changed, 9 deletions(-)
> >> >
> >> > diff --git a/meta/recipes-core/base-files/base-files/profile
> >> > b/meta/recipes-core/base-files/base-files/profile
> >> > index a062028..cfd0d69 100644
> >> > --- a/meta/recipes-core/base-files/base-files/profile
> >> > +++ b/meta/recipes-core/base-files/base-files/profile
> >> > @@ -20,15 +20,6 @@ if [ -d /etc/profile.d ]; then
> >> >       unset i
> >> >  fi
> >> >
> >> > -if command -v resize >/dev/null && command -v tty >/dev/null; then
> >> > -     # Make sure we are on a serial console (i.e. the device used
> >> > starts with
> >> > -     # /dev/tty[A-z]), otherwise we confuse e.g. the eclipse launcher
> >> > which
> >> > -     # tries do use ssh
> >> > -     case $(tty) in
> >> > -             /dev/tty[A-z]*) resize >/dev/null;;
> >> > -     esac
> >> > -fi
> >> > -
> >> >  export PATH PS1 OPIEDIR QPEDIR QTDIR EDITOR TERM
> >> >
> >> >  umask 022
> >> > --
> >> > 1.9.1
> >>
> >> Hold on. Looking at busybox' source code for resize, it seems that
> >> it actually does something besides outputting the shell code to
> >> set the variables (which is actually enabled by a separate feature
> >> called ENABLE_FEATURE_RESIZE_PRINT). It also calls
> >> ioctl(STDERR_FILENO, TIOCSWINSZ, &w) where w contains the
> >> calculated sizes.
> >
> > My knowledge of ANSI escapes is incredibly sketchy, but isn't that the
> code
> > to *get* the size of the screen?  Put the cursor at 999,999, then ask
> where
> > it is?
>
> The behaviour may have got broken with the various /etc/profile
> rewrites but it certainly did do something useful originally - it
> greatly improves usability for shells run on serial consoles. Please
> don't just remove it.
>

The question is does it do something useful *now*?

Ross

--001a113ff7d076aa7405597b1f92
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 18 September 2017 at 19:41, Andre McCurdy <span dir=3D"=
ltr">&lt;<a href=3D"mailto:armccurdy@gmail.com" target=3D"_blank">armccurdy=
@gmail.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><div =
class=3D"h5">On Mon, Sep 18, 2017 at 8:17 AM, Burton, Ross &lt;<a href=3D"m=
ailto:ross.burton@intel.com">ross.burton@intel.com</a>&gt; wrote:<br>
&gt; On 18 September 2017 at 16:07, Peter Kjellerstedt<br>
&gt; &lt;<a href=3D"mailto:peter.kjellerstedt@axis.com">peter.kjellerstedt@=
axis.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; &gt; -----Original Message-----<br>
&gt;&gt; &gt; From: <a href=3D"mailto:openembedded-core-bounces@lists.opene=
mbedded.org">openembedded-core-bounces@<wbr>lists.openembedded.org</a><br>
&gt;&gt; &gt; [mailto:<a href=3D"mailto:openembedded-core-bounces@lists.ope=
nembedded.org">openembedded-core-<wbr>bounces@lists.openembedded.org</a><wb=
r>] On Behalf Of<br>
&gt;&gt; &gt; Mike Looijmans<br>
&gt;&gt; &gt; Sent: den 18 september 2017 16:07<br>
&gt;&gt; &gt; To: <a href=3D"mailto:openembedded-core@lists.openembedded.or=
g">openembedded-core@lists.<wbr>openembedded.org</a><br>
&gt;&gt; &gt; Cc: Mike Looijmans &lt;<a href=3D"mailto:mike.looijmans@topic=
.nl">mike.looijmans@topic.nl</a>&gt;; Peter Kjellerstedt<br>
&gt;&gt; &gt; &lt;<a href=3D"mailto:peter.kjellerstedt@axis.com">peter.kjel=
lerstedt@axis.com</a>&gt;<br>
&gt;&gt; &gt; Subject: [OE-core] [PATCH] base-files: profile: Get rid of &q=
uot;resize&quot;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; The &quot;resize&quot; command actually outputs shell command=
s to be executed, for<br>
&gt;&gt; &gt; example:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; $ resize<br>
&gt;&gt; &gt; COLUMNS=3D102;<br>
&gt;&gt; &gt; LINES=3D27;<br>
&gt;&gt; &gt; export COLUMNS LINES;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; The output of &quot;resize&quot; is being discarded to /dev/n=
ull so the call has<br>
&gt;&gt; &gt; no<br>
&gt;&gt; &gt; effect whatsoever, and does not change the environment (it ca=
nnot change<br>
&gt;&gt; &gt; the<br>
&gt;&gt; &gt; environment of its parent). Remove the call and hence solve t=
he messages<br>
&gt;&gt; &gt; about shells missing &quot;command&quot; or &quot;tty&quot; o=
r &quot;resize&quot;.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Signed-off-by: Mike Looijmans &lt;<a href=3D"mailto:mike.looi=
jmans@topic.nl">mike.looijmans@topic.nl</a>&gt;<br>
&gt;&gt; &gt; ---<br>
&gt;&gt; &gt;=C2=A0 meta/recipes-core/base-files/<wbr>base-files/profile | =
9 ---------<br>
&gt;&gt; &gt;=C2=A0 1 file changed, 9 deletions(-)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; diff --git a/meta/recipes-core/base-<wbr>files/base-files/pro=
file<br>
&gt;&gt; &gt; b/meta/recipes-core/base-<wbr>files/base-files/profile<br>
&gt;&gt; &gt; index a062028..cfd0d69 100644<br>
&gt;&gt; &gt; --- a/meta/recipes-core/base-<wbr>files/base-files/profile<br=
>
&gt;&gt; &gt; +++ b/meta/recipes-core/base-<wbr>files/base-files/profile<br=
>
&gt;&gt; &gt; @@ -20,15 +20,6 @@ if [ -d /etc/profile.d ]; then<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0unset i<br>
&gt;&gt; &gt;=C2=A0 fi<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; -if command -v resize &gt;/dev/null &amp;&amp; command -v tty=
 &gt;/dev/null; then<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0# Make sure we are on a serial console (=
i.e. the device used<br>
&gt;&gt; &gt; starts with<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0# /dev/tty[A-z]), otherwise we confuse e=
.g. the eclipse launcher<br>
&gt;&gt; &gt; which<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0# tries do use ssh<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0case $(tty) in<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/dev/tty[A-z=
]*) resize &gt;/dev/null;;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0esac<br>
&gt;&gt; &gt; -fi<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt;=C2=A0 export PATH PS1 OPIEDIR QPEDIR QTDIR EDITOR TERM<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 umask 022<br>
&gt;&gt; &gt; --<br>
&gt;&gt; &gt; 1.9.1<br>
&gt;&gt;<br>
&gt;&gt; Hold on. Looking at busybox&#39; source code for resize, it seems =
that<br>
&gt;&gt; it actually does something besides outputting the shell code to<br=
>
&gt;&gt; set the variables (which is actually enabled by a separate feature=
<br>
&gt;&gt; called ENABLE_FEATURE_RESIZE_PRINT). It also calls<br>
&gt;&gt; ioctl(STDERR_FILENO, TIOCSWINSZ, &amp;w) where w contains the<br>
&gt;&gt; calculated sizes.<br>
&gt;<br>
&gt; My knowledge of ANSI escapes is incredibly sketchy, but isn&#39;t that=
 the code<br>
&gt; to *get* the size of the screen?=C2=A0 Put the cursor at 999,999, then=
 ask where<br>
&gt; it is?<br>
<br>
</div></div>The behaviour may have got broken with the various /etc/profile=
<br>
rewrites but it certainly did do something useful originally - it<br>
greatly improves usability for shells run on serial consoles. Please<br>
don&#39;t just remove it.<br></blockquote><div><br></div><div>The question =
is does it do something useful *now*?</div><div><br></div><div>Ross=C2=A0</=
div></div></div></div>

--001a113ff7d076aa7405597b1f92--
