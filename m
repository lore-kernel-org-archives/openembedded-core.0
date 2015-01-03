Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id DA92572761
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Jan 2015 00:41:08 +0000 (UTC)
Received: by mail-pa0-f50.google.com with SMTP id bj1so24767591pad.23
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Jan 2015 16:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=0OkoDwy4Foy7OzgKAykE2oss6zem8aMuBdYAqAC8lCs=;
	b=uMtLXvHqlYUxEJhqO4J3jZpKnnmxQ2eP0q7radCcsr2Swl/MKDeB+LTZJd4ID9Tn6s
	akmQYP2Mka/3Ic3cmhWo83GEPj00fP6Xs59V+gC14jJMCQ3WaqKCY4NFcm0CkNshFnb7
	GpFMDoYFpFiFubk1F5Hkl98+wACi7jKEOT6SsPuRta1lLBSmdTSVS1cBMvyg0T2egyhs
	CQQ8QSfB9RklENeALpktZ6L8CRcW/KiFJQad9F8YKv4yI8xIQdsc0d+M6ct6ZrCmDJ4m
	S8OAl0/BzS6pgFtLhEeu8NeH8iiapAHFzXZ2O0VNzWxkcHSoaRHK6TC13RIVFuLku22b
	t88Q==
X-Received: by 10.66.250.134 with SMTP id zc6mr112257421pac.2.1420245669015;
	Fri, 02 Jan 2015 16:41:09 -0800 (PST)
Received: from ?IPv6:2601:c:a700:272f:f8cc:75ad:29b0:59e5?
	([2601:c:a700:272f:f8cc:75ad:29b0:59e5])
	by mx.google.com with ESMTPSA id lq2sm3667474pab.34.2015.01.02.16.41.07
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 02 Jan 2015 16:41:07 -0800 (PST)
Message-ID: <54A73A9D.8080903@gmail.com>
Date: Fri, 02 Jan 2015 16:41:01 -0800
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1418663308.git.akuster808@gmail.com>
	<1420021585.25779.14.camel@linuxfoundation.org>
In-Reply-To: <1420021585.25779.14.camel@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Dizzy Merging
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
X-List-Received-Date: Sat, 03 Jan 2015 00:41:12 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/31/2014 02:26 AM, Richard Purdie wrote:
> Hi Armin,
>
> I've taken a look at the dizzy_1_7_1 branch and have merged a lot of
> things. For bitbake, I took the patches into the 1.24 branch. There was
> a patch missing for the PR server sync changes so I added that too,
> otherwise the others didn't make sense.
>
ok.
> For the OE-Core patches, the gcc sysroot poison one should not go in.
> I'd also question the udev changes and the gcc shared work changes since
> those were fairly significant changes with a lot more risk.

no worries.

>
> I've put the things I didn't take into
> http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=rpurdie/dizzy-next just so we can discuss them. We also need the other changes fror the buildtools change, those should go in together, I believe you already talked with Paul about that. We did manage a fairly green build on the autobuilder recently.
>

I thought I included one of the two commits in my contrib branch.

http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=akuster/dizzy_1_7_1&id=e8a6adf0612fc6d9ca703237a3a5c630177c2f34

Am I pulling over the missing commit or are you going to pull them over 
from Paul's request.

"The following changes since commit 
1cf1edcd28a002291622d04dd2d0ee2c67e329e4:

   buildtools-tarball: package all of Python (2014-12-11 16:34:01 +0000)

are available in the git repository at:

   git://git.openembedded.org/openembedded-core-contrib 
paule/dizzy-git-tools
 
http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/dizzy-git-tools

Jackie Huang (1):
   packagegroup-self-hosted: add git-perltools

Paul Eggleton (1):
   buildtools-tarball: restore missing git tools
"

> As you mentioned, we do need to sort out which changes make sense for
> linux-yocto, I'm hoping Bruce can help advise on that. We may be cutting
> things tight to have a build this weekend if we don't have those (so QA
> could look at this next week).

K.

Thanks,
Armin
>
> Cheers,
>
> Richard
>

