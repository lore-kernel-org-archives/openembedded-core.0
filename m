Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1A59B7C130
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 02:02:29 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x4D22TtB003540
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 12 May 2019 19:02:29 -0700 (PDT)
Received: from [128.224.162.157] (128.224.162.157) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Sun, 12 May 2019 19:02:16 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: Adrian Bunk <bunk@stusta.de>
References: <cover.1557628550.git.hongxu.jia@windriver.com>
	<ac6a82d6fb67ec8369434852cdcfba495966061b.1557628550.git.hongxu.jia@windriver.com>
	<20190512192026.GA27955@localhost>
	<25af358e-1e29-178a-a7ac-2a3946e9428b@windriver.com>
Message-ID: <d9870b9a-a7f1-96ac-27c0-c165e933ea3f@windriver.com>
Date: Mon, 13 May 2019 10:02:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <25af358e-1e29-178a-a7ac-2a3946e9428b@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 08/10] groff: upgrade 1.22.3 -> 1.22.4
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
X-List-Received-Date: Mon, 13 May 2019 02:02:30 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 5/13/19 9:36 AM, Hongxu Jia wrote:
> It's a long story, the git version groff is using submodule gnulib 
> rather than itself
>
> http://git.savannah.gnu.org/cgit/groff.git/commit/?id=5fec19d453983bc3127052e4f100110efda93786 
>
>
> Your suggestion works in this situation.
>
> But we do not use git groff, we are building from the source as in 
> distributed tarball files which
>
> does not require gnulib any more, so your fix is not suitable for us
>
> SRC_URI = "${GNU_MIRROR}/groff/groff-${PV}.tar.gz \
>
But be on the safe side, I am trying to translate the gnulib fix to 
groff tarball,

it works.

Thanks your suggestion, v2 incoming.

//Hongxu


> //Hongxu



