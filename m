Received: from linuxplesk15.openhost.net.nz (linuxplesk15.openhost.net.nz [119.47.118.83])
 by mx.groups.io with SMTP id smtpd.web12.16413.1616984631899857062
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Mar 2021 19:23:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: bluelightning.org, ip: 119.47.118.83, mailfrom: bluelightning@bluelightning.org)
Received: from linc.localnet (unknown [151.210.226.152])
	by linuxplesk15.openhost.net.nz (Postfix) with ESMTPSA id AEDDAA21B6;
	Mon, 29 Mar 2021 15:23:47 +1300 (NZDT)
Authentication-Results: linuxplesk15.openhost.net.nz;
	spf=pass (sender IP is 151.210.226.152) smtp.mailfrom=bluelightning@bluelightning.org smtp.helo=linc.localnet
Received-SPF: pass (linuxplesk15.openhost.net.nz: connection is authenticated)
From: "Paul Eggleton" <bluelightning@bluelightning.org>
To: Yi Fan Yu <yifan.yu@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe-core][PATCH v3 1/2] valgrind: update 3.16.1 -> 3.17.0
Date: Mon, 29 Mar 2021 15:23:47 +1300
Message-ID: <5446239.DvuYhMxLoT@linc>
In-Reply-To: <20210326143710.168053-1-yifan.yu@windriver.com>
References: <166FB59AC0FDC39E.19792@lists.openembedded.org>
	<20210326143710.168053-1-yifan.yu@windriver.com>
MIME-Version: 1.0
X-PPP-Message-ID: <20210329022347.2218400.32912@localhost6.localdomain6>
X-PPP-Vhost: softec.co.nz
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Yi Fan

On Saturday, 27 March 2021 03:37:09 NZDT Yi Fan Yu wrote:
> Notable changes:
> * library is now in libexecdir instead of libdir
> 
> Added patches:
> * Add musl.supp: missing musl.supp in 3.17.0
> 
> Dropped backport patches:
> * nlcontrolc: found in c79180a3afcf65902e578646c3b716cc749db406
> * drd Fedora33: found in 15330adf7c2471fbaa6a0818db07078d81dbff97
> * lmw lswi ppc64le: found in 74b74174d572fee4015b8f4e326db3cd949bcdc3
> 
> Other dropped patches
> * helgrind intercept: found in d2d54dbcc74244adfc0c80b40862edf2b82f53b9
> * drd musl fix: found in d2d54dbcc74244adfc0c80b40862edf2b82f53b9
> 
> TESTING RESULTS:
> qemux86-64:
> FAIL: drd/tests/swapcontext
> 
>       3.17.0  3.16.1
> ===================
> TOTAL:  736    726
> PASSED: 694    688
> FAILED:   1      0
> SKIPPED: 41     38

Can you take a look at the  following ptest failure:

 AssertionError: Failed ptests:
 {'valgrind': ['callgrind/tests/simwork-branch']}

https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/1657/steps/12/logs/stdio

(To be fair I'm not 100% sure if this only started happening after your patch though.)

Thanks
Paul





