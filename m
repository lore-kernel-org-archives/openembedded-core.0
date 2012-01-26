Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RqWKs-0004MX-B6 for openembedded-core@lists.openembedded.org;
	Thu, 26 Jan 2012 21:54:22 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0QKkYGO028257
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2012 20:46:34 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 28111-02 for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2012 20:46:30 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0QKkPel028251
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2012 20:46:26 GMT
Message-ID: <1327610787.19643.402.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 26 Jan 2012 20:46:27 +0000
In-Reply-To: <cover.1327519635.git.sgw@linux.intel.com>
References: <cover.1327519635.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/4] Misc Fixes
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
X-List-Received-Date: Thu, 26 Jan 2012 20:54:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-01-25 at 11:29 -0800, Saul Wold wrote:
> Richard,
> 
> This set address a build issue, and fixes a couple of bugs,
> I split the staticdev QA test into 2 part for the libgcc 
> change.
> 
> Thanks
> 	Sau!
> 
> 
> The following changes since commit 746e8ffa66850bf9050cd6baf94eb76c492eb535:
> 
>   uclibc-git: Update to latest RC (2012-01-25 14:33:52 +0000)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib sgw/fix
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/fix
> 
> Marc Ferland (1):
>   pm-utils: Add grep to RDEPENDS to avoid command failures.
> 
> Saul Wold (3):
>   default-providers: add kbd as PREFERRED_PROVIDER for console-tools
>   insane.bbclass: Add test for static .a libraries in non-staticdev
>     packages
>   libgcc: Add INSANE_SKIP of staticdev for libgcc-dev and libgcov-dev

Merged to master, thanks. I took v2 of the pm-utils fix though.

Cheers,

Richard



