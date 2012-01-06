Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RjDst-00058G-OC
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jan 2012 18:47:19 +0100
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1RjDll-0003xJ-Sr
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jan 2012 18:39:58 +0100
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 06 Jan 2012 17:39:57 +0000
In-Reply-To: <b63c8a5a0cf70a797fd49844b7854151a58f579e.1325837822.git.wenzong.fan@windriver.com>
References: <cover.1325837822.git.wenzong.fan@windriver.com>
	<b63c8a5a0cf70a797fd49844b7854151a58f579e.1325837822.git.wenzong.fan@windriver.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1325871597.12160.13.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH 1/1] archive.bbclass: archive work directory
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
X-List-Received-Date: Fri, 06 Jan 2012 17:47:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-01-06 at 16:20 +0800, wenzong.fan@windriver.com wrote:
> +    if [[ -d ${S} && ${S} != ${WORKDIR} ]]; then
> +        if [[ ${S} =~ "/work-shared/gcc" ]]; then
> +            # Create temporary sources directory for gcc
> +            mkdir -p ${PF}/temp
> +            cp -r ${S} ${PF}
> +            cp -r ${S}/../temp/* ${PF}/temp
> +            cp -r ${WORKDIR}/temp/* ${PF}/temp
> +            tarbase=`pwd`

Special-casing gcc like this seems a bit lame.  Is that check really
needed?

Also, will the above code work with all shells?  It looks a bit
bash-specific to me.

p.




