Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 82DBE77E96
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Apr 2017 09:52:45 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v3E9qiDA023608
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 14 Apr 2017 10:52:45 +0100
Message-ID: <1492163564.19076.18.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Date: Fri, 14 Apr 2017 10:52:44 +0100
In-Reply-To: <94259cfb17bc467485c33003af4a4925@XBOX02.axis.com>
References: <1492022024-30940-1-git-send-email-richard.purdie@linuxfoundation.org>
	<94259cfb17bc467485c33003af4a4925@XBOX02.axis.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Fri, 14 Apr 2017 10:52:45 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base-passwd/useradd: Various improvements to useradd with RSS
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
X-List-Received-Date: Fri, 14 Apr 2017 09:52:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2017-04-14 at 02:39 +0000, Peter Kjellerstedt wrote:
> However, during my testing I stumbled upon a bug in pseudo which
> caused 
> bash to segmentation fault. It was triggered by how the postinst-
> useradd 
> scripts are called from the postinst-base-passwd script. Seebs and I 
> debugged this and eventually found a solution which is now available
> as 
> commit b6b68db896 in git://git.yoctoproject.org/pseudo. This must be 
> fixed in OE-Core, either as a backport patch or by using an updated 
> version of pseudo. 

Thanks for figuring this out. Since our tests passed, I've merged the
current patch queue but I have a pseudo update in testing now and we'll
make sure that fix is in M4.

We had already found some other issues in testing with devtool and I
did merge in some fixes for those issues.

> I also made some improvements to the debuggability of the postinst 
> scripts. I will send that as a separate patch set.

Thanks, unfortunately those can't be merged as there is a problem, I
replied to the patches.

Cheers,

Richard




