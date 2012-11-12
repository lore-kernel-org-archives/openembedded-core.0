Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TXqrq-0000VX-A5
	for openembedded-core@lists.openembedded.org;
	Mon, 12 Nov 2012 11:03:47 +0100
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1TXqdJ-0008KI-Qy; Mon, 12 Nov 2012 10:48:46 +0100
Message-ID: <1352713720.6869.107.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: jackie.huang@windriver.com
Date: Mon, 12 Nov 2012 09:48:40 +0000
In-Reply-To: <88778c5a8e868a75c53ed8e60bb80a2cda17bc8d.1352690328.git.jackie.huang@windriver.com>
References: <cover.1352690328.git.jackie.huang@windriver.com>
	<88778c5a8e868a75c53ed8e60bb80a2cda17bc8d.1352690328.git.jackie.huang@windriver.com>
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] eglibc: always compile with optimization.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 12 Nov 2012 10:03:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-11-12 at 11:31 +0800, jackie.huang@windriver.com wrote:
> +# eglibc can't be built without optimization, if someone tries to compile an
> +# entire image as -O0, we override it with -O2 here and give a note about it.
> +def get_optimization(d):
> +    if base_contains("SELECTED_OPTIMIZATION", "-O0", "x", "", d) == "x":
> +        bb.note("eglibc can't be built with -O0, -O2 will be used instead.")
> +        selected_optimization = d.getVar("SELECTED_OPTIMIZATION", True)
> +        return selected_optimization.replace("-O0", "-O2")
> +    return selected_optimization

Did you test this patch at all?

p.




