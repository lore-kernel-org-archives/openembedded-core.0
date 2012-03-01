Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S3FMU-0006Wo-AU for openembedded-core@lists.openembedded.org;
	Fri, 02 Mar 2012 00:24:38 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q21NG8dP023809
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Mar 2012 23:16:08 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 23067-09 for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Mar 2012 23:16:03 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q21NFwko023802
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Mar 2012 23:15:59 GMT
Message-ID: <1330643762.14819.4.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 01 Mar 2012 23:16:02 +0000
In-Reply-To: <1330625283-14582-1-git-send-email-raj.khem@gmail.com>
References: <1330625283-14582-1-git-send-email-raj.khem@gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] libproxy: Fix build errors due to missing prototypes
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
X-List-Received-Date: Thu, 01 Mar 2012 23:24:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-03-01 at 10:08 -0800, Khem Raj wrote:
> g++ really does not like the missing prototypes
> here we were missing close() and read() so include
> unistd.h to get them
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../libproxy/libproxy/g++-namepace.patch           |   22 ++++++++++++++++++++
>  meta/recipes-support/libproxy/libproxy_0.4.7.bb    |    6 +++-
>  2 files changed, 26 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-support/libproxy/libproxy/g++-namepace.patch

Merged to master, thanks.

Richard



