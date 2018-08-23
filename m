Return-Path: <ryan.harkin@linaro.org>
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
	[209.85.167.41])
	by mail.openembedded.org (Postfix) with ESMTP id B9F7B745C1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2018 06:12:30 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id c21-v6so3185825lfh.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 23:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=vJ/ujhVe4YeYzoN2rWVwtzMhi/sRxJZ7O1Y8fROGli8=;
	b=dM1YwgsQMsTRSc1ZEF3YXwInpgs4PjSHFHZT/7Uql3f9azpF7e2/e9+7AzjYt4/W3v
	9R/GNRYbiE2oTdvtG+B/X8u1vMzGvcuN1tUnGo+/iIZ/IaWszgDZQUS30JWevP109Gpu
	odubAIvJCIpc1EIJDBJ+nrXbOxNZkG/B1z8JE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=vJ/ujhVe4YeYzoN2rWVwtzMhi/sRxJZ7O1Y8fROGli8=;
	b=eXTX+Rqpsbcae7VBr0LneQjJP+qm5VK05Nv2rDd59GHdTlcDe4df2OImKTj2i1djs1
	sjILjbPgQhLWrzkHRz5NHkFvz1NC85irmKf7nOdPgTKUjDLGVEtA+FZnPvVWm1InkTd1
	bOHYKDYxY+hMBY0z04IJ39vLWmQzIlAlJvqNeIhjem5ZjvINB9QPPZV/l1LmUZT9F2yV
	vzBCqf2EFQDPLStaeMNZ0JYEtUx3fjzP0djxCRV6tpb62RN4L+N60hf/7zG6ihkqsNOV
	6xbB5ersO4T9zGA5Z6AzqLKp7KiCgaPm6cHZD0BM6BbiEAzu1o6GFwDtO1ObD4UIMs2o
	j6jg==
X-Gm-Message-State: AOUpUlHKPG5jUSAouI8autVe6V40gPELG2pvA6xaXwpUw+2EbZ5DICrW
	KWvolD7659KUSeBaNgI0Bx+PzD6MTtGXf6XUZWYNAg==
X-Google-Smtp-Source: AA+uWPyQ5TUh9oEeLoLvn1iuIgS1RoD44NLWWueqJeHTV4YHeA/sloEw4cbAlDoPXMDlfwZkbutLRVKXO6Ev0kwizU0=
X-Received: by 2002:a19:f015:: with SMTP id
	p21-v6mr9113771lfc.56.1535004751185; 
	Wed, 22 Aug 2018 23:12:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab3:1bc7:0:0:0:0:0 with HTTP; Wed, 22 Aug 2018 23:12:30
	-0700 (PDT)
In-Reply-To: <CAJ86T=WjSNkzHpD0a-CxwmV1JfG7ksfezspi+5LvkdvJHdTcFw@mail.gmail.com>
References: <1534955436-729-1-git-send-email-ryan.harkin@linaro.org>
	<1534955436-729-4-git-send-email-ryan.harkin@linaro.org>
	<CA+chaQd0noT0sABT2ucXZOx6QvWhoQqQeqzWXO_nm89-5ZeREA@mail.gmail.com>
	<CAD0U-hLEPce-+gJcBcqQHFPkiHr1CPBEvaM6s1f1VTkEzpNnfQ@mail.gmail.com>
	<CA+chaQezPDFAP1L0NYCaoFDjPfriUt3_wh9QKTaa0ZwWBHtKYQ@mail.gmail.com>
	<CAD0U-hJHddn43O0WVxDqUft74RoHxfCQBb9XV-pG+GYqNU0iVQ@mail.gmail.com>
	<CA+chaQc2EUcz+PHi=BT5RrMQsCqegytxgLd6gzpH-PUYvt59Mw@mail.gmail.com>
	<CAD0U-hL6Mvxf+NYVJS64ygh+bMR2RMxwa=okW6g+yOGb-Xb7mA@mail.gmail.com>
	<CAJ86T=UOiE+m=3__e13YpRex22Z9h1ennqyCxQMRDdSWMiFZTw@mail.gmail.com>
	<CAD0U-hJ5Ef8+zV6fumw921=67hwS5yyqaDWWJGVm4D4rFyrYHQ@mail.gmail.com>
	<CAJ86T=WjSNkzHpD0a-CxwmV1JfG7ksfezspi+5LvkdvJHdTcFw@mail.gmail.com>
