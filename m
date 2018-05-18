Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id E7B5D750FA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 May 2018 17:33:06 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id f6-v6so15343803wmc.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 May 2018 10:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=03S5w4CJIh1yoZYB0c4LgB2k72zSPKobZq4Vd07kq8M=;
	b=U51lCLh04wEKZ4UGf/8jibV9/WPVhP8gzEnxYwO9IIAX3mzAcPLTZmx3I1BstWqis+
	KbcXKHqt5CRJxGVKLnbRWTHPy71Hx7Qk4oHwg7A/TomUQFXbbiIoTX2rOHHtWC0qDrDs
	DEhFQTVxkAklFjMlLLCg3bpYqqKl23QCvJ7OhHwBuajsUbpArcWxnL6+ua5E9G+Q9Gpe
	skl6hgq6v38e+YFfA4UQWBeG9BcbNWypW5jL8ImUHPGJ6GNKbQ85ti2uVLhWQPsozhq0
	OrqL4XR7YHdgpYJiHR7ADetcDgw81vR7bG7OOnmE1d5JooyPL2AYMaFRYvtumeHx3WLF
	qLog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=03S5w4CJIh1yoZYB0c4LgB2k72zSPKobZq4Vd07kq8M=;
	b=AJ2E+kwOQxcgUrkonF0jFP33oWBPnMeIbGa/SBPFUSFJoptnxGXYAu9xtvoszq0vKu
	FaZojf4hrQMEa/MnUZwbJHh9FZpMvy9uFXphS30RCi2p0j5qgi9M9w61miRAcnv8feTY
	DHNaAnyp1Ca+KEwe6DfSFW7/i4EhlSG+6ESei4fizChdlvyUAAOoYSu3uuzeZg02g0eF
	gU6QIJqrzL0tjSDZ5Aevri0na+c2wb+RvW+VW8+2WC6DbwXgkw3CcNWFEzzL5KmwCzuH
	9ab7jPRGzq0vXl2E6vvcgY744sISO4ia6ODWogzvNd3yjH5vm+d/fgEd3DFboRWTGo+K
	9eqA==
X-Gm-Message-State: ALKqPwfB33s0XiFpD7eoaDHpD5y9nROmdUv9WFfYz7B+EyaUmy9ldeyb
	91H87SENBZ6pB4Clt+4sWpReMiaM43Fl4wrIl2I=
X-Google-Smtp-Source: AB8JxZoE4FTd5BDeefJW7SZmkbcMKCxVHYkqq/yqsXYAgH7w4/Rpj3ijAJ+E2LuZAmruYGfirVmO2wOV1IFUMLPRpzo=
X-Received: by 2002:a1c:551:: with SMTP id 78-v6mr4944267wmf.60.1526664787241; 
	Fri, 18 May 2018 10:33:07 -0700 (PDT)
MIME-Version: 1.0
References: <1505723966-17120-1-git-send-email-mike.looijmans@topic.nl>
	<da35387ee5e44bd0a4248c41b79d1512@XBOX02.axis.com>
	<660382f7-55b7-39cc-ae2a-afab46301b3c@topic.nl>
	<CAJTo0LY=JnUkd7XMvkpNppc2drcSB8AF9dj_CyxHJRjixZ1uFA@mail.gmail.com>
	<34c855b7-3605-9c43-4a63-fdbdd39c2955@topic.nl>
	<411d4d88-f166-1c4e-2dc4-3009d157b071@topic.nl>
	<d2c9a503-a8ff-34f8-2d0c-ccea52e4ee7d@windriver.com>
	<44b92914-6c05-d08f-1d94-bd041c6b7733@windriver.com>
	<20180518102840.GA1398@jama>
	<1bf23c38ed974d80868c72516d57c23c@XBOX02.axis.com>
In-Reply-To: <1bf23c38ed974d80868c72516d57c23c@XBOX02.axis.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 18 May 2018 19:32:55 +0200
Message-ID: <CA+chaQe8F9gzQ1PKkC-tKqP19sS0afpWnqRdmXpDAy2A9fnKzQ@mail.gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Mike Looijmans <mike.looijmans@topic.nl>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] base-files: profile: Do not assume that the 'command' command exists
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
X-List-Received-Date: Fri, 18 May 2018 17:33:07 -0000
Content-Type: multipart/alternative; boundary="00000000000055afbc056c7e5804"

