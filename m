Received: from mail-out.m-online.net ([212.18.0.10])
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <wd@denx.de>)
	id 1SyOFa-0000GF-NO for openembedded-core@lists.openembedded.org;
	Mon, 06 Aug 2012 16:25:42 +0200
Received: from frontend1.mail.m-online.net (frontend1.mail.intern.m-online.net
	[192.168.8.180])
	by mail-out.m-online.net (Postfix) with ESMTP id 3WrLSm2r3dz3hhXL;
	Mon,  6 Aug 2012 16:14:00 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
	by mail.m-online.net (Postfix) with ESMTP id 3WrLSm2dmFzbbgZ;
	Mon,  6 Aug 2012 16:14:00 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from smtp-auth.mnet-online.de ([192.168.8.180])
	by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavisd-new,
	port 10024)
	with ESMTP id 4x3zI+hbWuVv; Mon,  6 Aug 2012 16:13:52 +0200 (CEST)
X-Auth-Info: 9Wvbji3pEIvK816O5IlmpHQecWGd/lH/YwiZ02ZlUL4=
Received: from diddl.denx.de (host-80-81-18-216.customer.m-online.net
	[80.81.18.216]) by smtp-auth.mnet-online.de (Postfix) with ESMTPA;
	Mon,  6 Aug 2012 16:13:52 +0200 (CEST)
Received: from gemini.denx.de (unknown [10.0.0.2])
	by diddl.denx.de (Postfix) with ESMTP id 81C111A2115;
	Mon,  6 Aug 2012 16:13:52 +0200 (CEST)
Received: from gemini.denx.de (localhost [127.0.0.1])
	by gemini.denx.de (Postfix) with ESMTP id 8D649203FD8;
	Mon,  6 Aug 2012 16:13:51 +0200 (CEST)
To: Radu Moisan <radu.moisan@intel.com>
From: Wolfgang Denk <wd@denx.de>
MIME-Version: 1.0
In-reply-to: <501FD013.5040000@intel.com>
References: <1343997523-4117-1-git-send-email-radu.moisan@intel.com>
	<20120803161915.399D1203B3D@gemini.denx.de>
	<501F63FF.1070401@intel.com>
	<20120806074542.A63C0203FD8@gemini.denx.de>
	<501FC96A.8000400@intel.com>
	<20120806134641.E98B3203FD8@gemini.denx.de>
	<501FD013.5040000@intel.com>
Comments: In-reply-to Radu Moisan <radu.moisan@intel.com>
	message dated "Mon, 06 Aug 2012 17:09:23 +0300."
Date: Mon, 06 Aug 2012 16:13:51 +0200
Message-Id: <20120806141351.8D649203FD8@gemini.denx.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][RFC] u-boot: Upgrade to upstream stable 2012.07
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
X-List-Received-Date: Mon, 06 Aug 2012 14:25:42 -0000
Content-type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Dear Radu,

In message <501FD013.5040000@intel.com> you wrote:
>
> CROSS_COMPILE is set in EXTRA_OEMAKE which is used in oe-runmake()=20
> within do_compile()
> Running devshell is achieved in do_devshell() which is run after=20
> do_patch() but before do_compile(), that's why in devshell CROSS_COMPIL=
E=20
> is not (yet) set.

But CROSS_COMPILE _is_ set (and apparently has the value
"i386-linux-".

The problem is that PATH is not set such that it contains any such
file as i386-linux-gcc.


Best regards,

Wolfgang Denk

--=20
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
"Beware of bugs in the above code; I have only proved it correct, not
tried it."                                             - Donald Knuth


