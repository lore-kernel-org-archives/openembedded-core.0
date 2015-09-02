Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C1F1B7700A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Sep 2015 06:55:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t826tFLs003295; Wed, 2 Sep 2015 07:55:15 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id tgatfHm7bdpV; Wed,  2 Sep 2015 07:55:15 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t826t0UE003290
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 2 Sep 2015 07:55:12 +0100
Message-ID: <1441176900.24871.25.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alejandro del Castillo <alejandro.delcastillo@ni.com>
Date: Wed, 02 Sep 2015 07:55:00 +0100
In-Reply-To: <1441117073-23911-1-git-send-email-alejandro.delcastillo@ni.com>
References: <1441117073-23911-1-git-send-email-alejandro.delcastillo@ni.com>
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] opkg: upgrade to v0.3.0
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
X-List-Received-Date: Wed, 02 Sep 2015 06:55:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-09-01 at 09:17 -0500, Alejandro del Castillo wrote:
> Changes required:
> - Rename opkg-cl to opkg
> - Add libarchive dependency
> - Drop backport patches
> - Drop obsolete directory options
> - Add patch to handle empty index files
> 
> Based on initial work by Paul Barker.
> 
> Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
> CC: Paul Barker <paul@paulbarker.me.uk>

The autobuilder shows these errors for a build containing this patch:

https://autobuilder.yoctoproject.org/main/builders/nightly-ipk/builds/468/steps/BuildImages/logs/stdio

Not sure why...

Cheers,

Richard


