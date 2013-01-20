Received: from mail-ie0-f177.google.com ([209.85.223.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TwlzC-00070j-T7
	for openembedded-core@lists.openembedded.org;
	Sun, 20 Jan 2013 04:54:29 +0100
Received: by mail-ie0-f177.google.com with SMTP id k13so8229808iea.36
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Jan 2013 19:38:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=6DJfT3sMRMPhw1cXnDbKNRSehu7GvBKX5wgPurCGeh8=;
	b=IYNHQdy5EnuObHzz4mTq1pvAGEx+P9DSnCW7FbRZkq1GSRl9e8IKlQoa7jSWDZfr8v
	Vl0/50SjIg3PSd9LkXgu85vH/yCn9CyD3yUQXpIiCgr0ZDUgSpliKVfSoJUQ+CA98n6M
	jhXECMYo4AXSx8/iA8TiNet6Fy+tRBDEceKPedgqMQDKnGRmCgFpziYzqeHlS55d9DKX
	cske6KLm/k2ksstDpTJyidlAe/GnTbgj7DiNFPBZY5A5AEdeTh2XaQzlB/UZbc/UMfkA
	pW23+XqH1sdQBfP7hZpxZx8QQ+CDbyXKNj4KlV9h8kMRhY25JEF4I3Hao4sQSX21eBml
	TapA==
MIME-Version: 1.0
X-Received: by 10.50.184.199 with SMTP id ew7mr6229401igc.84.1358653135703;
	Sat, 19 Jan 2013 19:38:55 -0800 (PST)
Received: by 10.64.18.169 with HTTP; Sat, 19 Jan 2013 19:38:55 -0800 (PST)
In-Reply-To: <CAP9ODKqRqVzNM+=jsE0uktcRFaK7Q_Kb5kW0FJ2w03OgzGTeGA@mail.gmail.com>
References: <cover.1358634922.git.raj.khem@gmail.com>
	<CAP9ODKqRqVzNM+=jsE0uktcRFaK7Q_Kb5kW0FJ2w03OgzGTeGA@mail.gmail.com>
Date: Sat, 19 Jan 2013 19:38:55 -0800
Message-ID: <CAMKF1sr0pNawGix3j8hq4KfYd4TNGeYtFkhbkkuR1ugFCdU29Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: Khem Raj <kraj@juniper.net>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] boost, nfs-utils upgrade, drop KERNEL_CC
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 20 Jan 2013 03:54:32 -0000
Content-Type: multipart/alternative; boundary=14dae934056786ceaa04d3b01539

--14dae934056786ceaa04d3b01539
Content-Type: text/plain; charset=UTF-8

On Saturday, January 19, 2013, Otavio Salvador wrote:

> On Sat, Jan 19, 2013 at 8:39 PM, Khem Raj <raj.khem@gmail.com<javascript:;>>
> wrote:
> > This patchset is about upgrading boost and nfs-utils to latest
> > KERNEL_CC is now formed using CC, this patch has been tested fair bit now
> >
> > The following changes since commit
> 18bc7b44ef58cbcbe32d45504d71eed54ef695a4:
> >
> >   guilt: add git 1.8.x support (2013-01-18 13:20:56 +0000)
> >
> > are available in the git repository at:
> >
> >   git://git.openembedded.org/openembedded-core-contrib kraj/misc
> >
> http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/misc
> >
> > Khem Raj (4):
> >   kernel.bbclass,module-base.bbclass: Use CC to form KERNEL_CC
> >   nfs-utils: Upgrade 1.2.3 -> 1.2.8-rc2
> >   consolekit_0.4.5.bb: Package unpackaged systemd files
> >   boost: Upgrade 1.51 -> 1.52
> >
> >  meta/classes/kernel-arch.bbclass                   |   13 +
> >  meta/classes/kernel.bbclass                        |   16 +-
> >  meta/classes/module-base.bbclass                   |   16 -
> >  .../nfs-utils/nfs-utils-1.0.6-uclibc.patch         |   37 +-
> >  .../nfs-utils-1.2.1-exp-subtree-warn-off.patch     |   12 +
> >  .../nfs-utils/nfs-utils-1.2.1-statdpath-man.patch  |   58 +++
> >  .../nfs-utils-1.2.3-sm-notify-res_init.patch       |   21 +
> >  .../nfs-utils/nfs-utils-1.2.5-idmap-errmsg.patch   |   12 +
> >  .../nfs-utils/nfs-utils-nfsctl-x32-fix.patch       |   30 --
> >  .../nfs-utils/nfs-utils/nfs-utils.1.2.8.rc2.patch  |  535
> ++++++++++++++++++++
> >  .../nfs-utils/nfs-utils.1.2.8.rc2.patch.1          |  535
> ++++++++++++++++++++
> >  .../{nfs-utils_1.2.3.bb => nfs-utils_1.2.7.bb}     |   28 +-
> >  meta/recipes-support/boost/boost.inc               |    2 -
> >  .../boost/{boost_1.51.0.bb => boost_1.52.0.bb}     |    8 +-
> >  meta/recipes-support/boost/files/hash_enums.patch  |   45 --
> >  .../recipes-support/consolekit/consolekit_0.4.5.bb |    2 +-
> >  16 files changed, 1228 insertions(+), 142 deletions(-)
> >  create mode 100644
> meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-1.2.1-exp-subtree-warn-off.patch
> >  create mode 100644
> meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-1.2.1-statdpath-man.patch
> >  create mode 100644
> meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-1.2.3-sm-notify-res_init.patch
> >  create mode 100644
> meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-1.2.5-idmap-errmsg.patch
> >  delete mode 100644
> meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-nfsctl-x32-fix.patch
> >  create mode 100644
> meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils.1.2.8.rc2.patch
> >  create mode 100644
> meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils.1.2.8.rc2.patch.1
>
> Something went wrong here... :)


