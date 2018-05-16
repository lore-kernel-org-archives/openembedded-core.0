Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8B43474801
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 May 2018 04:37:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w4G4bjoa008200
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 May 2018 21:37:45 -0700 (PDT)
Received: from [172.25.44.2] (172.25.44.2) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 15 May 2018 21:37:45 -0700
To: <mingli.yu@windriver.com>, <openembedded-core@lists.openembedded.org>
References: <20180511062300.98691-1-mingli.yu@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <c8207ee0-1df1-e31e-941a-f4a250e882a4@windriver.com>
Date: Wed, 16 May 2018 00:37:44 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180511062300.98691-1-mingli.yu@windriver.com>
X-Originating-IP: [172.25.44.2]
Subject: Re: [PATCH] boost: add contract lib
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
X-List-Received-Date: Wed, 16 May 2018 04:37:45 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 2018-05-11 02:23 AM, mingli.yu@windriver.com wrote:
> From: Mingli Yu <mingli.yu@windriver.com>
> 
> Add the contract lib which implements contract
> programming (a.k.a., Design by Contract or DbC) [1]
> for the C++ programming language.

Please clean up the long log.
You should write something like:

    Add the contract lib which implements contract programming
    (a.k.a., Design by Contract) for the C++ programming language.

I don't know what the [1] was about.
Ah, it's a reference from this documentation:
   https://www.boost.org/doc/libs/develop/libs/contract/doc/html/index.html

For anyone reading, but not following links:

[1] Design by Contract (DbC) is a registered trademark of the Eiffel 
Software company and it was first introduced by the Eiffel programming 
language (see [Meyer97]).


../Randy

> 
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>   meta/recipes-support/boost/boost.inc | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
> index b447897a0c..6984bee777 100644
> --- a/meta/recipes-support/boost/boost.inc
> +++ b/meta/recipes-support/boost/boost.inc
> @@ -9,6 +9,7 @@ BOOST_LIBS = "\
>   	atomic \
>   	chrono \
>   	container \
> +	contract \
>   	date_time \
>   	exception \
>   	filesystem \
> 


-- 
# Randy MacLeod
# Wind River Linux

