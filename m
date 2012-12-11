Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1TiMyS-000871-M4
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Dec 2012 11:22:05 +0100
Received: by tygrysek.juszkiewicz.com.pl (Postfix, from userid 65534)
	id D6E93D22C1; Tue, 11 Dec 2012 11:07:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	tygrysek.juszkiewicz.com.pl
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from [192.168.1.112] (87-206-60-225.dynamic.chello.pl
	[87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id B9F4FD22B5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Dec 2012 11:07:17 +0100 (CET)
Message-ID: <50C705C4.8010501@linaro.org>
Date: Tue, 11 Dec 2012 11:07:00 +0100
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1725092.zIXSmU5oUM@yiqingliang-pc>
In-Reply-To: <1725092.zIXSmU5oUM@yiqingliang-pc>
Subject: Re: how to change the resolution of qemux86 machine to 320x240?
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
X-List-Received-Date: Tue, 11 Dec 2012 10:22:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

W dniu 11.12.2012 17:54, Yi Qingliang pisze:
> Hi!
> 
> I have a s3c2442 system with 320x240 touch screen, and I want use qemux86 to 
> simulate it on pc.
> 
> I googled, got "vga=xxx" in kernel arguments, but no success.
> use "vga=ask" can select resolution, but no "320x240".
> what's the right way?

IIRC one option is to patch vgabios which qemu uses and add new VESA
mode with this resolution.

We did such thing long time ago for one customer but I do not remember
details.


