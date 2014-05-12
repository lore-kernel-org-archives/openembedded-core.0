Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f170.google.com (unknown [209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id AF09B605B2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 May 2014 05:03:28 +0000 (UTC)
Received: by mail-ig0-f170.google.com with SMTP id r10so4242834igi.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 May 2014 22:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=T19k4cB7/zXhBm6YJqvHVXYF/396u21HdOlaFktqhdg=;
	b=O0YkPciJvDHdFLauf68tM1G49oPTPe5di/71++Qrbb4WSNZDgfim6gIjkh4eND+MOe
	Sz8Y8jis06vPCxDy4n/XBGDbvnCOmchhzTtUhHyg7BhHfD/5HUQ7odiD4JTJLNlx7Lsh
	tCgRCUzvjACWZIVGni+Nxp3Zknu2juERl4u5t9i1rw4NN2OoNqVor6Tnsu3dp4BLqaiv
	3Ztmv+qV6dPA16wtGAM+pXYDNhrT7MJNGAPVyJgKTxA+UWl/LZcyxXU+6TPfhOT5CQyt
	dqA8d/4a7hoVgjG70P8HPVRutSeidVwaelQFaIqUX2M4soY9/ezeADNY/9DoCpLHLnaX
	gvSg==
MIME-Version: 1.0
X-Received: by 10.50.20.8 with SMTP id j8mr22727951ige.17.1399871009812; Sun,
	11 May 2014 22:03:29 -0700 (PDT)
Received: by 10.50.79.133 with HTTP; Sun, 11 May 2014 22:03:29 -0700 (PDT)
In-Reply-To: <1E758580-2234-4832-B3F7-2848343DFA89@icloud.com>
References: <874B01E8-8A61-442E-981C-3FCE0763854E@icloud.com>
	<CAMKF1so70jmiMNdfT_sBvnfHRd5zQNS-6LL3JufMs5H__+765A@mail.gmail.com>
	<1E758580-2234-4832-B3F7-2848343DFA89@icloud.com>
Date: Sun, 11 May 2014 22:03:29 -0700
Message-ID: <CAMKF1srUPfNFCVNVunUTbyzx1B3te3WVnCsUkTncgrc-p3Fh7w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Andrew Blackburn <andyblac@icloud.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: talloc build error
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
X-List-Received-Date: Mon, 12 May 2014 05:03:35 -0000
Content-Type: multipart/alternative; boundary=047d7bd752664578f504f92cde38

--047d7bd752664578f504f92cde38
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sunday, May 11, 2014, Andrew Blackburn <andyblac@icloud.com> wrote:

> cheers guy=E2=80=99s
>
> thats worked using autotools-brokensep instead of autotools, =E2=80=98
> wvstreams_4.6.1.bb=E2=80=99 also needed this too.
>
>
Care to submit patch ?


> best regards
>
> andy.
>
> On 11 May 2014, at 23:46, Khem Raj <raj.khem@gmail.com <javascript:;>>
> wrote:
>
> > On Sun, May 11, 2014 at 9:29 AM, Andrew Blackburn <andyblac@icloud.com<=
javascript:;>>
> wrote:
> >> hi all,
> >>
> >> i recently merged =E2=80=98meta-openembedded=E2=80=99 master into my b=
ranch, but i am
> now getting a build error with tallow, below is the erro i am getting, ca=
n
> anyone help on how to fix.
> >
> > It could be that S !=3D B change might be impacting this recipe. Can yo=
u
> > change the recipe to inherit autotools-brokensep instead of autotools
> > class.
> >
> >>
> >>
> >> NOTE: Preparing runqueue
> >> NOTE: Executing SetScene Tasks
> >> NOTE: Executing RunQueue Tasks
> >> ERROR: Function failed: do_configure (log file is located at
> /home/vix/oe-alliance/builds/openvix/tmp/work/mips32el-oe-linux/talloc/ta=
lloc-2.0.1-r2/temp/log.do_configure.9168)
> >> ERROR: Logfile of failure stored in:
> /home/vix/oe-alliance/builds/openvix/tmp/work/mips32el-oe-linux/talloc/ta=
lloc-2.0.1-r2/temp/log.do_configure.9168
> >> Log data follows:
> >> | DEBUG: Executing python function sysroot_cleansstate
> >> | DEBUG: Python function sysroot_cleansstate finished
> >> | DEBUG: SITE files ['endian-little', 'bit-32', 'mips-common',
> 'common-linux', 'common-glibc', 'mipsel-linux', 'common']
> >> | DEBUG: Executing shell function autotools_preconfigure
> >> | DEBUG: Shell function autotools_preconfigure finished
> >> | DEBUG: Executing python function autotools_copy_aclocals
> >> | DEBUG: Python function autotools_copy_aclocals finished
> >> | DEBUG: Executing shell function do_configure
> >> | gnu-configize: 'configure.ac' or 'configure.in' is required
> >> | WARNING:
> /home/vix/oe-alliance/builds/openvix/tmp/work/mips32el-oe-linux/talloc/ta=
lloc-2.0.1-r2/temp/run.do_configure.9168:1
> exit 1 from
> >> |   gnu-configize
> >> | ERROR: Function failed: do_configure (log file is located at
> /home/vix/oe-alliance/builds/openvix/tmp/work/mips32el-oe-linux/talloc/ta=
lloc-2.0.1-r2/temp/log.do_configure.9168)
> >> ERROR: Task 4967
> (/home/vix/oe-alliance/meta-openembedded/meta-oe/recipes-support/talloc/
> talloc_2.0.1.bb, do_configure) failed with exit code =E2=80=981'
> >>
> >>
> >>
> >> hope someone can help
> >>
> >>
> >> cheers
> >> Andy.
> >> --
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org <javascript:;>
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org <javascript:;>
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--047d7bd752664578f504f92cde38
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Sunday, May 11, 2014, Andrew Blackburn &lt;<a href=3D"mailto:and=
yblac@icloud.com">andyblac@icloud.com</a>&gt; wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">
cheers guy=E2=80=99s<br>
<br>
thats worked using autotools-brokensep instead of autotools, =E2=80=98<a hr=
ef=3D"http://wvstreams_4.6.1.bb" target=3D"_blank">wvstreams_4.6.1.bb</a>=
=E2=80=99 also needed this too.<br>
<br></blockquote><div><br></div><div>Care to submit patch ?</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">
best regards<br>
<br>
andy.<br>
<br>
On 11 May 2014, at 23:46, Khem Raj &lt;<a href=3D"javascript:;" onclick=3D"=
_e(event, &#39;cvml&#39;, &#39;raj.khem@gmail.com&#39;)">raj.khem@gmail.com=
</a>&gt; wrote:<br>
<br>
&gt; On Sun, May 11, 2014 at 9:29 AM, Andrew Blackburn &lt;<a href=3D"javas=
cript:;" onclick=3D"_e(event, &#39;cvml&#39;, &#39;andyblac@icloud.com&#39;=
)">andyblac@icloud.com</a>&gt; wrote:<br>
&gt;&gt; hi all,<br>
&gt;&gt;<br>
&gt;&gt; i recently merged =E2=80=98meta-openembedded=E2=80=99 master into =
my branch, but i am now getting a build error with tallow, below is the err=
o i am getting, can anyone help on how to fix.<br>
&gt;<br>
&gt; It could be that S !=3D B change might be impacting this recipe. Can y=
ou<br>
&gt; change the recipe to inherit autotools-brokensep instead of autotools<=
br>
&gt; class.<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; NOTE: Preparing runqueue<br>
&gt;&gt; NOTE: Executing SetScene Tasks<br>
&gt;&gt; NOTE: Executing RunQueue Tasks<br>
&gt;&gt; ERROR: Function failed: do_configure (log file is located at /home=
/vix/oe-alliance/builds/openvix/tmp/work/mips32el-oe-linux/talloc/talloc-2.=
0.1-r2/temp/log.do_configure.9168)<br>
&gt;&gt; ERROR: Logfile of failure stored in: /home/vix/oe-alliance/builds/=
openvix/tmp/work/mips32el-oe-linux/talloc/talloc-2.0.1-r2/temp/log.do_confi=
gure.9168<br>
&gt;&gt; Log data follows:<br>
&gt;&gt; | DEBUG: Executing python function sysroot_cleansstate<br>
&gt;&gt; | DEBUG: Python function sysroot_cleansstate finished<br>
&gt;&gt; | DEBUG: SITE files [&#39;endian-little&#39;, &#39;bit-32&#39;, &#=
39;mips-common&#39;, &#39;common-linux&#39;, &#39;common-glibc&#39;, &#39;m=
ipsel-linux&#39;, &#39;common&#39;]<br>
&gt;&gt; | DEBUG: Executing shell function autotools_preconfigure<br>
&gt;&gt; | DEBUG: Shell function autotools_preconfigure finished<br>
&gt;&gt; | DEBUG: Executing python function autotools_copy_aclocals<br>
&gt;&gt; | DEBUG: Python function autotools_copy_aclocals finished<br>
&gt;&gt; | DEBUG: Executing shell function do_configure<br>
&gt;&gt; | gnu-configize: &#39;<a href=3D"http://configure.ac" target=3D"_b=
lank">configure.ac</a>&#39; or &#39;<a href=3D"http://configure.in" target=
=3D"_blank">configure.in</a>&#39; is required<br>
&gt;&gt; | WARNING: /home/vix/oe-alliance/builds/openvix/tmp/work/mips32el-=
oe-linux/talloc/talloc-2.0.1-r2/temp/run.do_configure.9168:1 exit 1 from<br=
>
&gt;&gt; | =C2=A0 gnu-configize<br>
&gt;&gt; | ERROR: Function failed: do_configure (log file is located at /ho=
me/vix/oe-alliance/builds/openvix/tmp/work/mips32el-oe-linux/talloc/talloc-=
2.0.1-r2/temp/log.do_configure.9168)<br>
&gt;&gt; ERROR: Task 4967 (/home/vix/oe-alliance/meta-openembedded/meta-oe/=
recipes-support/talloc/<a href=3D"http://talloc_2.0.1.bb" target=3D"_blank"=
>talloc_2.0.1.bb</a>, do_configure) failed with exit code =E2=80=981&#39;<b=
r>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; hope someone can help<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; cheers<br>
&gt;&gt; Andy.<br>
&gt;&gt; --<br>
&gt;&gt; _______________________________________________<br>
&gt;&gt; Openembedded-core mailing list<br>
&gt;&gt; <a href=3D"javascript:;" onclick=3D"_e(event, &#39;cvml&#39;, &#39=
;Openembedded-core@lists.openembedded.org&#39;)">Openembedded-core@lists.op=
enembedded.org</a><br>
&gt;&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo=
/openembedded-core</a><br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"javascript:;" onclick=3D"_e(event, &#39;cvml&#39;, &#39;Openembe=
dded-core@lists.openembedded.org&#39;)">Openembedded-core@lists.openembedde=
d.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core</a><br>
</blockquote>

--047d7bd752664578f504f92cde38--
