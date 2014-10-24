Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 88A5865C86
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Oct 2014 17:11:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s9OHANaq003765; Fri, 24 Oct 2014 18:10:23 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id sF2uzeV7DEZe; Fri, 24 Oct 2014 18:10:23 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s9OHAJve003762
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Fri, 24 Oct 2014 18:10:21 +0100
Message-ID: <1414170654.30118.36.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Fri, 24 Oct 2014 18:10:54 +0100
In-Reply-To: <1459290.OulfKNcXUt@peggleto-mobl5.ger.corp.intel.com>
References: <1414162585.30118.28.camel@ted>
	<1459290.OulfKNcXUt@peggleto-mobl5.ger.corp.intel.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gnu-config: Deal with "make clean" breakage
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
X-List-Received-Date: Fri, 24 Oct 2014 17:11:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2014-10-24 at 16:24 +0100, Paul Eggleton wrote:
> On Friday 24 October 2014 15:56:25 Richard Purdie wrote:
> > diff --git a/meta/recipes-devtools/gnu-config/gnu-config_git.bb
> > b/meta/recipes-devtools/gnu-config/gnu-config_git.bb index 00fa759..ee1621f
> > 100644
> > --- a/meta/recipes-devtools/gnu-config/gnu-config_git.bb
> > +++ b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
> > @@ -17,6 +17,10 @@ SRC_URI = "git://git.sv.gnu.org/config.git \
> > 
> >  S = "${WORKDIR}/git"
> > 
> > +do_configure () {
> > +	:
> > +}
> > +
> >  do_compile() {
> > 
> >  }
> 
> Would it be worth adding some comments here to explain why these functions are 
> being nulled out?

Done in the version in master-next.

Cheers,

Richard


