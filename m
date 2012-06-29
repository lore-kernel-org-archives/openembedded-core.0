Received: from mail-out.m-online.net ([212.18.0.10])
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <wd@denx.de>)
	id 1SkksS-00036R-Dw for openembedded-core@lists.openembedded.org;
	Sat, 30 Jun 2012 01:45:28 +0200
Received: from frontend4.mail.m-online.net (unknown [192.168.8.183])
	by mail-out.m-online.net (Postfix) with ESMTP id 3WPDjS0sK4z3hhXk;
	Sat, 30 Jun 2012 01:34:52 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.8.164])
	by mail.m-online.net (Postfix) with ESMTP id 3WPDj61cVdzbbrV;
	Sat, 30 Jun 2012 01:34:34 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from smtp-auth.mnet-online.de ([192.168.8.183])
	by localhost (dynscan1.mail.m-online.net [192.168.8.164]) (amavisd-new,
	port 10024)
	with ESMTP id hDWr7b7Lvf-G; Sat, 30 Jun 2012 01:34:33 +0200 (CEST)
Received: from diddl.denx.de (host-80-81-18-216.customer.m-online.net
	[80.81.18.216]) by smtp-auth.mnet-online.de (Postfix) with ESMTPA;
	Sat, 30 Jun 2012 01:34:33 +0200 (CEST)
Received: from gemini.denx.de (gemini.denx.de [10.0.0.2])
	by diddl.denx.de (Postfix) with ESMTP id 635761A20EE;
	Sat, 30 Jun 2012 01:34:33 +0200 (CEST)
Received: from gemini.denx.de (localhost [127.0.0.1])
	by gemini.denx.de (Postfix) with ESMTP id 368832026AF;
	Sat, 30 Jun 2012 01:34:33 +0200 (CEST)
To: Khem Raj <raj.khem@gmail.com>
From: Wolfgang Denk <wd@denx.de>
MIME-Version: 1.0
In-reply-to: <CAMKF1sp8=OreFKNds00t-rxoVVgWaraUTRzMNqVZdY13FXu2YA@mail.gmail.com>
References: <1340994915-14947-1-git-send-email-paul.gortmaker@windriver.com>
	<1340994915-14947-2-git-send-email-paul.gortmaker@windriver.com>
	<CAMKF1srGhdr8kAQ+wyYPnVUW6nq_BHHup22YcGqrFrroW7WHhQ@mail.gmail.com>
	<20120629220145.70BDC2026AF@gemini.denx.de>
	<CAMKF1sp8=OreFKNds00t-rxoVVgWaraUTRzMNqVZdY13FXu2YA@mail.gmail.com>
Comments: In-reply-to Khem Raj <raj.khem@gmail.com>
	message dated "Fri, 29 Jun 2012 15:11:45 -0700."
Date: Sat, 30 Jun 2012 01:34:33 +0200
Message-Id: <20120629233433.368832026AF@gemini.denx.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] u-boot: Don't make the -Os removal part of global settings.
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
X-List-Received-Date: Fri, 29 Jun 2012 23:45:28 -0000
Content-type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Dear Khem Raj,

In message <CAMKF1sp8=3DOreFKNds00t-rxoVVgWaraUTRzMNqVZdY13FXu2YA@mail.gm=
ail.com> you wrote:
>=20
> > -O2 causes much bigger memory footprint, so the code does not fit any
> > more in the memory map and/or flash sectors that are reserved for it.
>=20
> Hmm interesting so we are living on edge here

Well, -O2 can mean some 30% bigger code size than -Os.  This hurts for
memory-footprint optimized code like a boot loader.  [It also hurts in
terms of exacution speed on most embedded systems...]

> Thanks for the info

You are welcome.

Best regards,

Wolfgang Denk

--=20
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
The IQ of the group is the lowest IQ of a member of the group divided
by the number of people in the group.


