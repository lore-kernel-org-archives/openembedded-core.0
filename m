Return-Path: <abuse@basmevissen.nl>
X-Greylist: delayed 521 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 02 Nov 2016 11:48:57 UTC
Received: from hosting.emcodev.net (hosting.emcodev.net [178.18.92.162])
	by mail.openembedded.org (Postfix) with ESMTP id BE44871A55
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Nov 2016 11:48:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by hosting.emcodev.net (Postfix) with ESMTP id 497EC12AE84;
	Wed,  2 Nov 2016 12:40:16 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at hosting.emcodev.net
Received: from hosting.emcodev.net ([127.0.0.1])
	by localhost (hosting.emcodev.net [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id adYjEp7DVvNH; Wed,  2 Nov 2016 12:39:57 +0100 (CET)
Received: from [192.168.178.15] (541CD0EC.cm-5-5d.dynamic.ziggo.nl
	[84.28.208.236]) (Authenticated sender: bas@emcodev.nl)
	by hosting.emcodev.net (Postfix) with ESMTPSA id D28BB12AD91;
	Wed,  2 Nov 2016 12:39:57 +0100 (CET)
Mime-Version: 1.0 (1.0)
From: Bas Mevissen <abuse@basmevissen.nl>
X-Mailer: iPad Mail (14A456)
In-Reply-To: <CAJTo0LbZrrrcvMmqpb943oarTKY6B=UkmszpdFLv=3cWqCV9SA@mail.gmail.com>
Date: Wed, 2 Nov 2016 12:39:57 +0100
Message-Id: <1BF9A377-D1BB-467B-90F2-0E205B7CEF49@basmevissen.nl>
References: <1478030040-20670-1-git-send-email-fabio.berton@ossystems.com.br>
	<1478030040-20670-4-git-send-email-fabio.berton@ossystems.com.br>
	<CAJTo0LbZrrrcvMmqpb943oarTKY6B=UkmszpdFLv=3cWqCV9SA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/8] serf: Update to version 1.3.9
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
X-List-Received-Date: Wed, 02 Nov 2016 11:48:58 -0000
Content-Type: multipart/alternative;
	boundary=Apple-Mail-74B3F2A0-EB2B-41D5-9A84-47CBE14DC51C
Content-Transfer-Encoding: 7bit

--Apple-Mail-74B3F2A0-EB2B-41D5-9A84-47CBE14DC51C
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> On 2 Nov 2016, at 12:04, Burton, Ross <ross.burton@intel.com> wrote:
>=20
>=20
>> On 1 November 2016 at 19:53, Fabio Berton <fabio.berton@ossystems.com.br>=
 wrote:
>> -SRC_URI =3D "http://snapshot.debian.org/archive/debian/20160728T043443Z/=
pool/main/s/${BPN}/${BPN}_${PV}.orig.tar.gz \
>> +SRC_URI =3D "https://www.apache.org/dist/${PN}/${PN}-${PV}.tar.bz2 \
>=20
> The reason we download from snapshot.debian.org is that apache.org/dist/ o=
nly contains the latest release (see http://apache.org/dist/serf/) so the mo=
ment 1.4.0 is released the tarball will disappear.
>=20
> If apache maintains an archive of *all* releases with a stable URL then th=
at would be preferable to snapshot.debian.org, but relying on apache.org/dis=
t/ isn't possible.
>=20

It looks like https://archive.apache.org/dist/serf contains all releases, in=
cluding the current one.

Bas.


> Ross
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--Apple-Mail-74B3F2A0-EB2B-41D5-9A84-47CBE14DC51C
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><div><br></div><div>On 2 Nov 2016, at 12:04=
, Burton, Ross &lt;<a href=3D"mailto:ross.burton@intel.com">ross.burton@inte=
l.com</a>&gt; wrote:<br><br></div><blockquote type=3D"cite"><div><div dir=3D=
"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 1 Novembe=
r 2016 at 19:53, Fabio Berton <span dir=3D"ltr">&lt;<a href=3D"mailto:fabio.=
berton@ossystems.com.br" target=3D"_blank">fabio.berton@ossystems.com.br</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border=
-left-style:solid;padding-left:1ex"><div id=3D"gmail-:p8" class=3D"gmail-a3s=
 gmail-aXjCH gmail-m158217aab2569672">-SRC_URI =3D "<a href=3D"http://snapsh=
ot.debian.org/archive/debian/20160728T043443Z/pool/main/s/${BPN}/${BPN}_${PV=
}.orig.tar.gz" rel=3D"noreferrer" target=3D"_blank">http://snapshot.debian.o=
rg/<wbr>archive/debian/<wbr>20160728T043443Z/pool/main/s/$<wbr>{BPN}/${BPN}_=
${PV}.orig.tar.gz</a> \<br>
+SRC_URI =3D "<a href=3D"https://www.apache.org/dist/${PN}/${PN}-${PV}.tar.b=
z2" rel=3D"noreferrer" target=3D"_blank">https://www.apache.org/dist/$<wbr>{=
PN}/${PN}-${PV}.tar.bz2</a> \</div></blockquote></div><br>The reason we down=
load from <a href=3D"http://snapshot.debian.org">snapshot.debian.org</a> is t=
hat <a href=3D"http://apache.org/dist/">apache.org/dist/</a> only contains t=
he latest release (see&nbsp;<a href=3D"http://apache.org/dist/serf/">http://=
apache.org/dist/serf/</a>) so the moment 1.4.0 is released the tarball will d=
isappear.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extr=
a">If apache maintains an archive of *all* releases with a stable URL then t=
hat would be preferable to <a href=3D"http://snapshot.debian.org">snapshot.d=
ebian.org</a>, but relying on <a href=3D"http://apache.org/dist/">apache.org=
/dist/</a> isn't possible.</div><div class=3D"gmail_extra"><br></div></div><=
/div></blockquote><div><br></div>It looks like&nbsp;<a href=3D"https://archi=
ve.apache.org/dist/serf/">https://archive.apache.org/dist/serf</a>&nbsp;cont=
ains all releases, including the current one.<div><br></div><div>Bas.</div><=
div><br></div><div><br><blockquote type=3D"cite"><div><div dir=3D"ltr"><div c=
lass=3D"gmail_extra">Ross</div></div>
</div></blockquote><blockquote type=3D"cite"><div><span>-- </span><br><span>=
_______________________________________________</span><br><span>Openembedded=
-core mailing list</span><br><span><a href=3D"mailto:Openembedded-core@lists=
.openembedded.org">Openembedded-core@lists.openembedded.org</a></span><br><s=
pan><a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-c=
ore">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a></s=
pan><br></div></blockquote></div></body></html>=

--Apple-Mail-74B3F2A0-EB2B-41D5-9A84-47CBE14DC51C--
