Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QZOll-0001qM-VI for openembedded-core@lists.openembedded.org;
	Wed, 22 Jun 2011 16:51:06 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QZOiK-0003F9-MB
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Jun 2011 16:47:33 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4E01FFDA.3050905@gmail.com>
References: <cover.1308732995.git.dongxiao.xu@intel.com>
	<d7c256ba838d05c85c6e7c2569f0a6c7b276ab17.1308732995.git.dongxiao.xu@intel.com>
	<4E01FFDA.3050905@gmail.com>
Organization: Phil Blundell Consulting Ltd
Date: Wed, 22 Jun 2011 15:47:23 +0100
Message-ID: <1308754043.21613.88.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH 1/1] libc-locale: split locale handling from libc recipe.
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
X-List-Received-Date: Wed, 22 Jun 2011 14:51:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-06-22 at 07:44 -0700, Khem Raj wrote:
> On 06/22/2011 02:01 AM, Dongxiao Xu wrote:
> > *libc's do_package will cost a lot of time due to the locale handing,
> > which may delay the other recipe's do_package task and affect the build
> > performance.
> 
> you could also move the locale generation into a task of its own instead 
> of new recipe

It'd be hard to get the dependencies to work out right if you did that,
though.  I think a new recipe probably is the right answer.

p.

[ .... 100000 quoted lines snipped ... ]




