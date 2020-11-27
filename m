Received: from linuxplesk15.openhost.net.nz (linuxplesk15.openhost.net.nz [119.47.118.83])
 by mx.groups.io with SMTP id smtpd.web11.14414.1606449312338391699
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Nov 2020 19:55:12 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: bluelightning.org, ip: 119.47.118.83, mailfrom: bluelightning@bluelightning.org)
Received: from linc.localnet (unknown [151.210.228.105])
	by linuxplesk15.openhost.net.nz (Postfix) with ESMTPSA id 77F06A46BA
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2020 16:55:09 +1300 (NZDT)
Authentication-Results: linuxplesk15.openhost.net.nz;
	spf=pass (sender IP is 151.210.228.105) smtp.mailfrom=bluelightning@bluelightning.org smtp.helo=linc.localnet
Received-SPF: pass (linuxplesk15.openhost.net.nz: connection is authenticated)
From: "Paul Eggleton" <bluelightning@bluelightning.org>
To: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 1/1] classes/kernel*: allow disabling symlink creation
Date: Fri, 27 Nov 2020 16:55:08 +1300
Message-ID: <3140175.5fSG56mABF@linc>
In-Reply-To: <3cbf479d1c740e65e5c2fdaae2b060910766b1c6.1606352479.git.paul.eggleton@linux.microsoft.com>
References: <cover.1606352479.git.paul.eggleton@linux.microsoft.com>
	<3cbf479d1c740e65e5c2fdaae2b060910766b1c6.1606352479.git.paul.eggleton@linux.microsoft.com>
MIME-Version: 1.0
X-PPP-Message-ID: <20201127035509.3918233.71465@localhost6.localdomain6>
X-PPP-Vhost: softec.co.nz
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday, 26 November 2020 14:01:47 NZDT Paul Eggleton wrote:
> From: Paul Eggleton <paul.eggleton@microsoft.com>
> 
> Allow setting any of the *_LINK_NAME variables to empty string in order
> to disable creating symlinks. This is particularly useful for situations
> where symlinks in DEPLOY_DIR_IMAGE will be treated externally as
> duplicates of the linked files (in which case you would probably set
> KERNEL_ARTIFACT_LINK_NAME = "" to disable them all at once).

I missed something - v2 incoming.

Cheers
Paul



