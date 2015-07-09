Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id B2FC76017E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jul 2015 07:58:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t697wpf7032441; Thu, 9 Jul 2015 08:58:51 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id uKcOE5ABRLBt; Thu,  9 Jul 2015 08:58:51 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t697wcvn032437
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 9 Jul 2015 08:58:49 +0100
Message-ID: <1436428717.9778.33.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
Date: Thu, 09 Jul 2015 08:58:37 +0100
In-Reply-To: <cover.1436195315.git.tanu.kaskinen@linux.intel.com>
References: <cover.1436195315.git.tanu.kaskinen@linux.intel.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/3] speex, speexdsp: 1.2rc1 -> 1.2rc2/1.2rc3
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
X-List-Received-Date: Thu, 09 Jul 2015 07:58:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2015-07-06 at 18:14 +0300, Tanu Kaskinen wrote:
> These patches update speex to 1.2rc2 and speexdsp to 1.2rc3. speexdsp
> was previously included in speex, but now it's in a separate source
> tree, so a new recipe is needed.
> 
> The following changes since commit dd09fab685de2eaf04aa5ab60f8220b89c1deae9:
> 
>   tune-core2.inc: set X86ARCH32 to i686 (instead of i586) (2015-07-02 23:08:27 +0100)
> 
> are available in the git repository at:
> 
>   git://git.openembedded.org/openembedded-core-contrib tanuk/speex
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=tanuk/speex

I included these patches on the autobuilder in master-next and saw:

https://autobuilder.yoctoproject.org/main/builders/nightly-x86-lsb/builds/385/steps/BuildImages_1/logs/stdio

and also what looks like a another separate but related issue:

https://autobuilder.yoctoproject.org/main/builders/nightly-world-lsb/builds/107/steps/BuildImages/logs/stdio
https://autobuilder.yoctoproject.org/main/builders/nightly-world/builds/387/steps/BuildImages/logs/stdio
https://autobuilder.yoctoproject.org/main/builders/nightly-multilib/builds/383/steps/BuildImages_2/logs/stdio

Could you take a look and see if we can figure out the issue there
please?

Cheers,

Richard






