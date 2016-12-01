Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 4F8CF62136
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Dec 2016 12:33:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 2E6E831C1B71;
	Thu,  1 Dec 2016 13:33:48 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id YeX8-8mbnLCa; Thu,  1 Dec 2016 13:33:46 +0100 (CET)
Received: from [172.22.22.61] (55d44d49.access.ecotel.net [85.212.77.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id E480431C1B77;
	Thu,  1 Dec 2016 13:33:45 +0100 (CET)
To: Khem Raj <raj.khem@gmail.com>
References: <1480549817-16636-1-git-send-email-obi@opendreambox.org>
	<15B74A76-F494-49BC-9BB6-6D0479495860@gmail.com>
From: Andreas Oberritter <obi@opendreambox.org>
Message-ID: <2b3dfd87-29e5-f50a-a0a1-bedd604b2bd3@opendreambox.org>
Date: Thu, 1 Dec 2016 13:33:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <15B74A76-F494-49BC-9BB6-6D0479495860@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libc-package.bbclass: split binary localedata even more if asked to
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
X-List-Received-Date: Thu, 01 Dec 2016 12:33:47 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 01.12.2016 05:02, Khem Raj wrote:
> 
>> On Nov 30, 2016, at 3:50 PM, Andreas Oberritter <obi@opendreambox.org> wrote:
>>
>> If GLIBC_SPLIT_LC_PACKAGES is set to a non-zero value, convert
>> glibc-binary-localedata-XX-YY to be a meta package depending on
>> glibc-binary-localedata-XX-YY-lc-address and so on. This enables
>> saving quite some space if someone doesn't need LC_COLLATE for
>> example.
>>
>> Some regex code was removed from output_locale_binary_rdepends,
>> because legitimize_package_name already converts to lowercase.
>>
> 
> This looks ok. May be add some documentation around 
> GLIBC_SPLIT_LC_PACKAGES in extended local.conf sample.

OK, will send a v2.

> I am worried about dependency changes, may be comparing old and new
> would help.

The generated meta packages make sure that dependencies stay intact. I
didn't observe any deviation in my test builds, with or without setting
GLIBC_SPLIT_LC_PACKAGES to 1.

Regards,
Andreas


