Return-Path: <ilkka.myller@nodefield.com>
X-Greylist: delayed 588 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 26 Apr 2017 20:41:41 UTC
Received: from smtp101.iad3a.emailsrvr.com (smtp101.iad3a.emailsrvr.com
	[173.203.187.101])
	by mail.openembedded.org (Postfix) with ESMTP id DD79E77D1F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Apr 2017 20:41:41 +0000 (UTC)
Received: from smtp37.relay.iad3a.emailsrvr.com (localhost [127.0.0.1])
	by smtp37.relay.iad3a.emailsrvr.com (SMTP Server) with ESMTP id
	A1A455BDE; Wed, 26 Apr 2017 16:31:54 -0400 (EDT)
X-Auth-ID: ilkka@nodefield.com
Received: by smtp37.relay.iad3a.emailsrvr.com (Authenticated sender:
	ilkka-AT-nodefield.com) with ESMTPSA id B71BD5B7B; 
	Wed, 26 Apr 2017 16:31:53 -0400 (EDT)
X-Sender-Id: ilkka@nodefield.com
Received: from imac.klaukkala.myller.lan (mobile-user-c3a5b5-111.dhcp.inet.fi
	[195.165.181.111])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384)
	by 0.0.0.0:465 (trex/5.7.12); Wed, 26 Apr 2017 16:31:54 -0400
From: Ilkka Myller <ilkka.myller@nodefield.com>
Message-Id: <CB34FC1D-AA6C-4C69-8C64-DF963214FFEB@nodefield.com>
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Date: Wed, 26 Apr 2017 23:31:52 +0300
In-Reply-To: <20170426192815.GA2366@linux-uys3>
To: Trevor Woerner <twoerner@gmail.com>
References: <655290B7709079438B7932553958E60D16D23684@ESS-EX01.essvote.corp.local>
	<20170426192815.GA2366@linux-uys3>
X-Mailer: Apple Mail (2.3273)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Broken NPM builds
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
X-List-Received-Date: Wed, 26 Apr 2017 20:41:45 -0000
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_BCCF63BC-C5F0-4FA2-976E-8A619547D446"

--Apple-Mail=_BCCF63BC-C5F0-4FA2-976E-8A619547D446
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

I=E2=80=99m the maintainer of meta-nodejs layer. The layer offers latest =
Node.js versions (current, LTS and end-of-life). As a member of Node.js =
core collaborator team, I=E2=80=99ve picked up the task of maintaining =
up-to-date Node.js offering for OE.=20

In addition to Node.js core packages the layer offers oe_runnpm command =
(from npm-base class) that allows running 100% standard npm with added =
capability to safely cross-compile native components on build host.
This command is analogous to oe_runmake from base class in OE core.

This design allows building static, immutable, OE-proper packages for =
Node.js based applications while still using standard npm installation =
process on the build host. This is where OE core npm class differs the =
most by-design.

meta-nodejs has chosen not to promote non-standard use of npm utility, =
npm repository or npm installation process.=20

However, as Michael Davis pointed out we can merge his patch allowing =
co-existence of both methods to meta-nodejs layer. I expect this to =
happen within few days if all goes well.

> Trevor Woerner <twoerner@gmail.com> kirjoitti 26.4.2017 kello 22.28:
>=20
> Ideally we'd either merge all/most of
> =
https://layers.openembedded.org/layerindex/branch/master/layer/meta-nodejs=
/ =
<https://layers.openembedded.org/layerindex/branch/master/layer/meta-nodej=
s/>
> into oecore, or remove what's in oecore and tell people to use the =
external
> layer. Why does oe-core have some, but not all, node support?


--Apple-Mail=_BCCF63BC-C5F0-4FA2-976E-8A619547D446
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><div class=3D"">I=E2=80=99m the maintainer of meta-nodejs =
layer. The layer offers latest Node.js versions (current, LTS and =
end-of-life). As a member of Node.js core collaborator team, I=E2=80=99ve =
picked up the task of maintaining up-to-date Node.js offering for =
OE.&nbsp;</div><div class=3D""><br class=3D""></div><div class=3D"">In =
addition to Node.js core packages the layer offers oe_runnpm command =
(from npm-base class) that allows running 100% standard npm with added =
capability to safely cross-compile native components on build =
host.</div><div class=3D"">This command is analogous to oe_runmake from =
base class in OE core.</div><div class=3D""><br class=3D""></div><div =
class=3D"">This design allows building static, immutable, OE-proper =
packages for Node.js based applications while still using standard npm =
installation process on the build host. This is where OE core npm class =
differs the most by-design.</div><div class=3D""><br class=3D""></div><div=
 class=3D"">meta-nodejs has chosen not to promote non-standard use of =
npm utility, npm repository or npm installation process.&nbsp;</div><div =
class=3D""><br class=3D""></div><div class=3D"">However, as Michael =
Davis pointed out we can merge his patch allowing co-existence of both =
methods to meta-nodejs layer. I expect this to happen within few days if =
all goes well.</div><div class=3D""><br class=3D""></div><div><blockquote =
type=3D"cite" class=3D""><div class=3D"">Trevor Woerner &lt;<a =
href=3D"mailto:twoerner@gmail.com" class=3D"">twoerner@gmail.com</a>&gt; =
kirjoitti 26.4.2017 kello 22.28:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><span =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; float: none; =
display: inline !important;" class=3D"">Ideally we'd either merge =
all/most of</span><br style=3D"font-family: Helvetica; font-size: 12px; =
font-style: normal; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px;" class=3D""><a =
href=3D"https://layers.openembedded.org/layerindex/branch/master/layer/met=
a-nodejs/" style=3D"font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;" =
class=3D"">https://layers.openembedded.org/layerindex/branch/master/layer/=
meta-nodejs/</a><br style=3D"font-family: Helvetica; font-size: 12px; =
font-style: normal; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px;" class=3D""><span style=3D"font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; float: none; display: =
inline !important;" class=3D"">into oecore, or remove what's in oecore =
and tell people to use the external</span><br style=3D"font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D""><span =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; float: none; =
display: inline !important;" class=3D"">layer. Why does oe-core have =
some, but not all, node support?</span></div></blockquote></div><br =
class=3D""></body></html>=

--Apple-Mail=_BCCF63BC-C5F0-4FA2-976E-8A619547D446--
