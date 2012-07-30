Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Svjc3-0002r3-W4 for openembedded-core@lists.openembedded.org;
	Mon, 30 Jul 2012 08:37:56 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6U6QLdp002561
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jul 2012 07:26:21 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 00871-04 for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jul 2012 07:26:16 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6U6Q9oD002555
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jul 2012 07:26:13 +0100
Message-ID: <1343629569.16998.41.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 30 Jul 2012 07:26:09 +0100
In-Reply-To: <1343540484-5817-1-git-send-email-paul.eggleton@linux.intel.com>
References: <1343540484-5817-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] classes/package: ensure pkgdata is cleaned out first
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
X-List-Received-Date: Mon, 30 Jul 2012 06:37:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2012-07-29 at 06:41 +0100, Paul Eggleton wrote:
> If do_package needs to be re-run and packages are removed/renamed as a
> result, we want the corresponding stale pkgdata files to no longer be
> present; for that we need to ensure all of the old pkgdata files are
> cleaned out prior to creating the new ones. This is particularly
> important now we rely on pkgdata more heavily (for complementary
> packages, license manifest, etc.).
> 
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>  meta/classes/package.bbclass |    1 +
>  1 file changed, 1 insertion(+)

Merged to master, thanks.

Richard



