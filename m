Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RTjPl-00078H-Ej for openembedded-core@lists.openembedded.org;
	Fri, 25 Nov 2011 01:13:13 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAP06fv9032616
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Nov 2011 00:06:41 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 32555-01 for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Nov 2011 00:06:36 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAP06XXM032610
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Nov 2011 00:06:34 GMT
Message-ID: <1322179599.10928.43.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 25 Nov 2011 00:06:39 +0000
In-Reply-To: <3dccc17f05b5413aa0190416feeff2a14d72be8a.1321527995.git.xiaofeng.yan@windriver.com>
References: <cover.1321527995.git.xiaofeng.yan@windriver.com>
	<3dccc17f05b5413aa0190416feeff2a14d72be8a.1321527995.git.xiaofeng.yan@windriver.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] tslib: Set open mode for ts_calibate.c
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
X-List-Received-Date: Fri, 25 Nov 2011 00:13:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-11-17 at 19:10 +0800, Xiaofeng Yan wrote:
> From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
> 
> Get patch from: http://permalink.gmane.org/gmane.comp.lib.uclibc.buildroot/27614
> 
> There is a potentially "unsafe" use of open(). Ubuntu 8.10+, for instance,
> by default enables the compiler flag -D_FORTIFY_SOURCE=2 \
> which throws an error of ts_calibrate.c. To fix this, \
> set a mode in the open() call, patch patched ts_calibrate.c \
> to set 0644 (S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH) and it compiles fine
> 
> Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
> ---
>  .../tslib/set-open-mode-for-ts_calibrate_c.patch   |   30 ++++++++++++++++++++
>  meta/recipes-graphics/tslib/tslib_1.0.bb           |    5 ++-
>  2 files changed, 33 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-graphics/tslib/tslib/set-open-mode-for-ts_calibrate_c.patch

Merged to master, thanks.

Richard



