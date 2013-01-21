Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TxEok-0000Pf-0m for openembedded-core@lists.openembedded.org;
	Mon, 21 Jan 2013 11:41:33 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id r0LAPlXP015616;
	Mon, 21 Jan 2013 10:25:47 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04722-07; Mon, 21 Jan 2013 10:25:43 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id r0LAPdgR015610
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Mon, 21 Jan 2013 10:25:40 GMT
Message-ID: <1358763940.14265.45.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Kang Kai <kai.kang@windriver.com>
Date: Mon, 21 Jan 2013 10:25:40 +0000
In-Reply-To: <36a8eaeb4853ea8ce5faa235e106e496b69bf356.1358754984.git.kai.kang@windriver.com>
References: <cover.1358754984.git.kai.kang@windriver.com>
	<36a8eaeb4853ea8ce5faa235e106e496b69bf356.1358754984.git.kai.kang@windriver.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] external-python-tarball: code refactoring
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
X-List-Received-Date: Mon, 21 Jan 2013 10:41:34 -0000
X-List-Received-Date: Mon, 21 Jan 2013 10:41:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-01-21 at 15:59 +0800, Kang Kai wrote:
> external-python-tarball only can be built when inherit package_ipk now.
> Update it and split the populate python operation to separated bbclass
> according the value of PACKAGE_CLASSES, then it could be built for rpm
> and deb too.
> 
> [Yocto 3006]
> 
> Signed-off-by: Kang Kai <kai.kang@windriver.com>
> ---
>  meta/classes/populate_python_deb.bbclass          |   42 ++++++++++++++
>  meta/classes/populate_python_ipk.bbclass          |   43 +++++++++++++++
>  meta/classes/populate_python_rpm.bbclass          |   59 ++++++++++++++++++++
>  meta/recipes-core/meta/external-python-tarball.bb |   61 ++++-----------------
>  4 files changed, 155 insertions(+), 50 deletions(-)
>  create mode 100644 meta/classes/populate_python_deb.bbclass
>  create mode 100644 meta/classes/populate_python_ipk.bbclass
>  create mode 100644 meta/classes/populate_python_rpm.bbclass

No, sorry but this isn't right. We already have package specific
functions to do these things, we should be trying to reuse those. If we
can't reuse the functions, we need to improve them so we can.

Cheers,

Richard



