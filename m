Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-lf0-f53.google.com (mail-lf0-f53.google.com
	[209.85.215.53])
	by mail.openembedded.org (Postfix) with ESMTP id 4E40B605FF
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 May 2016 17:02:10 +0000 (UTC)
Received: by mail-lf0-f53.google.com with SMTP id u64so67788624lff.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 May 2016 10:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=uRI37bLr+/oBymc59IfSkYHABNkbvTJezgs1XOpK5qY=;
	b=BabRVRu/O1ABOJ8ylJZuK80KhlEmbIgZ7ajRdnQ3XDiWgtBydGEuV1A7E7CwU1RzYW
	Dn5cnC737OIcCyqMIFb1QuWG3nLUKCWKYjUubVcJLQalTkoZY4/cTTL4nBqqo8CiUsV3
	voiYB8GRE5swGRguuTc1CrQWa2GqN7HCSCJywQYPRqLPJjhPygE+q/MwvV2ypnZ+Wmjx
	7le6Dg7irq7oJkzBHF3aVRTGb52XpV7fTUP0DjKzqgupd1YVbp7cSFe/I7mBgURIaqsi
	o3lt6Qg5Gl0soneMQBjQWhSsGIwjpI86GkTSsmqosNda7xx6huqXUyUDkpcATad8Cl9O
	e2+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=uRI37bLr+/oBymc59IfSkYHABNkbvTJezgs1XOpK5qY=;
	b=THZNx1SGLTwxMerLq66l4QBJ0ps5e6Gy+F1xKQVFLhqj0eMgx+r6HYNXd5UDyqSQRM
	9eE6+C6hKcrJivv88NItSe3oOUMAxTlSmDYZdtqKmRtZbnZIFRnMTk0zkIwMUF6hEJxs
	bpQWHuAYP6TL6RuZmazKzBGRvOpZrUA2SK1uD0RsYTc9FiPi/6FcLRXLLQpxX69GT3mf
	XvGL54HPxBGvNYr4LQRDE4G6wEqrCobDy0FlqQxhLmRiqwEIYR4A3jd5kl67MGsk3Uwx
	D/FhPASZDJbJ4+yZLQ5I2j/JvbvqGHLxeDpnKfzj/tdMmxfwLuQPFDl67qe4f9yhTme+
	/3Hg==
X-Gm-Message-State: AOPr4FU+OAVjbzO3JKbjWLxMNhCcJ+uQqHVrFDNUh+xd1O0GVZ9QAuLQj2U1FdYkcLhBbEj5w3dwwh1MlyUwpw==
X-Received: by 10.112.95.20 with SMTP id dg20mr4539503lbb.58.1462381329891;
	Wed, 04 May 2016 10:02:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.22.193 with HTTP; Wed, 4 May 2016 10:01:40 -0700 (PDT)
X-Originating-IP: [187.23.154.250]
In-Reply-To: <20160504150732.GB12969@jupiter.localdomain>
References: <CAAPZna1xLfbyYUKa+qcLfeGCv=mqg7JwWtirfAbqfM+TCu5m7g@mail.gmail.com>
	<20160504143806.GA12969@jupiter.localdomain>
	<CAAPZna1M5ibZ8J2vOZ5PmJqAHVwNn=vR8mKrmYmuQ-YdLWopfw@mail.gmail.com>
	<20160504150732.GB12969@jupiter.localdomain>
From: Fabio Berton <fabio.berton@ossystems.com.br>
Date: Wed, 4 May 2016 14:01:40 -0300
Message-ID: <CAAPZna2QkDzsa19=2rrKvypXpN-NOj02X724YVhm6Y+f8RdVXQ@mail.gmail.com>
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
X-List-Received-Date: Wed, 04 May 2016 17:02:11 -0000
Content-Type: multipart/alternative; boundary=001a11360658b1d8200532072f30

--001a11360658b1d8200532072f30
Content-Type: text/plain; charset=UTF-8

Yes, it helps.
Now I see my error... I need to use
SRC_URI = "npm://registry.npmjs.org;name=${PN};version=${PV}"
My recipe it's getting sources from github and not from registry.

Thanks!


On Wed, May 4, 2016 at 12:07 PM, Brendan Le Foll <brendan.le.foll@intel.com>
wrote:

> On Wed, May 04, 2016 at 11:53:08AM -0300, Fabio Berton wrote:
> >    Hi Brendan,
> >    Thanks for reply.
> >    I'm trying to use npm class with this layer
> >    [1]https://github.com/imyller/meta-nodejs
> >    For example, I changed this recipe
> >    [2]
> https://github.com/imyller/meta-nodejs/blob/master/recipes/grunt/gru
> >    nt-cli_1.1.0.bb to use npm class provided by oe-core and removed all
> >    classes from meta-nodejs.
>
> I'm not sure where that npm class is from but it's not the one from
> openembedded-core? With that npm.bbclass I'm able to build grunt-cli with a
> simple recipe like this:
>
> SUMMARY = "Grunt.js command line wrapper"
> HOMEPAGE = "http://gruntjs.com/"
> SECTION = "js/devel"
> LICENSE = "MIT"
> LIC_FILES_CHKSUM = "file://README.md;md5=a24cc788ab726e615aa5bf0168c5d77d"
> SRC_URI = "npm://registry.npmjs.org;name=${PN};version=${PV}"
> inherit npm
>
> Does that help? Note the license isn't downloaded by npm so I cheekily
> took the
> README.md for the md5 license check ;-) That probably needs to get fixed,
> using
> the package.json would likely be nicer...
>
> Cheers,
> Brendan
>
> >    I can install grunt-cli If I remove S = ${WORKDIR}/npmpkg and
> >    --no-registry option.
> >    I put PREFERRED_VERSION_nodejs-native on local.conf to set nodejs
> >    version and I tried with all versions available on meta-nodejs and
> >    meta-oe version, that has patch to enable --no-registry.
> >    I'll try with nodejs version that you're using.
> >
> >    On Wed, May 4, 2016 at 11:38 AM, Brendan Le Foll
> >    <[3]brendan.le.foll@intel.com> wrote:
> >
> >      On Tue, May 03, 2016 at 01:24:49PM -0300, Fabio Berton wrote:
> >      >    Hi all!
> >      >    I'm trying to install some recipes that use npm class and I
> >      have two
> >      >    questions.
> >      >    1 - Why use S = "${WORKDIR}/npmpkg"? This not work for me.
> >      That's surprising the fetcher basically extracts it that way so the
> >      class just defaults to that location as 'the right thing'. Do you
> >      have
> >      an example recipe that isn't working that I could take a look at?
> >      >    2 - Using option --no-registry inside npm_do_compile task I get
> >      this
> >      >    error:
> >      >    | npm ERR! Registry not defined and registry files not found:
> >      >
> >      "/home/user/prj/build/tmp/work/all-linux-musleabi/gulp-cli/1.2.1-r0/
> >      npm
> >      >    _cache/noregistry/wreck/.cache.json",
> >      >
> >      "/home/user/prj/build/tmp/work/all-linux-musleabi/gulp-cli/1.2.1-r0/
> >      npm
> >      >    _cache/wreck/.cache.json".
> >      >    | npm ERR!
> >      >    | npm ERR! If you need help, you may report this error at:
> >      >    | npm ERR!     <[1][4]https://github.com/npm/npm/issues>
> >      >    | npm ERR! Linux 3.18.0-trunk-amd64
> >      >    | npm ERR! argv
> >      >    "/home/user/prj/build/tmp/sysroots/x86_64-linux/usr/bin/node"
> >      >    "/home/user/prj/build/tmp/sysroots/x86_64-linux/usr/bin/npm"
> >      >    "--arch=arm" "--production" "--no-registry" "install"
> >      >    | npm ERR! node v4.4.1
> >      >    | npm ERR! npm  v2.14.20
> >      >    I found this issue [2][5]
> https://github.com/npm/npm/issues/5509
> >      and using
> >      >    --cache-min 99999 instead of --no-registry this error doesn't
> >      appears
> >      >    and build works fine.
> >      >    I noticed that nodejs recipe is using this patch
> >      >
> >      [3][6]
> https://github.com/bendaaron/meta-oe-dev/commit/3e02a40d689a70
> >      025472
> >      >    15473a00606d8213ce0c
> >      >    but seems not fix for me.
> >      So I saw this, and ignored it since --no-registry was working fine
> >      for
> >      me with that patch and then with 4.2.x. It seems the cache-min
> >      option
> >      doesn't always work as intented.
> >      I fired up a build with 4.4.x from
> >      [7]
> https://github.com/ostroproject/meta-iot-web/blob/master/recipes-
> >      devtools/nodejs/nodejs_4.4.1.bb
> >      and it seemed to build ok for me with --no-registry.
> >      Cheers,
> >      Brendan
> >
> > References
> >
> >    1. https://github.com/imyller/meta-nodejs
> >    2.
> https://github.com/imyller/meta-nodejs/blob/master/recipes/grunt/grunt-cli_1.1.0.bb
> >    3. mailto:brendan.le.foll@intel.com
> >    4. https://github.com/npm/npm/issues
> >    5. https://github.com/npm/npm/issues/5509
> >    6.
> https://github.com/bendaaron/meta-oe-dev/commit/3e02a40d689a70025472
> >    7.
> https://github.com/ostroproject/meta-iot-web/blob/master/recipes-devtools/nodejs/nodejs_4.4.1.bb
>

