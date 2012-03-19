Received: from mail-out.m-online.net ([212.18.0.10])
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <wd@denx.de>)
	id 1S9kru-00055e-Vf for openembedded-core@lists.openembedded.org;
	Mon, 19 Mar 2012 23:15:59 +0100
Received: from frontend1.mail.m-online.net (frontend1.mail.intern.m-online.net
	[192.168.8.180])
	by mail-out.m-online.net (Postfix) with ESMTP id 3VBWQh3GbWz3hhbZ;
	Mon, 19 Mar 2012 22:59:40 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.8.164])
	by mail.m-online.net (Postfix) with ESMTP id 3VBWQh3Bhyz4KK3d;
	Mon, 19 Mar 2012 22:59:40 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from smtp-auth.mnet-online.de ([192.168.8.180])
	by localhost (dynscan1.mail.m-online.net [192.168.8.164]) (amavisd-new,
	port 10024)
	with ESMTP id LFyYy+h9oqHW; Mon, 19 Mar 2012 22:59:40 +0100 (CET)
Received: from diddl.denx.de (host-80-81-18-216.customer.m-online.net
	[80.81.18.216]) by smtp-auth.mnet-online.de (Postfix) with ESMTPA;
	Mon, 19 Mar 2012 22:59:39 +0100 (CET)
Received: from gemini.denx.de (gemini.denx.de [10.0.0.2])
	by diddl.denx.de (Postfix) with ESMTP id 723BC1A5F9F;
	Mon, 19 Mar 2012 22:59:39 +0100 (CET)
Received: from gemini.denx.de (localhost [127.0.0.1])
	by gemini.denx.de (Postfix) with ESMTP id 5336A206060;
	Mon, 19 Mar 2012 22:59:34 +0100 (CET)
To: openembedded-core@lists.openembedded.org
From: Wolfgang Denk <wd@denx.de>
MIME-Version: 1.0
Comments: In-reply-to Richard Purdie <richard.purdie@linuxfoundation.org>
	message dated "Mon, 19 Mar 2012 21:22:30 +0000."
Date: Mon, 19 Mar 2012 22:59:34 +0100
Message-Id: <20120319215934.5336A206060@gemini.denx.de>
Subject: specific version dependenciews - was: Linking two recipes
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
X-List-Received-Date: Mon, 19 Mar 2012 22:15:59 -0000
Content-type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Dear Richard,

In message <1332192150.9740.72.camel@ted> you wrote:
> On Mon, 2012-03-19 at 13:59 -0700, simran singh wrote:
> > Hello,
> > I have recipes for two applications Recipe A and Recipe B. Recipe B
> > requires a lib.so file and init.h file which are installed by Recipe
> > A.
...
> recipe B needs to do:
>=20
> DEPENDS +=3D "recipeA"

I have a similar, but more complicated requirement which I don;t know
how to implement (if this is possible at all):

Some MACHINEs require a package A (some library), but in specific
versions: say machine X needs version A-1.2, while machine Y needs
version A-1.5.

Package A itself depends on another package B (another library).

The problem is, that different versions of A require specific versions
of B.  For example, to build A-1.2 we must use B-4.5, but to build
A-1.5 we must use B-8.2.

I am aware that I can describe the dependencies at the top leven,
stating for example that machine X needs A-1.2 and B-4.5, while
machine Y needs A-1.5 and B-8.2.

However, this seems clumsy, as the version depency A->B is something
that is only defined by the implementation of A, and I would like to
keep it encapsulated at this level.


Is there a clever way to describe such a multi-level dependency chain?

Thanks in advance.

Best regards,

Wolfgang Denk

--=20
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
As in certain cults it is possible to kill a process if you know  its
true name.                      -- Ken Thompson and Dennis M. Ritchie


