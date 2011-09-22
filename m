Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R6dA6-0002v6-HY for openembedded-core@lists.openembedded.org;
	Thu, 22 Sep 2011 08:53:34 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8M6sS8D024896 for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2011 07:54:29 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id He49jhsDUUwp
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2011 07:54:28 +0100 (BST)
Received: from [10.251.10.153] ([192.102.205.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8M6sJuM024890
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2011 07:54:24 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 22 Sep 2011 07:47:59 +0100
In-Reply-To: <f277242f36a8881f3241489183cfe1e0b4e20671.1316670532.git.edwin.zhai@intel.com>
References: <cover.1316670532.git.edwin.zhai@intel.com>
	<f277242f36a8881f3241489183cfe1e0b4e20671.1316670532.git.edwin.zhai@intel.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1316674091.2029.1.camel@ted>
Mime-Version: 1.0
Subject: Re: [PATCH 1/1] qemugl: Use local variable rather than "push" to save register
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
X-List-Received-Date: Thu, 22 Sep 2011 06:53:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-09-22 at 13:51 +0800, edwin.zhai@intel.com wrote:
> From: Zhai Edwin <edwin.zhai@intel.com>
> 
> New gcc uses "%esp" rather than "%ebp" to index local variable in stack, and
> push between save-to/restore-from stack decrease "%esp", which leads wrong
> index. Saving registers via local variables to make gcc aware of this and avoid
> stack disorder.
> 
> [YOCTO #1442] got fixed
> 
> Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>

Merged to master, good catch!

Cheers,

Richard