Ah it's wget :) I have deleted the useless file from pull request

>
> >  rename meta/recipes-connectivity/nfs-utils/{nfs-utils_1.2.3.bb =>
> nfs-utils_1.2.7.bb} (63%)
> >  rename meta/recipes-support/boost/{boost_1.51.0.bb => boost_1.52.0.bb}
> (44%)
> >  delete mode 100644 meta/recipes-support/boost/files/hash_enums.patch
> >
> > --
> > 1.7.9.5
> >
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org <javascript:;>
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
>
> --
> Otavio Salvador                             O.S. Systems
> E-mail: otavio@ossystems.com.br <javascript:;>
> http://www.ossystems.com.br
> Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br
>

--14dae934056786ceaa04d3b01539
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Saturday, January 19, 2013, Otavio Salvador  wrote:<br><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex">On Sat, Jan 19, 2013 at 8:39 PM, Khem Raj &lt;<a href=
=3D"javascript:;" onclick=3D"_e(event, &#39;cvml&#39;, &#39;raj.khem@gmail.=
com&#39;)">raj.khem@gmail.com</a>&gt; wrote:<br>

&gt; This patchset is about upgrading boost and nfs-utils to latest<br>
&gt; KERNEL_CC is now formed using CC, this patch has been tested fair bit =
now<br>
&gt;<br>
&gt; The following changes since commit 18bc7b44ef58cbcbe32d45504d71eed54ef=
695a4:<br>
&gt;<br>
&gt; =C2=A0 guilt: add git 1.8.x support (2013-01-18 13:20:56 +0000)<br>
&gt;<br>
&gt; are available in the git repository at:<br>
&gt;<br>
&gt; =C2=A0 git://<a href=3D"http://git.openembedded.org/openembedded-core-=
contrib" target=3D"_blank">git.openembedded.org/openembedded-core-contrib</=
a> kraj/misc<br>
&gt; =C2=A0 <a href=3D"http://cgit.openembedded.org/cgit.cgi/openembedded-c=
ore-contrib/log/?h=3Dkraj/misc" target=3D"_blank">http://cgit.openembedded.=
org/cgit.cgi/openembedded-core-contrib/log/?h=3Dkraj/misc</a><br>
&gt;<br>
&gt; Khem Raj (4):<br>
&gt; =C2=A0 kernel.bbclass,module-base.bbclass: Use CC to form KERNEL_CC<br=
>
&gt; =C2=A0 nfs-utils: Upgrade 1.2.3 -&gt; 1.2.8-rc2<br>
&gt; =C2=A0 <a href=3D"http://consolekit_0.4.5.bb" target=3D"_blank">consol=
ekit_0.4.5.bb</a>: Package unpackaged systemd files<br>
&gt; =C2=A0 boost: Upgrade 1.51 -&gt; 1.52<br>
&gt;<br>
&gt; =C2=A0meta/classes/kernel-arch.bbclass =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 13 +<br>
&gt; =C2=A0meta/classes/kernel.bbclass =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 16 +-<br>
&gt; =C2=A0meta/classes/module-base.bbclass =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 16 -<br>
&gt; =C2=A0.../nfs-utils/nfs-utils-1.0.6-uclibc.patch =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | =C2=A0 37 +-<br>
&gt; =C2=A0.../nfs-utils-1.2.1-exp-subtree-warn-off.patch =C2=A0 =C2=A0 | =
=C2=A0 12 +<br>
&gt; =C2=A0.../nfs-utils/nfs-utils-1.2.1-statdpath-man.patch =C2=A0| =C2=A0=
 58 +++<br>
&gt; =C2=A0.../nfs-utils-1.2.3-sm-notify-res_init.patch =C2=A0 =C2=A0 =C2=
=A0 | =C2=A0 21 +<br>
&gt; =C2=A0.../nfs-utils/nfs-utils-1.2.5-idmap-errmsg.patch =C2=A0 | =C2=A0=
 12 +<br>
