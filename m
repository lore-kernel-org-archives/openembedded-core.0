Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R6qox-0002nS-Ut for openembedded-core@lists.openembedded.org;
	Thu, 22 Sep 2011 23:28:40 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8MLTRi4032270; Thu, 22 Sep 2011 22:29:27 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id k5V58iKPfFj6; Thu, 22 Sep 2011 22:29:27 +0100 (BST)
Received: from [192.168.250.158] ([116.246.20.131]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8MLTHES032264
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Thu, 22 Sep 2011 22:29:20 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Darren Hart <dvhart@linux.intel.com>
Date: Thu, 22 Sep 2011 22:23:00 +0100
In-Reply-To: <e4dd377c38d0df65adb41959e5b720e5b539a47d.1316725800.git.dvhart@linux.intel.com>
References: <cover.1316725800.git.dvhart@linux.intel.com>
	<e4dd377c38d0df65adb41959e5b720e5b539a47d.1316725800.git.dvhart@linux.intel.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1316726587.28323.10.camel@ted>
Mime-Version: 1.0
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] intltool: add libxml-parser-perl-native dependency to -native version
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
X-List-Received-Date: Thu, 22 Sep 2011 21:28:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-09-22 at 14:14 -0700, Darren Hart wrote:
> Fixes [YOCTO #1514]
> 
> Without a native dependency on libxml-parser-perl-native,
> shared-mime-info-native can fail its do_configure task.
> 
> checking for XML::Parser... configure: error: XML::Parser perl module is
> required for intltool
> 
> Testing: Successfully built shared-mime-info and shared-mime-info-native for
> qemuppc.

Merged to master, thanks.

Richard



