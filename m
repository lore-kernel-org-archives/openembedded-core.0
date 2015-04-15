Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 35EE06ABF7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Apr 2015 20:38:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t3FKcwjM011482; Wed, 15 Apr 2015 21:38:58 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id GBudK3twH3fk; Wed, 15 Apr 2015 21:38:58 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t3FKcgUf011465
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 15 Apr 2015 21:38:54 +0100
Message-ID: <1429130322.6976.154.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Wed, 15 Apr 2015 21:38:42 +0100
In-Reply-To: <39bde4872c0287e3617e2e8af5768903e1d33cfc.1429002519.git.liezhi.yang@windriver.com>
References: <cover.1429002519.git.liezhi.yang@windriver.com>
	<39bde4872c0287e3617e2e8af5768903e1d33cfc.1429002519.git.liezhi.yang@windriver.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/6] libxml2: fix python path and add libxml2-python
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
X-List-Received-Date: Wed, 15 Apr 2015 20:38:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-04-14 at 02:08 -0700, Robert Yang wrote:
> We have libxml2-python for native and nativesdk, but don't have it for
> target, and can't find the reason from the git log, libxml2-python is
> widely used, after looked into it's configure.in, we can add it
> by PACKAGECONFIG.
> 
> The previous --with-python=${STAGING_BINDIR}/python is incorrect, it
> acted as work becase it's conigure can check automatically, python is in
> ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN}, as known as
> ${PYTHON}.
> 
> Add python to PACKAGECONFIG, since createrepo rdepends on
> libxml2-python, otherwise the target createrepo can't work.
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>

Something here caused a load of failures:

http://errors.yoctoproject.org/Errors/Search/?items=10&query=90b8d406488b0a3c42b2a745526e5b1273d8a982

e.g. specifically http://errors.yoctoproject.org/Errors/Details/9808/

Cheers,

Richard


