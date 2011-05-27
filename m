Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QQ5jj-0000SP-No for openembedded-core@lists.openembedded.org;
	Sat, 28 May 2011 00:42:50 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4RMas7b007453
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2011 23:36:54 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 07192-05 for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2011 23:36:50 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4RManJW007447
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2011 23:36:50 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4DE02216.1010003@intel.com>
References: <4DE02216.1010003@intel.com>
Date: Fri, 27 May 2011 23:36:43 +0100
Message-ID: <1306535803.27470.309.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/1][v3] license.bbclass parsing changes rebased sans debug
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
X-List-Received-Date: Fri, 27 May 2011 22:42:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-05-27 at 15:13 -0700, Elizabeth Flanagan wrote:
> Using python abstract syntax trees as a parser and an ast visitor class, I've
> begun the first steps to being able to put some sanity to license selection.
> 
> One note. License modifiers have traditionally been limited to the "or greater"
> modifier "+". I've added another modifier "with exceptions" for licenses that
> have no generic ie common-licenses/GPL-2,0-with-GCC-exception
> 
> The following changes since commit 62e3f0ff7b27d8beb21b4b226051c3db654ea4e4:
> 
>    License Field Cleanup: Non-standard field names (2011-05-27 18:27:22 +0100)
> 
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib eflanagan/common-licenses
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=eflanagan/common-licenses
> 
> Beth Flanagan (1):
>    license.bbclass: Sane Parsing of licenses

Merged to master, thanks.

Richard



