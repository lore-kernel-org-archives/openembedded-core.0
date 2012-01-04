Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RiPg6-0004BJ-O5 for openembedded-core@lists.openembedded.org;
	Wed, 04 Jan 2012 13:10:46 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q04C3Pl9018305
	for <openembedded-core@lists.openembedded.org>;
	Wed, 4 Jan 2012 12:03:25 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 17902-05 for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jan 2012 12:03:22 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q04C3IL8018299
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 4 Jan 2012 12:03:19 GMT
Message-ID: <1325678598.3555.132.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 04 Jan 2012 12:03:18 +0000
In-Reply-To: <1325541032-29837-1-git-send-email-josh@linux.intel.com>
References: <1325541032-29837-1-git-send-email-josh@linux.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] busybox: rename syslog.conf to syslog-startup.conf
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
X-List-Received-Date: Wed, 04 Jan 2012 12:10:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-01-02 at 13:50 -0800, Joshua Lock wrote:
> Busybox 1.19 introduced basic support for an rsyslog inspired syslog.conf
> whereas we've been shipping syslog.conf as a file to be sourced by the
> syslog init script in order to configure which options busybox's syslog is
> started with.
> 
> Busybox 1.19 in syslog mode chokes on our syslog.conf and doesn't start.
> 
> This patch renames the syslog.conf we ship to syslog-startup.conf in order
> to prevent busybox trying to parse the file as an rsyslog style syslog.conf
> 
> Fixes [YOCTO #1848]
> 
> Signed-off-by: Joshua Lock <josh@linux.intel.com>
> ---
>  meta/recipes-core/busybox/busybox.inc              |   10 +++++-----
>  meta/recipes-core/busybox/busybox_1.19.3.bb        |    4 ++--
>  meta/recipes-core/busybox/files/syslog             |    4 ++--
>  .../recipes-core/busybox/files/syslog-startup.conf |   12 ++++++++++++
>  meta/recipes-core/busybox/files/syslog.conf        |    9 ---------
>  5 files changed, 21 insertions(+), 18 deletions(-)
>  create mode 100644 meta/recipes-core/busybox/files/syslog-startup.conf
>  delete mode 100644 meta/recipes-core/busybox/files/syslog.conf

Merged to master, thanks.

Richard



