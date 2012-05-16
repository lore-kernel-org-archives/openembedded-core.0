Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1SUd2A-0008Ld-Jf
	for openembedded-core@lists.openembedded.org;
	Wed, 16 May 2012 14:08:50 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1SUcsV-0006ec-H8
	for openembedded-core@lists.openembedded.org;
	Wed, 16 May 2012 13:58:51 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 16 May 2012 12:58:50 +0100
In-Reply-To: <4FB3948B.9090609@mlbassoc.com>
References: <4FB3948B.9090609@mlbassoc.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1337169531.1964.32.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: X server failing on PowerPC
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
X-List-Received-Date: Wed, 16 May 2012 12:08:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-05-16 at 05:50 -0600, Gary Thomas wrote:
>     void *ptr;
>     switch(XX) {
>        case a:
>           define_some_structure A;
>           ptr = &A;
>           break;
>        case b:
>           define_some_structure B;
>           ptr = &B;
>           break;
>     }
>     call_some_function(ptr);
> 
>[...]
>
> Is this even legal C?  

No. 

p.




