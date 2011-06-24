Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qa4Uc-0002yV-PO for openembedded-core@lists.openembedded.org;
	Fri, 24 Jun 2011 13:24:11 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5OBKY0E030296
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2011 12:20:34 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 30262-01 for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2011 12:20:30 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5OBKS35030290
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2011 12:20:29 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4E043FEF.8080107@linux.intel.com>
References: <4E043FEF.8080107@linux.intel.com>
Date: Fri, 24 Jun 2011 12:20:25 +0100
Message-ID: <1308914425.20015.155.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: gconf-dbus fetch failure
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
X-List-Received-Date: Fri, 24 Jun 2011 11:24:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-06-24 at 00:42 -0700, Darren Hart wrote:
> It seems there is a problem with the subversion repository for gconf-dbus. Are others seeing this as well, or this perhaps a local networking issue?
> 
> ERROR: Logfile of failure stored in: /build/poky/timeline/qemux86/tmp/work/x86_64-linux/gconf-dbus-native-2.16.0+svnr705-r0/temp/log.do_fetch.19184
> Log data follows:
> | NOTE: Fetch svn://developer.imendio.com/svn/gconf-dbus;module=trunk;proto=http
> | NOTE: Fetch svn://developer.imendio.com/svn/gconf-dbus;module=trunk;proto=http
> | svn: OPTIONS of 'http://developer.imendio.com/svn/gconf-dbus/trunk': could not connect to server (http://developer.imendio.com)
> |  ERROR: Function 'Fetcher failure for URL: 'svn://developer.imendio.com/svn/gconf-dbus;module=trunk;proto=http'. Unable to fetch URL svn://developer.imendio.com/svn/gconf-dbus;module=trunk;proto=http from any source.' failed
> 

Its a known issue and we are currently relying on the mirror to provide
this file. We have a plan to get this addressed (drop gconf-dbus in
favour of gconf).

Cheers,

Richard



