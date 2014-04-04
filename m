Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 294926B728
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Apr 2014 14:14:58 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s34EElO3014911; Fri, 4 Apr 2014 15:14:47 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id OFUVQM7CU7al; Fri,  4 Apr 2014 15:14:47 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s34EEi9i014907
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Fri, 4 Apr 2014 15:14:45 +0100
Message-ID: <1396620878.13862.6.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alex DAMIAN <alexandru.damian@intel.com>
Date: Fri, 04 Apr 2014 15:14:38 +0100
In-Reply-To: <1396620314-32484-1-git-send-email-alexandru.damian@intel.com>
References: <1396620314-32484-1-git-send-email-alexandru.damian@intel.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 08/15] toaster.bbclass: image file is missing a "/"
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
X-List-Received-Date: Fri, 04 Apr 2014 14:15:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2014-04-04 at 15:05 +0100, Alex DAMIAN wrote:
> From: Cristiana Voicu <cristiana.voicu@intel.com>
> 
> Relaced the key with the join between path and file name.
> 
> [YOCTO #6090]
> 
> Signed-off-by: Cristiana Voicu <cristiana.voicu@intel.com>
> ---
>  meta/classes/toaster.bbclass | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/toaster.bbclass b/meta/classes/toaster.bbclass
> index 9fb2cec..d2fa82d 100644
> --- a/meta/classes/toaster.bbclass
> +++ b/meta/classes/toaster.bbclass
> -- 
> 1.9.1

This patch does not look right...

Cheers,

Richard


