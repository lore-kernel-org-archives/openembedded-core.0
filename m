Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 91D6665DC4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Apr 2014 16:57:52 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s38Gvl98025978; Tue, 8 Apr 2014 17:57:48 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id C3Q-LFkYwBF7; Tue,  8 Apr 2014 17:57:47 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s38Gvhqw025968
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Tue, 8 Apr 2014 17:57:44 +0100
Message-ID: <1396976257.24597.109.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Slater, Joseph" <joe.slater@windriver.com>
Date: Tue, 08 Apr 2014 17:57:37 +0100
In-Reply-To: <007BD92917A2324FA403BCF9A464CF8455D24E2D@ALA-MBA.corp.ad.wrs.com>
References: <007BD92917A2324FA403BCF9A464CF8455D24E2D@ALA-MBA.corp.ad.wrs.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: libxslt populate_sysroot dependencies
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
X-List-Received-Date: Tue, 08 Apr 2014 16:57:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2014-04-07 at 23:25 +0000, Slater, Joseph wrote:
> I have attached a patch that makes sure libxml2-native is available
> when both it and libxslt-native
> are taken from sstate.
>  
> The patch parallels one from a few weeks ago for pixbufcache, but the
> underlying problem might
> have been fixed since then.  I looked for likely commits, and didn't
> see anything, so this patch might still be needed.

This is an shlibs depends, right? sstate should handle those correctly.
If not, I'd like to see logs from a build where this doesn't happen on
master please?

There are fixes in master such as:

http://git.yoctoproject.org/cgit.cgi/poky/commit/bitbake?id=d67f25da2d1acb8f5c833dad7a2c1fc710261d6c

which may help although there are others. What version of bitbake were
you seeing issues with?

Cheers,

Richard



