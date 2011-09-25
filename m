Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R7sUe-0004lp-6Z for openembedded-core@lists.openembedded.org;
	Sun, 25 Sep 2011 19:27:56 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8PHSn5C019792; Sun, 25 Sep 2011 18:28:49 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id QwkFXC3NmG61; Sun, 25 Sep 2011 18:28:49 +0100 (BST)
Received: from [192.168.1.40] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8PHSiap019787
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Sun, 25 Sep 2011 18:28:45 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Sun, 25 Sep 2011 18:22:20 +0100
In-Reply-To: <1316807201-22623-5-git-send-email-dbaryshkov@gmail.com>
References: <1316807201-22623-1-git-send-email-dbaryshkov@gmail.com>
	<1316807201-22623-5-git-send-email-dbaryshkov@gmail.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1316971347.8185.33.camel@ted>
Mime-Version: 1.0
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: Re: [PATCH 05/10] eglibc: fix packaging of some of nativesdk packages, V2
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
X-List-Received-Date: Sun, 25 Sep 2011 17:27:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-09-23 at 23:46 +0400, Dmitry Eremin-Solenikov wrote:
> eglibc.inc contains packaging rules that depend on PKGSUFFIX expansion.
> However that variable wasn't expanded properly in some case. E.g.
> 
> PACKAGES = " ... nscd${PKGSUFFIX} ..."
> FILES_nscd${PKGSUFFIX} = "${sbindir}/nscd*"
> 
> would be expanded to
> 
> PACKAGES = " ... nscd-nativesdk ..."
> FILES_nscd = "${sbindir}/nscd*"
> 
> Thus leading to empty -nativesdk packages and missing files. To overcome
> that use python code blob to properly define PKGSUFFIX variable.
> 
> As a change from V1, fix the glibc-thread-db related problem by using
> ${PN} instead of eglibc-XXX-nativesdk for extra-nss and thread-db
> packages.
> 
> Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>

I've merged the pieces of this patch series that didn't get feedback.
I'm still not 100% convinced this patch is right. I'd like to understand
more about the errors you're seeing that area leading you to submit
it...

Cheers,

Richard



