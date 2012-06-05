Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Sc234-0002kJ-LM for openembedded-core@lists.openembedded.org;
	Wed, 06 Jun 2012 00:16:23 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q55M5u0I002908
	for <openembedded-core@lists.openembedded.org>;
	Tue, 5 Jun 2012 23:05:56 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 01600-03 for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jun 2012 23:05:51 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q55M5ipC002902
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 5 Jun 2012 23:05:47 +0100
Message-ID: <1338933943.20169.280.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 05 Jun 2012 23:05:43 +0100
In-Reply-To: <1338835664-27699-1-git-send-email-jason.wessel@windriver.com>
References: <1338835664-27699-1-git-send-email-jason.wessel@windriver.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH v2] perl: Allow perl to cross build and native build in a directory named "t"
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
X-List-Received-Date: Tue, 05 Jun 2012 22:16:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-06-04 at 13:47 -0500, Jason Wessel wrote:
> If any directory in leading up to your tmp directory has the name "t"
> perl will fail to build with a very cryptic error shown below:
> 
> pod/buildtoc: no pods at pod/buildtoc line 305.
> make[1]: *** [pod/perltoc.pod] Error 255
> 
> This is a result of the perl file checking making an assumption
> that it is only looking at files and directories with in the perl
> source directory.  This assumption fails with the way bitbake
> sets up perl to properly cross compile.
> 
> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> ---
>  .../perl/perl-5.14.2/perl-build-in-t-dir.patch     |   42 ++++++++++++++++++++
>  meta/recipes-devtools/perl/perl-native_5.14.2.bb   |    5 ++-
>  meta/recipes-devtools/perl/perl_5.14.2.bb          |    3 +-
>  3 files changed, 47 insertions(+), 3 deletions(-)
>  create mode 100644 meta/recipes-devtools/perl/perl-5.14.2/perl-build-in-t-dir.patch

Merged to master, thanks.

Richard