--00000000000055afbc056c7e5804
Content-Type: text/plain; charset="UTF-8"

Awesome, thanks!

On Fri, May 18, 2018 at 6:51 PM Peter Kjellerstedt <
peter.kjellerstedt@axis.com> wrote:

> > -----Original Message-----
> > From: Martin Jansa [mailto:martin.jansa@gmail.com]
> > Sent: den 18 maj 2018 12:29
> > To: ChenQi <Qi.Chen@windriver.com>
> > Cc: Mike Looijmans <mike.looijmans@topic.nl>; openembedded-
> > core@lists.openembedded.org; Peter Kjellerstedt
> > <peter.kjellerstedt@axis.com>; Burton, Ross <ross.burton@intel.com>
> > Subject: Re: [OE-core] [PATCH 1/2] base-files: profile: Do not assume
> > that the 'command' command exists
> >
> > On Fri, Oct 13, 2017 at 06:07:16PM +0800, ChenQi wrote:
> > > On 10/13/2017 05:53 PM, ChenQi wrote:
> > > > On 09/18/2017 09:56 PM, Mike Looijmans wrote:
> > > >> On 18-09-17 15:24, Mike Looijmans wrote:
> > > >>> On 18-09-17 15:08, Burton, Ross wrote:
> > > >>>> On 18 September 2017 at 12:31, Mike Looijmans
> > > >>>> <mike.looijmans@topic.nl <mailto:mike.looijmans@topic.nl>>
> > wrote:
> > > >>>>
> > > >>>>         This is basically the same change as I first sent a
> > patch
> > > >>>> for in
> > > >>>>         April, and
> > > >>>>         last pinged this Friday... The only real difference is
> > that
> > > >>>> this one
> > > >>>>         misses
> > > >>>>         passing error output from resize to /dev/null (which it
> > > >>>> should do to
> > > >>>>         handle
> > > >>>>         the case where tty exists, but resize does not).
> > > >>>>
> > > >>>>
> > > >>>>     Yeah, indeed.
> > > >>>>
> > > >>>>
> > > >>>> Apologies for missing that patch!
> > > >>>>
> > > >>>>     Other problem is that "resize" outputs shell script on
> > stdout
> > > >>>> to be
> > > >>>>     executed, so the proper "total" invokation would be:
> > > >>>>
> > > >>>>        /dev/tty[A-z]*) eval `resize 2>/dev/null` ;;
> > > >>>>
> > > >>>>     The "eval" part is missing in your version...
> > > >>>>
> > > >>>>
> > > >>>> Who is going to submit the One True patch with all the fixes in?
> > I
> > > >>>> promise to merge it.
> > > >>>
> > > >>> I'll send the one ring, eh, patch, in a few minutes. I'll merge
> > the
> > > >>> two into a single as well.
> > > >>
> > > >> On second thought, just use Peter's patch "as is".
> > > >>
> > > >> I've been experimenting with the "eval" part and it doesn't behave
> > > >> well. Tends to confuse minicom, create garbage, and in particular
> > > >> when run from "profile", it seems to result in counterproductive
> > > >> COLUMNS=0 and LINES=0.
> > > >>
> > > >> I'm actually wondering why the call to "resize" is being done at
> > all.
> > > >> Just calling "resize" has no effect, since it outputs the results
> > on
> > > >> stdout as shell script, and that is being discarded. Looking at
> > the
> > > >> commit that introduced it:
> > > >>
> > > >
> > > > Looking at the codes in busybox (console-tools/resize.c), I can see
> > > > that tcsetattr is actually called.
> > > > The output is due to:
> > > >
> > > >     if (ENABLE_FEATURE_RESIZE_PRINT)
> > > >         printf("COLUMNS=%d;LINES=%d;export COLUMNS LINES;\n",
> > > >             w.ws_col, w.ws_row);
> > > >
> > > > I can confirm that calling 'resize' is needed. Otherwise, you might
> > > > get input wrapping on the same line when typing long commands.
> > > >
> > > > I just tried busybox init based system and I also met '-sh:
> > command:
> > > > not found' error message.
> > >
> > > Sorry for the noise. Just noticed that oe-core has enabled 'command'
> > for
> > > busybox by default. It's my own busybox defconfig that hasn't enabled
> > it.
> >
> > I was just hit by the same. resize and tty work fine, but command
> > applet is missing in my images.
> >
> > Is enabling command applet in busybox now hard requirement for all the
> > builds or is anyone still planing to send follow-up on this?
> >
> > At least to show some more meaningful error when it's not available?
> >
> > "you probably need to fix your busybox defconfig, because some old
> > thread on oe-core ML says so"
> >
> > Cheers,
>
> Wow, here's an old discussion I had forgotten all about. I actually
> do have an updated version of the patch that solves the problem by
> running resize twice, once with stderr piped to /dev/null to
> determine if the resize command exists, and once without stderr
> piped to /dev/null to actually do the resize (since resize uses
> stderr to determine the size of the tty).
>
> I'll send the updated patch in a minute.
>
> > > Best Regards,
> > > Chen Qi
> > >
> > > > I think Peter's patch ([OE-core] [PATCHv2 1/1] base-files: profile:
> > > > Avoid using "command" to determine if programs exist) is correct.
> > > >
> > > > Best Regards,
> > > > Chen Qi
> > > >
> > > >> cc6360f4c4d9 (base-files: set dynamic COLUMNS via resize command)
> > > >>
> > > >> that already has no effect whatsoever. See the man page for
> > resize:
> > > >> https://linux.die.net/man/1/resize
> > > >>
> > > >> I also would consider running some program's output as shell
> > script a
> > > >> bit spooky, it looks like a security hole waiting to be exploited.
> > > >>
> > > >>
> > > >>
> > > >> Kind regards,
> > > >>
> > > >> Mike Looijmans
> > > >> System Expert
> > > >>
> > > >> TOPIC Products
> > > >> Materiaalweg 4, NL-5681 RJ Best
> > > >> Postbus 440, NL-5680 AK Best
> > > >> Telefoon: +31 (0) 499 33 69 79
> > > >> E-mail: mike.looijmans@topicproducts.com
> > > >> Website: www.topicproducts.com
> > > >>
> > > >> Please consider the environment before printing this e-mail
> >
> > --
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> //Peter
>
>

