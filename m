Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id D6F436D290
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Nov 2013 11:39:49 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rA4BdcQG009190; Mon, 4 Nov 2013 11:39:38 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 91EeyTpH3w0V; Mon,  4 Nov 2013 11:39:38 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rA4BdWQC009187
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Mon, 4 Nov 2013 11:39:33 GMT
Message-ID: <1383565168.6271.107.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Hongxu Jia <hongxu.jia@windriver.com>
Date: Mon, 04 Nov 2013 11:39:28 +0000
In-Reply-To: <cover.1383558655.git.hongxu.jia@windriver.com>
References: <cover.1383558655.git.hongxu.jia@windriver.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: saul.wold@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2 0/5] fix WARNING: QA Issue on kmod/udev/nfs-utils (unsafe references [/ references to /usr/lib])
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
X-List-Received-Date: Mon, 04 Nov 2013 11:39:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-11-04 at 17:56 +0800, Hongxu Jia wrote:
> Change in V2: The fourth patch fixed the QA Issue on udev, it was missed on previous version.
> 
> //Hongxu
> 
> The following changes since commit f3541226b8b1187e79dec0f6f9f3c58cedf9ac9b:
> 
>   bitbake: hob: do not display the "Package list may be incomplete!" dialog (2013-11-01 17:59:31 +0000)
> 
> are available in the git repository at:
> 
>   git://git.pokylinux.org/poky-contrib hongxu/fix-qa-issue
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-qa-issue
> 
> Hongxu Jia (5):
>   insane.bbclass: support to skip  unsafe references in binaries qa
>     check.
>   kmod: fix QA issue
>   udev: fix  QA issue
>   udev: fix QA issue
>   nfs-utils: fix QA issue

Last time these warnings came up I asked for a clear plan about what
needed to live in / and what needed to live in /usr and how we were
going to fix things once and for all (or forget this idea).

Where is the plan? Why is it ok to just ignore these particular
warnings?

Cheers,

Richard


