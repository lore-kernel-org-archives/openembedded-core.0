Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SwAiO-0001hs-UZ for openembedded-core@lists.openembedded.org;
	Tue, 31 Jul 2012 13:34:17 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6VBMdPP020311
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2012 12:22:39 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 19675-07 for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2012 12:22:33 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6VBMVvm020300
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2012 12:22:32 +0100
Message-ID: <1343733752.9756.1.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 31 Jul 2012 12:22:32 +0100
In-Reply-To: <1343597225-9805-1-git-send-email-raj.khem@gmail.com>
References: <1343597225-9805-1-git-send-email-raj.khem@gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] package_rpm.bbclass: Accomodate dash when using arrays
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
X-List-Received-Date: Tue, 31 Jul 2012 11:34:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2012-07-29 at 14:27 -0700, Khem Raj wrote:
> we were assigning local variable to an array coming through
> positional arguments. local is a non posix contruct thats
> also supported by dash luckily but operates differently in this
> case it exapnds the array before assignment. so
> 
> local pkgs="$@"
> 
> turns into pkgs=locale-base-en-us locale-base-en-gb
> 
> ant we see errors
> 
> run.do_rootfs.25593: 932: local: locale-base-en-gb: bad variable name
> 
> So lets not use defining and assigning local in one go
> first define a local and then the assignment
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/classes/package_rpm.bbclass |    7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)

Merged to master, thanks.

Richard



