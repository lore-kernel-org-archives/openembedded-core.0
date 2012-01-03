Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Ri3zk-00061f-7v
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 14:01:36 +0100
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1Ri3sg-0000hp-5Q
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 13:54:18 +0100
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 03 Jan 2012 12:54:17 +0000
In-Reply-To: <dc40ef2cd746000c0cfa0a59b23679cb826c7e3f.1325571069.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
	<dc40ef2cd746000c0cfa0a59b23679cb826c7e3f.1325571069.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1325595258.24417.357.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [CONSOLIDATED PULL 112/113] glib-2.0: disable glib due to host contamination
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
X-List-Received-Date: Tue, 03 Jan 2012 13:01:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-01-02 at 22:20 -0800, Saul Wold wrote:
> -EXTRA_OECONF = "--disable-debug --enable-included-printf=no"
> +EXTRA_OECONF = "--disable-debug --enable-included-printf=no --disable-dtrace"

I suppose you meant to say "disable dtrace" rather than "disable glib"
in the subject line.  Also, please add an expanded checkin comment
explaining what the host contamination is that results from having
dtrace on.

p.




