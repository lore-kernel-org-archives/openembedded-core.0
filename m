Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QcaDZ-0005KZ-4c for openembedded-core@lists.openembedded.org;
	Fri, 01 Jul 2011 11:40:57 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1Qca9y-00029m-Tu
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jul 2011 11:37:15 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1309511730.20015.514.camel@rex>
References: <1309511730.20015.514.camel@rex>
Organization: Phil Blundell Consulting Ltd
Date: Fri, 01 Jul 2011 10:37:13 +0100
Message-ID: <1309513033.2633.27.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: cairo: Clean up packaging and fix warnings
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
X-List-Received-Date: Fri, 01 Jul 2011 09:40:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-07-01 at 10:15 +0100, Richard Purdie wrote:
> +PACKAGES =+ "libcairo-gobject2 libcairo-script-interpreter2 cairo-perf-utils"

I guess those can/should just be "libcairo-gobject" and
"libcairo-script-interpreter" now as well.

>  SUMMARY_libcairo2 = "The Cairo 2D vector graphics library"
>  DESCRIPTION_libcairo2 = "Cairo is a multi-platform library providing anti-aliased \

Presumably those also want changing to ${PN} or some such.

p.



