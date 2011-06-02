Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QS94K-0000k6-HD for openembedded-core@lists.openembedded.org;
	Thu, 02 Jun 2011 16:40:16 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QS91H-00037C-3N
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Jun 2011 16:37:07 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4DE79D69.7080806@mentor.com>
References: <cover.1306931844.git.dexuan.cui@intel.com>
	<4DE67440.1020405@mentor.com> <1306950977.27470.461.camel@rex>
	<4DE69582.2090508@mentor.com>
	<1306958729.3119.3.camel@lenovo.internal.reciva.com>
	<4DE6A43A.3050401@mentor.com>
	<1306961135.3119.13.camel@lenovo.internal.reciva.com>
	<4DE6A836.3040004@mentor.com> <1307023591.27470.549.camel@rex>
	<4DE79D69.7080806@mentor.com>
Organization: Phil Blundell Consulting Ltd
Date: Thu, 02 Jun 2011 15:37:06 +0100
Message-ID: <1307025426.2529.209.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [RFC v1 PATCH 00/16] populate perl-native into its own	directory
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
X-List-Received-Date: Thu, 02 Jun 2011 14:40:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-06-02 at 07:25 -0700, Tom Rini wrote:
> But help2man is just the easy/common case.  Heck, it _may_ blow up even
> with the host help2man instead of help2man-native, if a recipe uses
> system-wide help2man and perlnative.bbclass.  The root problem (again,
> from memory) is that since we modify PERL5LIB and so on, when we do
> that, we've opened ourselves up for system-wide perl trying to use
> perl-native's stuff.

Ah right, I think I see what you're getting at now.

If we've got a clean separation between perl-native and host perl,
though, can't we now just eliminate all of that futzing with PERL5LIB in
cpan.bbclass and such like places?  perl-native already knows how to
look in the right places within the sysroot for its modules so there
should be no need for anything else to be overriding it.

p.




