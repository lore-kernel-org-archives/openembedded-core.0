Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QMLb7-0006ba-EB for openembedded-core@lists.openembedded.org;
	Tue, 17 May 2011 16:50:09 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QMLYM-0005Zn-6y
	for openembedded-core@lists.openembedded.org;
	Tue, 17 May 2011 16:47:18 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1305642925.3424.251.camel@rex>
References: <1305633118.2429.188.camel@phil-desktop>
	<1305633770.3424.229.camel@rex>
	<1305634164.2429.193.camel@phil-desktop>
	<1305641835.2429.228.camel@phil-desktop>
	<1305642925.3424.251.camel@rex>
Organization: Phil Blundell Consulting Ltd
Date: Tue, 17 May 2011 15:47:17 +0100
Message-ID: <1305643637.2429.260.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH v2] image-prelink: remove hardcoded path assumptions
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
X-List-Received-Date: Tue, 17 May 2011 14:50:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-05-17 at 15:35 +0100, Richard Purdie wrote:
> The patch description and what it does don't quite match (the rm is
> removed and options are added to prelink).

The added "-c ..." option is necessary in case ${sysconfdir_native} and
${sysconfdir} are not the same thing.

The "-N" tells prelink to not generate a cache file, which seems a
better plan than having it generate one which we then have to delete.
But I can drop that change, and/or send it as a separate patch if you
prefer.

p.




