Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tasskjapp@gmail.com>) id 1SmJWY-0003TM-05
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jul 2012 08:57:18 +0200
Received: by lbol5 with SMTP id l5so9567482lbo.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Jul 2012 23:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=K+HXZEy2Ex5LzfhIrzchxYFdv/7edAsPsZ3Qvc6Gpj8=;
	b=VDvlIGNaDCxtoLDopBt06Zm/pBZI0HcQvZMnvlztWc4sY1dW+EbWH+L+ibCGLaN600
	U2+J9gfwS99SaFpTMFYO28bd79D+wbt2uW6qlrCRxGDoa6WznUdPvyyx0JfRgz+3qD99
	pdN9oLiVT78e8WpnYP4he74Aim2/x+uBwx0Yaq6+NbNtGXwGprjhz2TIW/jX/NZgJudV
	pdFkVruwG+X3I9pEM2SULCA+mAQ+skiUFqz4wOf8W8B/chybAYCoPswdwBsljqBdg197
	q6cDnNw/jcqZ9aRZVr7TEIojyV1MI6zP/6IesYpWJv2WsT1ueXfxxNIDl97qyBA5E/kG
	ZyBg==
Received: by 10.112.104.100 with SMTP id gd4mr9509272lbb.24.1341384375162;
	Tue, 03 Jul 2012 23:46:15 -0700 (PDT)
Received: from [192.168.0.121] ([84.49.231.147])
	by mx.google.com with ESMTPS id q8sm13394687lbj.2.2012.07.03.23.46.13
	(version=SSLv3 cipher=OTHER); Tue, 03 Jul 2012 23:46:14 -0700 (PDT)
Message-ID: <4FF3E606.7000001@gmail.com>
Date: Wed, 04 Jul 2012 08:43:18 +0200
From: Tasslehoff Kjappfot <tasskjapp@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <CANrdZLjpmXK5j+jr=fTD43je2Ni6exWGcrCkejKgE1ZZXe5TGQ@mail.gmail.com>
	<CAMKF1spWqFCoXRbnevoKz+ftThQf41nObpMQ6N46YQ6_fucznQ@mail.gmail.com>
	<4FE167B4.3020802@gmail.com>
In-Reply-To: <4FE167B4.3020802@gmail.com>
Subject: Re: Generating a movable SDK
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
X-List-Received-Date: Wed, 04 Jul 2012 06:57:18 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/20/2012 08:03 AM, Tasslehoff Kjappfot wrote:
> On 06/19/2012 10:33 PM, Khem Raj wrote:
>>
>>
>> On Tuesday, June 19, 2012, Steve English <steve.english@navetas.com
>> <mailto:steve.english@navetas.com>> wrote:
>>  > Hi,
>>  > I've generated a cross compiling ARM SDK
>> (angstrom-eglibc-x86_64-armv7a-v2012.05-toolchain.tar.bz2) that works
>> great if installed in /usr/local/oecore-x86_64. I would like to move
>> these binaries and run them from under my home directory (on this and
>> other host machines).
>>  >
>>  > I can tweak the PATH and use --sysroot where appropriate, but the ELF
>> binaries themselves specify a loader of
>> /usr/local/oecore-x86_64/sysroots/x86_64-angstromsdk-linux/lib/ld-linux-x86-64.so.2
>>
>> in their .interp header. Is it possible to generate an SDK that uses the
>> standard host loader, or at least uses a relative path for the built
>> loader?
>>
>>
>> Sdk is not install time relocatable yet there is a feature enhancement
>> request in yo to bugzilla for the same
>>
> That request is mine, I think. I have gotten around this by making
> /usr/local/oecore-i686 a symlink to where I want to keep the toolchain
> (in a vcs). Works like a charm.
>
> - Tasslehoff

But now I wish the sdk was relocatable again.

As I said we have the sdk in our vcs, and a symlink in /usr/local to 
make the toolchain binaries happy. We have a build server that does 
continous builds, and she has multiple trees checked out, so the 
symlink-approach is not ideal.

Any clever workaround for this (or even better, a fix to make the sdk 
relocatable)?

- Tasslehoff



