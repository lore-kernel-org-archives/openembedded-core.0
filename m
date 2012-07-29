Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SvQ1l-0002HK-8O for openembedded-core@lists.openembedded.org;
	Sun, 29 Jul 2012 11:43:09 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6T9VZZC027016
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Jul 2012 10:31:35 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 26851-05 for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Jul 2012 10:31:30 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6T9VSXI027010
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Jul 2012 10:31:30 +0100
Message-ID: <1343554288.16998.34.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Sun, 29 Jul 2012 10:31:28 +0100
In-Reply-To: <1343334859-21249-1-git-send-email-yao.zhao@windriver.com>
References: <1343334859-21249-1-git-send-email-yao.zhao@windriver.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH v3] bzip2-native: handling native path issue
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
X-List-Received-Date: Sun, 29 Jul 2012 09:43:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-07-26 at 16:34 -0400, Yao Zhao wrote:
> follow Richard's approach, modify bzip2-native recipe to install bzip2 package
> binaries to STAGING_BINDIR_NATIVE/bzip2-native to avoid problems when other
> package is doing upack to reference bzip2. libbz2.so* still installs to
> STAGING_LIBDIR_NATIVE.
> 
> change python-native to depends on bzip2-replacement-native instead of
> bzip2-full-native and add EXTRANATIVEPATH for bzip2-native.
> 
> Didn't add bzip2native.bbclass as python-native is the only user so far.
> 
> Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
> ---
>  .../recipes-devtools/python/python-native_2.7.3.bb |    4 +++-
>  meta/recipes-extended/bzip2/bzip2_1.0.6.bb         |    4 +++-
>  2 files changed, 6 insertions(+), 2 deletions(-)


Merged to master, thanks.

Richard



