Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QSWa1-0004iR-JA for openembedded-core@lists.openembedded.org;
	Fri, 03 Jun 2011 17:46:33 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QSWWw-0003dv-Qh
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Jun 2011 17:43:22 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4DE8EE32.9060905@windriver.com>
References: <4DE56B0D.4020209@intel.com> <4DE87AD1.1050004@linux.intel.com>
	<4DE8EE32.9060905@windriver.com>
Organization: Phil Blundell Consulting Ltd
Date: Fri, 03 Jun 2011 16:43:21 +0100
Message-ID: <1307115801.2529.350.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: Tell me your build error message annoyances!
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
X-List-Received-Date: Fri, 03 Jun 2011 15:46:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-06-03 at 09:22 -0500, Mark Hatle wrote:
> I believe currently we have around 3-5 messages per step, and it's still too
> noisy -- unless you need to debug something.

Correct.  Right now, the output looks like:

NOTE: Running task 613 of 728 (ID: 190, virtual:native:/home/pb/oe/oe-core/meta/recipes-core/util-linux/util-linux_2.19.1.bb, do_install)
NOTE: package util-linux-native-2.19.1-r0: task do_install: Started
NOTE: package util-linux-native-2.19.1-r0: task do_install: Succeeded
NOTE: Running task 614 of 728 (ID: 191, virtual:native:/home/pb/oe/oe-core/meta/recipes-core/util-linux/util-linux_2.19.1.bb, do_populate_sysroot)
NOTE: package util-linux-native-2.19.1-r0: task do_populate_sysroot: Started
NOTE: package util-linux-native-2.19.1-r0: task do_populate_sysroot: Succeeded

It looks as though the "Started" and "Succeeded" lines could just be
deleted without losing any real information.

p.




