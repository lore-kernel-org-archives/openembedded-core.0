Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web08.61054.1629321493118176295
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Aug 2021 14:18:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20201202 header.b=YYsNRAvq;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: okaya@kernel.org)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C712361051;
	Wed, 18 Aug 2021 21:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1629321492;
	bh=jhCYu7rRemelX/UuVQZFMRPa43qsIMlYoWEdK8l6qzE=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
	b=YYsNRAvqSXLrELKLeBFngs3qicv7/XB+HAjulQYn9xyVGLVVjBPjsGlIPvczWOYuW
	 2wBi2NcHDgwYpAWCDc3AWMHfyYg23N0pQeiRhpOqNhTHB/+sDltXjQ8CPCsBlY4Q0Z
	 lZw8CaegCM6258ruFqeESnXdrr6HN07c1CUtFlz16o1s9PIL06+VM9wYDpEJgwmTLR
	 P92A+RFjGZvkcIv4v9cmsxLjTaC5rxLw/x22o5Sps3NMmih3dNUke7vFzgIDo3lH5z
	 p9N62IYgAxXw5mI3WwSYuXiLIxNLZw148bp6fNlcr5RtS7pVcFDB4ENxBJWt7iu1G2
	 Eh6DVu6TUzduw==
Subject: Re: [OE-core] [RFC WIP][PATCH v2] add two zram IMAGE_FEATUREs
To: Trevor Woerner <twoerner@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20210818203605.30426-1-twoerner@gmail.com>
 <de12600b-4b7d-b6b1-83f3-88825631b73b@kernel.org>
 <20210818210427.GA7454@localhost>
From: "Sinan Kaya" <okaya@kernel.org>
Message-ID: <117d380d-d026-b9f3-1213-6fec5af83f1a@kernel.org>
Date: Thu, 19 Aug 2021 00:18:10 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210818210427.GA7454@localhost>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/19/2021 12:04 AM, Trevor Woerner wrote:
> root@rock-pi-e:~# zramctl
> 	NAME       ALGORITHM DISKSIZE  DATA COMPR TOTAL STREAMS MOUNTPOINT
> 	/dev/zram2 lz4         975.6M    4K   73B   12K       4 [SWAP]
> 	/dev/zram1 lz4            10M  400K 16.1K  240K       4 /run
> 	/dev/zram0 lz4            30M   68K  1.6K   68K       4 /var/volatile
> 
> So, in conclusion, the stuff on meta-openembmedded's zram package is:
> - old
> - has very few knobs for the user to tweak
> - doesn't handle the zram-tmpfs case
> - doesn't update your kernel config automatically

I see your point. zram package is focused on swap partitions only.
You seem to go beyond swap partitions and tap into tmpfs next.
