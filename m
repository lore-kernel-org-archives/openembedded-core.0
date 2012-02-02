Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Rt1Wm-0003o3-IH for openembedded-core@lists.openembedded.org;
	Thu, 02 Feb 2012 19:37:00 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q12IT35d010581
	for <openembedded-core@lists.openembedded.org>;
	Thu, 2 Feb 2012 18:29:03 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 10526-01 for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Feb 2012 18:28:55 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q12ISlUP010509
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 2 Feb 2012 18:28:48 GMT
Message-ID: <1328207332.3895.10.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 02 Feb 2012 18:28:52 +0000
In-Reply-To: <cover.1328057677.git.josh@linux.intel.com>
References: <cover.1328057677.git.josh@linux.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/3] Misc fixes - pciutils and syslogd
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
X-List-Received-Date: Thu, 02 Feb 2012 18:37:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-01-31 at 16:58 -0800, Joshua Lock wrote:
> All,
> 
> Here are a couple of patches to fix issues in test builds I've been running
> today.
> 
> The first fixes our patched configure script in pciutils for users of the dash
> shell. The second ensures sysklogd is a little more useful out of the box.
> 
> Cheers,
> Joshua
> 
> The following changes since commit d7b13cd42ab8d5f44f97e119b73ec2e363677d26:
> 
>   useradd.bbclass: Fix missing quote (2012-01-27 23:57:33 +0000)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib josh/fixes
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=josh/fixes
> 
> Joshua Lock (3):
>   pciutils: fix configure script for dash
>   sysklogd: various fixes so it starts/stops cleanly
>   distro_tracking_fields: take sysklogd off Saul's plate

Merged to master, thanks.

Richard



