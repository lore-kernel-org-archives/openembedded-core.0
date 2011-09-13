Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <a.tqvist@gmail.com>) id 1R3RTO-0003V7-04
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Sep 2011 13:48:18 +0200
Received: by yia28 with SMTP id 28so320319yia.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Sep 2011 04:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=Lna1bi9ion69DHkjUYb6FApCmAxVAVgZgvBWmYN4qIY=;
	b=GZf38tOEeNQigs1++bYb1Qxm6qfbf7dwOEWszfzxIzOobtMCbr5okyX/SKPr0/o5++
	hqZAOu3QCXPDTZIL8EuEXj2iydd/lhj+rAfil4CxTCeoRzqIBGwzlHIh+WVJwO4bLlr2
	7vXuL+d2Ldf/v4qxfeFJPcyAryAmtlMbbOJKQ=
MIME-Version: 1.0
Received: by 10.231.20.159 with SMTP id f31mr8955146ibb.26.1315914188134; Tue,
	13 Sep 2011 04:43:08 -0700 (PDT)
Received: by 10.231.30.66 with HTTP; Tue, 13 Sep 2011 04:43:08 -0700 (PDT)
Date: Tue, 13 Sep 2011 13:43:08 +0200
Message-ID: <CAJRXtp_4uxndU6zxf5CnF6Hp-QnLcHBX=4UyDP2vc2CK7e5Nfw@mail.gmail.com>
From: =?ISO-8859-1?Q?Anders_T=F6rnqvist?= <a.tqvist@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Missing http://www.yoctoproject.org/downloads/pseudo/pseudo-1.1.1.tar.bz2
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
X-List-Received-Date: Tue, 13 Sep 2011 11:48:18 -0000
Content-Type: multipart/alternative; boundary=0015177412d0bd180a04acd1259b

--0015177412d0bd180a04acd1259b
Content-Type: text/plain; charset=ISO-8859-1

Just cloned a git version of oe core and tried to build with

git clone git://git.openembedded.org/openembedded-core oe-core
cd oe-core
git clone git://git.openembedded.org/bitbake bitbake
. ./oe-init-build-env
bitbake core-image-minimal

The build soon results in a missing
http://www.yoctoproject.org/downloads/pseudo/pseudo-1.1.1.tar.bz2 :

ERROR: Function 'Fetcher failure for URL: '
http://www.yoctoproject.org/downloads/pseudo/pseudo-1.1.1.tar.bz2'. Unable
to fetch URL
http://www.yoctoproject.org/downloads/pseudo/pseudo-1.1.1.tar.bz2 from any
source.' failed
NOTE: package pseudo-native-1.1.1-r2: task do_fetch: Failed

--0015177412d0bd180a04acd1259b
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Just cloned a git version of oe core and tried to build with<br><br>git clo=
ne git://<a href=3D"http://git.openembedded.org/openembedded-core">git.open=
embedded.org/openembedded-core</a> oe-core<br>cd oe-core<br>git clone git:/=
/<a href=3D"http://git.openembedded.org/bitbake">git.openembedded.org/bitba=
ke</a> bitbake<br>
. ./oe-init-build-env<br>bitbake core-image-minimal<br><br>The build soon r=
esults in a missing <a href=3D"http://www.yoctoproject.org/downloads/pseudo=
/pseudo-1.1.1.tar.bz2">http://www.yoctoproject.org/downloads/pseudo/pseudo-=
1.1.1.tar.bz2</a> :<br>
<br>ERROR: Function &#39;Fetcher failure for URL: &#39;<a href=3D"http://ww=
w.yoctoproject.org/downloads/pseudo/pseudo-1.1.1.tar.bz2">http://www.yoctop=
roject.org/downloads/pseudo/pseudo-1.1.1.tar.bz2</a>&#39;. Unable to fetch =
URL <a href=3D"http://www.yoctoproject.org/downloads/pseudo/pseudo-1.1.1.ta=
r.bz2">http://www.yoctoproject.org/downloads/pseudo/pseudo-1.1.1.tar.bz2</a=
> from any source.&#39; failed<br>
NOTE: package pseudo-native-1.1.1-r2: task do_fetch: Failed<br><br>

--0015177412d0bd180a04acd1259b--