--00000000000055afbc056c7e5804
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Awesome, thanks!=C2=A0<br></div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr">On Fri, May 18, 2018 at 6:51 PM Peter Kjellerstedt &l=
t;<a href=3D"mailto:peter.kjellerstedt@axis.com">peter.kjellerstedt@axis.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">&gt; -----Original=
 Message-----<br>
&gt; From: Martin Jansa [mailto:<a href=3D"mailto:martin.jansa@gmail.com" t=
arget=3D"_blank">martin.jansa@gmail.com</a>]<br>
&gt; Sent: den 18 maj 2018 12:29<br>
&gt; To: ChenQi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=3D"_bla=
nk">Qi.Chen@windriver.com</a>&gt;<br>
&gt; Cc: Mike Looijmans &lt;<a href=3D"mailto:mike.looijmans@topic.nl" targ=
et=3D"_blank">mike.looijmans@topic.nl</a>&gt;; openembedded-<br>
&gt; <a href=3D"mailto:core@lists.openembedded.org" target=3D"_blank">core@=
lists.openembedded.org</a>; Peter Kjellerstedt<br>
&gt; &lt;<a href=3D"mailto:peter.kjellerstedt@axis.com" target=3D"_blank">p=
eter.kjellerstedt@axis.com</a>&gt;; Burton, Ross &lt;<a href=3D"mailto:ross=
.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;<br>
&gt; Subject: Re: [OE-core] [PATCH 1/2] base-files: profile: Do not assume<=
br>
&gt; that the &#39;command&#39; command exists<br>
&gt; <br>
&gt; On Fri, Oct 13, 2017 at 06:07:16PM +0800, ChenQi wrote:<br>
&gt; &gt; On 10/13/2017 05:53 PM, ChenQi wrote:<br>
&gt; &gt; &gt; On 09/18/2017 09:56 PM, Mike Looijmans wrote:<br>
&gt; &gt; &gt;&gt; On 18-09-17 15:24, Mike Looijmans wrote:<br>
&gt; &gt; &gt;&gt;&gt; On 18-09-17 15:08, Burton, Ross wrote:<br>
&gt; &gt; &gt;&gt;&gt;&gt; On 18 September 2017 at 12:31, Mike Looijmans<br=
>
&gt; &gt; &gt;&gt;&gt;&gt; &lt;<a href=3D"mailto:mike.looijmans@topic.nl" t=
arget=3D"_blank">mike.looijmans@topic.nl</a> &lt;mailto:<a href=3D"mailto:m=
ike.looijmans@topic.nl" target=3D"_blank">mike.looijmans@topic.nl</a>&gt;&g=
t;<br>
&gt; wrote:<br>
&gt; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This is basical=
ly the same change as I first sent a<br>
&gt; patch<br>
&gt; &gt; &gt;&gt;&gt;&gt; for in<br>
&gt; &gt; &gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0April, and<br>
&gt; &gt; &gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0last pinged thi=
s Friday... The only real difference is<br>
&gt; that<br>
&gt; &gt; &gt;&gt;&gt;&gt; this one<br>
&gt; &gt; &gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0misses<br>
&gt; &gt; &gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0passing error o=
utput from resize to /dev/null (which it<br>
&gt; &gt; &gt;&gt;&gt;&gt; should do to<br>
&gt; &gt; &gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0handle<br>
&gt; &gt; &gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0the case where =
tty exists, but resize does not).<br>
&gt; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0Yeah, indeed.<br>
&gt; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt;&gt; Apologies for missing that patch!<br>
&gt; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0Other problem is that &quot;r=
esize&quot; outputs shell script on<br>
&gt; stdout<br>
&gt; &gt; &gt;&gt;&gt;&gt; to be<br>
&gt; &gt; &gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0executed, so the proper &quot=
;total&quot; invokation would be:<br>
&gt; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 /dev/tty[A-z]*) eval =
`resize 2&gt;/dev/null` ;;<br>
&gt; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0The &quot;eval&quot; part is =
missing in your version...<br>
&gt; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt;&gt; Who is going to submit the One True patch with a=
ll the fixes in?<br>
&gt; I<br>
&gt; &gt; &gt;&gt;&gt;&gt; promise to merge it.<br>
&gt; &gt; &gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt; I&#39;ll send the one ring, eh, patch, in a few minu=
tes. I&#39;ll merge<br>
&gt; the<br>
&gt; &gt; &gt;&gt;&gt; two into a single as well.<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; On second thought, just use Peter&#39;s patch &quot;as i=
s&quot;.<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; I&#39;ve been experimenting with the &quot;eval&quot; pa=
rt and it doesn&#39;t behave<br>
&gt; &gt; &gt;&gt; well. Tends to confuse minicom, create garbage, and in p=
articular<br>
&gt; &gt; &gt;&gt; when run from &quot;profile&quot;, it seems to result in=
 counterproductive<br>
