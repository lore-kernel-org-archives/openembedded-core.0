Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RWV9M-00048b-Gk for openembedded-core@lists.openembedded.org;
	Fri, 02 Dec 2011 16:35:44 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB2FT0cf031072;
	Fri, 2 Dec 2011 15:29:00 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 30497-07; Fri,  2 Dec 2011 15:28:55 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB2FSp2h031066
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 2 Dec 2011 15:28:52 GMT
Message-ID: <1322839741.18900.31.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Darren Hart <dvhart@linux.intel.com>
Date: Fri, 02 Dec 2011 15:29:01 +0000
In-Reply-To: <4ef49c1f45f1d61be02121e755546ca10e4668a1.1322795646.git.dvhart@linux.intel.com>
References: <cover.1322795646.git.dvhart@linux.intel.com>
	<4ef49c1f45f1d61be02121e755546ca10e4668a1.1322795646.git.dvhart@linux.intel.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] bootimage: Use ${S} explicitly for generated config files
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
X-List-Received-Date: Fri, 02 Dec 2011 15:35:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-12-01 at 19:20 -0800, Darren Hart wrote:
> The syslinux and grub-efi classes were generating config files in the current
> working directory. This caused a failure due to a race in the creation of the
> directories leading to cwd changing and the build failing to find the config
> files. While this has been addressed in bitbake, it is better to use an
> explicit path.
> 
> While ${WORKDIR} may seem a more appropriate place, the recipe
> already uses ${S} for the "hdd" and "cd" construction, so we use ${S}
> here to keep things consolidated and consistent and address the issue
> with minimal change.
> 
> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
> ---
>  meta/classes/grub-efi.bbclass |    8 +++-----
>  meta/classes/syslinux.bbclass |    4 ++--
>  2 files changed, 5 insertions(+), 7 deletions(-)

Merged to master, thanks.

Richard



