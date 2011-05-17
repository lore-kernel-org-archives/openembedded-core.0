Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>)
	id 1QMB5x-0004la-Ag; Tue, 17 May 2011 05:37:17 +0200
Received: by eye27 with SMTP id 27so24916eye.6
	for <multiple recipients>; Mon, 16 May 2011 20:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:from:date:message-id:subject:to
	:content-type; bh=jM435ebG/Dj/aLEL3ja+NrXGLA9M6yUPOR99uZReNTw=;
	b=BlTnIDCoXGzQzrYkun/j2ERLjSm8B9F8Oaikw7MPNU9hBzzeERxs/NdLMgf9qCXyGC
	zT9lGXZTBqeGBkNF86yR0VPT9qiTNNu6ndMGe1INkzvjMANPWej/VTlidJT5l4CbW85N
	Oy8UlMV+JDJOz1E2wJ5vj37dZnA9z+e6Fo45A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	b=Wnei/cpJM4igSC2uywSAM0ZushM1z0x9XlcuN4Z5SgrJDeUvHcXjXfqp9sGjPt+N9O
	pEVzaA2HvweYQJJ1QPNppw7xU5rmbKtVZdIEOETYQ8eGsjgauuARe41z6KIgwrQ5dtSK
	P9frbCjpD91SEmQDrp0V3UYQsu6ZO2Uiq1hqw=
Received: by 10.14.7.198 with SMTP id 46mr42028eep.108.1305603264212; Mon, 16
	May 2011 20:34:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.53.78 with HTTP; Mon, 16 May 2011 20:33:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 16 May 2011 20:33:54 -0700
Message-ID: <BANLkTins9Bp0bJ9=08OD7b9cvinJ06r9ng@mail.gmail.com>
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: SlugOS layers on top of openembedded-core/meta-openembedded available
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
X-List-Received-Date: Tue, 17 May 2011 03:37:17 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

I have ported over the slugos distributon as collection of layers on
top of oe-core and meta-oe. There are two new layers
created namely meta-sluos the distro layer and meta-nslu2 the machine
layer for nslu2. There is a third repo which is the master
project which contains the makefile and supporting scripts to do the
layering and setup. Right now its able to build slugos-images for
nslu2be based on both uclibc and eglibc

If you are interested to play around please give it a shot. The procedure is

Clone the slugos-setup repo

$ git clone git://github.com/kraj/slugos-setup.git
$ cd slugos-setup
$ make

and see the magic unfold

I would be interested in problem reports anybody runs into.

The layer repositories are currently hosted on github.com until they
find another place

Enjoy

-Khem


