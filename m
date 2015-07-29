Return-Path: <kergoth@gmail.com>
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id BC74275A60
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 16:40:35 +0000 (UTC)
Received: by igbpg9 with SMTP id pg9so16258122igb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 09:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=0fQE4BrRQTdCTiuTozRGIU+md/t3FacvdUYKb0piT5I=;
	b=gvbQc2jwTXWwDYmmkiQmFR6L91MzLYyxllqqRz12BwvIlr3O4R1IZJkwc1jwRv+6qN
	NrZseeUmMS4bHvkxn70V2QugkskT+9Sjy+lLsaWg0vYxzBObWl/bCmtXqjtH345AI6gW
	fjaykb7ZofWBne9saAF8fcG7NMC2eiOTfJoCuJZHFjgr5pj0tGOuhgX/cptSslwjSp6q
	TNXWA8Mz6LorC7UFIQpnxUshUyCTGuX3pO7KeyD7Yfo22BpsoFRH3ZHNm9JK3DF4atPW
	7zW+5UWFvEPFb5uSHxI5Aa53rTkTAcTx+Qnb0Apq1r9t+IG5wIup3ErMkqnGXPYWlOcb
	jRpQ==
X-Received: by 10.50.225.35 with SMTP id rh3mr7472887igc.29.1438188034986;
	Wed, 29 Jul 2015 09:40:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.100.199 with HTTP; Wed, 29 Jul 2015 09:40:15 -0700 (PDT)
In-Reply-To: <2239134.B3utLX50et@peggleto-mobl.ger.corp.intel.com>
References: <cover.1436889188.git.chris_larson@mentor.com>
	<34337e7400db6002b7d708a32609e2731d908a1f.1436889188.git.chris_larson@mentor.com>
	<55B8799D.3050600@windriver.com>
	<2239134.B3utLX50et@peggleto-mobl.ger.corp.intel.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Wed, 29 Jul 2015 09:40:15 -0700
Message-ID: <CABcZANkCPbUfxhN3FB=k8W4n79sKs73Os+u01H+8TkjOyUuimg@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/6] devtool: also load plugins from BBPATH
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
X-List-Received-Date: Wed, 29 Jul 2015 16:40:36 -0000
Content-Type: multipart/alternative; boundary=001a1132f214f21857051c063e14

--001a1132f214f21857051c063e14
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 29, 2015 at 2:56 AM, Paul Eggleton <
paul.eggleton@linux.intel.com> wrote:

> Hmm, I guess we will have to add a command-line parameter to specify BBPA=
TH
> (or the full plugin search path) so that tinfoil doesn't have to be
> instantiated when it's specified.
>

Indeed, sorry about that, I didn=E2=80=99t even realize populate_sdk_ext us=
ed
devtool from a bbclass :)
--=20
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a1132f214f21857051c063e14
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Wed, Jul 29, 2015 at 2:56 AM, Paul Eggleton <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:paul.eggleton@linux.intel.com" target=3D"_blank">paul.eggleton@=
linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><di=
v id=3D":2b5" class=3D"a3s" style=3D"overflow:hidden">Hmm, I guess we will =
have to add a command-line parameter to specify BBPATH<br>
(or the full plugin search path) so that tinfoil doesn&#39;t have to be<br>
instantiated when it&#39;s specified.<br></div></blockquote><div><br></div>=
<div>Indeed, sorry about that, I didn=E2=80=99t even realize populate_sdk_e=
xt used devtool from a bbclass :)</div></div>-- <br><div class=3D"gmail_sig=
nature"><div dir=3D"ltr">Christopher Larson<br>kergoth at gmail dot com<br>=
Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior=
 Software Engineer, Mentor Graphics</div></div>
</div></div>

--001a1132f214f21857051c063e14--
