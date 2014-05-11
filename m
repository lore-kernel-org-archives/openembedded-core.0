Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (unknown [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 099126059B
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 May 2014 17:05:50 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s4BH5hYx022223; Sun, 11 May 2014 18:05:43 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id nTv9w88hpiqg; Sun, 11 May 2014 18:05:43 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s4BH5ehQ022219
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Sun, 11 May 2014 18:05:42 +0100
Message-ID: <1399827934.31891.119.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Gary Robertson <gary.robertson@linaro.org>
Date: Sun, 11 May 2014 18:05:34 +0100
In-Reply-To: <1399586980.31891.79.camel@ted>
References: <1397851967-24110-1-git-send-email-gary.robertson@linaro.org>
	<1398272388-3326-1-git-send-email-gary.robertson@linaro.org>
	<1398272388-3326-2-git-send-email-gary.robertson@linaro.org>
	<CAF7YWnzBffap=rUnEAVhJ1B6x4-v7rvv9LR+mxK6i_tw=Gqbyg@mail.gmail.com>
	<1399586980.31891.79.camel@ted>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: Mike Holmes <mike.holmes@linaro.org>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] rt-tests: bump version 0.87 => 0.89
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
X-List-Received-Date: Sun, 11 May 2014 17:05:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2014-05-08 at 23:09 +0100, Richard Purdie wrote:
> On Thu, 2014-05-08 at 16:24 -0500, Gary Robertson wrote:
> 
> > I am regrettably new at patch submissions within the Linux / Open
> > Source community, so please forgive my breach of etiquette if I abuse
> > the balance between persistence and peskiness.
> > 
> > I submitted the first version of this recipe patch on 18 APR and
> > received prompt suggestions for improvement.
> > However since amending the patch to incorporate those improvements and
> > re-submitting the patch on 24 APR, I have heard no further comments or
> > responses.
> > 
> > So I am pinging the list once more to check the status of the patch.
> > Please let me know if additional work must be done to make the patch
> > acceptable.
> > 
> > (BTW, I authored the patch to cyclictest and Anders Roxell authored
> > the patch to update the recipe with the new version of the rt-tests.
> > I subsequently submitted the recipe patch on his behalf... that is why
> > his name appears as author of the patch itself.)
> 
> We have tried this in some of the test builds. My memory says something
> failed and we hence didn't merge it but I'm not remembering which
> version of the series that was, or what the failure was. Saul may
> remember.
> 
> We do try and reply to the patches where we identify failures with
> pointers to the logs but this one has probably fallen through the
> cracks, sorry.
> 
> If we can't remember we'll try it in master-next or mut and see if we
> can remember what the issue was...

I merged this as I thought we were ok, then we found:

https://autobuilder.yoctoproject.org/main/builders/nightly-world/builds/85/steps/BuildImages/logs/stdio

so a patch to fix that would be much appreciated.

Cheers,

Richard


