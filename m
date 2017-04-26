Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 5E5D477A2D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Apr 2017 07:41:55 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id u65so30883260wmu.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Apr 2017 00:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=jnrs50ti8ksZzyNl2/zDrxn2kYNuWAyo8kBl0WYZmNg=;
	b=LkCD8E0bEOHeQiTssSyL3A3NQYviuzlQnxV1hsOVWiTqDvHi4XN9eiexLG73gyNL3g
	WDYTHx4n88Q0gJi7xLNWqiqKd8JYAzbLD5mCuKvIzA0vBv7LMV6YTBwfQXWvftWVPHIZ
	WiudzmECTi/+y48wkMZ2ihRnTVJY6OQ9I+kLCik3l2cWqZheccsYlusncWyzPKWTxUbb
	83YtI3mzmJ8zTWizvYMEkKypYcOEOMluoN0zbp5lWnnQNaWxU3MG/xBoQtg6WorUFrz7
	oq8vGvgH/VP0BceaKJGYFIGyFLlNJ1bUS77yyDpOQtgBtm7rdLHdJ5kaUL+L575hsbFF
	LkEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=jnrs50ti8ksZzyNl2/zDrxn2kYNuWAyo8kBl0WYZmNg=;
	b=fiOe3PTHMd6rfy22pyA2NPqnxFrJpr8EcxOCNRiSU85PuULlXYlvl0xjVRwwJJmq5M
	591oYgjl7jfc2EV6Zd4I1md0TGNhf5ehbQ9XT/WHNI6qPMVSq8yKlbW7e5ka0FIfM67V
	xuzPq94n8oDwcE0dKtNQpSfrmCIqLe2jIdEx24a44vHRwwyv+IVlMZ7b01R70T26WPnQ
	ZIP0eaqQNAW7Af8ZwF0OqOfcyyXVbnkPBJQWGjlnB428FWfxjYPH/q/cQpqUt9MGSOF4
	XoP1WHyVLKYdZ4eE6qhxbwX5MfP0kmDpAnPJmRiUvzeSujcD5JFcZZKiHzN0iL6eUSAd
	zDNA==
X-Gm-Message-State: AN3rC/6NPtWgNkKWSCTXnGAcsPvomxE6I0u3awJ1kC+R116V04E8i9Fq
	/HFPx/oONOEkJHeN
X-Received: by 10.28.68.134 with SMTP id r128mr4691246wma.60.1493192516626;
	Wed, 26 Apr 2017 00:41:56 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	l133sm4186705wmf.17.2017.04.26.00.41.54
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 26 Apr 2017 00:41:54 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 26 Apr 2017 09:42:12 +0200
To: "Bystricky, Juro" <juro.bystricky@intel.com>
Message-ID: <20170426074212.GB3258@jama>
References: <1493144048-12455-1-git-send-email-juro.bystricky@intel.com>
	<CA+chaQfX1iYsYwqx4CMKuADmW75_VZStzZpdE-hw=ahtsDvdwg@mail.gmail.com>
	<6E51916E4A1F32428260031F4C7CD2B61194BE74@ORSMSX112.amr.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <6E51916E4A1F32428260031F4C7CD2B61194BE74@ORSMSX112.amr.corp.intel.com>
User-Agent: Mutt/1.8.2 (2017-04-18)
Cc: "jurobystricky@hotmail.com" <jurobystricky@hotmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] Reproducible binaries
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
X-List-Received-Date: Wed, 26 Apr 2017 07:41:58 -0000
X-Groupsio-MsgNum: 96696
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hQiwHBbRI9kgIhsi"
Content-Disposition: inline

--hQiwHBbRI9kgIhsi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 25, 2017 at 07:24:08PM +0000, Bystricky, Juro wrote:
> <html dir=3D"ltr">
> <head>
> <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-885=
9-1">
> <style type=3D"text/css" id=3D"owaParaStyle">P {margin-top:0;margin-botto=
m:0;}</style>
> </head>
> <body fpstyle=3D"1" ocsi=3D"0">
> <div style=3D"direction: ltr;font-family: Tahoma;color: #000000;font-size=
: 10pt;">The idea is that both builds have reproducible timestamps. So ther=
e may be different ways to determine the best way to get the stamp. My rati=
onale was that if the builds are from
>  two different commits, the difference should be reflected in the timesta=
mp.&nbsp; But I agree that two different commits<br>
> may in principle result in the same binary image. But without the last co=
mmit you would end up with different binaries anyway, as the timestamp is u=
sually taken from the time of the build.<br>
> <div style=3D"font-family: Times New Roman; color: #000000; font-size: 16=
px">
> <hr tabindex=3D"-1">
> <div id=3D"divRpF588021" style=3D"direction: ltr;"><font size=3D"2" color=
=3D"#000000" face=3D"Tahoma"><b>From:</b> Martin Jansa [martin.jansa@gmail.=
com]<br>
> <b>Sent:</b> Tuesday, April 25, 2017 11:36 AM<br>
> <b>To:</b> Bystricky, Juro<br>
> <b>Cc:</b> Patches and discussions about the oe-core layer; jurobystricky=
@hotmail.com<br>
> <b>Subject:</b> Re: [OE-core] [PATCH 0/4] Reproducible binaries<br>
> </font><br>
> </div>
> <div></div>
> <div>
> <div dir=3D"ltr">Is using the last commit really that useful?
> <div><br>
> </div>
> <div>I would like to be able to compare 2 subsequent builds (ideally perf=
ormed on 2 different hosts with some small modification in metadata layers)=
 and the binaries not affected by those small metadata modifications should=
 be the same - which is not the case