--001a11360658b1d8200532072f30
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:monospac=
e,monospace;font-size:small">Yes, it helps.<br>Now I see my error... I need=
 to use<br>SRC_URI =3D &quot;npm://<a href=3D"http://registry.npmjs.org" re=
l=3D"noreferrer" target=3D"_blank">registry.npmjs.org</a>;name=3D${PN};vers=
ion=3D${PV}&quot;<br></div><div class=3D"gmail_default" style=3D"font-famil=
y:monospace,monospace;font-size:small">My recipe it&#39;s getting sources f=
rom github and not from registry.<br><br></div><div class=3D"gmail_default"=
 style=3D"font-family:monospace,monospace;font-size:small">Thanks!<br></div=
><div class=3D"gmail_default" style=3D"font-family:monospace,monospace;font=
-size:small">=C2=A0<br></div></div><div class=3D"gmail_extra"><br><div clas=
s=3D"gmail_quote">On Wed, May 4, 2016 at 12:07 PM, Brendan Le Foll <span di=
r=3D"ltr">&lt;<a href=3D"mailto:brendan.le.foll@intel.com" target=3D"_blank=
">brendan.le.foll@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex"><span class=3D"">On Wed, May 04, 2016 at 11:53:08AM -0300, Fabio B=
erton wrote:<br>
&gt;=C2=A0 =C2=A0 Hi Brendan,<br>
&gt;=C2=A0 =C2=A0 Thanks for reply.<br>
&gt;=C2=A0 =C2=A0 I&#39;m trying to use npm class with this layer<br>
</span>&gt;=C2=A0 =C2=A0 [1]<a href=3D"https://github.com/imyller/meta-node=
js" rel=3D"noreferrer" target=3D"_blank">https://github.com/imyller/meta-no=
dejs</a><br>
<span class=3D"">&gt;=C2=A0 =C2=A0 For example, I changed this recipe<br>
</span>&gt;=C2=A0 =C2=A0 [2]<a href=3D"https://github.com/imyller/meta-node=
js/blob/master/recipes/grunt/gru" rel=3D"noreferrer" target=3D"_blank">http=
s://github.com/imyller/meta-nodejs/blob/master/recipes/grunt/gru</a><br>
<span class=3D"">&gt;=C2=A0 =C2=A0 <a href=3D"http://nt-cli_1.1.0.bb" rel=
=3D"noreferrer" target=3D"_blank">nt-cli_1.1.0.bb</a> to use npm class prov=
ided by oe-core and removed all<br>
&gt;=C2=A0 =C2=A0 classes from meta-nodejs.<br>
<br>
</span>I&#39;m not sure where that npm class is from but it&#39;s not the o=
ne from<br>
openembedded-core? With that npm.bbclass I&#39;m able to build grunt-cli wi=
th a<br>
simple recipe like this:<br>
<br>
SUMMARY =3D &quot;Grunt.js command line wrapper&quot;<br>
HOMEPAGE =3D &quot;<a href=3D"http://gruntjs.com/" rel=3D"noreferrer" targe=
t=3D"_blank">http://gruntjs.com/</a>&quot;<br>
SECTION =3D &quot;js/devel&quot;<br>
LICENSE =3D &quot;MIT&quot;<br>
LIC_FILES_CHKSUM =3D &quot;file://README.md;md5=3Da24cc788ab726e615aa5bf016=
8c5d77d&quot;<br>
SRC_URI =3D &quot;npm://<a href=3D"http://registry.npmjs.org" rel=3D"norefe=
rrer" target=3D"_blank">registry.npmjs.org</a>;name=3D${PN};version=3D${PV}=
&quot;<br>
inherit npm<br>
<br>
Does that help? Note the license isn&#39;t downloaded by npm so I cheekily =
took the<br>
README.md for the md5 license check ;-) That probably needs to get fixed, u=
sing<br>
the package.json would likely be nicer...<br>
<br>
Cheers,<br>
Brendan<br>
<span class=3D""><br>
&gt;=C2=A0 =C2=A0 I can install grunt-cli If I remove S =3D ${WORKDIR}/npmp=
kg and<br>
&gt;=C2=A0 =C2=A0 --no-registry option.<br>
&gt;=C2=A0 =C2=A0 I put PREFERRED_VERSION_nodejs-native on local.conf to se=
t nodejs<br>
&gt;=C2=A0 =C2=A0 version and I tried with all versions available on meta-n=
odejs and<br>
&gt;=C2=A0 =C2=A0 meta-oe version, that has patch to enable --no-registry.<=
br>
&gt;=C2=A0 =C2=A0 I&#39;ll try with nodejs version that you&#39;re using.<b=
r>
&gt;<br>
&gt;=C2=A0 =C2=A0 On Wed, May 4, 2016 at 11:38 AM, Brendan Le Foll<br>
</span><span class=3D"">&gt;=C2=A0 =C2=A0 &lt;[3]<a href=3D"mailto:brendan.=
le.foll@intel.com">brendan.le.foll@intel.com</a>&gt; wrote:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 On Tue, May 03, 2016 at 01:24:49PM -0300, Fabio Be=
rton wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 Hi all!<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 I&#39;m trying to install some r=
ecipes that use npm class and I<br>
&gt;=C2=A0 =C2=A0 =C2=A0 have two<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 questions.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 1 - Why use S =3D &quot;${WORKDI=
R}/npmpkg&quot;? This not work for me.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 That&#39;s surprising the fetcher basically extrac=
ts it that way so the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 class just defaults to that location as &#39;the r=
ight thing&#39;. Do you<br>
&gt;=C2=A0 =C2=A0 =C2=A0 have<br>
&gt;=C2=A0 =C2=A0 =C2=A0 an example recipe that isn&#39;t working that I co=
uld take a look at?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 2 - Using option --no-registry i=
nside npm_do_compile task I get<br>
&gt;=C2=A0 =C2=A0 =C2=A0 this<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 error:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 | npm ERR! Registry not defined =
and registry files not found:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &quot;/home/user/prj/build/tmp/work/all-linux-musl=
eabi/gulp-cli/1.2.1-r0/<br>
&gt;=C2=A0 =C2=A0 =C2=A0 npm<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 _cache/noregistry/wreck/.cache.j=
son&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &quot;/home/user/prj/build/tmp/work/all-linux-musl=
eabi/gulp-cli/1.2.1-r0/<br>
&gt;=C2=A0 =C2=A0 =C2=A0 npm<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 _cache/wreck/.cache.json&quot;.<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 | npm ERR!<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 | npm ERR! If you need help, you=
 may report this error at:<br>
