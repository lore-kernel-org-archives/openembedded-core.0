Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1SHaQy-0003xj-Gi
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Apr 2012 14:44:32 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1SHaI1-0001OL-2x
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Apr 2012 14:35:17 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 10 Apr 2012 13:35:15 +0100
In-Reply-To: <a608dd6d5aec06056da9c20078b5cd171d6b6470.1334014014.git.mark.hatle@windriver.com>
References: <cover.1334014014.git.mark.hatle@windriver.com>
	<a608dd6d5aec06056da9c20078b5cd171d6b6470.1334014014.git.mark.hatle@windriver.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1334061317.28712.121.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH 1/1] tune-mips32: Update the default MIPS tuning to be mips32
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
X-List-Received-Date: Tue, 10 Apr 2012 12:44:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-04-09 at 18:31 -0500, Mark Hatle wrote:
> Previously the default mips tuning was defined as "mips1"
> internally in the compiler.  Revise this and change to "mips32".
> 
> This eliminates the need for the mips32 specific tunings, which were
> not being used anyway.  (They exists and were used, but were not
> differentiated by package arch prior to a recent commit.)

This change is slightly more far-reaching than the description above
suggests, in that it isn't just changing the default tuning: it seems
actually to remove the ability to tune for pre-mips32 altogether.
Obviously there's nothing to stop anybody creating tune files for
earlier MIPS in some other BSP layer, but this is a feature that exists
in oe-core today and would be removed by this patch.

Also, the second paragraph of your checkin message above doesn't make a
lot of sense.  In the first sentence you say that the mips32 tunings
were not being used, and then in the second sentence you say that they
were.  It doesn't seem that both those statements can logically be true.

And, finally, the checkin message doesn't make it entirely clear why
this change represents an improvement, i.e. why MIPS32 is a better
default tune than MIPS I.

p.




