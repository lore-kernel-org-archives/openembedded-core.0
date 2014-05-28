Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (unknown [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 0E8DE6FB9D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 May 2014 08:43:34 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s4S8h7i5024434; Wed, 28 May 2014 09:43:07 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id oQ4pJxmIsCvV; Wed, 28 May 2014 09:43:06 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s4S8h2Mb024426
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Wed, 28 May 2014 09:43:04 +0100
Message-ID: <1401266574.2607.17.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Darren Hart <dvhart@linux.intel.com>
Date: Wed, 28 May 2014 09:42:54 +0100
In-Reply-To: <cover.1401223100.git.dvhart@linux.intel.com>
References: <cover.1401223100.git.dvhart@linux.intel.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1] i2c-tools: Add i2c-tools to the core
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 28 May 2014 08:43:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2014-05-27 at 13:38 -0700, Darren Hart wrote:
> The following changes since commit f3d62a9eb9c47356e6150fdd55f790c159e620c7:
> 
>   eglinfo: updated to compile with mesa10+ (2014-05-27 16:11:55 +0100)
> 
> are available in the git repository at:
> 
>   git://git.yoctoproject.org/poky-contrib dvhart/i2c-tools
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=dvhart/i2c-tools
> 
> Darren Hart (1):
>   i2c-tools: Add i2c-tools to the core
> 
>  meta/recipes-devtools/i2c-tools/files/Module.mk    |   72 ++++++++++++++++++++
>  .../i2c-tools/i2c-tools-3.1.0/Module.mk            |   72 ++++++++++++++++++++
>  meta/recipes-devtools/i2c-tools/i2c-tools_3.1.0.bb |   26 +++++++
>  3 files changed, 170 insertions(+)
>  create mode 100644 meta/recipes-devtools/i2c-tools/files/Module.mk
>  create mode 100644 meta/recipes-devtools/i2c-tools/i2c-tools-3.1.0/Module.mk
>  create mode 100644 meta/recipes-devtools/i2c-tools/i2c-tools_3.1.0.bb

I merged this, I've said I wanted this patch for long enough to multiple
people, thanks! :)

I removed the duplicate Module.mk file...

Cheers,

Richard


