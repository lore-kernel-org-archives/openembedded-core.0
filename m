Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QPtX4-0000Zv-Cb for openembedded-core@lists.openembedded.org;
	Fri, 27 May 2011 11:40:38 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>)
	id 1QPtU6-00063W-Gl; Fri, 27 May 2011 11:37:35 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4DDF17A7.4010807@linux.intel.com>
References: <cover.1306364294.git.dvhart@linux.intel.com>
	<f2eb88161222a6df60739367d2f44342d3bfbbf2.1306364294.git.dvhart@linux.intel.com>
	<1306453593.27470.226.camel@rex>  <4DDF17A7.4010807@linux.intel.com>
Organization: Phil Blundell Consulting Ltd
Date: Fri, 27 May 2011 10:37:32 +0100
Message-ID: <1306489052.2525.400.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH 1/1] utils.bbclass: make FILESEXTRAPATHS colon delimited
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
X-List-Received-Date: Fri, 27 May 2011 09:40:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-05-26 at 20:16 -0700, Darren Hart wrote:
> So by changing from split() to split(":") we change the behavior of
> split when operating on empty strings, requiring us to special case the
> output. Rather obnoxious wouldn't you say?

Yes, that is an annoying misfeature.  The other related thing to watch
out for is this:

>>> print " a b ".split()
['a', 'b']
>>> print ":a:b:".split(":")
['', 'a', 'b', '']
>>> 

... in other words, if you make the separator be anything other than a
space, you need to take special care to strip off any null elements that
might have been accidentally generated at the start and end.

p.




