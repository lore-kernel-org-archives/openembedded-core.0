Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Sen.Zhang@windriver.com>) id 1Tvf9j-0004Ie-Dy
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Jan 2013 03:24:39 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r0H29CM2027457
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 16 Jan 2013 18:09:12 -0800 (PST)
Received: from [128.224.162.230] (128.224.162.230) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Wed, 16 Jan 2013 18:09:11 -0800
Message-ID: <50F75D56.3050005@windriver.com>
Date: Thu, 17 Jan 2013 10:09:26 +0800
From: Jesse Zhang <sen.zhang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<nitin.a.kamble@intel.com>
References: <1358234208-6177-1-git-send-email-sen.zhang@windriver.com>
	<1358234208-6177-2-git-send-email-sen.zhang@windriver.com>
	<1358337581.8129.2.camel@ted>
In-Reply-To: <1358337581.8129.2.camel@ted>
X-Originating-IP: [128.224.162.230]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] coreutils: remove dependency on coreutils-native
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 17 Jan 2013 02:24:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On 01/16/2013 07:59 PM, Richard Purdie wrote:
> Two questions:
> 
> 1) Why do we have this dependency here at all? Are we sure we don't need
> it for some reasons?

It was introduced in this commit, Cc'ing Nitin.

commit 543577c25b5a4e89a3ab15ee28e754b71c2a43d5
Author: Nitin A Kamble <nitin.a.kamble@intel.com>
Date:   Thu Mar 17 10:25:04 2011 -0700

    coreutils-6.9: fix man page building for the gplv2 recipe

But the reason behind the dependency is not entirely clear. And we've
never seen such issue with the GPLv3 recipe. (And the GPLv2 recipe with
my fix has been building well here for some time).

> 2) Isn't the build of coreutils-native still broken? We should probably
> hack it so it installs into some path prefix like
> {python/perl/gzip/tar}-native or doesn't install the utils at all.

Yeah, the build would still be broken.

The main contents of coreutils are the several dozen commands. I'm not
sure how it can be useful if we install them into a not-in-$PATH dir.
Any suggestions? I'm willing to work out a fix.

jesse


