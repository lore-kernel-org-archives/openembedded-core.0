Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id EF2A777CF8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 May 2017 13:14:53 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v4GDEnDB001605
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 16 May 2017 14:14:50 +0100
Message-ID: <1494940489.27342.30.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 16 May 2017 14:14:49 +0100
In-Reply-To: <cover.1494932131.git.pkj@axis.com>
References: <cover.1494932131.git.pkj@axis.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Tue, 16 May 2017 14:14:50 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 0/2] Allow oe-pkgdata-util package-info to display more info
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
X-List-Received-Date: Tue, 16 May 2017 13:14:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2017-05-16 at 12:56 +0200, Peter Kjellerstedt wrote:
> After a build in our autobuilder, we use `oe-pkgdata-util package-
> info
> -f package.manifest` to store a file with information about each
> installed package. This is typically used to compare builds later
> on. Since not every difference to a package is explained by its
> version, we have found it beneficial to also include the SRC_URI in
> the generated file.
> 
> This patch set adds SRC_URI to the pkgdata that is stored for each
> package, and adds a new option to oe-pkgdata-util package-info,
> -e <var>, that can be used to display extra variables from the
> pkgdata.

I'm going to say no to this.

The reason is that pkgdata is not really about collecting up all build
information. If you want to know how two different builds differ, you'd
use the sigdata files. If I take this patch, more will follow where you
find some new difference you want to track and there are other
mechanisms I'd suggest (buildhistory and siginfo for starters). I don't
want to turn the pkgdata files into something they're not.

Cheers,

Richard

