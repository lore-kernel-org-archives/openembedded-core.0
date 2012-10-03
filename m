Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1TJRtS-0000jD-J4
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Oct 2012 18:33:54 +0200
Received: from [192.168.1.111] (host86-143-222-9.range86-143.btcentralplus.com
	[86.143.222.9])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 2D3D5D22B7
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Oct 2012 18:20:57 +0200 (CEST)
Message-ID: <506C65E5.4070003@linaro.org>
Date: Wed, 03 Oct 2012 17:20:53 +0100
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1349280226.18301.50.camel@ted>
In-Reply-To: <1349280226.18301.50.camel@ted>
Subject: Re: Yocto Project 1.4 Planning Process
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 03 Oct 2012 16:33:54 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

W dniu 03.10.2012 17:03, Richard Purdie pisze:
> Whilst I appreciate people are concentrating on 1.3, we do also need
> to think about planning 1.4.

> Questions are more than welcome, as is feedback about this process.

Before adding it to bugzilla or wiki I would like to list few things
which would be usable during adding new architecture (maybe missed them).

1. A way to automatical upload logs after build - selection all/failed
    one would be extra.

2. A way to collect preprocessed files in case of gcc ICE.

3. Option to automatically rebuild ICEd recipe with PARALLEL_MAKE
    disabled so it is easier to notice where it ICEd.


