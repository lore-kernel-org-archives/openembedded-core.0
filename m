Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S37bb-0007vQ-Md for openembedded-core@lists.openembedded.org;
	Thu, 01 Mar 2012 16:07:43 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q21ExDI9017616
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Mar 2012 14:59:13 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 17436-01 for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Mar 2012 14:59:07 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q21Ex5hN017610
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Mar 2012 14:59:06 GMT
Message-ID: <1330613948.31767.12.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 01 Mar 2012 14:59:08 +0000
In-Reply-To: <1330612994-26329-1-git-send-email-gary@mlbassoc.com>
References: <1330612994-26329-1-git-send-email-gary@mlbassoc.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] initscripts: Properly handle new timestamp format
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
X-List-Received-Date: Thu, 01 Mar 2012 15:07:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-03-01 at 07:43 -0700, Gary Thomas wrote:
> Recent changes have attempted to make consistant use of /etc/timestamp
> In particular
>   5aab665 initscripts: Make /etc/timestamp consistent again.
>   173a48f image.bbclass: Ensure timestamp matches format used in initscripts after recent changes
> 
> This new format can cause problems as the value is too large for
> most [32 bit] machines.  Work around this by only comparing the
> YYYYMMDD portion (which does fit in 32 bits).  Also, the new format
> is not directly compatible with the 'date' command line, so it
> must be reformatted for use.
> 
> Signed-off-by: Gary Thomas <gary@mlbassoc.com>
> ---
>  .../initscripts/initscripts-1.0/bootmisc.sh        |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)

I merged the changes to busybox in relation to this. Is this patch still
needed?

Cheers,

Richard



