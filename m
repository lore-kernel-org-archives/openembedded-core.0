Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RNtag-0001il-NE for openembedded-core@lists.openembedded.org;
	Tue, 08 Nov 2011 22:52:22 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pA8Lk8LI006923
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 Nov 2011 21:46:08 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 06833-01 for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Nov 2011 21:46:04 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pA8Lk1Is006917
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 Nov 2011 21:46:02 GMT
Message-ID: <1320788763.10843.118.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 08 Nov 2011 21:46:03 +0000
In-Reply-To: <cover.1320780004.git.sgw@linux.intel.com>
References: <cover.1320780004.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [CONSOLIDATED PULL 00/17] Updates and Fixes
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
X-List-Received-Date: Tue, 08 Nov 2011 21:52:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-11-08 at 11:22 -0800, Saul Wold wrote:
> Richard,
> 
> I have reviewed and build/booted these changes.
> 
> There are 2 changes from Tom that I need your advice on, please review
> the gmp and python changes, I do not want to hold these up if they are 
> correct, but I wanted to think if there was a better way to handle the
> python one.

The gmp one looked correct, the python one looked reasonable too. I've
taken them both, if a better solution comes up for the python issue I'll
take it though.

> The following changes since commit 157db263b50fabf4afcbea3c2a5364c0752ae0e2:
> 
>   clutter-gst: fix patch filename (2011-11-08 17:33:19 +0000)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib sgw/stage
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage
> 
> Mark Hatle (1):
>   pseudo: Uprev pseudo to version 1.2
> 
> Matthew McClintock (1):
>   Add new IMAGE_CLASSES variable for classes for image generation
> 
> Otavio Salvador (5):
>   libcap: fix sstate for native package
>   files/device_table-minimal.txt: add /dev/kmsg
>   dhcp: drop unused dhcp3.inc file
>   dhcp: rename dhcp4.inc to dhcp.inc
>   dhcp: move server configuration to dhcp-server-config
> 
> Tom Zanussi (6):
>   tune-corei7: Add tune file for Intel Core i7 machines
>   tune-ivb: Add tune file for Intel Ivy Bridge machines
>   machine/include/tune-atom.inc: add atom-specific settings
>   ** gmp_5.0.2: Set CC_FOR_BUILD to BUILD_CC
>   libzypp: fix mishandling of hyphenated arches
>   ** python: skip setup.py 'import check' when cross-compiling
> 
> Xiaofeng Yan (4):
>   libarchive: update to 2.8.5
>   distro_tracking_fields.inc: update to libarchive to 2.8.5
>   qmmp: update to 0.5.2
>   distro_tracking_fields.inc: Modify the status of qmmp

I took everything except the tune file changes from Tom which I need to
discuss.

Cheers,

Richard



