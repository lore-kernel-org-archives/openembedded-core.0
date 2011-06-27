Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1Qb8d7-0004vt-31 for openembedded-core@lists.openembedded.org;
	Mon, 27 Jun 2011 12:01:21 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1Qb8Zb-0008Is-Di
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Jun 2011 11:57:43 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <598f1ae9f5b0adee5bf9cfae4fc6bf3522bdfd4f.1309059243.git.sgw@linux.intel.com>
References: <dc56d07c4a034568b8860d7bcd41b31acbdb3e89.1309059243.git.sgw@linux.intel.com>
	<598f1ae9f5b0adee5bf9cfae4fc6bf3522bdfd4f.1309059243.git.sgw@linux.intel.com>
Organization: Phil Blundell Consulting Ltd
Date: Mon, 27 Jun 2011 10:57:42 +0100
Message-ID: <1309168662.21613.265.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [RFC - Staticdev 2/2] systemtap: add sqlite3 to DEPENDS
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
X-List-Received-Date: Mon, 27 Jun 2011 10:01:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2011-06-25 at 21:36 -0700, Saul Wold wrote:
> -DEPENDS = "elfutils"
> +DEPENDS = "elfutils sqlite3"

No doubt this is a fine change but I didn't quite understand what it has
to do with staticdev.  Was this meant to be a separate patchset?

p.




