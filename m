Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1ROToK-0004f9-HB for openembedded-core@lists.openembedded.org;
	Thu, 10 Nov 2011 13:32:53 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAACQZRF028759
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2011 12:26:35 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 28200-08 for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2011 12:26:30 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAACQRCS028753
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2011 12:26:28 GMT
Message-ID: <1320927990.1165.15.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 10 Nov 2011 12:26:30 +0000
In-Reply-To: <cover.1320799787.git.josh@linux.intel.com>
References: <cover.1320799787.git.josh@linux.intel.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/3] Switch to upstream GConf
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
X-List-Received-Date: Thu, 10 Nov 2011 12:32:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-11-08 at 16:53 -0800, Joshua Lock wrote:
> This series' primary goal is to switch us from gconf-dbus to the upstream
> GConf, where the D-Bus backend is now maintained.
> 
> To ease recipe writing I also pulled in and cleaned up the GNOME related
> classes from meta-openembedded.
> 
> Cheers,
> Joshua
> 
> The following changes since commit 25fae81538a92e15eab3fc169ebce44505f67839:
> 
>   python: skip setup.py 'import check' when cross-compiling (2011-11-08 21:44:23 +0000)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib josh/work
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=josh/work
> 
> Joshua Lock (3):
>   shared-mime-info: package runtime data separately
>   classes/[gnome|gnomebase|mime]: enhance gnome related classes
>   gconf: add upstream GNOME gconf 3.2.3 and drop gconf-dbus

Merged to master, thanks. I did add a couple of follow up tweaks to
these to fix various issues.

Cheers,

Richard



