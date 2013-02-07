Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1U3ayt-0003uj-I3
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Feb 2013 00:34:18 +0100
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1U3ajW-0003xl-MZ; Fri, 08 Feb 2013 00:18:24 +0100
Message-ID: <1360279082.6206.30.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Date: Thu, 07 Feb 2013 23:18:02 +0000
In-Reply-To: <5113CA88.9020508@linaro.org>
References: <cover.1360055640.git.laurentiu.palcu@intel.com>
	<a306516e1af55efcd93563779e389448e16c97d3.1360055640.git.laurentiu.palcu@intel.com>
	<5113CA88.9020508@linaro.org>
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/8] add fontcache.bbclass
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
X-List-Received-Date: Thu, 07 Feb 2013 23:34:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-02-07 at 16:38 +0100, Marcin Juszkiewicz wrote:
>> +${@qemu_run_binary(d, '$D', '/usr/bin/fc-cache')} --sysroot=$D
>/dev/null 2>&1
> What about platform which do not have qemu support? Like AArch64...

There are other places in the oe-core tree that already require working
qemu support so I don't think this is a qualitatively new issue.  I
suspect that in the long term, qemu is going to become another tool that
needs targetting to any new architecture, just like gcc, binutils,
glibc, linux, javascriptcore and so on.  

On the other hand, that "/usr/bin" looks a bit unwholesome to me. :-}

p.




