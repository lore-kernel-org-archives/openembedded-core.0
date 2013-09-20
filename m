Return-Path: <walters@verbum.org>
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
	[66.111.4.27])
	by mail.openembedded.org (Postfix) with ESMTP id AAEC46C801
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Sep 2013 16:04:44 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.mail.srv.osa [10.202.2.46])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id 9B19421801;
	Fri, 20 Sep 2013 12:04:16 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
	by compute6.internal (MEProxy); Fri, 20 Sep 2013 12:04:16 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=subject:from:to:cc:in-reply-to:references
	:content-type:date:message-id:mime-version
	:content-transfer-encoding; s=smtpout; bh=247RgznH2jXV4bmGCSjKgo
	oFgvw=; b=OABJevVLIKEswk0a/30IjLUc1HnCJtAv2ouPFBLWUb3io+L1eDQH15
	Qe67VjI+sMDtw6CY5rrN+MlzsUau5NvRBqj9RvXZKa4CgzgBHOleoy5DMYMJeqhm
	/+bwT394ZUYLzlqSf6v2CfOdA17D0P/bx/6ke/zn5Bugvv+XmoQms=
X-Sasl-enc: L6FUtON0IZiKIIoHBzgg0NNLuptW1uhMwp43bohiFW2i 1379693056
Received: from [192.168.1.2] (unknown [66.31.18.51])
	by mail.messagingengine.com (Postfix) with ESMTPA id 4E33E6804EE;
	Fri, 20 Sep 2013 12:04:16 -0400 (EDT)
From: Colin Walters <walters@verbum.org>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
In-Reply-To: <1379688225-29241-1-git-send-email-paul.eggleton@linux.intel.com>
References: <1379688225-29241-1-git-send-email-paul.eggleton@linux.intel.com>
Date: Fri, 20 Sep 2013 12:04:15 -0400
Message-ID: <1379693055.1665.9.camel@localhost>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 (2.32.3-26.el6) 
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] glib-2.0: fix broken python script header on machines using buildtools
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
X-List-Received-Date: Fri, 20 Sep 2013 16:04:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-09-20 at 15:43 +0100, Paul Eggleton wrote:
>  it also seems sensible to do
> this for native as well instead of explicitly trying to exclude that
> case.

But someone presumably introduced the explicit special case for native
for a reason, I'd expect some blame analysis to be done here to
determine whether those reasons were bogus or not.



