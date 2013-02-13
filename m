Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Peter.Seebach@windriver.com>) id 1U5TLm-0007OK-Il
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Feb 2013 04:49:39 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r1D3Xa2G014540
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Feb 2013 19:33:36 -0800 (PST)
Received: from e6410-2 (172.25.40.227) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Tue, 12 Feb 2013 19:33:36 -0800
Date: Tue, 12 Feb 2013 21:33:28 -0600
From: Peter Seebach <peter.seebach@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Message-ID: <20130212213328.572f84d5@e6410-2>
In-Reply-To: <1360714913.11225.24.camel@ted>
References: <1360714913.11225.24.camel@ted>
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.10; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Subject: Re: [PATCH] multilib: Fix an OVERRIDES expansion order issue
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
X-List-Received-Date: Wed, 13 Feb 2013 03:49:43 -0000
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

On Wed, 13 Feb 2013 00:21:53 +0000
Richard Purdie <richard.purdie@linuxfoundation.org> wrote:

> +    # DEFAULTTUNE can change TARGET_ARCH override so expand this now
> before update_data
> +    newtune = e.data.getVar("DEFAULTTUNE_" + "virtclass-multilib-" +
> variant)

I was going to ask whether this wants a ", True", but it occurs to me
that I think it actually doesn't.

At which point I feel I should ask: Should there be an explicit
", False" so it doesn't get corrected in a later patch?

-s
-- 
Listen, get this.  Nobody with a good compiler needs to be justified.


