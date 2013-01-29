Received: from hrndva-omtalb.mail.rr.com ([71.74.56.122])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <hchapman-oecore@3gfp.com>) id 1U0JgF-0004I0-Cg
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Jan 2013 23:29:28 +0100
X-Authority-Analysis: v=2.0 cv=QcjkT7nv c=1 sm=0 a=0BEmelG+NCIkmYz4MtfDKA==:17
	a=KAMKcUAUZugA:10 a=GlcJdTXvC24A:10 a=h1JwTc6auzgA:10
	a=wPDyFdB5xvgA:10 a=kj9zAlcOel0A:10 a=cL4bF6sHAAAA:8
	a=X7dwJZnD9C0A:10 a=pGLkceISAAAA:8 a=UBhn7au_FPf2FxZ8mnkA:9
	a=CjuIK1q_8ugA:10 a=MSl-tDqOz04A:10
	a=0BEmelG+NCIkmYz4MtfDKA==:117
X-Cloudmark-Score: 0
X-Authenticated-User: 
X-Originating-IP: 65.34.9.19
Received: from [65.34.9.19] ([65.34.9.19:44206] helo=blue.3gfp.com)
	by hrndva-oedge03.mail.rr.com (envelope-from
	<hchapman-oecore@3gfp.com>) (ecelerity 2.2.3.46 r()) with ESMTP
	id 4C/6F-06396-A9948015; Tue, 29 Jan 2013 22:13:47 +0000
Received: from localhost (localhost [127.0.0.1])
	by blue.3gfp.com (Postfix) with ESMTP id 7025B1080589;
	Tue, 29 Jan 2013 17:13:46 -0500 (EST)
X-Virus-Scanned: by amavisd-new-2.6.4 (20090625) (Debian) at 3gfp.com
Received: from blue.3gfp.com ([127.0.0.1])
	by localhost (blue.3gfp.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 15IYQrjdZzfE; Tue, 29 Jan 2013 17:13:46 -0500 (EST)
Received: from [192.168.0.115] (rrcs-71-43-163-130.se.biz.rr.com
	[71.43.163.130])
	by blue.3gfp.com (Postfix) with ESMTPSA id D8C0A1080478;
	Tue, 29 Jan 2013 17:13:45 -0500 (EST)
Mime-Version: 1.0 (Mac OS X Mail 6.2 \(1499\))
From: Harvey Chapman <hchapman-oecore@3gfp.com>
In-Reply-To: <20130129203953.GS16904@jama.palm1.palmone.com>
Date: Tue, 29 Jan 2013 17:13:45 -0500
Message-Id: <F9975BBC-4DD7-41A8-AD7B-601BD66E8A8B@3gfp.com>
References: <20130129203953.GS16904@jama.palm1.palmone.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Mailer: Apple Mail (2.1499)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: sstate keeping ipk for every AUTOINC value?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 29 Jan 2013 22:29:31 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

On Jan 29, 2013, at 3:39 PM, Martin Jansa <martin.jansa@gmail.com> =
wrote:

> Or why do I have each .ipk 7 times in deploy/ipk/arch?
>=20
> tmp-eglibc/sstate-control $ grep ncurses_ =
manifest-armv5te-ncurses.deploy-ipk
> =
/OE/oe-core/tmp-eglibc/deploy/ipk/armv5te/ncurses_5.9-r13.1.6_armv5te.ipk
> =
/OE/oe-core/tmp-eglibc/deploy/ipk/armv5te/ncurses_5.9-r13.1.8_armv5te.ipk
> =
/OE/oe-core/tmp-eglibc/deploy/ipk/armv5te/ncurses_5.9-r13.1.7_armv5te.ipk
> =
/OE/oe-core/tmp-eglibc/deploy/ipk/armv5te/ncurses_5.9-r13.1.4_armv5te.ipk
> =
/OE/oe-core/tmp-eglibc/deploy/ipk/armv5te/ncurses_5.9-r13.1.3_armv5te.ipk
> =
/OE/oe-core/tmp-eglibc/deploy/ipk/armv5te/ncurses_5.9-r13.1.9_armv5te.ipk
> =
/OE/oe-core/tmp-eglibc/deploy/ipk/armv5te/ncurses_5.9-r13.1.1_armv5te.ipk

On that note, I often tweak my PR value when testing a modification to a =
recipe. Then, I change it back. How do I get rid of all of the files =
generated for a recipe that no longer exists like all of Martin's old =
ncurses versions shown above?

Is there some way to have all of the old revisions auto-deleted?=


