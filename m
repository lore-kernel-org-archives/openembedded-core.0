Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1SujTm-0004FF-6f
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Jul 2012 14:17:14 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1SujIe-00005P-EQ
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Jul 2012 14:05:44 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 27 Jul 2012 13:05:43 +0100
In-Reply-To: <20120727115256.GK3621@jama.jama.net>
References: <20120726135324.6971710217@opal>
	<20120727110521.GH3621@jama.jama.net>
	<20120727115256.GK3621@jama.jama.net>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1343390744.5878.101.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [oe-commits] Cristian Iorga : libpcap: upgrade to ver. 1.3
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
X-List-Received-Date: Fri, 27 Jul 2012 12:17:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-07-27 at 13:52 +0200, Martin Jansa wrote:
>  * check_data_file_clashes: Package libpcap1 wants to install file /usr/lib/libpcap.so.1
>         But that file is already provided by package  * libpcap
>  * check_data_file_clashes: Package libpcap1 wants to install file /usr/lib/libpcap.so.1
>         But that file is already provided by package  * libpcap

If the old library was also libpcap.so.1, why has the package name
changed?  You said in your first mail that the patch "changes .so
version" but if that was the case then there oughtn't to have been a
file conflict here.

p.



