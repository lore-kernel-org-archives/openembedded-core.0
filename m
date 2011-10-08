Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RCS3G-0001oK-4Q for openembedded-core@lists.openembedded.org;
	Sat, 08 Oct 2011 10:14:34 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p988FSDo018663 for <openembedded-core@lists.openembedded.org>;
	Sat, 8 Oct 2011 09:15:28 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id yvHP-UrAnj6K
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Oct 2011 09:15:27 +0100 (BST)
Received: from [192.168.1.66] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p988FOwj018658
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 8 Oct 2011 09:15:26 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Sat, 08 Oct 2011 09:08:45 +0100
In-Reply-To: <D3F85958-4E8C-4D2C-B8BD-C7AF341FAF47@dominion.thruhere.net>
References: <D3F85958-4E8C-4D2C-B8BD-C7AF341FAF47@dominion.thruhere.net>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1318061333.8533.58.camel@ted>
Mime-Version: 1.0
Subject: Re: Bitbake dependency failure with git fetcher
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
X-List-Received-Date: Sat, 08 Oct 2011 08:14:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2011-10-08 at 01:29 +0200, Koen Kooi wrote:
> Everytime openssl and a git recipe get changed at the same time, I end
> up with:
> 
> | /angstrom/build/tmp-angstrom_2010_x-eglibc/sysroots/x86_64-linux/usr/bin/git.real: error while loading shared libraries: libcrypto.so.1.0.0: cannot open shared object file: No such file or directory
> 
> Why is bitbake not resolving the git-native -> openssl-native dep
> before invoking the git fetcher?

I suspect you're using rm_work?

Cheers,

Richard



