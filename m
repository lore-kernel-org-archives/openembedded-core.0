Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 7F09061619
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 10:35:50 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r6OAihuH015564; Wed, 24 Jul 2013 11:44:43 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id IFpovVkQDszJ; Wed, 24 Jul 2013 11:44:43 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r6OAibiH015536
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Wed, 24 Jul 2013 11:44:39 +0100
Message-ID: <1374662115.23294.126.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Saul Wold <sgw@linux.intel.com>
Date: Wed, 24 Jul 2013 11:35:15 +0100
In-Reply-To: <cover.1374511663.git.sgw@linux.intel.com>
References: <cover.1374511663.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: otavio@ossystems.com.br, paul.eggleton@linux.intel.com,
	dvhart@linux.intel.com, zhenhua.luo@freescale.com,
	openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED PULL 00/27] Ready for Pull after final ACK
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
X-List-Received-Date: Wed, 24 Jul 2013 10:35:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2013-07-22 at 10:12 -0700, Saul Wold wrote:
> Richard,
> 
> This has been trimmed and reviewed, please wait for Paul and Ross (traveling)
> final ACKs.
> 
> ** Reminder to BSP Maintainers - Please update your mesa .bbappends *** 
> ** I will send email when RP has pulled, please keep me posted on your branches **
> 
> Thanks
> 	Sau!
> 
> 
> The following changes since commit 8fc6904fe97438478119db6cd23b7b4eb33b50aa:
> 
>   curl: add upstream status to patch (2013-07-18 12:21:13 -0700)
> 
> are available in the git repository at:
> 
>   git://git.openembedded.org/openembedded-core-contrib sgw/stage
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage
> 
> André Draszik (1):
>   directfb: don't patch pkg-config files
> 
> Beth Flanagan (1):
>   adt_installer_internal: fix spelling error
> 
> Chen Qi (2):
>   useradd.bbclass: add a new base class and code refactor
>   extrausers.bbclass: add a new bbclass
> 
> Daniel Nilsson (1):
>   glew: Update GLEW version number in autotools patch
> 
> Emilia Ciobanu (3):
>   kmod:add GIT revision to PV variable
>   lttng-modules: Append _git to recipe name and add GIT revision to PV  
>       variable
>   docbook-sgml-dtd-4.5-native.bb: Add real PV inside the recipe

I merged this but with this last one, why not rename the recipe to the
standard naming and then we don't need to set PV?

Cheers,

Richard


