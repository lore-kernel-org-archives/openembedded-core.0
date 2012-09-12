Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1TBo0i-0007CG-59
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Sep 2012 16:33:48 +0200
Received: by iaky10 with SMTP id y10so1393763iak.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2012 07:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=6HuUhFC6on1Ffyv4xlpb4AduCUR3mRjLbUagXRivXcs=;
	b=vBBNoEavZ5qYWN6pKjPKxGljqDtEdlp1XRosG4bXMJP+ENDroxZZxb6qYeMLOhZZKI
	A8oaFQ/BhwucdBo4vogau2dr/9NuDb34JakRADAgxHEtE5Avs5BJde2P9wu5Fds5vz/V
	WweTAq7AqQTEVf4/UxlLFPViipuXiclBJ/oyFnVcr15wLrMoRt/Erjs5pJk55XqA7LnR
	JnzT8u5aUhmE41RyoKFYmToCWyEqA/KpeP8OsSfT7P4+wGnMRjpkWledchYooaikB17E
	r1b2aYxxK67+qNNnY6GHEa9vSDuNEc56SeAFbTFdp5YAdxCV9rOT0FHT/FvGu1iRrPSu
	FuPQ==
MIME-Version: 1.0
Received: by 10.50.195.194 with SMTP id ig2mr20713031igc.24.1347459675211;
	Wed, 12 Sep 2012 07:21:15 -0700 (PDT)
Received: by 10.64.46.106 with HTTP; Wed, 12 Sep 2012 07:21:15 -0700 (PDT)
In-Reply-To: <CADkTA4P-THBeYwVkRvnyy3TxH6OTs9qcYUE-cBwXLWjJou7zrA@mail.gmail.com>
References: <1347455995-24565-1-git-send-email-schnitzeltony@googlemail.com>
	<1347456710.11710.11.camel@ted>
	<CADkTA4P-THBeYwVkRvnyy3TxH6OTs9qcYUE-cBwXLWjJou7zrA@mail.gmail.com>
Date: Wed, 12 Sep 2012 16:21:15 +0200
Message-ID: <CAGiJk9dn+rD5c=r958rWA8YcH_F88z_EWP5sEN+jDmknWQ-59A@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: paul.eggleton@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] cml1.bbclass: fix kernel menuconfig
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
X-List-Received-Date: Wed, 12 Sep 2012 14:33:48 -0000
Content-Type: text/plain; charset=UTF-8

2012/9/12 Bruce Ashfield <bruce.ashfield@gmail.com>:
> On Wed, Sep 12, 2012 at 9:31 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> FWIW I've been unable to reproduce this locally :(.
>
> I've also tried to reproduce this periodically and have never seen it where
> I can debug it properly.
>
> I'm also not disputing that this is an issue .. just one I can't get at yet
> either.

It seems like this issue is only triggered on Fedora machines..
(At least there were 2 reports of this issue on Fedora)

So far I've got no problems with (K)Ubuntu machines.
But I've seen this on a Fedora 17 one too.

>
> Cheers,
>
> Bruce
>

-- 
Regards
Samuel


