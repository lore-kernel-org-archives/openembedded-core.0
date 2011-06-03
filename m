Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QSSfF-0006Ae-KA for openembedded-core@lists.openembedded.org;
	Fri, 03 Jun 2011 13:35:41 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QSScB-0003aC-5U
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Jun 2011 13:32:31 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1307083232.git.kai.kang@windriver.com>
References: <cover.1307083232.git.kai.kang@windriver.com>
Organization: Phil Blundell Consulting Ltd
Date: Fri, 03 Jun 2011 12:32:30 +0100
Message-ID: <1307100750.2529.257.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH 0/1] eglibc: enable eglibc configurability V2
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
X-List-Received-Date: Fri, 03 Jun 2011 11:35:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-06-03 at 14:47 +0800, Kang Kai wrote:
> If want to disable locale-code charsets or locales, you have to uncomment
> PACKAGE_NO_GCONV = 1
> Because without this, it fails on package_do_split_gconvs in libc-package.bbclass

Can we not just fix libc-package.bbclass to stop it failing in that
situation?  It seems a bit sad to require an extra "flip this switch to
make it work" kind of variable.

p.




