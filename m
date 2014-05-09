Return-Path: <walters@verbum.org>
X-Greylist: delayed 419 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 09 May 2014 19:52:35 UTC
Received: from out5-smtp.messagingengine.com (unknown [66.111.4.29])
	by mail.openembedded.org (Postfix) with ESMTP id 71B8D60167
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 May 2014 19:52:35 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.mail.srv.osa [10.202.2.44])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id E654E21D9F;
	Fri,  9 May 2014 15:45:37 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
	by compute4.internal (MEProxy); Fri, 09 May 2014 15:45:37 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=date:from:subject:to:cc:message-id
	:in-reply-to:references:mime-version:content-type; s=smtpout;
	bh=LqFjGjt06iI2/yXJDrUAxFj/L68=; b=FmyyNNZ7NC8riJc0qyIL0zeKuxEA
	mSmZ+oHPn3Qjk0gpeZN729zMjJeKhBpPgb4umq0zBk4/mQ0hoKvnzTHNv1eeT/s5
	mLsWG7fhU8k7QC85y1ibQBpjQGr/RzsoKPFt3o0+HK074A8A9VGYoFhVsxfzKrLh
	0q0PaHfxwH659kc=
X-Sasl-enc: 6JAFXbfIqJWky1877bxbwyejwYIyzgdcpwwJgNr436tF 1399664737
Received: from [192.168.1.4] (unknown [66.31.18.51])
	by mail.messagingengine.com (Postfix) with ESMTPA id 7BAC2680253;
	Fri,  9 May 2014 15:45:37 -0400 (EDT)
Date: Fri, 09 May 2014 19:41:36 +0000
From: Colin Walters <walters@verbum.org>
To: Mark Hatle <mark.hatle@windriver.com>
Message-Id: <1399664736.22845.0@mail.messagingengine.com>
In-Reply-To: <536CF0E6.9060800@windriver.com>
References: <1399591490-13000-1-git-send-email-mark.hatle@windriver.com>
	<CAJTo0LZ75OkvT+yNkbczmqVT1=xSCu1PZainWDyWXAy8Frro+Q@mail.gmail.com>
	<536CF0E6.9060800@windriver.com>
X-Mailer: geary/0.6.0
MIME-Version: 1.0
X-OriginalDate: Fri, 09 May 2014 19:41:36 -0004
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base-files: Add /run/lock as a standard	directory
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
X-List-Received-Date: Fri, 09 May 2014 19:52:37 -0000
Content-Type: text/plain; charset=utf-8; format=flowed

On Fri, May 9, 2014 at 11:14 AM, Mark Hatle <mark.hatle@windriver.com> 
wrote:
> 
> /run is not always a tmpfs...  We've got configurations where it's 
> persistent.

What?  Why?


