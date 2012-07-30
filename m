Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SvpIp-0002vp-Sr for openembedded-core@lists.openembedded.org;
	Mon, 30 Jul 2012 14:42:28 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6UCUqUR004920
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jul 2012 13:30:52 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 00871-09 for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jul 2012 13:30:48 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6UCUeCj004914
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jul 2012 13:30:42 +0100
Message-ID: <1343651440.786.1.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 30 Jul 2012 13:30:40 +0100
In-Reply-To: <50164ADE.9030603@intel.com>
References: <cover.1343387245.git.laurentiu.palcu@intel.com>
	<5012D864.1090208@linux.intel.com> <50152759.4080202@balister.org>
	<50164ADE.9030603@intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/6] relocatable SDK
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
X-List-Received-Date: Mon, 30 Jul 2012 12:42:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-07-30 at 11:50 +0300, Laurentiu Palcu wrote:
> Hi Philip,
> 
> >>> The user will then execute the .sh script and give it the target
> >>> directory for SDK installation (default is /opt/poky). The installer
> > 
> > For oe-core the default should be something like /opt/oe-core, not 
> > /opt/some-distro.
> This a good observation.
> 
> SDKPATH = "/opt/${DISTRO}/${SDK_VERSION}"
> 
> I will change the installer/setup scripts so that the default SDK
> installation directory takes into account the DISTRO variable.

SDKPATH is the right variable to use for this. The above is from
poky.conf and is a valid distro configuration option. The OE-Core
default doesn't use distro and installs into /usr/local/oecore/

Cheers,

Richard