&gt; &gt; &gt;&gt; COLUMNS=3D0 and LINES=3D0.<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; I&#39;m actually wondering why the call to &quot;resize&=
quot; is being done at<br>
&gt; all.<br>
&gt; &gt; &gt;&gt; Just calling &quot;resize&quot; has no effect, since it =
outputs the results<br>
&gt; on<br>
&gt; &gt; &gt;&gt; stdout as shell script, and that is being discarded. Loo=
king at<br>
&gt; the<br>
&gt; &gt; &gt;&gt; commit that introduced it:<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Looking at the codes in busybox (console-tools/resize.c), I =
can see<br>
&gt; &gt; &gt; that tcsetattr is actually called.<br>
&gt; &gt; &gt; The output is due to:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0if (ENABLE_FEATURE_RESIZE_PRINT)<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0printf(&quot;COLUMNS=3D%d;L=
INES=3D%d;export COLUMNS LINES;\n&quot;,<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0w.ws_col, w.w=
s_row);<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I can confirm that calling &#39;resize&#39; is needed. Other=
wise, you might<br>
&gt; &gt; &gt; get input wrapping on the same line when typing long command=
s.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I just tried busybox init based system and I also met &#39;-=
sh:<br>
&gt; command:<br>
&gt; &gt; &gt; not found&#39; error message.<br>
&gt; &gt;<br>
&gt; &gt; Sorry for the noise. Just noticed that oe-core has enabled &#39;c=
ommand&#39;<br>
&gt; for<br>
&gt; &gt; busybox by default. It&#39;s my own busybox defconfig that hasn&#=
39;t enabled<br>
&gt; it.<br>
&gt; <br>
&gt; I was just hit by the same. resize and tty work fine, but command<br>
&gt; applet is missing in my images.<br>
&gt; <br>
&gt; Is enabling command applet in busybox now hard requirement for all the=
<br>
&gt; builds or is anyone still planing to send follow-up on this?<br>
&gt; <br>
&gt; At least to show some more meaningful error when it&#39;s not availabl=
e?<br>
&gt; <br>
&gt; &quot;you probably need to fix your busybox defconfig, because some ol=
d<br>
&gt; thread on oe-core ML says so&quot;<br>
&gt; <br>
&gt; Cheers,<br>
<br>
Wow, here&#39;s an old discussion I had forgotten all about. I actually <br=
>
do have an updated version of the patch that solves the problem by <br>
running resize twice, once with stderr piped to /dev/null to <br>
determine if the resize command exists, and once without stderr <br>
piped to /dev/null to actually do the resize (since resize uses <br>
stderr to determine the size of the tty).<br>
<br>
I&#39;ll send the updated patch in a minute.<br>
<br>
&gt; &gt; Best Regards,<br>
&gt; &gt; Chen Qi<br>
&gt; &gt;<br>
&gt; &gt; &gt; I think Peter&#39;s patch ([OE-core] [PATCHv2 1/1] base-file=
s: profile:<br>
&gt; &gt; &gt; Avoid using &quot;command&quot; to determine if programs exi=
st) is correct.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Best Regards,<br>
&gt; &gt; &gt; Chen Qi<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;&gt; cc6360f4c4d9 (base-files: set dynamic COLUMNS via resize=
 command)<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; that already has no effect whatsoever. See the man page =
