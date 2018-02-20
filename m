Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 0210878818
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Feb 2018 12:10:15 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w1KCAB4Y002502
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 20 Feb 2018 12:10:12 GMT
Message-ID: <1519128611.24236.292.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 20 Feb 2018 12:10:11 +0000
In-Reply-To: <1518153094-13367-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1518153094-13367-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.3 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] busybox: 1.27.2 -> 1.28.0
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
X-List-Received-Date: Tue, 20 Feb 2018 12:10:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2018-02-09 at 13:11 +0800, Huang Qiyu wrote:
> 1.Upgrade busybox from 1.27.2 to 1.28.0.
> 2.Delete CVE-2011-5325.patch, busybox-CVE-2017-16544.patch, since it
> is integrated upstream.
> 3.Modify busybox-udhcpc-no_deconfig.patch, since the data has been
> changed.
> 
> Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>

This fails with:

ERROR: core-image-minimal-dev-1.0-r0 do_rootfs: [log_check] core-image-minimal-dev: found 1 error message in the logfile:
[log_check] update-alternatives: Error: cannot register alternative arch to /usr/bin/arch since it is already registered to /bin/arch

https://autobuilder.yocto.io/builders/nightly-arm/builds/832/steps/BuildImages/logs/stdio

pretty much everywhere.

Cheers,

Richard

