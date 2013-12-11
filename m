Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id E6FF66AE9E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Dec 2013 14:26:56 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rBBEPgOA014218; Wed, 11 Dec 2013 14:26:43 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id EghDxfGQG7d7; Wed, 11 Dec 2013 14:26:43 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rBBEQbs6014247
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Wed, 11 Dec 2013 14:26:39 GMT
Message-ID: <1386771992.4332.76.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Wed, 11 Dec 2013 14:26:32 +0000
In-Reply-To: <cover.1386752561.git.liezhi.yang@windriver.com>
References: <cover.1386752561.git.liezhi.yang@windriver.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: paul.eggleton@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 000/122 V2] [dora] fixes for dora (cover leter only)
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
X-List-Received-Date: Wed, 11 Dec 2013 14:26:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Robert,

Can you confirm that all these patches have an equivalent change in
master already? I can see some which I can't find equivalent changes in
master for :(

You also do need to drop the "kernel: restore scripts in the sysroot"
patch since it was reverted in master and is not a correct fix for
anything.

Cheers,

Richard

On Wed, 2013-12-11 at 04:21 -0500, Robert Yang wrote:
> * V2:
>   + Create the PULL based on oe-core
>   + Remove the 2 patches after more discussions with the submitter:
>     - native-python: bad interpreter error message
>     - Fix conflict between procps and base-files
> 
> * V1 (Initial version)
>   + Main changes:
>     - Wic fixes
>     - Update the kernel to 3.10.17
>     - CVE fixes
>     - Other Bug fixes
> 
> // Robert
> 
> The following changes since commit c303f5ecf7cda1c3b8bb776a6800946c0487cd93:
> 
>   Revert "utils.bbclass: Fix override ordering for FILESPATH" (2013-12-03 12:55:47 +0000)
> 
> are available in the git repository at:
> 
>   git://git.pokylinux.org/poky-contrib robert/dora-next-oecore
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/dora-next-oecore