From: Ryan Harkin <ryan.harkin@linaro.org>
Date: Thu, 23 Aug 2018 07:12:30 +0100
Message-ID: <CAD0U-h+yMkaadysGDcmhZHSPY8tgbw_O8jquynJduChJjgypxA@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	daiane.angolini@nxp.com, Patch Tracking <patches@linaro.org>
Subject: Re: [RFC 3/3] linux-firmware: MACHINEOVERRIDES for BCM43430 NVRAM
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
X-List-Received-Date: Thu, 23 Aug 2018 06:12:31 -0000
Content-Type: multipart/alternative; boundary="000000000000ec5e3005741424ac"

--000000000000ec5e3005741424ac
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 22 August 2018 at 23:55, Andre McCurdy <armccurdy@gmail.com> wrote:

> On Wed, Aug 22, 2018 at 2:56 PM, Ryan Harkin <ryan.harkin@linaro.org>
> wrote:
> > On Wed, 22 Aug 2018, 21:42 Andre McCurdy, <armccurdy@gmail.com> wrote:
> >> On Wed, Aug 22, 2018 at 1:10 PM, Ryan Harkin <ryan.harkin@linaro.org>
> >> wrote:
> >> > On Wed, 22 Aug 2018, 20:02 Martin Jansa, <martin.jansa@gmail.com>
> wrote:
> >> >>
> >> >> Your 1st parameter is wrong, compare again with the example I gave
> you
> >> >> (don't include "brcm/" path in 1st param, because you want the
> symlink
> >> >> to
> >> >> point to just brcmfmac43430-sdio.AP6212.txt like you did in the
> version
> >> >> after cd).
> >> >
> >> > That doesn't work either. I tried it with the same result, but didn'=
t
> >> > send a
> >> > log of it. That works for you?
> >>
> >> Martin's example is correct so maybe check your tests again for typos.
> >> It it still doesn't work then please do send a log.
> >>
> >> The link will point to whatever you define via the first parameter, so
> >> if you changed the first parameter it shouldn't be possible to get
> >> "the same result".
> >>
> >>   $ mkdir foo
> >>   $ ln -sf test_target foo/test1
> >>   $ ln -sf brcm/test_target foo/test2
> >>   $ ls -l foo
> >>
> >>   lrwxrwxrwx 1 andre andre 11 Aug 22 13:35 test1 -> test_target
> >>   lrwxrwxrwx 1 andre andre 16 Aug 22 13:35 test2 -> brcm/test_target
> >
> > Yes, that's essentially the same as what I'm getting.
> >
> > Now try "cat foo/test1" and what happens?
> >
> > There is no file called test_target in the foo directory. And neither i=
s
> > there a file called brcm/test_target in the foo directory.
>
> Correct. The above was just an example to show that you can * create
> symlinks * in the foo directory without cd'ing into the foo directory
> first.
>
> If you'd like the symlinks in the example to point to valid targets
> then you need to create the targets too, e.g.
>
>   $ mkdir -p foo/brcm
>   $ echo hello > foo/test_target
>   $ echo hello2 > foo/brcm/test_target
>
> But note that the process of creating a symlink is always the same,
> regardless of whether the symlink points to a valid target or not (so
> you can run these extra commands to create the targets before or after
> you create the symlinks).
>

So that doesn't work for me how I expect it to work. I must be missing
something fundamental here.

The recipe is trying to create a soft link from a file in the current
directory to a file in the sub-directory. On my system, your example
creates links from a file in the sub-directory to the another file in the
sub-directory.

So, to copy your example, but creating the file "test_target" from the
start:

