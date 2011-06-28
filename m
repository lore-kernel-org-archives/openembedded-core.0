Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QbUOR-0003lx-6y for openembedded-core@lists.openembedded.org;
	Tue, 28 Jun 2011 11:15:40 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QbUKu-0000Ok-Dr
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Jun 2011 11:12:00 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <2c83cbe9b56b589ad8786d8d371c2d85810b31f2.1309246787.git.edwin.zhai@intel.com>
References: <cover.1309246787.git.edwin.zhai@intel.com>
	<2c83cbe9b56b589ad8786d8d371c2d85810b31f2.1309246787.git.edwin.zhai@intel.com>
Organization: Phil Blundell Consulting Ltd
Date: Tue, 28 Jun 2011 10:11:59 +0100
Message-ID: <1309252319.21613.330.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH 1/3] glib-networking: Add 2.28.7 as new recipe
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
X-List-Received-Date: Tue, 28 Jun 2011 09:15:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-06-28 at 15:42 +0800, edwin.zhai@intel.com wrote:
> +SRC_URI = "${GNOME_MIRROR}/${PN}/2.28/${PN}-${PV}.tar.bz2"

FYI, gnome.bbclass will do this for you and will also figure out the
"2.28" part automatically.

p.




