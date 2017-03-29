Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 9F42E6093E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Mar 2017 22:24:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTP id v2TMOwgP015065; 
	Wed, 29 Mar 2017 23:24:58 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id SBF0iGKMWbbn; Wed, 29 Mar 2017 23:24:58 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v2TMOuV0015062
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 29 Mar 2017 23:24:57 +0100
Message-ID: <1490826296.13980.335.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andreas Oberritter <obi@opendreambox.org>, Andrea Adami
	<andrea.adami@gmail.com>
Date: Wed, 29 Mar 2017 23:24:56 +0100
In-Reply-To: <20170329230933.3b71d516@t510.zcs.saftware.de>
References: <1490820317-3686-1-git-send-email-andrea.adami@gmail.com>
	<20170329230933.3b71d516@t510.zcs.saftware.de>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] bitbake.conf: add whoami to HOSTTOOLS
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
X-List-Received-Date: Wed, 29 Mar 2017 22:24:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2017-03-29 at 23:09 +0200, Andreas Oberritter wrote:
> On Wed, 29 Mar 2017 22:45:17 +0200
> Andrea Adami <andrea.adami@gmail.com> wrote:
> 
> > 
> > Spotted in log do_compile of linux:
> > 
> >  /tmp/build/tmp-glibc/work-shared/c7x0/kernel-
> > source/scripts/mkcompile_h:
> >  line 46: whoami: command not found
> As an alternative, we could set KBUILD_BUILD_USER (and possibly
> KBUILD_BUILD_HOST) to a fixed or machine-based value in
> kernel.bbclass'
> EXTRA_OEMAKE variable, which could also improve the reproducibility
> of
> builds.

Agreed, I already suggested we should figure out how to pass in a
deterministic value and said I would not accept a patch to add whoami
to HOSTTOOLS.

Cheers,

Richard

