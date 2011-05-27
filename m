Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QPxQk-0006MB-5F for openembedded-core@lists.openembedded.org;
	Fri, 27 May 2011 15:50:22 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>)
	id 1QPxNn-000665-El; Fri, 27 May 2011 15:47:19 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1306503625-719-1-git-send-email-koen@dominion.thruhere.net>
References: <1306503625-719-1-git-send-email-koen@dominion.thruhere.net>
Organization: Phil Blundell Consulting Ltd
Date: Fri, 27 May 2011 14:47:17 +0100
Message-ID: <1306504037.2525.449.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH] dbus 1.4.1: create UUIDDIR in postinst
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
X-List-Received-Date: Fri, 27 May 2011 13:50:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-05-27 at 15:40 +0200, Koen Kooi wrote:
> +	mkdir -p $UUIDDIR || true

Why "|| true"?  If this creation fails then the following chown will
surely fail as well, except with a different and less illuminating error
message.

> +     chown "$MESSAGEUSER"."$MESSAGEUSER" "$UUIDDIR"

The dot syntax is nonstandard and obsolescent.  It would be better to
use ":" there.

p.




