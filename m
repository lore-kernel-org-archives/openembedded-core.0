Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-lf0-f45.google.com (mail-lf0-f45.google.com
	[209.85.215.45])
	by mail.openembedded.org (Postfix) with ESMTP id 71A4B62132
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 May 2016 14:53:38 +0000 (UTC)
Received: by mail-lf0-f45.google.com with SMTP id u64so63159564lff.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 May 2016 07:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xzNkwReYbSLuLS1dPEdJBlZsiuBl3lXelSIvFQ8zDwI=;
	b=OG/LgoBugLZC211iSeTjmo7QDhkblxxDETOQeO+S/j8A36V/5ZT2GYI4L1bEJP8DmU
	zs6BkLbpbLo6QrhFSxutDw/zBzUSoHO0rtmECCpz1jOYrGcK9PjLm/GZIdZMEItkdog7
	JVhQL8tAinGO3etesr1kwqlfp7KLsJSe8g7MwZ6MowuKI+oxmwbOl3Z94G5HgFvdmucL
	iiCo8WgoWoY4rmYE6GxICxP1N9CYI8lBpdfT2xUfmWamVSOAFUYu9dJ7g3j/V9swZ0AM
	nlL6rxBSbI5NEo697dRBQ8jMQ3hg6Q6v/IrjvOgSMxqF2ATEkM/83ZSV9KYZcG3RE2zU
	+SWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xzNkwReYbSLuLS1dPEdJBlZsiuBl3lXelSIvFQ8zDwI=;
	b=Yxa+eQzo+2CP/TM562o9L4WqlpjhfmTpBi+y41vYoeXST28ZutbszoJ7vUvDPy/HkA
	C0FPJ9QttBATpet4Inkr9BuBDPMsbQamOdkrOkERhp5KuzHTt9zZyutNqC56KqcawAFn
	jffiw0dHqaTI8rQBwLvzn+Ib5bBekCfJSh/+N68PBn7mcF27fJ2sv2ulizlZkYVk19KO
	bF0rBkXQeldUq4NGtxJnz3lEp7Jm91uGPxQflzB/7qRyHBa268mbE9xKxSRxbocoiGVz
	8xBzP84DgIB7oGMUvv46ACMgSkWQrp0MfSAZgCNoud5k+YqdRcVNeI9s9OS/TZnOVq8V
	2sgA==
X-Gm-Message-State: AOPr4FXAS6+0NPfjN6gJYJK2DmpP1iH70ZS4pn1BC9VrHrScdGY2mHSit6SMlEGhX4P7ivppgZOxKYilbYhK5g==
X-Received: by 10.112.189.1 with SMTP id ge1mr4238273lbc.9.1462373617946; Wed,
	04 May 2016 07:53:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.22.193 with HTTP; Wed, 4 May 2016 07:53:08 -0700 (PDT)
X-Originating-IP: [187.23.154.250]
In-Reply-To: <20160504143806.GA12969@jupiter.localdomain>
References: <CAAPZna1xLfbyYUKa+qcLfeGCv=mqg7JwWtirfAbqfM+TCu5m7g@mail.gmail.com>
	<20160504143806.GA12969@jupiter.localdomain>
From: Fabio Berton <fabio.berton@ossystems.com.br>
Date: Wed, 4 May 2016 11:53:08 -0300
Message-ID: <CAAPZna1M5ibZ8J2vOZ5PmJqAHVwNn=vR8mKrmYmuQ-YdLWopfw@mail.gmail.com>
To: Brendan Le Foll <brendan.le.foll@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: npm class usage
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
X-List-Received-Date: Wed, 04 May 2016 14:53:39 -0000
Content-Type: multipart/alternative; boundary=001a11c36f7006e8b70532056448

--001a11c36f7006e8b70532056448
Content-Type: text/plain; charset=UTF-8

Hi Brendan,

Thanks for reply.

I'm trying to use npm class with this layer
https://github.com/imyller/meta-nodejs

For example, I changed this recipe
https://github.com/imyller/meta-nodejs/blob/master/recipes/grunt/grunt-cli_1.1.0.bb
to use npm class provided by oe-core and removed all classes from
meta-nodejs.

I can install grunt-cli If I remove S = ${WORKDIR}/npmpkg and
--no-registry option.

I put PREFERRED_VERSION_nodejs-native on local.conf to set nodejs version
and I tried with all versions available on meta-nodejs and meta-oe version,
that has patch to enable --no-registry.

I'll try with nodejs version that you're using.


On Wed, May 4, 2016 at 11:38 AM, Brendan Le Foll <brendan.le.foll@intel.com>
wrote:

> On Tue, May 03, 2016 at 01:24:49PM -0300, Fabio Berton wrote:
> >    Hi all!
> >    I'm trying to install some recipes that use npm class and I have two
> >    questions.
> >    1 - Why use S = "${WORKDIR}/npmpkg"? This not work for me.
>
> That's surprising the fetcher basically extracts it that way so the
> class just defaults to that location as 'the right thing'. Do you have
> an example recipe that isn't working that I could take a look at?
>
> >    2 - Using option --no-registry inside npm_do_compile task I get this
> >    error:
> >    | npm ERR! Registry not defined and registry files not found:
> >
> "/home/user/prj/build/tmp/work/all-linux-musleabi/gulp-cli/1.2.1-r0/npm
> >    _cache/noregistry/wreck/.cache.json",
> >
> "/home/user/prj/build/tmp/work/all-linux-musleabi/gulp-cli/1.2.1-r0/npm
> >    _cache/wreck/.cache.json".
> >    | npm ERR!
> >    | npm ERR! If you need help, you may report this error at:
> >    | npm ERR!     <[1]https://github.com/npm/npm/issues>
> >    | npm ERR! Linux 3.18.0-trunk-amd64
> >    | npm ERR! argv
> >    "/home/user/prj/build/tmp/sysroots/x86_64-linux/usr/bin/node"
> >    "/home/user/prj/build/tmp/sysroots/x86_64-linux/usr/bin/npm"
> >    "--arch=arm" "--production" "--no-registry" "install"
> >    | npm ERR! node v4.4.1
> >    | npm ERR! npm  v2.14.20
> >    I found this issue [2]https://github.com/npm/npm/issues/5509 and
> using
> >    --cache-min 99999 instead of --no-registry this error doesn't appears
> >    and build works fine.
> >    I noticed that nodejs recipe is using this patch
> >    [3]
> https://github.com/bendaaron/meta-oe-dev/commit/3e02a40d689a70025472
> >    15473a00606d8213ce0c
> >    but seems not fix for me.
>
> So I saw this, and ignored it since --no-registry was working fine for
> me with that patch and then with 4.2.x. It seems the cache-min option
> doesn't always work as intented.
>
> I fired up a build with 4.4.x from
>
> https://github.com/ostroproject/meta-iot-web/blob/master/recipes-devtools/nodejs/nodejs_4.4.1.bb
> and it seemed to build ok for me with --no-registry.
>
> Cheers,
> Brendan
>

--001a11c36f7006e8b70532056448
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:monospac=
e,monospace;font-size:small">Hi Brendan,<br><br></div><div class=3D"gmail_d=
efault" style=3D"font-family:monospace,monospace;font-size:small">Thanks fo=
r reply.<br><br></div><div class=3D"gmail_default" style=3D"font-family:mon=
ospace,monospace;font-size:small">I&#39;m trying to use npm class with this=
 layer <a href=3D"https://github.com/imyller/meta-nodejs">https://github.co=
m/imyller/meta-nodejs</a><br><br></div><div class=3D"gmail_default" style=
=3D"font-family:monospace,monospace;font-size:small">For example, I changed=
 this recipe <a href=3D"https://github.com/imyller/meta-nodejs/blob/master/=
recipes/grunt/grunt-cli_1.1.0.bb">https://github.com/imyller/meta-nodejs/bl=
ob/master/recipes/grunt/grunt-cli_1.1.0.bb</a> to use npm class provided by=
 oe-core and removed all classes from meta-nodejs. <br><br></div><div class=
=3D"gmail_default" style=3D"font-family:monospace,monospace;font-size:small=
">I can install grunt-cli If I remove S =3D ${WORKDIR}/npmpkg and <br> --no=
-registry option.<br><br></div><div class=3D"gmail_default" style=3D"font-f=
amily:monospace,monospace;font-size:small">I put PREFERRED_VERSION_nodejs-n=
ative on local.conf to set nodejs version and I tried with all versions ava=
ilable on meta-nodejs and meta-oe version, that has patch to enable  --no-r=
egistry.<br><br></div><div class=3D"gmail_default" style=3D"font-family:mon=
ospace,monospace;font-size:small">I&#39;ll try with nodejs version that you=
&#39;re using.<br></div><div class=3D"gmail_default" style=3D"font-family:m=
onospace,monospace;font-size:small"><br></div></div><div class=3D"gmail_ext=
ra"><br><div class=3D"gmail_quote">On Wed, May 4, 2016 at 11:38 AM, Brendan=
 Le Foll <span dir=3D"ltr">&lt;<a href=3D"mailto:brendan.le.foll@intel.com"=
 target=3D"_blank">brendan.le.foll@intel.com</a>&gt;</span> wrote:<br><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex"><span class=3D"">On Tue, May 03, 2016 at 01:24:49=
PM -0300, Fabio Berton wrote:<br>
&gt;=C2=A0 =C2=A0 Hi all!<br>
&gt;=C2=A0 =C2=A0 I&#39;m trying to install some recipes that use npm class=
 and I have two<br>
