Return-Path: <Daniel.Klauer@gin.de>
Received: from good-out-11.clustermail.de (good-out-11.clustermail.de
	[212.223.35.73])
	by mail.openembedded.org (Postfix) with ESMTP id BF4547CBE3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2019 11:43:06 +0000 (UTC)
Received: from [10.0.0.4] (helo=frontend.clustermail.de)
	by smtpout-03.clustermail.de with esmtp (Exim 4.92)
	(envelope-from <Daniel.Klauer@gin.de>)
	id 1hs43S-0001Iw-AV; Mon, 29 Jul 2019 13:43:07 +0200
Received: from [217.6.33.237] (helo=Win2012-02.gin-domain.local)
	by frontend.clustermail.de with esmtpsa
	(TLSv1.2:ECDHE-RSA-AES256-SHA:256) (Exim 4.92)
	(envelope-from <Daniel.Klauer@gin.de>)
	id 1hs43S-00024D-5v; Mon, 29 Jul 2019 13:43:02 +0200
Received: from [10.160.138.39] (10.160.138.39) by Win2012-02.gin-domain.local
	(192.168.1.12) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
	Mon, 29 Jul 2019 13:43:01 +0200
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <dad4085c-9767-f4bc-e89e-462166f09d8b@gin.de>
	<a961a7b844771bf26bb1f8fe8c97bdaafe1cde2a.camel@linuxfoundation.org>
From: Daniel Klauer <daniel.klauer@gin.de>
Message-ID: <8ab3c3cb-ffc8-ee02-38d9-7c3ff408031d@gin.de>
Date: Mon, 29 Jul 2019 13:43:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <a961a7b844771bf26bb1f8fe8c97bdaafe1cde2a.camel@linuxfoundation.org>
X-Originating-IP: [10.160.138.39]
X-ClientProxiedBy: Win2012-02.gin-domain.local (192.168.1.12) To
	Win2012-02.gin-domain.local (192.168.1.12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: package.bbclass behaviour with multiple providers of a shared library
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
X-List-Received-Date: Mon, 29 Jul 2019 11:43:07 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 25.07.19 23:57, Richard Purdie wrote:
> We definitely should sort to make things deterministic. Since I don't
> want to forget this I've added a patch into my testing queue.
OK, thanks! It would be great to have the patch backported to warrior
too, so I just re-sent your patch for [warrior] for that.

