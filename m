Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S3RbW-0007V8-H5 for openembedded-core@lists.openembedded.org;
	Fri, 02 Mar 2012 13:28:58 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q22CKSaG030849
	for <openembedded-core@lists.openembedded.org>;
	Fri, 2 Mar 2012 12:20:28 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 29538-09 for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Mar 2012 12:20:24 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q22CKJFr030842
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 2 Mar 2012 12:20:20 GMT
Message-ID: <1330690822.15224.12.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 02 Mar 2012 12:20:22 +0000
In-Reply-To: <1330645282.15224.0.camel@ted>
References: <1330645282.15224.0.camel@ted>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] lib/oe/patch.py: Fix patch resolver logic
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
X-List-Received-Date: Fri, 02 Mar 2012 12:28:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-03-01 at 23:41 +0000, Richard Purdie wrote:
> Currently, if PATCHRESOLVE is user and and PatchTree() is being used, you can
> get backtraces if patch applcication fails. This is because even in the failure
> case, self._current is incremented, meaning second time around, there are array
> range issues.
> 
> This patch changes the code so _current is only incremented upon successful
> patch application, thereby resolving this failure.
> 
> [YOCTO #2043 partially]
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

This patch is wrong, it breaks with multiple patch application. I've
posted an updated patch.

Cheers,

Richard



