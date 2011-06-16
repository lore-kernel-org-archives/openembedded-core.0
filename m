Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QXLsy-0003hi-Ob
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Jun 2011 01:22:04 +0200
Received: by pzk36 with SMTP id 36so1521173pzk.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jun 2011 16:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=WDpklFn6T5JvtbFS5/SgYtc0+5jI7oZqzqI4o/lYNHw=;
	b=pMuJm4MLX5Ngo3GY/JIkukc8+dBy5/kqfsLcT8YmfrY/wr350gDNi5iBAtaYYumcTX
	PsVDwiypwCEn3PCIzduvdk+81+jW8999/1W1SNzfiYqpkDztCAUy8piCbyXk6OSUz98l
	dcWObCuc0oE9YvLi/+Hyw8unwfljRQ6GfnEg4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=YMiPjLtC0f3AJBE+L0s3LEpg7vseua99zBB7j7FjVaT09B1GJ1LBcxhCbh6gm2zkMG
	t118fXPdwwfG8l/O9KxuIgciX01OHtFXGbtj6NiugqFJkwVYEyMZdh01lVwTMOABpJvp
	HP6iAGomn+x1QJ9wpvtwQ2AlOLy0GK90tLKw4=
Received: by 10.142.154.12 with SMTP id b12mr286846wfe.156.1308266315923;
	Thu, 16 Jun 2011 16:18:35 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id c10sm1794052wff.0.2011.06.16.16.18.34
	(version=SSLv3 cipher=OTHER); Thu, 16 Jun 2011 16:18:34 -0700 (PDT)
Message-ID: <4DFA8F49.8000309@gmail.com>
Date: Thu, 16 Jun 2011 16:18:33 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110516 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1308219330.25285.4194.camel@phil-desktop>	<4DFA0824.5030809@gmail.com>
	<1308234598.25285.4740.camel@phil-desktop>
In-Reply-To: <1308234598.25285.4740.camel@phil-desktop>
Subject: Re: eglibc testing?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 16 Jun 2011 23:22:05 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/16/2011 07:29 AM, Phil Blundell wrote:
> On Thu, 2011-06-16 at 06:41 -0700, Khem Raj wrote:
>> I nfsmount eglibc builddir on target and run the testsuite. I see aroung
>> 10-15 fails. Havent run the testsuite in a while
>
> Maybe the right thing to do with eglibc would be to build a rootfs
> containing the testsuite, run it up in qemu-system-arm, and then
> engineer some IPC mechanism to get the test results back to the host.

using nfs isnt bad either since the tests excercise libraries from /lib
on target IOW installed eglibc.

> That way you would at least be testing something close to the real
> target kernel, rather than the qemu syscall emulation which I suspect is
> to blame for some of my failures.
>
> For gcc it'd probably be fine to just run the individual tests under
> qemu directly since they don't tend to have a lot of OS dependency.
>

Yes I think I should put together my mechanism somewhere and post it
and dejaGNU setup I use for cross testing

> p.
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



