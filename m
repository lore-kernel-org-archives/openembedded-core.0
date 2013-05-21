Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 530F760897
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2013 12:14:43 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r4LCI59D019797; Tue, 21 May 2013 13:18:13 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Ejk_z00jez-i; Tue, 21 May 2013 13:18:12 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r4LCHvbU019766
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Tue, 21 May 2013 13:18:09 +0100
Message-ID: <1369127448.11013.16.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Gary Thomas <gary@mlbassoc.com>
In-Reply-To: <51962FFE.3040202@mlbassoc.com>
References: <51962FFE.3040202@mlbassoc.com>
Date: Tue, 21 May 2013 10:10:48 +0100
Mime-Version: 1.0
X-Mailer: Evolution 3.6.4-0ubuntu1 
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Poor first impression
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
X-List-Received-Date: Tue, 21 May 2013 12:14:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-05-17 at 07:26 -0600, Gary Thomas wrote:
> I just tried to run Poky/Yocto on a fresh Ubuntu 12.04 system.  I knew there would
> be missing bits and have seen the "sanity" messages in the past, so I thought I'd
> just carry on.  Today's experience was not pretty and would it not for my experience
> with this, I would have been very perplexed...

There are two issues there, firstly the scripts/bitbake binary is doing
a really bad job, secondly, one of the improved debugging patches I
added to bitbake, regressed things in this case.

I posted a patch to bitbake last night, I've just posted a fix for
scripts/bitbake now. These two together should improve this. I agree
that particular error would create a poor first impression, thanks for
reporting it.

Cheers,

Richard


