Return-Path: <sean@geanix.com>
Received: from first.geanix.com (first.geanix.com [116.203.34.67])
	by mail.openembedded.org (Postfix) with ESMTP id 611F19002F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Sep 2019 13:41:35 +0000 (UTC)
Received: from [192.168.100.95] (unknown [95.138.208.137])
	by first.geanix.com (Postfix) with ESMTPSA id C417968280;
	Thu, 19 Sep 2019 13:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
	t=1568900492; bh=dK6tr85hQN4KJsOCPF5DtsIw7/TzxT4HZU4fQALX+S0=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=XS8JlWW/9ngEUIg/tscaq5wv7hX+XllIlIx/aCovWgMXNiEE0XfAS5QrQPn9QP76V
	6JDBY0yXNP+9oomLd0PA//Gh5XVegUqmyCZJDkqRQsgd3zOpVCTlGdIwp9hQupOuL0
	NEkVx5aHVeKqyNGgTlDZye0KPh/dQqg8Adv2aQ/7q640b46/VL53jTCfq4AOz5Txkw
	etbMhhY0wicMvEtWttdr4aYDAulLG1sBGZc19SjByqzU9f5Mqoa3mnhhpImJB2AIdD
	F6gTtJ1PxlCG/Eg3rQbDCZ56iW3PL3/S3xqJ02Vykvls1iW5STDNzvWwwp7Zi0v08S
	vjvmIa8SeAQtQ==
To: openembedded-core@lists.openembedded.org, akuster808@gmail.com
References: <20190909182913.4070-1-sean@geanix.com>
From: Sean Nyekjaer <sean@geanix.com>
Message-ID: <92e67034-87fa-6bc8-917a-76ed954f8166@geanix.com>
Date: Thu, 19 Sep 2019 15:41:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20190909182913.4070-1-sean@geanix.com>
X-Spam-Status: No, score=-3.1 required=4.0 tests=ALL_TRUSTED,BAYES_00,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,URIBL_BLOCKED
	autolearn=disabled version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on b8b5098bc1bc
Subject: Re: [thud][PATCH v2] libgpg-error: Fix build with gawk 5.x
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
X-List-Received-Date: Thu, 19 Sep 2019 13:41:35 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US-large
Content-Transfer-Encoding: 7bit



On 09/09/2019 20.29, Sean Nyekjaer wrote:
> Based on poky master, but for version 1.32
> 
> Signed-off-by: Sean Nyekjaer <sean@geanix.com>
> ---
>   .../libgpg-error-1.32-gawk5-support.patch     | 161 ++++++++++++++++++
>   .../libgpg-error/libgpg-error_1.32.bb         |   1 +
>   2 files changed, 162 insertions(+)
>   create mode 100644 meta/recipes-support/libgpg-error/libgpg-error/libgpg-error-1.32-gawk5-support.patch
> 

Hi Armin

Could we merge this and the one for warrior?

Br
/Sean