&gt; =C2=A0.../nfs-utils/nfs-utils-nfsctl-x32-fix.patch =C2=A0 =C2=A0 =C2=
=A0 | =C2=A0 30 --<br>
&gt; =C2=A0.../nfs-utils/nfs-utils/nfs-utils.1.2.8.rc2.patch =C2=A0| =C2=A0=
535 ++++++++++++++++++++<br>
&gt; =C2=A0.../nfs-utils/nfs-utils.1.2.8.rc2.patch.1 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| =C2=A0535 ++++++++++++++++++++<br>
&gt; =C2=A0.../{<a href=3D"http://nfs-utils_1.2.3.bb" target=3D"_blank">nfs=
-utils_1.2.3.bb</a> =3D&gt; <a href=3D"http://nfs-utils_1.2.7.bb" target=3D=
"_blank">nfs-utils_1.2.7.bb</a>} =C2=A0 =C2=A0 | =C2=A0 28 +-<br>
&gt; =C2=A0meta/recipes-support/boost/boost.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A02 -<br>
&gt; =C2=A0.../boost/{<a href=3D"http://boost_1.51.0.bb" target=3D"_blank">=
boost_1.51.0.bb</a> =3D&gt; <a href=3D"http://boost_1.52.0.bb" target=3D"_b=
lank">boost_1.52.0.bb</a>} =C2=A0 =C2=A0 | =C2=A0 =C2=A08 +-<br>
&gt; =C2=A0meta/recipes-support/boost/files/hash_enums.patch =C2=A0| =C2=A0=
 45 --<br>
&gt; =C2=A0.../recipes-support/consolekit/<a href=3D"http://consolekit_0.4.=
5.bb" target=3D"_blank">consolekit_0.4.5.bb</a> | =C2=A0 =C2=A02 +-<br>
&gt; =C2=A016 files changed, 1228 insertions(+), 142 deletions(-)<br>
&gt; =C2=A0create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils=
/nfs-utils-1.2.1-exp-subtree-warn-off.patch<br>
&gt; =C2=A0create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils=
/nfs-utils-1.2.1-statdpath-man.patch<br>
&gt; =C2=A0create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils=
/nfs-utils-1.2.3-sm-notify-res_init.patch<br>
&gt; =C2=A0create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils=
/nfs-utils-1.2.5-idmap-errmsg.patch<br>
&gt; =C2=A0delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils=
/nfs-utils-nfsctl-x32-fix.patch<br>
&gt; =C2=A0create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils=
/nfs-utils.1.2.8.rc2.patch<br>
&gt; =C2=A0create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils=
/nfs-utils.1.2.8.rc2.patch.1<br>
<br>
Something went wrong here... :)</blockquote><div><br></div><div>Ah it&#39;s=
 wget :) I have deleted the useless file from pull request<span></span>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">

<br>
&gt; =C2=A0rename meta/recipes-connectivity/nfs-utils/{<a href=3D"http://nf=
s-utils_1.2.3.bb" target=3D"_blank">nfs-utils_1.2.3.bb</a> =3D&gt; <a href=
=3D"http://nfs-utils_1.2.7.bb" target=3D"_blank">nfs-utils_1.2.7.bb</a>} (6=
3%)<br>
&gt; =C2=A0rename meta/recipes-support/boost/{<a href=3D"http://boost_1.51.=
0.bb" target=3D"_blank">boost_1.51.0.bb</a> =3D&gt; <a href=3D"http://boost=
_1.52.0.bb" target=3D"_blank">boost_1.52.0.bb</a>} (44%)<br>
&gt; =C2=A0delete mode 100644 meta/recipes-support/boost/files/hash_enums.p=
atch<br>
&gt;<br>
&gt; --<br>
&gt; 1.7.9.5<br>
&gt;<br>
&gt;<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"javascript:;" onclick=3D"_e(event, &#39;cvml&#39;, &#39;Ope=
nembedded-core@lists.openembedded.org&#39;)">Openembedded-core@lists.openem=
bedded.org</a><br>
&gt; <a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openemb=
edded-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/li=
stinfo/openembedded-core</a><br>
<br>
<br>
<br>
--<br>
Otavio Salvador =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 O.S. Systems<br>
E-mail: <a href=3D"javascript:;" onclick=3D"_e(event, &#39;cvml&#39;, &#39;=
otavio@ossystems.com.br&#39;)">otavio@ossystems.com.br</a> =C2=A0<a href=3D=
"http://www.ossystems.com.br" target=3D"_blank">http://www.ossystems.com.br=
</a><br>

Mobile: +55 53 9981-7854 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a=
 href=3D"http://projetos.ossystems.com.br" target=3D"_blank">http://projeto=
s.ossystems.com.br</a><br>
</blockquote>

--14dae934056786ceaa04d3b01539--