>  if we feed them with the top commit date.</div>
> <div><br>
> </div>
> <div>The real world use-case is that we're doing daily official builds (w=
hich don't use sstate for some bad reasons) and just comparing files-in-ima=
ge.txt file from buildhistory shows that almost all binaries are different =
every day (just their size fluctuating
>  &#43;- 2 bytes from the linker mangling) and when something goes wrong, =
it's hard to find &quot;the significant diff&quot; when it's always all dif=
ferent even when the 2nd build only had very small change in image recipe.<=
/div>
> </div>
> <div class=3D"gmail_extra"><br>
> <div class=3D"gmail_quote">On Tue, Apr 25, 2017 at 8:14 PM, Juro Bystrick=
y <span dir=3D"ltr">
> &lt;<a href=3D"mailto:juro.bystricky@intel.com" target=3D"_blank">juro.by=
stricky@intel.com</a>&gt;</span> wrote:<br>
> <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex; border-left=
:1px #ccc solid; padding-left:1ex">
> This patch set contains several patches aimed to achieve reproducible bin=
aries.<br>
> Building reproducible binaries may remove certain intentional<br>
> randomness intended for increased security. Hence, it is reasonable<br>
> to expect there will be cases where this is not desirable.<br>
> The user can select his/her preferences via the variable<br>
> BUILD_REPRODUCIBLE_BINARIES. The variable defaults to &quot;0&quot; (do n=
ot<br>
> build reproducible binaries) in order to minimize any potential<br>
> regressions. (Once the reproducible binaries code is mature enough,<br>
> it can be set to &quot;1&quot;.)<br>
> <br>
> The patch set is rather simple, targeting the &quot;low hanging fruit&quo=
t;.<br>
> For debian packages we get a lot of binary identical packages simply by<b=
r>
> exporting SOURCE_DATE_EPOCH.<br>
> For rootfs we get much fewer differences by modified prelinking and by<br>
> ensuring various timestamps are reproducible.<br>

But not for 2 different builds with slightly modified metadata (e.g.
just because top commit is different in whatever build repository you're
running from even when it doesn't have any effect in your image), right?

So it doesn't fix the files-in-image.txt differences as described in:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D5866

> <br>
> <br>
> Juro Bystricky (4):<br>
> &nbsp; bitbake.conf: new variable BUILD_REPRODUCIBLE_BINARIES<br>
> &nbsp; base.bbclass: initial support for binary reproducibility<br>
> &nbsp; image-preling.bbclass: support binary reproducibility<br>
> &nbsp; rootfs-postcommands.bbclass: support binary reproducibility<br>
> <br>
> &nbsp;meta/classes/base.bbclass&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; | 82 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&=
#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&=
#43;&#43;&#43;&#43;<wbr>&#43;&#43;<br>
> &nbsp;meta/classes/image-prelink.<wbr>bbclass&nbsp; &nbsp; &nbsp; &nbsp;|=
&nbsp; 9 &#43;&#43;&#43;-<br>
> &nbsp;meta/classes/rootfs-<wbr>postcommands.bbclass | 18 &#43;&#43;&#43;&=
#43;&#43;&#43;-<br>
> &nbsp;meta/conf/bitbake.conf&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp;|&nbsp; 3 &#43;&#43;<br>
> &nbsp;4 files changed, 109 insertions(&#43;), 3 deletions(-)<br>
> <span class=3D"HOEnZb"><font color=3D"#888888"><br>
> --<br>
> 2.7.4<br>
> <br>
> --<br>
> ______________________________<wbr>_________________<br>
> Openembedded-core mailing list<br>
> <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_bl=
ank">Openembedded-core@lists.<wbr>openembedded.org</a><br>
> <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-co=
re" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr=
>mailman/listinfo/openembedded-<wbr>core</a><br>
> </font></span></blockquote>
> </div>
> <br>
> </div>
> </div>
> </div>
> </div>
> </body>
> </html>

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--hQiwHBbRI9kgIhsi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWQBPUwAKCRA3VSO3ZXaA
HKY2AJ0SNfNnKcEVe8W4gTl5xKLsI7OkiwCeNe8HgeZpuGH6mVAJaKcwhc0X1zI=
=9TA+
-----END PGP SIGNATURE-----

--hQiwHBbRI9kgIhsi--
