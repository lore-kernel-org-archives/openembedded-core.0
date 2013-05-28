Return-Path: <marcin.juszkiewicz@linaro.org>
Received: from tygrysek.juszkiewicz.com.pl (tygrysek.juszkiewicz.com.pl
	[178.33.81.99])
	by mail.openembedded.org (Postfix) with ESMTP id 43D006A428
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 May 2013 13:56:18 +0000 (UTC)
Received: from [192.168.0.101] (87-206-152-156.dynamic.chello.pl
	[87.206.152.156])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id B67BAD22B2;
	Tue, 28 May 2013 15:55:52 +0200 (CEST)
Message-ID: <51A4B77E.7070906@linaro.org>
Date: Tue, 28 May 2013 15:56:14 +0200
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130404 Thunderbird/17.0.5
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <1369665656-20275-1-git-send-email-marcin.juszkiewicz@linaro.org>
	<CCC27A1E-27F7-4D70-B7A5-30F2118D3D0C@gmail.com>
In-Reply-To: <CCC27A1E-27F7-4D70-B7A5-30F2118D3D0C@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gcc 4.8: use /lib/ for AArch64
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
X-List-Received-Date: Tue, 28 May 2013 13:56:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

W dniu 28.05.2013 01:23, Khem Raj pisze:
> On May 27, 2013, at 7:40 AM, Marcin Juszkiewicz
> <marcin.juszkiewicz@linaro.org> wrote:

>> +++ b/meta/recipes-devtools/gcc/gcc-4.8/use-lib-for-aarch64.patch
>> @@ -0,0 +1,23 @@
>> +From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
>> +
>> +AArch64 is built with /lib/ as prefix but GCC 4.8 tries to use /lib64/
>> +path so build fails.
>> +
>> +It may affect builds when /lib64/ will be used but so far it is not
>> +default.
>> +
> 
> Marcin,
> 
> what is the multilib strategy for aarch64? i think using lib64 for
> 64bit and keep /lib for 32bit apps would be ideal so you can keep the
> existing apps running. In OE we have convoluted x86_64 where when not
> using mutlilib it uses /lib for 64bit apps and when doing multilib it
> does /lib64 for default 64bit apps and /lib for 32bit apps its quite
> confusing. For arm lets not follow those footsteps and use /lib64 for
> 64bit from the onset and then multilib can come later and will fit in
> nicely.

I will leave that decision to Riku as new meta-linaro maintainer.

My view is that so far AArch64 is still in kind of "testing phase" rather
then fully used system. Switch to /lib64/ would require far more patches
(gcc-4.7, eglibc etc) than switching to /lib/ which is used since we
started with this architecture.