$ mkdir -p /tmp/test
$ cd /tmp/test
$ mkdir foo
$ echo 1 > test_target
$ ln -sf test_target foo/test1
$ ln -sf brcm/test_target foo/test2
$ ls -l foo
total 0
lrwxrwxrwx 1 ryan ryan 11 Aug 23 06:54 test1 -> test_target
lrwxrwxrwx 1 ryan ryan 16 Aug 23 06:54 test2 -> brcm/test_target
$ cat test_target
1
$ cat foo/test1
cat: foo/test1: No such file or directory
$ cat foo/test2
cat: foo/test2: No such file or directory
$ echo hello > foo/test_target
$ echo hello2 > foo/brcm/test_target
bash: foo/brcm/test_target: No such file or directory
$ cat foo/test1
hello
$ cat foo/test2
cat: foo/test2: No such file or directory
$ cat test_target
1
$ tree
.
=E2=94=9C=E2=94=80=E2=94=80 foo
=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 test1 -> test_target
=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 test2 -> brcm/test_target
=E2=94=82   =E2=94=94=E2=94=80=E2=94=80 test_target
=E2=94=94=E2=94=80=E2=94=80 test_target

1 directory, 4 files

So, neither test1 nor test2 are linked to /tmp/test/test_target. test1 is
linked to /tmp/test/foo/test_target and test2 is linked to
/tmp/test/brcm/test_target, which doesn't exist.

AFAIK, when creating a softlink, you have to give it either an absolute
path, or a path relative to the link being created. The path cannot be
relative to the original file that you want to link to.

So, this will work:

$cd /tmp/test
$ ln -sf ../test_target foo/test3
$ cat foo/test3
1
$ cat /tmp/test/foo/test3
1

But that is a strange way to create the soft link, IMO.

AFAICT, for the recipe, to get rid of the "cd", I'd have to specify an
absolute path to the original file:

