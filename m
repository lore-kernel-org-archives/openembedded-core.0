Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QRn3b-0001Eg-FO for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 17:10:03 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QRn0Z-0001hS-4o
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 17:06:55 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4DE56B0D.4020209@intel.com>
References: <4DE56B0D.4020209@intel.com>
Organization: Phil Blundell Consulting Ltd
Date: Wed, 01 Jun 2011 16:06:42 +0100
Message-ID: <1306940803.2529.101.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: Tell me your build error message annoyances!
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
X-List-Received-Date: Wed, 01 Jun 2011 15:10:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-05-31 at 15:26 -0700, Scott Garman wrote:
> I'd like to collect some feedback on error messages while building that 
> you find confusing/annoying/unhelpful. I'm going to be working on trying 
> to improve the situation and would like to hear from you about what 
> could be more helpful.

Funnily enough we were just having a discussion about this on irc.  My
personal top two least favourite diagnostics are:

a) "bitbake -b nonexistent-file" gives ten lines of so of python
exception traceback and then prints "MultipleMatches".

b) "bitbake -b recipe.bb", with a recipe that skips (due to an
inCOMPATIBLE_MACHINE or whatever) gives the traditional ten lines of
traceback spew and then prints "TypeError: 'NoneType' object is not
iterable".

This is with bitbake 1.13.0.

p.




