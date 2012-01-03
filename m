Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Ri3F7-0003s5-1c
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 13:13:26 +0100
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1Ri382-0000fA-Hs
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 13:06:07 +0100
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 03 Jan 2012 12:06:04 +0000
In-Reply-To: <3f873c307073fbce1943cf36a81076aecdcbf741.1325571069.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
	<3f873c307073fbce1943cf36a81076aecdcbf741.1325571069.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1325592366.24417.345.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [CONSOLIDATED PULL 061/113] wpa-supplicant - pulls GPLv3 license rpm in a non-GPLv3 build (libgnutls-extra)
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
X-List-Received-Date: Tue, 03 Jan 2012 12:13:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-01-02 at 22:19 -0800, Saul Wold wrote:
> +def get_defconfig(bb, d):
> +	if d.getVar('INCOMPATIBLE_LICENSE', 1) in [ 'GPLv3' ]:
> +		return "-nogplv3"
> +	return ""

Is this really the sort of thing we want to be doing?  It seems like an
abuse of INCOMPATIBLE_LICENSE to me. 

But, anyway, given that EAP_TTLSv1 seems to be a dead protocol, and the
latest versions of wpa-supplicant and GnuTLS have removed EAP_TTLSv1 and
TLS/IA altogether, it seems as though we could safely just turn that
stuff off in the standard defconfig and avoid the whole gnutls-extra
thing without introducing this complexity.

p.




