Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RaUiV-0007g3-3l for openembedded-core@lists.openembedded.org;
	Tue, 13 Dec 2011 16:56:31 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBDFnaZQ010804
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2011 15:49:36 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 09849-09 for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2011 15:49:31 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBDFnSwY010798
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2011 15:49:29 GMT
Message-ID: <1323791367.25491.4.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 13 Dec 2011 15:49:27 +0000
In-Reply-To: <e27fba3b38877fb7420c58a3e35cdbcef1cb767a.1323358819.git.otavio@ossystems.com.br>
References: <cover.1323358819.git.otavio@ossystems.com.br>
	<e27fba3b38877fb7420c58a3e35cdbcef1cb767a.1323358819.git.otavio@ossystems.com.br>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 2/3] dosfstools: update native to 2.11
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
X-List-Received-Date: Tue, 13 Dec 2011 15:56:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-12-08 at 15:40 +0000, Otavio Salvador wrote:
> This unify recipes for target and native builds and also drops the the
> already merged patches.
> 
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  .../dosfstools/dosfstools-native_2.10.bb           |   19 -----
>  .../dosfstools/dosfstools/2.6.20-syscall.patch     |   72 -------------------
>  .../dosfstools/dosfstools-2.10-kernel-2.6.patch    |   74 --------------------
>  .../dosfstools/dosfstools/mkdosfs-bootcode.patch   |   68 ++++++++----------
>  .../dosfstools/dosfstools/mkdosfs-dir.patch        |   62 ++++++++---------
>  .../recipes-devtools/dosfstools/dosfstools_2.10.bb |   24 ------
>  .../recipes-devtools/dosfstools/dosfstools_2.11.bb |   11 ++-
>  7 files changed, 69 insertions(+), 261 deletions(-)
>  delete mode 100644 meta/recipes-devtools/dosfstools/dosfstools-native_2.10.bb
>  delete mode 100644 meta/recipes-devtools/dosfstools/dosfstools/2.6.20-syscall.patch
>  delete mode 100644 meta/recipes-devtools/dosfstools/dosfstools/dosfstools-2.10-kernel-2.6.patch
>  delete mode 100644 meta/recipes-devtools/dosfstools/dosfstools_2.10.bb

This broke large live images:

http://autobuilder.yoctoproject.org:8010/builders/crownbay-noemgd/builds/39/steps/shell_30/logs/stdio

and many other failure reports. I've figured out what changed and pushed
a fix:

http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=995a09e7bf3aee7853b17a7757cbf6cbc4edf6b8

Cheers,

Richard



