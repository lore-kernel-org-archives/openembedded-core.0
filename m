Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1T8sat-0008CJ-1d for openembedded-core@lists.openembedded.org;
	Tue, 04 Sep 2012 14:51:03 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q84CccKZ016936;
	Tue, 4 Sep 2012 13:38:38 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 15631-07; Tue,  4 Sep 2012 13:38:32 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q84CcUPw016929
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Tue, 4 Sep 2012 13:38:31 +0100
Message-ID: <1346762310.30964.38.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 04 Sep 2012 13:38:30 +0100
In-Reply-To: <1346749751-25699-1-git-send-email-Martin.Jansa@gmail.com>
References: <1346749751-25699-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] bitbake.conf: FETCHCMD_svn add --non-interactive --trust-server-cert
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Sep 2012 12:51:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-09-04 at 11:09 +0200, Martin Jansa wrote:
> * now with subversion-native we know those 2 options are supported
> * with https protocol used for SVN checkouts we cannot confirm certificate and do_fetch fails
>   Error validating server certificate for 'https://foo:443':
>   - The certificate is not issued by a trusted authority. Use the
>     fingerprint to validate the certificate manually!
>     Certificate information:
>     ...
>     (R)eject, accept (t)emporarily or accept (p)ermanently? svn: E175002: Unable to connect to a repository at URL 'https://foo/trunk'
>     svn: E175002: OPTIONS of 'https://foo/trunk': Server certificate verification failed: issuer is not trusted (https://foo)
>     ERROR: Function failed: Fetcher failure for URL: 'svn://foo;protocol=https;module=trunk'. Unable to fetch URL from any source.
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/conf/bitbake.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Merged to master, thanks.

Richard



