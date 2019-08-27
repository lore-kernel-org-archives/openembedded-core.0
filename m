Return-Path: <paul@betafive.co.uk>
X-Greylist: delayed 551 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 27 Aug 2019 08:27:26 UTC
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
	[66.111.4.29])
	by mail.openembedded.org (Postfix) with ESMTP id F0B327D68F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2019 08:27:26 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 56F0921CBA;
	Tue, 27 Aug 2019 04:18:15 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
	by compute1.internal (MEProxy); Tue, 27 Aug 2019 04:18:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=betafive.co.uk;
	h=mime-version:message-id:in-reply-to:references:date:from:to
	:subject:content-type; s=fm2; bh=vGHqM0gy1yZHipA2METQIqFUKzyPR1c
	KCZCKCglFd8o=; b=NxOz//lRQFVIdlJK0zQoN0njXS/mRpC4oLo/wDmXMvt9fPG
	Tyw9as0yNwl9YnyNCDFZG4pxLtiErjNF7JSDOaOFOOPEeKKe7KV0qKfY8e4LBAYk
	fjQoqArql75t4ZmzOZkTWXGYxSbI/r96JJhIvgarLu9XusECIhPkpKPxTxlZkqWh
	kng/oJW0QWD4tWw15yYPwh+SDDliqY7JZS8dR8k6zs9wfyi8+E/EXwjtPgd5Z4Wa
	Ca1anL93d82r62SnrEPLlHskyljXuTa0UxRXPt9jb73f/+KL83ht4aOh/d7EzFa7
	NGSxDnrBrPVyo7r905YUyDF7+mFelhodrRMGXiQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=vGHqM0
	gy1yZHipA2METQIqFUKzyPR1cKCZCKCglFd8o=; b=lDUqfJpml3uG4Q/hdi6HQI
	S8dDzp23Hukk1+KBNQcjkEbd8Bt4ABZUSWeAPFzWKec7hXtz3JQPNNcGG1KBp2/A
	wAKWKACT+LPvUyNENq/0m80lUfvM0B3XatyauznETNatlAKDd2YP1iIGjaSkcgOJ
	bpYl6T4vM+4TulQgF+zPv+k6ATlEgWpbHAkzUhuGrxibqyPJpCGhqdHVbrcE4Tcc
	E5ggofXFBAeYQkmbGZby+i24iEo4Oy9CYawoIu66xrRxgCgPgt2FEUKLGn5uMDf4
	nZANBnCEoYWyEFfeb2chkbkQl1JDWIfGkzTfVplC2X6AksY2TSMoMu//41Oj7kXg
	==
X-ME-Sender: <xms:RudkXdyD4ZftqDZ_Y9hdk7ZkC-qALgCGJ0_0tCr2ABVeLpkAluI6xg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudehiedgtdduucetufdoteggodetrfdotf
	fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
	uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
	cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdfrrghu
	lhcuuegrrhhkvghrfdcuoehprghulhessggvthgrfhhivhgvrdgtohdruhhkqeenucfrrg
	hrrghmpehmrghilhhfrhhomhepphgruhhlsegsvghtrghfihhvvgdrtghordhukhenucev
	lhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:RudkXRjCcT9crj1hEFbI4B2D250dyZtIjNjBnVD5PUYl9ivemdUvnQ>
	<xmx:RudkXSUhnLdPD31gRFN1k-VbSpPhpDWi4Dpl3ZCy3POHc5FQFTObkg>
	<xmx:RudkXT1kXCYrROPcg6JrpCnIlguUNcebhaPNitGv5RJOJbtfEQtiOg>
	<xmx:R-dkXS_BaDkgMUQ3GyXK0p8b7jri9wLXCQnavzwwpXj26PgTtWZuiA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id D1C60E00AE; Tue, 27 Aug 2019 04:18:14 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-139-g73fcb67-fmstable-20190826v1
Mime-Version: 1.0
Message-Id: <0dd74dca-9147-4a57-b565-6998cc62e40b@www.fastmail.com>
In-Reply-To: <a4df475b-9291-1d3d-43d5-c0c01b8b9806@cn.fujitsu.com>
References: <a4df475b-9291-1d3d-43d5-c0c01b8b9806@cn.fujitsu.com>
Date: Tue, 27 Aug 2019 09:17:54 +0100
From: "Paul Barker" <paul@betafive.co.uk>
To: zang <zangrc.fnst@cn.fujitsu.com>,
	"OE Core" <openembedded-core@lists.openembedded.org>
Subject: Re: Consultation about the issue of archiver
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
X-List-Received-Date: Tue, 27 Aug 2019 08:27:27 -0000
Content-Type: text/plain

On Tue, 27 Aug 2019, at 08:21, zang wrote:
> hello:
> 
> Recently, when I enabled the archiver.bbclass, I found that some 
> packages could not generate the srpm package. The reason is that it 
> returned in the function copyleft_should_include() in the file 
> archiver.bbclass. 
> 
>  | included, reason = copyleft_should_include(d)
>  | if not included:
>  | bb.debug(1, 'archiver: %s is excluded: %s' % (pn, reason))
>  | /*return from here*/
>  | return 
>  | else:
>  | bb.debug(1, 'archiver: %s is included: %s' % (pn, reason)) 
> Why do you want to make a license judgment on the package?
>  I hope someone can answer it, thank you very much.
>  The following is my local.conf:
> 
> | ...
> | INHERIT += "archiver"
> | ARCHIVER_MODE[srpm] = "1"
> | ARCHIVER_MODE[src] = "original"
> | ...
> e.g. When I use the following 
> command,tmp/work/core2-64-poky-linux/openssl/1.1.1c-r0/deploy-sources/ 
> is empty.
> 
> | bitbake -f -c deploy_archives openssl 

The flexibility of the archiver class is a real advantage, you just need to configure it via the variables used by the copyleft_filter class. To capture everything except 'CLOSED' and 'Proprietary' recipes I have the following set:

    COPYLEFT_LICENSE_INCLUDE = "*"

Give that a try and let me know if it works for you.

Thanks,

-- 
Paul Barker
Managing Director & Principal Engineer
Beta Five Ltd

