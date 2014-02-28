Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-lb0-f177.google.com (mail-lb0-f177.google.com
	[209.85.217.177])
	by mail.openembedded.org (Postfix) with ESMTP id 35A886E8E2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2014 11:46:16 +0000 (UTC)
Received: by mail-lb0-f177.google.com with SMTP id z11so2558761lbi.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2014 03:46:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=FUb+9MkZ+PstP7B+ZCP2Z07PDO1rrYRRVJ+gJn4mvNE=;
	b=s3YVOND/gVEv5wxap4SQ00dxa+AMwqmcWgAM8YBryKBsZBEW2ehaYVo3Y9Puxiup78
	CT2HAx05i9gxaat7cqXtIAZEq+0I9bsr7nI0dnKGNH/XseYGiZez00pryGGfbne3RduO
	kq7WPnp2QZuieIB/44aalcNFA8ohG1L9QjDO6qNzrgZFk0l0Su8Bd1CyWv6x2dGNSXLR
	dulXFfWlFQWuSOKjgxz4hZXljcx5PrcShlft9lw+MBFZ4dDO3jDwnG2C7fQo7mWM8mXR
	72k8SBOKIsiKHUlJ3cHHZh+nqG2cwRMTI1cpUbsvdfs+so83/yDiq/bPVlYrUoFac+c8
	+naw==
X-Received: by 10.152.21.4 with SMTP id r4mr1523584lae.51.1393587977193;
	Fri, 28 Feb 2014 03:46:17 -0800 (PST)
Received: from [172.16.141.133] (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPSA id o10sm13186991laj.2.2014.02.28.03.46.15
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 28 Feb 2014 03:46:16 -0800 (PST)
Message-ID: <531076FF.5080009@gmail.com>
Date: Fri, 28 Feb 2014 12:46:07 +0100
From: =?UTF-8?B?RGF2aWQgTnlzdHLDtm0=?= <david.c.nystrom@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1393587200-16322-1-git-send-email-david.nystrom@enea.com>
	<CAJTo0LbhW_UfQkXXgNzf2H+xN4=ygaNQbih4=6mjY0Mp26OK0g@mail.gmail.com>
In-Reply-To: <CAJTo0LbhW_UfQkXXgNzf2H+xN4=ygaNQbih4=6mjY0Mp26OK0g@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] e2fsprogs: Add util-linux-libuuid to DEPENDS
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
X-List-Received-Date: Fri, 28 Feb 2014 11:46:17 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On fre 28 feb 2014 12:44:36, Burton, Ross wrote:
> On 28 February 2014 11:33, David Nyström <david.c.nystrom@gmail.com> wrote:
>> -DEPENDS = "util-linux"
>> +DEPENDS = "util-linux util-linux-libuuid"
>
> That makes no sense: the value of DEPENDS is a list of recipes, and
> util-linux is the recipe.
>
> Ross

Yes, sorry about that, scrap this path.

