Return-Path: <paul@betafive.co.uk>
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
	[64.147.123.20])
	by mail.openembedded.org (Postfix) with ESMTP id C4B6C7FCC3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2019 14:28:17 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.west.internal (Postfix) with ESMTP id 1650D88D;
	Tue, 26 Nov 2019 09:28:17 -0500 (EST)
Received: from imap2 ([10.202.2.52])
	by compute1.internal (MEProxy); Tue, 26 Nov 2019 09:28:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=betafive.co.uk;
	h=mime-version:message-id:in-reply-to:references:date:from:to
	:subject:content-type; s=fm3; bh=Kh+Gb74FolYXfqI0g08uM94ng17d0ig
	M6cEVMjszZ60=; b=E2AKeIhlHqjctLGsjVaOuiPDKahTX9IAtfL7KF2jMgr9RvM
	pFNuNlNvkaTZ0TsxSVBEf+6OX0OPzJkeWWUhHWk1wPj6H6VZsBWsQCCQ7PPR4Jow
	tp7whQ/T88JWJ2fHCN3eLeIyjTJyMdafbs1rOKL8y/bMVZaeP2XE5ykE5iH+7MVN
	hzQSTcHBU9L95Og72AAWD/6dvpgdTyn0BsrRALLiHCFXr1cS0Z6lulsfwpgtkBO8
	EIe4AudF/CyhjjVTUmTfo3zBnHyA+O73ZtV5VGGl99Gzb/QNlLJdRlBwElumDfca
	byS54i968Rs3QJlufTgSyr/dvww5n5mr3Z2AZpw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=Kh+Gb7
	4FolYXfqI0g08uM94ng17d0igM6cEVMjszZ60=; b=qij/AqjiQJDce12bX4F43J
	KJRivprP6NLp3RHJ2KfrGbS/8p6QDh/MOSDk3hE9leacWxDbBw7G7+hzF32aJwMR
	1FenU7D2IqkcQMBvlrMU50ysEe2/VN3ZhIGY2Eg6niMTjI245i6PsC9PzkR0Rcnl
	Gh2mizrUbO1vn75D4gpj/oRgY2Kk/k4VYMYm+xy0viOsnCFy9xke6MC1GkGC49Hd
	ZHeStyAMUDfE+vA9aPAXnHGygTHiKMxrrRwXWE7UI0/R5bcpPt23Uw8DPRSCiBtQ
	OW0KGw+tUIpGZrpryUTTAWm8u0TaNmZYbgRlbThbUyzumKrDtudAjGju1CrSkDmg
	==
X-ME-Sender: <xms:gDbdXYVg4Vo9GsXaVozbBz3UCXso9Wy6qAaVKr7INtSrM7Bi038Zkw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudeifedgieeiucetufdoteggodetrfdotf
	fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
	uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
	cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdfrrghu
	lhcuuegrrhhkvghrfdcuoehprghulhessggvthgrfhhivhgvrdgtohdruhhkqeenucffoh
	hmrghinhepnhhtphdrohhrghdpnhhtphhpohholhdrohhrghdpghhoohhglhgvrdgtohhm
	necurfgrrhgrmhepmhgrihhlfhhrohhmpehprghulhessggvthgrfhhivhgvrdgtohdruh
	hknecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:gDbdXfXik6c8Q5FVMbsC62MLeuBvgZIYOYQT15A5BaSYhqSzkCYBtg>
	<xmx:gDbdXZRbGHsvzaeWamo5tJidGzoGKqSKvOHr404jfYSvLBZLH-1TNQ>
	<xmx:gDbdXe2mFA2aRrJnQNEkeieGE-I7G0iq2gh1mqsM2mVXd_JARWj9Tw>
	<xmx:gDbdXXqeelG86y4RvCBFmxO5xVykOVehsFgVn4R0dSDX6xTuqVAbMQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 286F6E00A2; Tue, 26 Nov 2019 09:28:16 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-578-g826f590-fmstable-20191119v1
Mime-Version: 1.0
Message-Id: <abf17fb0-6ee0-457d-8cb6-37bcf78f9400@www.fastmail.com>
In-Reply-To: <20191126133943.124402-1-cengiz@kernel.wtf>
References: <20191126133943.124402-1-cengiz@kernel.wtf>
Date: Tue, 26 Nov 2019 14:27:54 +0000
From: "Paul Barker" <paul@betafive.co.uk>
To: "Cengiz Can" <cengiz@kernel.wtf>,
	"OE Core" <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Tue, 26 Nov 2019 14:28:17 -0000
Content-Type: text/plain

On Tue, 26 Nov 2019, at 13:39, Cengiz Can wrote:
> Currently OE-Core's systemd-timesyncd defaults to Google's time servers.
> 
> However those servers are not always reachable.
> 
> ```
> systemd-timesyncd[242]:
>   Timed out waiting for reply from 216.239.35.12:123 (time4.google.com).
> systemd-timesyncd[242]:
>   Timed out waiting for reply from 216.239.35.0:123 (time1.google.com).
> systemd-timesyncd[242]:
>   Timed out waiting for reply from 216.239.35.4:123 (time2.google.com).
> systemd-timesyncd[242]:
>   Timed out waiting for reply from 216.239.35.8:123 (time3.google.com).
> systemd-timesyncd[242]:
>   Timed out waiting for reply from 216.239.35.12:123 (time4.google.com).
> ```
> 
> Even if they are, it is much more sensible to use pool servers from
> ntp.org.
> 
> This patch adds a default timesyncd.conf with Google's time servers
> moved to Fallback and pool.ntp.org as primary time servers.
> 
> Signed-off-by: Cengiz Can <cengiz@kernel.wtf>
> ---
>  .../systemd/systemd-conf/timesyncd.conf         | 17 +++++++++++++++++
>  meta/recipes-core/systemd/systemd-conf_243.bb   |  3 +++
>  2 files changed, 20 insertions(+)
>  create mode 100644 meta/recipes-core/systemd/systemd-conf/timesyncd.conf
> 
> diff --git a/meta/recipes-core/systemd/systemd-conf/timesyncd.conf 
> b/meta/recipes-core/systemd/systemd-conf/timesyncd.conf
> new file mode 100644
> index 0000000000..84fdc354b8
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd-conf/timesyncd.conf
> @@ -0,0 +1,17 @@
> +#  This file is part of systemd.
> +#
> +#  systemd is free software; you can redistribute it and/or modify it
> +#  under the terms of the GNU Lesser General Public License as 
> published by
> +#  the Free Software Foundation; either version 2.1 of the License, or
> +#  (at your option) any later version.
> +#
> +# Entries in this file show the compile time defaults.
> +# You can change settings by editing this file.
> +# Defaults can be restored by simply deleting this file.
> +#
> +# See timesyncd.conf(5) for details.
> +
> +[Time]
> +NTP=0.pool.ntp.org 1.pool.ntp.org 2.pool.ntp.org 3.pool.ntp.org

https://www.ntppool.org/en/vendors.html should be considered before changing the defaults to these values. We should probably get a vendor zone.

-- 
Paul Barker

