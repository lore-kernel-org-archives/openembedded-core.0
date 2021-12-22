Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3116C433EF
	for <webhook@archiver.kernel.org>; Wed, 22 Dec 2021 15:28:29 +0000 (UTC)
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by mx.groups.io with SMTP id smtpd.web09.20591.1640186908714001668
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Dec 2021 07:28:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=VA8jHFr7;
 spf=pass (domain: pbarker.dev, ip: 66.111.4.29, mailfrom: paul@pbarker.dev)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id DC0C65C018D;
	Wed, 22 Dec 2021 10:28:27 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Wed, 22 Dec 2021 10:28:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	message-id:date:mime-version:subject:references:to:from
	:in-reply-to:content-type:content-transfer-encoding; s=fm2; bh=8
	L6NsWrzHHVUyFwM173E5dIYM/H81f/eT+3avrTs1cA=; b=VA8jHFr7SVpgrDD25
	ekuMKEsh1J3rBIePCl1BIAYIGo1Ghuas1VaBIM2hNixFyBNiyAEBuz3+A1hfGTsU
	bLMqTAoGEVFE35xHP5ZnLEEse2tD/UuzQakja9CRwiRVJKqDRdTi9SA6puuRKYDj
	2kWcuvEJq9pyWFlNAxQ4zDa4Lipjdhqe36s0xnTEltlv+QfA/cRsU1v1LYfh/QCU
	A826RjuFUuW5/TJI4+iEdnfSimNWVBVpUdcgnt3RcNG0i0dg1tx8IFLfNdFOTYD6
	a0l/TfQrpHmGC1IzkWpGAtkbryo7qWoH9JgXbdgjJEkaUj/KWfu5YGBlZmgE10We
	XwhFg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; bh=8L6NsWrzHHVUyFwM173E5dIYM/H81f/eT+3avrTs1
	cA=; b=oF8VHbNx3RsT/cqCcHsjZ+snu7/nidKZRqI2g2z2uikbysQ+OMknCoojh
	CmWu1y7GxC4s1hovtlrfcXbAslCHq0PGeOkLVJ8QG1QHCLBZNrJJ+pmwa5drGn3a
	O9QexXPpYXH/lAoFSCCBKBUBBrzLJ/yN6WLj8xXI0inG+ZZHbLWbEqi9gioH3jWt
	X6YlvSDcAzNuXvk+Y9ZLc/AEtXLbaLQb5FZ29CQhYmTxAWOHZ7zuTEHw5CyG/KiP
	O6R1dWSrWyV/yzqjqgBsNgVXvdBg1R1ffAd+2l2XTxwcoE8GuIvGxU3W3Z/ahw0l
	VJWLaS34PfvP7PZvjugUM0ZR6lIEQ==
X-ME-Sender: <xms:G0TDYXIPLhikj_65WSBTKt0p8_3aTbmBLVvXyMi6oJhM690_EliJvg>
    <xme:G0TDYbIbiw40fPauA3kXoU33Wq4u4PbKYVLEd5WWkWXnWbusSO3AJktKYp7CGjSHV
    Z5QqKPEYP5hXxV1NYA>
X-ME-Received: 
 <xmr:G0TDYfsOlQc42IbsSXZbX6j51dz7wgIFf_0Pp4pxNs0Ep9GXnHm8zIk0CDH0gdjFNY-qGIcsJLRu0XupT460FESWk7grioRzXZNp84FdQ0b2-mFk2N8>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvuddruddtiedgieelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkfffgggfufhfvffhjggtgfesthejredttdefjeenucfhrhhomheprfgruhhl
    uceurghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdruggvvheqnecuggftrfgrthhtvg
    hrnhepieffgeeivefhfeegtdeljeekieegfeffleehvdekfeetteehgeefgffhgeeiieej
    necuffhomhgrihhnpehgihhtlhgrsgdrtghomhdpfhhoshguvghmrdhorhhgnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgruhhlsehpsggr
    rhhkvghrrdguvghv
X-ME-Proxy: <xmx:G0TDYQZPNOSBHaxFEGIh1cwQjpFilA_BDLsnv4BmKdGv--0ynAIBGg>
    <xmx:G0TDYebNEHMr8Csw4iC_6ihJKWjiDnsgr7Eq2a3bKstSaAJC4JCipA>
    <xmx:G0TDYUDrEtyhyhgip4pYKdEhrPVGQ_NvDXyq7Jco_NKUrChqoZKWaA>
    <xmx:G0TDYXDwGMZ5pJVeZlqDd9hT_jRkcwW62TQcjZl10Adq9sgmCr0crg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Dec 2021 10:28:26 -0500 (EST)
Message-ID: <4ec5d14d-577b-dc3c-54ca-b02035d72620@pbarker.dev>
Date: Wed, 22 Dec 2021 15:28:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Fwd: [FOSDEM standholders] FOSDEM 2022 stands - an update
References: <20211220155821.GD27931@alpha.arachsys.com>
To: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
 openembedded-devel@lists.openembedded.org
From: Paul Barker <paul@pbarker.dev>
In-Reply-To: <20211220155821.GD27931@alpha.arachsys.com>
X-Forwarded-Message-Id: <20211220155821.GD27931@alpha.arachsys.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Dec 2021 15:28:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159960

Hi all,

I'm unable to take the lead on organising a virtual stand for 
OpenEmbedded at FOSDEM 2022. I'm forwarding this mail to the lists to 
see if anyone else would like to take over - you'll need to review how 
the virtual stands work, update the website content as detailed below 
and be around during FOSDEM 2022 to "run" the stand.

At least one commit to the website content needs to be made before the 
end of the year to confirm that OpenEmbedded will have a stand. The 
repositories we used last year were:

   * https://gitlab.com/openembedded/community/fosdem-stand-content

   * https://gitlab.com/openembedded/community/fosdem-stand-static

I can grant permissions on those repositories to whoever needs them. I 
also recommend we email stands@fosdem.org to let them know who will be 
running the stand this year so that the standholders mailing list can be 
updated.

Thanks,
Paul


-------- Forwarded Message --------
Subject: [FOSDEM standholders] FOSDEM 2022 stands - an update
Date: Mon, 20 Dec 2021 15:58:21 +0000
From: Alasdair G Kergon <agk@fosdem.org>
To: standholders@lists.fosdem.org

We've decided to streamline the process for the 2022 event by reusing the
system and data that is already in place.

The 2021 stands website has been archived into archive.fosdem.org.

stands.fosdem.org is now available to use again in 2022 and the direct
links there from fosdem.org have been removed for now.  The front
page hasn't yet been updated.

If you had a stand at FOSDEM 2021, and wish to have one at FOSDEM 2022,
then all you need to do is to start updating your static content the
same way as you did last year.

If you don't want a stand, please send an email to stands@fosdem.org and
we will remove it.  We will also remove stands that haven't had at
least one change made by 31st December.

PLEASE MAKE AT LEAST ONE COMMIT BEFORE 31ST DECEMBER.

If you need metadata updating that you can't change yourself, either
send pull requests againt the main repository or email stands@fosdem.org.

The system for videos/events is not ready yet and this won't be set up
until the final list of stands is confirmed.

New stands will be by invitation only and limited in number because of
the amount of manual administration involved.  If you think there's a
deserving case for an invitation, contact stands@fosdem.org.

Alasdair

_______________________________________________
standholders mailing list
standholders@lists.fosdem.org
https://lists.fosdem.org/listinfo/standholders