</span>&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 | npm ERR!=C2=A0 =C2=A0 =
=C2=A0&lt;[1][4]<a href=3D"https://github.com/npm/npm/issues" rel=3D"norefe=
rrer" target=3D"_blank">https://github.com/npm/npm/issues</a>&gt;<br>
<span class=3D"">&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 | npm ERR! Linu=
x 3.18.0-trunk-amd64<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 | npm ERR! argv<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 &quot;/home/user/prj/build/tmp/s=
ysroots/x86_64-linux/usr/bin/node&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 &quot;/home/user/prj/build/tmp/s=
ysroots/x86_64-linux/usr/bin/npm&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 &quot;--arch=3Darm&quot; &quot;-=
-production&quot; &quot;--no-registry&quot; &quot;install&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 | npm ERR! node v4.4.1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 | npm ERR! npm=C2=A0 v2.14.20<br=
>
</span>&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 I found this issue [2][5]=
<a href=3D"https://github.com/npm/npm/issues/5509" rel=3D"noreferrer" targe=
t=3D"_blank">https://github.com/npm/npm/issues/5509</a><br>
<span class=3D"">&gt;=C2=A0 =C2=A0 =C2=A0 and using<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 --cache-min 99999 instead of --n=
o-registry this error doesn&#39;t<br>
&gt;=C2=A0 =C2=A0 =C2=A0 appears<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 and build works fine.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 I noticed that nodejs recipe is =
using this patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
</span>&gt;=C2=A0 =C2=A0 =C2=A0 [3][6]<a href=3D"https://github.com/bendaar=
on/meta-oe-dev/commit/3e02a40d689a70" rel=3D"noreferrer" target=3D"_blank">=
https://github.com/bendaaron/meta-oe-dev/commit/3e02a40d689a70</a><br>
<span class=3D"">&gt;=C2=A0 =C2=A0 =C2=A0 025472<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 15473a00606d8213ce0c<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 but seems not fix for me.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 So I saw this, and ignored it since --no-registry =
was working fine<br>
&gt;=C2=A0 =C2=A0 =C2=A0 for<br>
&gt;=C2=A0 =C2=A0 =C2=A0 me with that patch and then with 4.2.x. It seems t=
he cache-min<br>
&gt;=C2=A0 =C2=A0 =C2=A0 option<br>
&gt;=C2=A0 =C2=A0 =C2=A0 doesn&#39;t always work as intented.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 I fired up a build with 4.4.x from<br>
</span>&gt;=C2=A0 =C2=A0 =C2=A0 [7]<a href=3D"https://github.com/ostroproje=
ct/meta-iot-web/blob/master/recipes-" rel=3D"noreferrer" target=3D"_blank">=
https://github.com/ostroproject/meta-iot-web/blob/master/recipes-</a><br>
<span class=3D"">&gt;=C2=A0 =C2=A0 =C2=A0 devtools/nodejs/<a href=3D"http:/=
/nodejs_4.4.1.bb" rel=3D"noreferrer" target=3D"_blank">nodejs_4.4.1.bb</a><=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 and it seemed to build ok for me with --no-registr=
y.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Cheers,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Brendan<br>
&gt;<br>
</span>&gt; References<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 1. <a href=3D"https://github.com/imyller/meta-nodejs" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/imyller/meta-nodejs</a=
><br>
&gt;=C2=A0 =C2=A0 2. <a href=3D"https://github.com/imyller/meta-nodejs/blob=
/master/recipes/grunt/grunt-cli_1.1.0.bb" rel=3D"noreferrer" target=3D"_bla=
nk">https://github.com/imyller/meta-nodejs/blob/master/recipes/grunt/grunt-=
cli_1.1.0.bb</a><br>
&gt;=C2=A0 =C2=A0 3. mailto:<a href=3D"mailto:brendan.le.foll@intel.com">br=
endan.le.foll@intel.com</a><br>
&gt;=C2=A0 =C2=A0 4. <a href=3D"https://github.com/npm/npm/issues" rel=3D"n=
oreferrer" target=3D"_blank">https://github.com/npm/npm/issues</a><br>
&gt;=C2=A0 =C2=A0 5. <a href=3D"https://github.com/npm/npm/issues/5509" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/npm/npm/issues/5509</a=
><br>
&gt;=C2=A0 =C2=A0 6. <a href=3D"https://github.com/bendaaron/meta-oe-dev/co=
mmit/3e02a40d689a70025472" rel=3D"noreferrer" target=3D"_blank">https://git=
hub.com/bendaaron/meta-oe-dev/commit/3e02a40d689a70025472</a><br>
&gt;=C2=A0 =C2=A0 7. <a href=3D"https://github.com/ostroproject/meta-iot-we=
b/blob/master/recipes-devtools/nodejs/nodejs_4.4.1.bb" rel=3D"noreferrer" t=
arget=3D"_blank">https://github.com/ostroproject/meta-iot-web/blob/master/r=
ecipes-devtools/nodejs/nodejs_4.4.1.bb</a><br>
</blockquote></div><br></div>

--001a11360658b1d8200532072f30--
