Return-Path: <kamensky@cisco.com>
Received: from alln-iport-1.cisco.com (alln-iport-1.cisco.com [173.37.142.88])
	by mail.openembedded.org (Postfix) with ESMTP id 92A8577EA6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Mar 2018 15:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=709; q=dns/txt; s=iport;
	t=1522251992; x=1523461592;
	h=date:from:to:cc:subject:in-reply-to:message-id:
	references:mime-version;
	bh=IV8dFCyaTqesC8c2u0cjlVYUpKMZ9tGpMm5acUNsQjk=;
	b=URr9fZpu9DS/rFV/hCEBEok2jf5DtxFO5svcj+XAo3CX+nXcwksZstnO
	gJIR8yGYcH8n4TqlL8US6TTAunyQcG1w/0BIh1GeSaTq8SigOyRv1koID
	SvaVBWBU3TOMiYeZ2R4hTrRPKejr57xYH7LuTAhtxtMTdhRO5NZSsRbtl o=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0DHAgBmuLta/4YNJK1dGQEBAQEBAQE?=
	=?us-ascii?q?BAQEBAQcBAQEBAYNBgVCMYowjgVMhgQ+OOYYLC4UEAoQNITcVAQIBAQEBAQE?=
	=?us-ascii?q?CayiFJQEBAQECATgCPwULCxguVwaFGQiuEYhFgimHWYITgTqCVopDAoxQg3K?=
	=?us-ascii?q?GcQiPV4sCK4Z5iCwCBAsCEwGBJTIigVJNIxWCfoJHjiUfjVcHgj8BAQ?=
X-IronPort-AV: E=Sophos;i="5.48,372,1517875200"; d="scan'208";a="90683289"
Received: from alln-core-12.cisco.com ([173.36.13.134])
	by alln-iport-1.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Mar 2018 15:46:31 +0000
Received: from sjc-ads-6991 (sjc-ads-6991.cisco.com [10.30.218.111])
	by alln-core-12.cisco.com (8.14.5/8.14.5) with ESMTP id w2SFkUdx001853
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 28 Mar 2018 15:46:31 GMT
Date: Wed, 28 Mar 2018 08:46:30 -0700 (PDT)
From: Victor Kamensky <kamensky@cisco.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
In-Reply-To: <1522071403.11431.62.camel@linuxfoundation.org>
Message-ID: <alpine.LRH.2.00.1803280841200.21653@sjc-ads-6991.cisco.com>
References: <1522042927-29046-1-git-send-email-kamensky@cisco.com>
	<CAJTo0LY4JsGtTM1a==RQiRaemZ3__LpbBmQkBOLBi_+gJfBmxg@mail.gmail.com>
	<1522071403.11431.62.camel@linuxfoundation.org>
User-Agent: Alpine 2.00 (LRH 1167 2008-08-23)
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qemu: fix qemuarm64 intermediate kernel hang in raid6_select_algo func
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
X-List-Received-Date: Wed, 28 Mar 2018 15:46:30 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed



On Mon, 26 Mar 2018, Richard Purdie wrote:

> On Mon, 2018-03-26 at 11:31 +0100, Burton, Ross wrote:
>> An early winner of Patch of the Day in my books.
>
> Indeed, getting this one fixed is great as it has been messing up a lot
> of builds, thanks!

Thank you guys.

FYI and it is a quite emabarissing: I forgot to do "git add" for .bb
file to update SRC_URI with the patch that I tested. So now it is
really has no effect :(. I will send catch up patch with SRC_URI
update (one that I really tested) as soon as I finish retesting it
on top of latest tree. Sorry about that. I just noticed that while I
reviewed lastest today pulled tree.

Thanks,
Victor

> Cheers,
>
> Richard
>

