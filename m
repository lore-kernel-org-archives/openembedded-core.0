Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1R8dH8-0005Cu-Ol
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Sep 2011 21:25:06 +0200
Received: by bke11 with SMTP id 11so7501376bke.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Sep 2011 12:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=EPTN9ZsinlzQhFafnood7Q30HXl2eRV6u3M0oYjEgww=;
	b=G+KesYOAZycqJJ+jhjJC8VyRSpKdYzMDJqWMqdbHpLMxB0bMUnuPpSfNqjf4IyPhoW
	zb2hZynogLP5YTU1wKZ130kdlNjQMUMeWuhyS+/wXfbPy58yvGl1a41ic3QA3lVXUb8G
	J8ewK2ABAt27UVZIwsBGyW4PRHOvwAtTNILUs=
MIME-Version: 1.0
Received: by 10.204.128.130 with SMTP id k2mr5797877bks.322.1317151180821;
	Tue, 27 Sep 2011 12:19:40 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.35.198 with HTTP; Tue, 27 Sep 2011 12:19:40 -0700 (PDT)
Date: Tue, 27 Sep 2011 16:19:40 -0300
X-Google-Sender-Auth: M_EEOxXfGhQ_PWvdBkKA-v6tjUo
Message-ID: <CAP9ODKrJS5MAdiU1bL+pT=cBb0=j1tXpk0KQQJ=4uww5r_-G+Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: [RFH] package_setscene failing when using gitpkgv
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
X-List-Received-Date: Tue, 27 Sep 2011 19:25:06 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,

We have some packages that use gitpkgv but protocol ssh ... for this
specific case we're seeing the building get stuck due ssh asking for
credentials.

After looking at why this happened we figured it was due the use of
pseudo but this is expected to be used for package_setscene however we
fail to see why git ls-remote is being ran when package_setscene is
called.

Anyone has a clue?

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


