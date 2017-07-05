Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 5F2D4775DE
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jul 2017 14:33:51 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v65EXoFw029988
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Wed, 5 Jul 2017 15:33:51 +0100
Message-ID: <1499265230.9571.181.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Anders Darander <anders@chargestorm.se>,
	openembedded-core@lists.openembedded.org
Date: Wed, 05 Jul 2017 15:33:50 +0100
In-Reply-To: <20170705135358.ask4pvpiaxwqusi3@ad.chargestorm.se>
References: <cover.1498459830.git.anders@chargestorm.se>
	<25c15eb7fc3af2ec38a63ed73ae710e1e2172dad.1498459830.git.anders@chargestorm.se>
	<20170705135358.ask4pvpiaxwqusi3@ad.chargestorm.se>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Wed, 05 Jul 2017 15:33:52 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [pyro][PATCH 1/1] package_manager: flush installed_pkgs file before oe-pkgdata-util uses it
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
X-List-Received-Date: Wed, 05 Jul 2017 14:33:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2017-07-05 at 15:53 +0200, Anders Darander wrote:
> * Anders Darander <anders@chargestorm.se> [170626 08:53]:
> 
> > 
> > From: Martin Jansa <martin.jansa@gmail.com>
> > 
> > * since this commit:
> >   commit f5a1013ffa9815f22e13989e2bcb83f966e7ce2c
> >   Author: Ross Burton <ross.burton@intel.com>
> >   Date:   Tue Apr 18 16:19:12 2017 +0100
> > 
> >     package_manager: don't race on a file when installing
> > complementary
> >     packages
> > 
> >   the file isn't closed before oe-pkgdata-util uses it and this
> >   temporary file might look empty to oe-pkgdata-util, because it
> >   wasn't flushed yet. Which resulted in almost empty debugfs
> > tarballs
> >   and no locale packages in regular rootfs.
> > * without this change:
> >   124K May 30 07:41 core-image-full-cmdline-raspberrypi3-64-
> > 20170530054003-dbg.rootfs.tar.gz
> > * with this change:
> Ping. 

I did queue this in pyro-next earlier too. I suspect there are others
I've missed but I am trying to change my processes to make this easier
for me to make sure things get caught.

Cheers,

Richard

