Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RDC1i-0003Mc-PV for openembedded-core@lists.openembedded.org;
	Mon, 10 Oct 2011 11:20:02 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9A9KwgE008499 for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Oct 2011 10:20:58 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id bYlmK4S-8Y+B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Oct 2011 10:20:58 +0100 (BST)
Received: from [192.168.1.66] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9A9Kt6g008495
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Oct 2011 10:20:57 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 10 Oct 2011 10:14:14 +0100
In-Reply-To: <4E927CD9.2040505@intel.com>
References: <1317840239-5290-1-git-send-email-jason.wessel@windriver.com>
	<4E927CD9.2040505@intel.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1318238063.23801.5.camel@ted>
Mime-Version: 1.0
Subject: Re: [PATCH] Allow user mode NFS server to run without rpcbind / portmap
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
X-List-Received-Date: Mon, 10 Oct 2011 09:20:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2011-10-09 at 22:04 -0700, Saul Wold wrote:
> On 10/05/2011 11:43 AM, Jason Wessel wrote:
> >> From the 2.6.39 linux kernel and up it is possible to use
> > and nfsroot mount without the need to talk to an RPC info
> > server as long as the port numbers for mountd and nfsd
> > are known in advance.
> >
> > This patch updates the qemu startup scripts and the
> > user mode NFS server to have the ability to start
> > without the need to use rpcbind or portmap services.
> >
> Jason,
> 
> I have not fully tested this yet, but if someone has rpcbind and/or 
> portmap services are running, what affect will this patch have?

It shouldn't have any effect, the system is just no longer requiring to
look up the port numbers through rpcbind/portmap but can use the values
directly.

Cheers,

Richard



