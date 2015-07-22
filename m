Return-Path: <kergoth@gmail.com>
Received: from mail-qg0-f51.google.com (mail-qg0-f51.google.com
	[209.85.192.51])
	by mail.openembedded.org (Postfix) with ESMTP id CD60173CF2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jul 2015 15:34:48 +0000 (UTC)
Received: by qgy5 with SMTP id 5so104311003qgy.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jul 2015 08:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=dd5OTj6Yvhdjig9bgyT7sf4C4vvn9FysN4093jtIEA4=;
	b=ZAMd5qwOa4qCxwf9Ew++G4FOVTPsvOU0sP56wZgUVPpFOCRsqYW7rZczV6nun/sw2L
	0H38hBoMIb88hrZsIeLAZYWwf8CJZsM/MDaEAR7eLjQRzaXRtOfEK1i5dWzqMcI4ELoh
	ul0/UdYWTaD4kg1/1QmjQXy9b4U3qsIrPrp2Y8ousid3Uk18ChxqjfMWvGfMaQy05Zsw
	22zRp4q/dsEADP7Ydx6+N/HraqkzU2PnO9SM0n1JEyI5waGWTxbgFDYfZDnLY9/jivqS
	x9vZFE5qimudvD6XiN0jiY9JZcFOOd0qAmU3VwD2TSppDjEWDKCsV3u0ZvP7snL7Rb3M
	xilg==
X-Received: by 10.140.34.33 with SMTP id k30mr4595459qgk.56.1437579288405;
	Wed, 22 Jul 2015 08:34:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.108.55 with HTTP; Wed, 22 Jul 2015 08:34:28 -0700 (PDT)
In-Reply-To: <13693490.gf1pOGu3uf@peggleto-mobl.ger.corp.intel.com>
References: <c5e5bbd5f85ed4ae437815656889d328da25e75b.1437430369.git.chris_larson@mentor.com>
	<62a5e84af02b4ed03f1e6a9516c718b98be20689.1437430369.git.chris_larson@mentor.com>
	<13693490.gf1pOGu3uf@peggleto-mobl.ger.corp.intel.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Wed, 22 Jul 2015 08:34:28 -0700
Message-ID: <CABcZAN=b8+pU+U7sCj6eC1f46m3wsbaNWFUfeMn8xA8AZZTZJA@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 3/6] recipetool: also load plugins from BBPATH
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
X-List-Received-Date: Wed, 22 Jul 2015 15:34:49 -0000
Content-Type: multipart/alternative; boundary=001a11c0b2ced26dd4051b788256

--001a11c0b2ced26dd4051b788256
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 22, 2015 at 3:55 AM, Paul Eggleton <
paul.eggleton@linux.intel.com> wrote:

> I must admit it wasn't immediately obvious to me why you'd made some of t=
he
> changes here, although after several reads it does make sense - would you
> be
> able to add a slightly more detailed commit message explaining the change=
s?
> (same for the equivalent devtool patch).
>

Will do, thanks.

- The tinfoil setup had to be split, as we need access to the tinfoil
object to get BBPATH.
- The argument parsing was split into two, first just the global options,
the second for everything else, to let us enable debugging or quiet mode
before the plugins are loaded, so we can see details about that process,
rather than doing it all at once. =E2=80=94help, while global, shouldn=E2=
=80=99t be handled
in the first pass, otherwise the help info will lack info about the plugins=
.

I=E2=80=99ll add that info to the commit message, and also rename initial_a=
rgs to
global_args to hopefully clarify it a bit better in the code.
--=20
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a11c0b2ced26dd4051b788256
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Wed, Jul 22, 2015 at 3:55 AM, Paul Eggleton <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:paul.eggleton@linux.intel.com" target=3D"_blank">paul.eggleton@=
linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><di=
v id=3D":n9" class=3D"a3s" style=3D"overflow:hidden">I must admit it wasn&#=
39;t immediately obvious to me why you&#39;d made some of the<br>
changes here, although after several reads it does make sense - would you b=
e<br>
able to add a slightly more detailed commit message explaining the changes?=
<br>
(same for the equivalent devtool patch).</div></blockquote></div><br>Will d=
o, thanks.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_ex=
tra">- The tinfoil setup had to be split, as we need access to the tinfoil =
object to get BBPATH.</div><div class=3D"gmail_extra">- The argument parsin=
g was split into two, first just the global options, the second for everyth=
ing else, to let us enable debugging or quiet mode before the plugins are l=
oaded, so we can see details about that process, rather than doing it all a=
t once. =E2=80=94help, while global, shouldn=E2=80=99t be handled in the fi=
rst pass, otherwise the help info will lack info about the plugins.</div><d=
iv class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">I=E2=80=99ll =
add that info to the commit message, and also rename initial_args to global=
_args to hopefully clarify it a bit better in the code.<br>-- <br><div clas=
s=3D"gmail_signature"><div dir=3D"ltr">Christopher Larson<br>kergoth at gma=
il dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - T=
slib<br>Senior Software Engineer, Mentor Graphics</div></div>
</div></div>

--001a11c0b2ced26dd4051b788256--
