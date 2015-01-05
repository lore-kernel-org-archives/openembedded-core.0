Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f181.google.com (mail-pd0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id 65AAE7213F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Jan 2015 20:50:32 +0000 (UTC)
Received: by mail-pd0-f181.google.com with SMTP id v10so28469611pde.26
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Jan 2015 12:50:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=F9hGgRlwZ3SEG2bG97c8JSkmA2J4rUd/14nOHXxiAR4=;
	b=XciedYSCsDK8/wvzZkonPtGlL2/Ys7dEy9vWB4CnDN1dNWnlw7ii6q5mvPrOWDr471
	EyNIKUfbRDtiffGA7IQRYy49u2ll4zl7xPRqHyDfmTyeZiEHC1DSwGwrrMP5hOZwjJZ5
	gUsc42wcCP+Vtr7yA6fKEIzHGiJoSwQJlnynCkVTMs5q2Qfx25S76cCRkWOvanytXgH1
	LKDjWlj84X4yPjsxA/k9bbeBLtvv2Yr/9w1NK+GGiWV266XDqW4FdkccDdedX7b8IUD6
	76Pa4GdQONonJAegIIpZdKMbXbIob2IoPX+F0Y8dTXcLsiKcHNG8x7XrQJq3OMBDH4UP
	yklA==
X-Received: by 10.68.65.16 with SMTP id t16mr149002123pbs.70.1420491033572;
	Mon, 05 Jan 2015 12:50:33 -0800 (PST)
Received: from ?IPv6:2601:c:a700:272f:9530:792e:11cb:1736?
	([2601:c:a700:272f:9530:792e:11cb:1736])
	by mx.google.com with ESMTPSA id
	qc1sm33807067pbb.84.2015.01.05.12.50.31
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Jan 2015 12:50:32 -0800 (PST)
Message-ID: <54AAF916.1030706@gmail.com>
Date: Mon, 05 Jan 2015 12:50:30 -0800
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>, 
	openembedded-core@lists.openembedded.org
References: <cover.1419958884.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1419958884.git.paul.eggleton@linux.intel.com>
Subject: Re: [dizzy][PATCH 0/2] Backport fixes for git-perltools split
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
X-List-Received-Date: Mon, 05 Jan 2015 20:50:36 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Paul,

I submitted this for 1.7.1 inclusion.

- armin

On 12/30/2014 09:02 AM, Paul Eggleton wrote:
> The following changes since commit 1cf1edcd28a002291622d04dd2d0ee2c67e329e4:
>
>    buildtools-tarball: package all of Python (2014-12-11 16:34:01 +0000)
>
> are available in the git repository at:
>
>    git://git.openembedded.org/openembedded-core-contrib paule/dizzy-git-tools
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/dizzy-git-tools
>
> Jackie Huang (1):
>    packagegroup-self-hosted: add git-perltools
>
> Paul Eggleton (1):
>    buildtools-tarball: restore missing git tools
>
>   meta/recipes-core/meta/buildtools-tarball.bb          |  4 ++++
>   .../meta/nativesdk-buildtools-perl-dummy.bb           | 19 +++++++++++++++++++
>   .../packagegroups/packagegroup-self-hosted.bb         |  1 +
>   3 files changed, 24 insertions(+)
>   create mode 100644 meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb
>

