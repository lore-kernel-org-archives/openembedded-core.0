Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id D4E6E6D593
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2013 21:27:38 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rACLRY5a001362; Tue, 12 Nov 2013 21:27:34 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id mHt65A_uBXPb; Tue, 12 Nov 2013 21:27:34 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rACLRUXE001358
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Tue, 12 Nov 2013 21:27:33 GMT
Message-ID: <1384291647.6460.67.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Slater, Joseph" <joe.slater@windriver.com>
Date: Tue, 12 Nov 2013 21:27:27 +0000
In-Reply-To: <007BD92917A2324FA403BCF9A464CF8455BE9A7A@ALA-MBA.corp.ad.wrs.com>
References: <1383947372-20075-1-git-send-email-jslater@windriver.com>
	<1384253239.6460.0.camel@ted>
	<007BD92917A2324FA403BCF9A464CF8455BE9823@ALA-MBA.corp.ad.wrs.com>
	<1384285506.6460.33.camel@ted>
	<007BD92917A2324FA403BCF9A464CF8455BE9A7A@ALA-MBA.corp.ad.wrs.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] linuxdoc-tools: add dependency on texinfo
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
X-List-Received-Date: Tue, 12 Nov 2013 21:27:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-11-12 at 20:46 +0000, Slater, Joseph wrote:
> 
> > -----Original Message-----
> > From: Richard Purdie [mailto:richard.purdie@linuxfoundation.org]
> > Sent: Tuesday, November 12, 2013 11:45 AM
> > To: Slater, Joseph
> > Cc: openembedded-core@lists.openembedded.org
> > Subject: Re: [OE-core] [PATCH 1/1] linuxdoc-tools: add dependency on texinfo
> > 
> > On Tue, 2013-11-12 at 19:02 +0000, Slater, Joseph wrote:
> > > I believe we will use the host makeinfo, if that exists, so we
> > > won't automatically build texinfo-native.  But, if we are building
> > > it at the same time we are trying to run makeinfo, we might get
> > > "our" version instead of the host's, and our version might not be
> > > fully installed.  At least, that looks like what happened for the
> > > build failure this patch attempts to fix.
> > 
> > It would help to have that in the commit message.
> > 
> > Equally, does this really solve the problem or does it just move it
> > elsewhere as other applications probably use makeinfo too? :/
> 
> It does just move it elsewhere.  I don't know if texinfo would be basic
> enough to force it to build early (I'm not sure how to do that), or if
> we just expect packages that need it to depend on it.

Could we simply not install the makeinfo binary in texinfo-native and
always use the one from the host?

Cheers,

Richard


