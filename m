Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>)
	id 1Rfqvw-0006Zy-IC; Wed, 28 Dec 2011 11:40:33 +0100
Received: by vcbf1 with SMTP id f1so8998448vcb.6
	for <multiple recipients>; Wed, 28 Dec 2011 02:33:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=Y+rLOm0fqAH16d1PHNL74Vwvjrt55cQVHH4H4lp3jn4=;
	b=VywR5PO+RPQTjmAgMtl6hRQEg36CPMO0L74cGz9T6Ep9UYHWqNa9Tb85mLd9FyEz4q
	CXXb22xQ5RUeXGIv1P8FojQqxAXQM9ZJjutP8Oczb0I6PuWKgY2b3HTi1y1H8FZXQkBo
	Baowd6KSI8rxlJWqGCcmrDuerxcv4EfZof8eY=
MIME-Version: 1.0
Received: by 10.52.178.195 with SMTP id da3mr15253626vdc.20.1325068395786;
	Wed, 28 Dec 2011 02:33:15 -0800 (PST)
Received: by 10.52.160.137 with HTTP; Wed, 28 Dec 2011 02:33:15 -0800 (PST)
Date: Wed, 28 Dec 2011 11:33:15 +0100
Message-ID: <CACW_hTbBoB4yaN0W+H3WuW9GXYFGD6+FxQ5BMbKe+a2-pqc_Hw@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: non-fetching recipes
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
X-List-Received-Date: Wed, 28 Dec 2011 10:40:33 -0000
Content-Type: multipart/alternative; boundary=bcaec51a7d5a08b17f04b52487e4

--bcaec51a7d5a08b17f04b52487e4
Content-Type: text/plain; charset=ISO-8859-1

Hi,

I noticed that several recipes are non-fetchers. These are mostly the ones
with sources hosted on kernel.org.
Is there an issue with kernel.org again?

I noticed this for oe classic where libpam and util-linux-ng did not fetch
(as well as opkg-utils but that one is from openmoko).
oe maintenance branch seems to have the same problems as well as using
binutils 2.21 which is not available any more. master does not have this as
it has been moved to 2.21a.

I'm crossposting this to oe-core, because I noticed it uses the same
location for libpam (and probably util-linux).

Someone might want to run some fetchalls.

Frans.

--bcaec51a7d5a08b17f04b52487e4
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,<br><br>I noticed that several recipes are non-fetchers. These are mostl=
y the ones with sources hosted on <a href=3D"http://kernel.org">kernel.org<=
/a>. <br>Is there an issue with <a href=3D"http://kernel.org">kernel.org</a=
> again?<br>
<br>I noticed this for oe classic where libpam and util-linux-ng did not fe=
tch (as well as opkg-utils but that one is from openmoko).<br>oe maintenanc=
e branch seems to have the same problems as well as using binutils 2.21 whi=
ch is not available any more. master does not have this as it has been move=
d to 2.21a.<br>
<br>I&#39;m crossposting this to oe-core, because I noticed it uses the sam=
e location for libpam (and probably util-linux).<br><br>Someone might want =
to run some fetchalls.<br><br>Frans.<br>

--bcaec51a7d5a08b17f04b52487e4--