&gt;=C2=A0 =C2=A0 questions.<br>
&gt;=C2=A0 =C2=A0 1 - Why use S =3D &quot;${WORKDIR}/npmpkg&quot;? This not=
 work for me.<br>
<br>
</span>That&#39;s surprising the fetcher basically extracts it that way so =
the<br>
class just defaults to that location as &#39;the right thing&#39;. Do you h=
ave<br>
an example recipe that isn&#39;t working that I could take a look at?<br>
<span class=3D""><br>
&gt;=C2=A0 =C2=A0 2 - Using option --no-registry inside npm_do_compile task=
 I get this<br>
&gt;=C2=A0 =C2=A0 error:<br>
&gt;=C2=A0 =C2=A0 | npm ERR! Registry not defined and registry files not fo=
und:<br>
&gt;=C2=A0 =C2=A0 &quot;/home/user/prj/build/tmp/work/all-linux-musleabi/gu=
lp-cli/1.2.1-r0/npm<br>
&gt;=C2=A0 =C2=A0 _cache/noregistry/wreck/.cache.json&quot;,<br>
&gt;=C2=A0 =C2=A0 &quot;/home/user/prj/build/tmp/work/all-linux-musleabi/gu=
lp-cli/1.2.1-r0/npm<br>
&gt;=C2=A0 =C2=A0 _cache/wreck/.cache.json&quot;.<br>
&gt;=C2=A0 =C2=A0 | npm ERR!<br>
&gt;=C2=A0 =C2=A0 | npm ERR! If you need help, you may report this error at=
:<br>
</span>&gt;=C2=A0 =C2=A0 | npm ERR!=C2=A0 =C2=A0 =C2=A0&lt;[1]<a href=3D"ht=
tps://github.com/npm/npm/issues" rel=3D"noreferrer" target=3D"_blank">https=
://github.com/npm/npm/issues</a>&gt;<br>
<span class=3D"">&gt;=C2=A0 =C2=A0 | npm ERR! Linux 3.18.0-trunk-amd64<br>
&gt;=C2=A0 =C2=A0 | npm ERR! argv<br>
&gt;=C2=A0 =C2=A0 &quot;/home/user/prj/build/tmp/sysroots/x86_64-linux/usr/=
bin/node&quot;<br>
&gt;=C2=A0 =C2=A0 &quot;/home/user/prj/build/tmp/sysroots/x86_64-linux/usr/=
bin/npm&quot;<br>
&gt;=C2=A0 =C2=A0 &quot;--arch=3Darm&quot; &quot;--production&quot; &quot;-=
-no-registry&quot; &quot;install&quot;<br>
&gt;=C2=A0 =C2=A0 | npm ERR! node v4.4.1<br>
&gt;=C2=A0 =C2=A0 | npm ERR! npm=C2=A0 v2.14.20<br>
</span>&gt;=C2=A0 =C2=A0 I found this issue [2]<a href=3D"https://github.co=
m/npm/npm/issues/5509" rel=3D"noreferrer" target=3D"_blank">https://github.=
com/npm/npm/issues/5509</a> and using<br>
<span class=3D"">&gt;=C2=A0 =C2=A0 --cache-min 99999 instead of --no-regist=
ry this error doesn&#39;t appears<br>
&gt;=C2=A0 =C2=A0 and build works fine.<br>
&gt;=C2=A0 =C2=A0 I noticed that nodejs recipe is using this patch<br>
</span>&gt;=C2=A0 =C2=A0 [3]<a href=3D"https://github.com/bendaaron/meta-oe=
-dev/commit/3e02a40d689a70025472" rel=3D"noreferrer" target=3D"_blank">http=
s://github.com/bendaaron/meta-oe-dev/commit/3e02a40d689a70025472</a><br>
<span class=3D"">&gt;=C2=A0 =C2=A0 15473a00606d8213ce0c<br>
&gt;=C2=A0 =C2=A0 but seems not fix for me.<br>
<br>
</span>So I saw this, and ignored it since --no-registry was working fine f=
or<br>
me with that patch and then with 4.2.x. It seems the cache-min option<br>
doesn&#39;t always work as intented.<br>
<br>
I fired up a build with 4.4.x from<br>
<a href=3D"https://github.com/ostroproject/meta-iot-web/blob/master/recipes=
-devtools/nodejs/nodejs_4.4.1.bb" rel=3D"noreferrer" target=3D"_blank">http=
s://github.com/ostroproject/meta-iot-web/blob/master/recipes-devtools/nodej=
s/nodejs_4.4.1.bb</a><br>
and it seemed to build ok for me with --no-registry.<br>
<br>
Cheers,<br>
Brendan<br>
</blockquote></div><br></div>

--001a11c36f7006e8b70532056448--
