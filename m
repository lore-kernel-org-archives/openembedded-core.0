Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1R92ln-0007t9-W7
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Sep 2011 00:38:28 +0200
Received: by yia27 with SMTP id 27so7964511yia.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2011 15:32:59 -0700 (PDT)
Received: by 10.236.173.231 with SMTP id v67mr1387176yhl.48.1317249179505;
	Wed, 28 Sep 2011 15:32:59 -0700 (PDT)
Received: from [10.0.1.28] (adsl-68-88-70-1.dsl.rcsntx.swbell.net.
	[68.88.70.1])
	by mx.google.com with ESMTPS id g66sm303795yhh.12.2011.09.28.15.32.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 28 Sep 2011 15:32:58 -0700 (PDT)
References: <201109282319.08663.schnitzeltony@gmx.de>
In-Reply-To: <201109282319.08663.schnitzeltony@gmx.de>
Mime-Version: 1.0 (iPhone Mail 8L1)
Message-Id: <F880B9A0-D329-43D1-80ED-C12732108908@dominion.thruhere.net>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
X-Mailer: iPhone Mail (8L1)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 28 Sep 2011 17:32:55 -0500
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: oe-core lsb / oe-classic lsb_base
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Sep 2011 22:38:28 -0000
Content-Transfer-Encoding: 7bit
Content-Type: multipart/alternative;
	boundary=Apple-Mail-3--360439281

--Apple-Mail-3--360439281
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



Op 28 sep. 2011 om 16:19 heeft Andreas M=C3=BCller <schnitzeltony@gmx.de> he=
t volgende geschreven:

> I am trying to get networkmanager ( included in meta-oe ) working. Since t=
he daemon does not start automatically, I try to start it manually by /etc/i=
nit.d/Networkmanager start

Stop using sysvinit and switch to systemd.=20




> That complaines about missing /lib/lsb/init-functions. OK - I add lsb to R=
DEPEND in networkmanager but now manual start complains for missing function=
 log_daemon_msg ( and will surely later complain about log_end_msg ). Furthe=
r investigations make me wonder:=20
>=20
> - *All* files found in /etc/core-lsb include the file /etc/init.d/function=
s which is not included on my image.
> - scripts init-functions and included are sourced in oe-core. Do we want t=
o maintain these scripts?
> - isn't this a case for inherit allarch?
>=20
> I checked lsb_base in oe-classic: The sources are taken from debian and=20=

>=20
> + /lib/lsb/init-functions contains my missing functions
> - lsb_release is a python script
>=20
> So how about
>=20
> * reduce lsb down to lsb_release ( and rename recipe to lsb_release )
> * add lsb_base from oe-classic
>=20
> OR
>=20
> combine both: Take oe-core lsb_release and oe-classic init-functions ( res=
ulting version number? )
>=20
> What do you think?
>=20
> Andreas
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--Apple-Mail-3--360439281
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><body bgcolor=3D"#FFFFFF"><div><br><br>Op 28 sep. 2011 om 16:19 heeft A=
ndreas M=C3=BCller &lt;<a href=3D"mailto:schnitzeltony@gmx.de">schnitzeltony=
@gmx.de</a>&gt; het volgende geschreven:<br><br></div><div></div><blockquote=
 type=3D"cite"><div><span>I am trying to get networkmanager ( included in me=
ta-oe ) working. Since the daemon does not start automatically, I try to sta=
rt it manually by /etc/init.d/Networkmanager start</span><font class=3D"Appl=
e-style-span" color=3D"#000000"><font class=3D"Apple-style-span" color=3D"#0=
023A3"><br></font></font></div></blockquote><div><br></div>Stop using sysvin=
it and switch to systemd.&nbsp;<br><div><br></div><div><br></div><div><br></=
div><br><blockquote type=3D"cite"><div><span>That complaines about missing /=
lib/lsb/init-functions. OK - I add lsb to RDEPEND in networkmanager but now m=
anual start complains for missing function log_daemon_msg ( and will surely l=
ater complain about log_end_msg ). Further investigations make me wonder: </=
span><br><span></span><br><span>- *All* files found in /etc/core-lsb include=
 the file /etc/init.d/functions which is not included on my image.</span><br=
><span>- scripts init-functions and included are sourced in oe-core. Do we w=
ant to maintain these scripts?</span><br><span>- isn't this a case for inher=
it allarch?</span><br><span></span><br><span>I checked lsb_base in oe-classi=
c: The sources are taken from debian and </span><br><span></span><br><span>+=
 /lib/lsb/init-functions contains my missing functions</span><br><span>- lsb=
_release is a python script</span><br><span></span><br><span>So how about</s=
pan><br><span></span><br><span>* reduce lsb down to lsb_release ( and rename=
 recipe to lsb_release )</span><br><span>* add lsb_base from oe-classic</spa=
n><br><span></span><br><span>OR</span><br><span></span><br><span>combine bot=
h: Take oe-core lsb_release and oe-classic init-functions ( resulting versio=
n number? )</span><br><span></span><br><span>What do you think?</span><br><s=
pan></span><br><span>Andreas</span><br><span></span><br><span>______________=
_________________________________</span><br><span>Openembedded-core mailing l=
ist</span><br><span><a href=3D"mailto:Openembedded-core@lists.openembedded.o=
rg">Openembedded-core@lists.openembedded.org</a></span><br><span><a href=3D"=
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core">http:=
//lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core</a></span><=
br></div></blockquote></body></html>=

--Apple-Mail-3--360439281--
