Return-Path: <cengiz@kernel.wtf>
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
	by mail.openembedded.org (Postfix) with ESMTP id 26E9E7FC81
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2019 20:02:16 +0000 (UTC)
Received: from [10.1.10.1] (unknown [176.88.139.188])
	(Authenticated sender: cengiz@kernel.wtf)
	by relay11.mail.gandi.net (Postfix) with ESMTPSA id 33891100005;
	Tue, 26 Nov 2019 20:02:16 +0000 (UTC)
From: Cengiz Can <cengiz@kernel.wtf>
To: Phil Blundell <pb@pbcl.net>
Date: Tue, 26 Nov 2019 23:02:15 +0300
Message-ID: <16ea94ea570.2bfa.85c738e3968116fc5c0dc2de74002084@kernel.wtf>
In-Reply-To: <20191126181929.sys6lo2fadf72wdn@pbcl.net>
References: <20191126133943.124402-1-cengiz@kernel.wtf>
	<20191126181929.sys6lo2fadf72wdn@pbcl.net>
User-Agent: AquaMail/1.21.0-1492 (build: 102100009)
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] systemd-conf: add timesyncd.conf
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
X-List-Received-Date: Tue, 26 Nov 2019 20:02:17 -0000
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 8bit

Hello,

I didn't know that they were using vendor naming for rate limiting.

On November 26, 2019 21:19:31 Phil Blundell <pb@pbcl.net> wrote:

> The "advice for vendors" on the ntp.org website specifically says:
>
>
>   Do not use the standard pool.ntp.org names as a default
>   configuration in your system.
>
>
> I don't think we should make this change.

I have two questions though

1) Does Google allow their time servers to be directly used?

2) Can we apply for a vendor name like "oe" so at least they can 
throttle/rate limit their inbound traffic?

Because at current state, timesyncd is unreliable and doesn't have sane 
defaults enabled. pool.ntp.org is a community effort but has thousands of 
servers that are available for service. Not just 4 Google controlled servers.






