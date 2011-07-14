Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QhNP2-00071d-F5 for openembedded-core@lists.openembedded.org;
	Thu, 14 Jul 2011 17:00:36 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6EEucXh008415
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jul 2011 15:56:38 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 08140-04 for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jul 2011 15:56:34 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6EEuVml008409
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jul 2011 15:56:31 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <A84789EE-49E1-4E8D-BB65-73C2FF2B1CB5@dominion.thruhere.net>
References: <A84789EE-49E1-4E8D-BB65-73C2FF2B1CB5@dominion.thruhere.net>
Date: Thu, 14 Jul 2011 15:56:27 +0100
Message-ID: <1310655387.20015.1177.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: target python problems
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
X-List-Received-Date: Thu, 14 Jul 2011 15:00:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-07-13 at 13:07 +0200, Koen Kooi wrote:
> After a recent update to python (the past week by the looks of it)
> python modules only install the .so files and not the .py and .pyo
> files anymore. This leads to breakge like this:
> 
> root@usrp-e1xx:~# opkg install python-dbus --force-reinstall
> Removing package python-dbus from root...
> Installing python-dbus (0.83.2-r0) to root...
> Downloading http://feeds.angstrom-distribution.org/feeds/core/ipk/eglibc/armv7a/python/python-dbus_0.83.2-r0_armv7a.ipk.
> Configuring python-dbus.
> 
> root@usrp-e1xx:~# systemd-analyze blame
> Could not find platform independent libraries <prefix>
> Could not find platform dependent libraries <exec_prefix>
> Consider setting $PYTHONHOME to <prefix>[:<exec_prefix>]
> 'import site' failed; use -v for traceback
> Traceback (most recent call last):
>   File "/usr/bin/systemd-analyze", line 3, in <module>
>     import dbus, sys
> ImportError: No module named dbus
> 
> Prior to the 'opkg upgrade' yesterday systemd-analyze blame was working properly

I merged a fix to a python patch which should have addressed this...

Cheers,

Richard



