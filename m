Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QV1lH-0003dq-Hc for openembedded-core@lists.openembedded.org;
	Fri, 10 Jun 2011 15:28:32 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>)
	id 1QV1i4-0000HJ-9F; Fri, 10 Jun 2011 15:25:12 +0200
From: Phil Blundell <pb@pbcl.net>
To: mike@mwester.net, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4DF21798.3080006@mwester.net>
References: <4DF18EF7.8000207@windriver.com>
	<4DF1B022.2010506@windriver.com>  <4DF21798.3080006@mwester.net>
Organization: Phil Blundell Consulting Ltd
Date: Fri, 10 Jun 2011 14:25:03 +0100
Message-ID: <1307712303.2529.5016.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: The design document for ccache-native
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
X-List-Received-Date: Fri, 10 Jun 2011 13:28:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-06-10 at 08:09 -0500, Mike Westerhof wrote:
> I fear that the use of ccache is inherently risky with OE.  Given the
> (relatively common) case where the user blows away their TMPDIR in order
> to get a full, clean rebuild after an update to the toolchain is make,
> it is possible that ccache will erroneously re-use an object created by
> the earlier version of the toolchain.
> 
> While imperfect, I would suggest that we would do better if we would
> somehow embed the PV (or something like that) for the toolchain into the
> CCACHE_DIR, thus ensuring that we don't risk the re-use of old objects
> when the toolchain is updated.

ccache does already include the mtime and file size of the compiler in
the hash that it uses to determine whether two compilations are "the
same".  I'm not sure that mangling the compiler version into ${PV} is
going to buy much.

>(Frankly, given my experiences with it, I'd prefer we just disable
>ccache entirely with OE.)

I agree that it should probably be disabled by default.  I've also had
some slightly bad experiences with ccache although I don't think I have
ever encountered the failure mode you mentioned above.

p.




