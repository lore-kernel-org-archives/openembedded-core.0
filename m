Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1UGF7V-0000Jv-5y
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Mar 2013 21:51:27 +0100
Received: by tygrysek.juszkiewicz.com.pl (Postfix, from userid 65534)
	id DA7CDD22E8; Thu, 14 Mar 2013 21:34:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	tygrysek.juszkiewicz.com.pl
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [192.168.1.112] (87-206-60-225.dynamic.chello.pl
	[87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 7ABABD22B2;
	Thu, 14 Mar 2013 21:34:12 +0100 (CET)
Message-ID: <5142343C.4070107@linaro.org>
Date: Thu, 14 Mar 2013 21:34:04 +0100
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130311 Thunderbird/17.0.4
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1363282893-19390-1-git-send-email-marcin.juszkiewicz@linaro.org>
	<51421128.6090201@windriver.com> <5142148A.7010009@linaro.org>
	<5D166876-A7B9-4F53-A0DC-61DA13087097@gmail.com>
In-Reply-To: <5D166876-A7B9-4F53-A0DC-61DA13087097@gmail.com>
X-Enigmail-Version: 1.4.6
Subject: Re: [PATCH] Add architecture files for AArch64 architecture.
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
X-List-Received-Date: Thu, 14 Mar 2013 20:51:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

W dniu 14.03.2013 21:24, Khem Raj pisze:
>>> No, we do not use /lib64/ for AArch64.
> 
> Thats under discussion I have seen threads and patches on gcc ml and
>  glibc ml about it.
> 
> http://gcc.gnu.org/ml/gcc-patches/2013-03/msg00288.html 
> http://sourceware.org/ml/libc-ports/2013-03/msg00125.html
> 
> I would rather like to have lib64 but I guess multi arch guys will 
> not like it

OK. With current state of binutils/eglibc/gcc-linaro as we have in OE we
use /lib/ instead of /lib64/ directory. Once it got changed upstream I
will adapt to it.


