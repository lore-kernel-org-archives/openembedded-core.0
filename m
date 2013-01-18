Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <amy.fong@windriver.com>) id 1TwFGk-0005Cj-6y
	for openembedded-core@lists.openembedded.org;
	Fri, 18 Jan 2013 17:58:30 +0100
Received: from yow-afong-lx2.ottawa.windriver.com (yow-afong-lx2.wrs.com
	[128.224.146.164])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r0IGgpvd011585
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO);
	Fri, 18 Jan 2013 08:42:51 -0800 (PST)
Received: from afong by yow-afong-lx2.ottawa.windriver.com with local (Exim
	4.80) (envelope-from <amy.fong@windriver.com>)
	id 1TwF1m-000312-Qo; Fri, 18 Jan 2013 11:42:50 -0500
Date: Fri, 18 Jan 2013 11:42:50 -0500
From: Amy Fong <amy.fong@windriver.com>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20130118164250.GA11580@windriver.com>
References: <20130118161408.GA11224@windriver.com>
	<20130118163734.GX23233@jama.palm1.palmone.com>
MIME-Version: 1.0
In-Reply-To: <20130118163734.GX23233@jama.palm1.palmone.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] autofs has openldap dependency issues
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
X-List-Received-Date: Fri, 18 Jan 2013 16:58:31 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 18, 2013 at 05:37:34PM +0100, Martin Jansa wrote:
> On Fri, Jan 18, 2013 at 11:14:08AM -0500, Amy Fong wrote:
> > commit 09947d772a36e4d2c2dc48356281bd3ce0a04b0c
> > Author: Amy Fong <amy.fong@windriver.com>
> > Date:   Fri Jan 18 11:10:35 2013 -0500
> > 
> >     autofs: fails to compile with openldap disabled
> >     
> >     As of 5.0.6, it appears that changes were introduced so that
> >     if you compile with openldap disabled and openldap headers are not
> >     available, then autofs fails to build.
> >     
> >     Since autofs no longer depends on openldap, remove the dependency
> >     
> >     Signed-off-by: Amy Fong <amy.fong@windriver.com>
> 
> I think this belongs to oe-devel ML and should be for
> meta-openembedded/meta-networking not standalone meta-networking.
> 
> Cheers,

D'oh! Sorry. :)