+do_install_append_bcm43430-nvram-mur1dx() {
+       ( ln -sf ${PWD}/brcmfmac43430-sdio.MUR1DX.txt
${D}${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.txt)

... assuming PWD is available to the recipe. There will be a proper Yocto
variable I can use, of course, but I can't think of it right now.

Either way, Martin's example doesn't work for me. And adding the absolute
path of the original file doesn't seem any neater or clearer than following
the TI example from the do_install a few lines up in the recipe. But I'm
happy to do it either way, so long as it works.

--000000000000ec5e3005741424ac
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On 22 August 2018 at 23:55, Andre McCurdy <span dir=3D"ltr">&lt;<a href=
=3D"mailto:armccurdy@gmail.com" target=3D"_blank">armccurdy@gmail.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div =
class=3D"gmail-HOEnZb"><div class=3D"gmail-h5">On Wed, Aug 22, 2018 at 2:56=
 PM, Ryan Harkin &lt;<a href=3D"mailto:ryan.harkin@linaro.org">ryan.harkin@=
linaro.org</a>&gt; wrote:<br>
&gt; On Wed, 22 Aug 2018, 21:42 Andre McCurdy, &lt;<a href=3D"mailto:armccu=
rdy@gmail.com">armccurdy@gmail.com</a>&gt; wrote:<br>
&gt;&gt; On Wed, Aug 22, 2018 at 1:10 PM, Ryan Harkin &lt;<a href=3D"mailto=
:ryan.harkin@linaro.org">ryan.harkin@linaro.org</a>&gt;<br>
&gt;&gt; wrote:<br>
&gt;&gt; &gt; On Wed, 22 Aug 2018, 20:02 Martin Jansa, &lt;<a href=3D"mailt=
o:martin.jansa@gmail.com">martin.jansa@gmail.com</a>&gt; wrote:<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Your 1st parameter is wrong, compare again with the examp=
le I gave you<br>
&gt;&gt; &gt;&gt; (don&#39;t include &quot;brcm/&quot; path in 1st param, b=
ecause you want the symlink<br>
&gt;&gt; &gt;&gt; to<br>
&gt;&gt; &gt;&gt; point to just brcmfmac43430-sdio.AP6212.txt like you did =
in the version<br>
&gt;&gt; &gt;&gt; after cd).<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; That doesn&#39;t work either. I tried it with the same result=
, but didn&#39;t<br>
&gt;&gt; &gt; send a<br>
&gt;&gt; &gt; log of it. That works for you?<br>
&gt;&gt;<br>
&gt;&gt; Martin&#39;s example is correct so maybe check your tests again fo=
r typos.<br>
&gt;&gt; It it still doesn&#39;t work then please do send a log.<br>
&gt;&gt;<br>
&gt;&gt; The link will point to whatever you define via the first parameter=
, so<br>
&gt;&gt; if you changed the first parameter it shouldn&#39;t be possible to=
 get<br>
&gt;&gt; &quot;the same result&quot;.<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0$ mkdir foo<br>
&gt;&gt;=C2=A0 =C2=A0$ ln -sf test_target foo/test1<br>
&gt;&gt;=C2=A0 =C2=A0$ ln -sf brcm/test_target foo/test2<br>
&gt;&gt;=C2=A0 =C2=A0$ ls -l foo<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0lrwxrwxrwx 1 andre andre 11 Aug 22 13:35 test1 -&gt; t=
est_target<br>
&gt;&gt;=C2=A0 =C2=A0lrwxrwxrwx 1 andre andre 16 Aug 22 13:35 test2 -&gt; b=
rcm/test_target<br>
&gt;<br>
&gt; Yes, that&#39;s essentially the same as what I&#39;m getting.<br>
&gt;<br>
&gt; Now try &quot;cat foo/test1&quot; and what happens?<br>
&gt;<br>
&gt; There is no file called test_target in the foo directory. And neither =
is<br>
&gt; there a file called brcm/test_target in the foo directory.<br>
<br>
</div></div>Correct. The above was just an example to show that you can * c=
reate<br>
symlinks * in the foo directory without cd&#39;ing into the foo directory<b=
r>
first.<br>
<br>
If you&#39;d like the symlinks in the example to point to valid targets<br>
then you need to create the targets too, e.g.<br>
<br>
=C2=A0 $ mkdir -p foo/brcm<br>
=C2=A0 $ echo hello &gt; foo/test_target<br>
=C2=A0 $ echo hello2 &gt; foo/brcm/test_target<br>
<br>
But note that the process of creating a symlink is always the same,<br>
regardless of whether the symlink points to a valid target or not (so<br>
you can run these extra commands to create the targets before or after<br>
you create the symlinks).<br></blockquote><div><br></div><div>So that doesn=
&#39;t work for me how I expect it to work. I must be missing something fun=
damental here.</div></div><br></div><div class=3D"gmail_extra">The recipe i=
s trying to create a soft link from a file in the current directory to a fi=
le in the sub-directory. On my system, your example creates links from a fi=
le in the sub-directory to the another file in the sub-directory.</div><div=
 class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">So, to copy you=
r example, but creating the file &quot;test_target&quot; from the start:</d=
iv><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra"><div cla=
ss=3D"gmail_extra">$ mkdir -p /tmp/test</div><div class=3D"gmail_extra">$ c=
d /tmp/test<br></div><div class=3D"gmail_extra">$ mkdir foo<br></div><div c=
lass=3D"gmail_extra">$ echo 1 &gt; test_target<br></div><div class=3D"gmail=
_extra">$ ln -sf test_target foo/test1<br></div><div class=3D"gmail_extra">=
$ ln -sf brcm/test_target foo/test2<br></div><div class=3D"gmail_extra">$ l=
s -l foo<br></div><div class=3D"gmail_extra">total 0</div><div class=3D"gma=
il_extra">lrwxrwxrwx 1 ryan ryan 11 Aug 23 06:54 test1 -&gt; test_target</d=
iv><div class=3D"gmail_extra">lrwxrwxrwx 1 ryan ryan 16 Aug 23 06:54 test2 =
-&gt; brcm/test_target</div><div class=3D"gmail_extra">$ cat test_target<br=
></div><div class=3D"gmail_extra">1</div><div class=3D"gmail_extra">$ cat f=
oo/test1<br></div><div class=3D"gmail_extra">cat: foo/test1: No such file o=
r directory</div><div class=3D"gmail_extra">$ cat foo/test2<br></div><div c=
lass=3D"gmail_extra">cat: foo/test2: No such file or directory</div><div cl=
ass=3D"gmail_extra">$ echo hello &gt; foo/test_target<br></div><div class=
=3D"gmail_extra">$ echo hello2 &gt; foo/brcm/test_target<br></div><div clas=
s=3D"gmail_extra">bash: foo/brcm/test_target: No such file or directory</di=
v><div class=3D"gmail_extra">$ cat foo/test1<br></div><div class=3D"gmail_e=
xtra">hello</div><div class=3D"gmail_extra">$ cat foo/test2<br></div><div c=
lass=3D"gmail_extra">cat: foo/test2: No such file or directory</div><div cl=
ass=3D"gmail_extra">$ cat test_target<br></div><div class=3D"gmail_extra">1=
</div><div><div>$ tree</div><div>.</div><div>=E2=94=9C=E2=94=80=E2=94=80 fo=
o</div><div>=E2=94=82=C2=A0 =C2=A0=E2=94=9C=E2=94=80=E2=94=80 test1 -&gt; t=
est_target</div><div>=E2=94=82=C2=A0 =C2=A0=E2=94=9C=E2=94=80=E2=94=80 test=
2 -&gt; brcm/test_target</div><div>=E2=94=82=C2=A0 =C2=A0=E2=94=94=E2=94=80=
=E2=94=80 test_target</div><div>=E2=94=94=E2=94=80=E2=94=80 test_target</di=
v><div><br></div><div>1 directory, 4 files</div></div><div><br></div><div>S=
o, neither test1 nor test2 are linked to /tmp/test/test_target. test1 is li=
nked to /tmp/test/foo/test_target and test2 is linked to /tmp/test/brcm/tes=
t_target, which doesn&#39;t exist.</div><div><br></div><div>AFAIK, when cre=
ating a softlink, you have to give it either an absolute path, or a path re=
lative to the link being created. The path cannot be relative to the origin=
al file that you want to link to.</div><div><br></div><div>So, this will wo=
rk:</div><div><br></div><div>$cd /tmp/test</div><div><div>$ ln -sf ../test_=
target foo/test3</div><div>$ cat foo/test3<br></div><div>1</div></div><div>=
<div>$ cat /tmp/test/foo/test3</div><div>1</div></div><div><br></div><div>B=
ut that is a strange way to create the soft link, IMO.</div><div><br></div>=
<div>AFAICT, for the recipe, to get rid of the &quot;cd&quot;, I&#39;d have=
 to specify an absolute path to the original file:</div><div><br></div><div=
><div>+do_install_append_bcm43430-nvram-mur1dx() {</div><div>+=C2=A0 =C2=A0=
 =C2=A0 =C2=A0( ln -sf ${PWD}/brcmfmac43430-sdio.MUR1DX.txt <span style=3D"=
font-size:small;background-color:rgb(255,255,255);text-decoration-style:ini=
tial;text-decoration-color:initial;float:none;display:inline">${D}${nonarch=
_base_libdir}/firmware/brcm/</span>brcmfmac43430-sdio.txt)</div></div><div>=
<br></div><div>... assuming PWD is available to the recipe. There will be a=
 proper Yocto variable I can use, of course, but I can&#39;t think of it ri=
ght now.</div><div><br></div><div>Either way, Martin&#39;s example doesn&#3=
9;t work for me. And adding the absolute path of the original file doesn&#3=
9;t seem any neater or clearer than following the TI example from the do_in=
stall a few lines up in the recipe. But I&#39;m happy to do it either way, =
so long as it works.</div></div></div>

--000000000000ec5e3005741424ac--
