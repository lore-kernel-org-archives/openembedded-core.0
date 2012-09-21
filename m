Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TFBN0-0004pQ-Eq
	for openembedded-core@lists.openembedded.org;
	Sat, 22 Sep 2012 00:06:46 +0200
Received: by eaad12 with SMTP id d12so1063399eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Sep 2012 14:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=MhN/XFC6NowtYFRVeitLR1OYMsVMJQa4pfJQVs3Qy9g=;
	b=aaVqq52QtEGnq8Q5mP9Q+sK9Nhgb1aWabvzOTx6jz00dF/ipGCpAU48vLo6Ahoupt+
	F5Lh52IWE2nnhBupGU4Dq8+EitqHnAWdtW09g+i7ch6sLqkJ1I1Ns5701bRXRgtgMCK4
	M0RUarolAYcOWrrNcB/hxRaGpCoPLEDMMIFQFFTENsV8a+wXwPIPLy6IIFZxIyBJapGs
	wRxHLc+dYoIZJ8thxbnKA0WxtP3ghRGymnybbPD5yhm+4bAxd+JvBGTgZzu/4YBYO+d+
	zQlXu7h0Uev+E2LkYf+RdpACc8pWWHy9EQDfcPRkMSJ9lXbv3cceJRwSqUZa7DPoxosH
	ZBrw==
Received: by 10.14.218.134 with SMTP id k6mr7902196eep.14.1348264442290; Fri,
	21 Sep 2012 14:54:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.173.69 with HTTP; Fri, 21 Sep 2012 14:53:32 -0700 (PDT)
In-Reply-To: <505CC452.9040906@windriver.com>
References: <505C6C8A.9000800@windriver.com> <1348235937.10108.78.camel@ted>
	<505CC452.9040906@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 21 Sep 2012 14:53:32 -0700
Message-ID: <CAMKF1srm1JLHray=JEJtRoBjwKvg8KFGno95fjRz+SFN+Fu-Pg@mail.gmail.com>
To: Florin Sarbu <florin.sarbu@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: binutils fails to set ld.gold as default
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
X-List-Received-Date: Fri, 21 Sep 2012 22:06:46 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Sep 21, 2012 at 12:47 PM, Florin Sarbu
<florin.sarbu@windriver.com> wrote:
> It is enabled. As I said earlier, ld.gold gets created, it's just that ld is
> not pointing to it even though the flag says --enable-gold=default. It still
> point to the regular cross ld. Another config option that creates ld.gold is
> --enable-ld=yes, so at this point default looks exactly like yes.
> Just to be extra sure, I did try to add the extra space as you suggested but
> the behaviour is the same.

post the output of
bitbake -e binutils-cross


