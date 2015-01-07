Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id AB56A7169F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jan 2015 23:47:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t07NkxoO001896; Wed, 7 Jan 2015 23:46:59 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id eJPXiDoF_cxp; Wed,  7 Jan 2015 23:46:59 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t07NkkWS001882
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 7 Jan 2015 23:46:58 GMT
Message-ID: <1420674443.25779.78.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 07 Jan 2015 23:47:23 +0000
In-Reply-To: <CADkTA4MjiRZWfb4Ly9ydGKL+LpXnWAtGVXW0AVASZ273NDAGpA@mail.gmail.com>
References: <1420651519-25240-1-git-send-email-otavio@ossystems.com.br>
	<1420651519-25240-2-git-send-email-otavio@ossystems.com.br>
	<CADkTA4MjiRZWfb4Ly9ydGKL+LpXnWAtGVXW0AVASZ273NDAGpA@mail.gmail.com>
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] module.bbclass: Add KERNEL_SRC in EXTRA_OEMAKE
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
X-List-Received-Date: Wed, 07 Jan 2015 23:47:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2015-01-07 at 13:45 -0500, Bruce Ashfield wrote:
> On Wed, Jan 7, 2015 at 12:25 PM, Otavio Salvador
> <otavio@ossystems.com.br> wrote:
> > When the sstate hash changes for do_configure task, the do_configure
> > default implementation triggers the 'clean' to be run. For it to
> > succeed we need to have KERNEL_SRC defined in EXTRA_OEMAKE. Fixes
> > following error:
> 
> I wanted to reproduce this locally, since I've never seen the problem
> myself.
> 
> What's the best way to trigger the sstate hash change ?

bitbake virtual/kernel -c configure -f

Cheers,

Richard


