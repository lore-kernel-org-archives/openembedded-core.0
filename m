Received: from mail-out.m-online.net ([212.18.0.9])
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <wd@denx.de>)
	id 1S9wh7-0004Dk-Er for openembedded-core@lists.openembedded.org;
	Tue, 20 Mar 2012 11:53:37 +0100
Received: from frontend1.mail.m-online.net (unknown [192.168.8.180])
	by mail-out.m-online.net (Postfix) with ESMTP id 3VBrBd26T8z4LDfG;
	Tue, 20 Mar 2012 11:35:21 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.8.164])
	by mail.m-online.net (Postfix) with ESMTP id 3VBrBd0WvGz4KK3D;
	Tue, 20 Mar 2012 11:35:21 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from smtp-auth.mnet-online.de ([192.168.8.180])
	by localhost (dynscan1.mail.m-online.net [192.168.8.164]) (amavisd-new,
	port 10024)
	with ESMTP id d6gpOcIzvdFR; Tue, 20 Mar 2012 11:35:20 +0100 (CET)
Received: from diddl.denx.de (host-80-81-18-216.customer.m-online.net
	[80.81.18.216]) by smtp-auth.mnet-online.de (Postfix) with ESMTPA;
	Tue, 20 Mar 2012 11:35:20 +0100 (CET)
Received: from gemini.denx.de (unknown [10.0.0.2])
	by diddl.denx.de (Postfix) with ESMTP id 2D1C11A6535;
	Tue, 20 Mar 2012 11:35:20 +0100 (CET)
Received: from gemini.denx.de (localhost [127.0.0.1])
	by gemini.denx.de (Postfix) with ESMTP id 22B00202A50;
	Tue, 20 Mar 2012 11:35:20 +0100 (CET)
To: Richard Purdie <richard.purdie@linuxfoundation.org>
From: Wolfgang Denk <wd@denx.de>
MIME-Version: 1.0
In-reply-to: <1332203843.9740.76.camel@ted>
References: <20120319215934.5336A206060@gemini.denx.de>
	<1332203843.9740.76.camel@ted>
Comments: In-reply-to Richard Purdie <richard.purdie@linuxfoundation.org>
	message dated "Tue, 20 Mar 2012 00:37:23 +0000."
Date: Tue, 20 Mar 2012 11:35:20 +0100
Message-Id: <20120320103520.22B00202A50@gemini.denx.de>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: specific version dependenciews
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
X-List-Received-Date: Tue, 20 Mar 2012 10:53:37 -0000
Content-type: text/plain; charset=UTF-8
Content-transfer-encoding: 8bit

Dear Richard,

In message <1332203843.9740.76.camel@ted> you wrote:
...
> > Some MACHINEs require a package A (some library), but in specific
> > versions: say machine X needs version A-1.2, while machine Y needs
> > version A-1.5.
> > 
> > Package A itself depends on another package B (another library).
> > 
> > The problem is, that different versions of A require specific versions
> > of B.  For example, to build A-1.2 we must use B-4.5, but to build
> > A-1.5 we must use B-8.2.
> > 
> > I am aware that I can describe the dependencies at the top leven,
> > stating for example that machine X needs A-1.2 and B-4.5, while
> > machine Y needs A-1.5 and B-8.2.
> > 
> > However, this seems clumsy, as the version depency A->B is something
> > that is only defined by the implementation of A, and I would like to
> > keep it encapsulated at this level.
> > 
> > 
> > Is there a clever way to describe such a multi-level dependency chain?
> 
> If you mark A and B as machine specific, the system should be able to
> cope with the problem and set the preferred versions at the machine
> level.

I'm sorry, but I don't understand what you mean.

How do I mark a package as machine specific?

And would setting "the preferred versions at the machine level" not be
exactly what I am trying to avoid?

I don't want to make the machine descriptions aware of any version
dependencies between A and B.  I would like to put this information
into the description of A, so that when a specific version of A gets
built, automatically the matching version of B will be chosen.

Can this be done?

Best regards,

Wolfgang Denk

-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
It is easier to change the specification to fit the program than vice
versa.


