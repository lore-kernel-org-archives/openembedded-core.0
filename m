Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RLWAj-0002W3-QL for openembedded-core@lists.openembedded.org;
	Wed, 02 Nov 2011 09:27:45 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pA28LdYP012575
	for <openembedded-core@lists.openembedded.org>;
	Wed, 2 Nov 2011 08:21:39 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 11972-05 for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Nov 2011 08:21:34 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pA28LUeh012569
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 2 Nov 2011 08:21:31 GMT
Message-ID: <1320222090.20107.12.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 02 Nov 2011 08:21:30 +0000
In-Reply-To: <cover.1320191934.git.sgw@linux.intel.com>
References: <cover.1320191934.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [Pull v3 0/4] Add User Fixes
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
X-List-Received-Date: Wed, 02 Nov 2011 08:27:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-11-01 at 17:21 -0700, Saul Wold wrote:
> Richard,
> 
> Hope that third times the charm!
> 
> Fixes 1699, additional commit comments, fixed whitespace.
> 
> Sau!
> 
> 
> The following changes since commit d0a2c87d068f2d769d47c8455bb1434b90a7a844:
> 
>   Fix HOMEPAGE values in libzypp and sat-solver .bb files (2011-11-01 18:28:06 +0000)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib sgw/fix
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/fix
> 
> Saul Wold (4):
>   avahi: use useradd to create avahi user for avahi-daemon
>   xserver-nodm-init: Use useradd to add the xuser for rootless X
>   connman: Use useradd to add the xuser for DBus
>   dbus: ensure that the useradd shell is set to /bin/false

Thanks for the tweaks, merged to master.

Cheers,

Richard



