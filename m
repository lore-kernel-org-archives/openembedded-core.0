Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 720016EE45
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Mar 2014 17:47:39 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s25HlKB5002523; Wed, 5 Mar 2014 17:47:20 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id JGina6r1q58m; Wed,  5 Mar 2014 17:47:19 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s25HlEfE002491
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Wed, 5 Mar 2014 17:47:16 GMT
Message-ID: <1394041627.31845.127.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Matt Fleming <matt@console-pimps.org>
Date: Wed, 05 Mar 2014 17:47:07 +0000
In-Reply-To: <1394038191-26474-1-git-send-email-matt@console-pimps.org>
References: <1394038191-26474-1-git-send-email-matt@console-pimps.org>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: Matt Fleming <matt.fleming@intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] kernel-yocto: Inspect remote branches with git ls-remote
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Mar 2014 17:47:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2014-03-05 at 16:49 +0000, Matt Fleming wrote:
> From: Matt Fleming <matt.fleming@intel.com>
> 
> 'git branch' may use ANSI escape codes in its output (to provide colour)
> which doesn't play well with commands expecting pure plain text, e.g.
> 
>     fatal: '^[[31mmaster^[[m' is not a valid branch name.
> 
> Furthermore, the output of 'git branch' is subject to change and trying
> to parse it could potentially lead to breakage in the future.
> 
> Signed-off-by: Matt Fleming <matt.fleming@intel.com>
> ---
>  meta/classes/kernel-yocto.bbclass | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

My worry with this change is that it will cause the system to hit the
network. We specifically support builds from archives of the
repositories so I'd worry about using ls-remote like this :/.

Cheers,

Richard