for<br>
&gt; resize:<br>
&gt; &gt; &gt;&gt; <a href=3D"https://linux.die.net/man/1/resize" rel=3D"no=
referrer" target=3D"_blank">https://linux.die.net/man/1/resize</a><br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; I also would consider running some program&#39;s output =
as shell<br>
&gt; script a<br>
&gt; &gt; &gt;&gt; bit spooky, it looks like a security hole waiting to be =
exploited.<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; Kind regards,<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; Mike Looijmans<br>
&gt; &gt; &gt;&gt; System Expert<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; TOPIC Products<br>
&gt; &gt; &gt;&gt; Materiaalweg 4, NL-5681 RJ Best<br>
&gt; &gt; &gt;&gt; Postbus 440, NL-5680 AK Best<br>
&gt; &gt; &gt;&gt; Telefoon: +31 (0) 499 33 69 79<br>
&gt; &gt; &gt;&gt; E-mail: <a href=3D"mailto:mike.looijmans@topicproducts.c=
om" target=3D"_blank">mike.looijmans@topicproducts.com</a><br>
&gt; &gt; &gt;&gt; Website: <a href=3D"http://www.topicproducts.com" rel=3D=
"noreferrer" target=3D"_blank">www.topicproducts.com</a><br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; Please consider the environment before printing this e-m=
ail<br>
&gt; <br>
&gt; --<br>
&gt; Martin &#39;JaMa&#39; Jansa=C2=A0 =C2=A0 =C2=A0jabber: <a href=3D"mail=
to:Martin.Jansa@gmail.com" target=3D"_blank">Martin.Jansa@gmail.com</a><br>
<br>
//Peter<br>
<br>
</blockquote></div>

--00000000000055afbc056c7e5804--
