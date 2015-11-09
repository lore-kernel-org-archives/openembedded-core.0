Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id 060D765CBF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Nov 2015 22:04:33 +0000 (UTC)
Received: by igvg19 with SMTP id g19so36626655igv.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Nov 2015 14:04:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems_com_br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-type;
	bh=PrsQ8HeEQX20tQJSIoRKopvv0oz7Gm3r0tXYZDwcKvg=;
	b=DTSPaDVP7UwIAKxqV62FyCckwH9ePOazqelZGW+UPHjWYul2CNkQpKZWe9IVzJvPS6
	sugOV7Mq/EJfW0QwMPxyq93eqgFKkQ/xfRKEXTZSvZGGh1wYvPOJXsQusY072Szh+wOl
	sDMI7/04gW2rGA2MbG4kXx1iJDVDdCV9G+Q3WVRUKfLzKYNGjrBggn43nYX/kONqoFz/
	2psPMqJUOZZMLEATcUs591119OIpYnXHmNv3wHD3oFCnIOyDVnKLbyFDI2ymGvMGnzSS
	bulpf/ehlZaBMxCREGZgMIuVW8Jfr1PQJ/IMtF02P0f7EIa0rCnxGoxLAvoFL7lWtb4G
	OGBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=PrsQ8HeEQX20tQJSIoRKopvv0oz7Gm3r0tXYZDwcKvg=;
	b=Zxhjzhmibcxxh4dk6LIuwjt3KyqSOpgwGftkSpgWZmhMh/Qgv6+Q+dvS7pTBu5Hue1
	iLaPkx76jFE4gGNvzYAa1GPB88hoOXVqwD7/bPjJUoCxFLZrflnn5B+TCd5cH6+t4t/O
	Yh+Ksmpx10lcr/BOHwuSo7wgFWwTowGLZR/11yEQyhNg1xxvvwDbPacH0uS1hGl75q8H
	HnRkhTGUfcPx2L+0h2ngx4SaWEKcc0dO2gZbU42zKppUAOA0ClRgox1UJyQKhe6IQ69f
	i0YLyvbhc4QH51u2cr1c8t1xlO1M22k0M5TaI4430YXp7HSFnfPgNsYf50wMVsHul/tc
	j77A==
X-Gm-Message-State: ALoCoQlCciDnJGiMhvrIQ/rKhy1vKiGMRLXB/8TNF1Iw8X//6cE5/5V8R1Tp3JEO4j7CIJbYLoEX
X-Received: by 10.50.131.229 with SMTP id op5mr705262igb.83.1447106673691;
	Mon, 09 Nov 2015 14:04:33 -0800 (PST)
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com.
	[209.85.223.171]) by smtp.gmail.com with ESMTPSA id
	m189sm278612ioa.22.2015.11.09.14.04.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 09 Nov 2015 14:04:32 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by ioc74 with SMTP id 74so135089935ioc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Nov 2015 14:04:31 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.107.151.131 with SMTP id z125mr695747iod.192.1447106671555; 
	Mon, 09 Nov 2015 14:04:31 -0800 (PST)
Received: by 10.36.15.197 with HTTP; Mon, 9 Nov 2015 14:04:31 -0800 (PST)
In-Reply-To: <20151109214736.GK8499@bill-the-cat>
References: <1445961940-12110-1-git-send-email-otavio@ossystems.com.br>
	<20151109202937.GH8499@bill-the-cat>
	<CAP9ODKoZR+w+CmPv0gcpJfDf=QqkFNgPOmAX22YJ5RrjAHfkAg@mail.gmail.com>
	<20151109214736.GK8499@bill-the-cat>
Date: Mon, 9 Nov 2015 20:04:31 -0200
X-Gmail-Original-Message-ID: <CAP9ODKqAmMkQ6bEhU1QTuDVNz3eiYp_YbpMD=9t+JODts-3fCw@mail.gmail.com>
Message-ID: <CAP9ODKqAmMkQ6bEhU1QTuDVNz3eiYp_YbpMD=9t+JODts-3fCw@mail.gmail.com>
To: Tom Rini <trini@konsulko.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: Update to 2015.10 release
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
X-List-Received-Date: Mon, 09 Nov 2015 22:04:34 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Nov 9, 2015 at 7:47 PM, Tom Rini <trini@konsulko.com> wrote:
> On Mon, Nov 09, 2015 at 07:11:37PM -0200, Otavio Salvador wrote:
>> On Mon, Nov 9, 2015 at 6:29 PM, Tom Rini <trini@konsulko.com> wrote:
>> > On Tue, Oct 27, 2015 at 02:05:40PM -0200, Otavio Salvador wrote:
>> >
>> >> The U-Boot 2015.10 has been released at October 20th 2015. This also
>> >> removes the GCC workaround, for the inline behavior, as this version
>> >> properlu supports the GCC 5.2 as compiler.
>> >>
>> >> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>> >
>> > Sorry for being late on this.  Please make sure to cherry-pick at least
>> > c139b5ff0999ec3d44a02ebdb623a92e5782e53e from upstream (or a number of
>> > boards won't boot Linux) and possibly even
>> > fb3db635757f68e68ab3e943396c34886529b88e /
>> > 2bb5b638791d0f4f7d2f0e5c276e70a1034805ce /
>> > 347ea94e2a954ab70f64a3f43d9b374cf4640f26 which are some important MIPS
>> > fixes.
>>
>> I queued those here for the next patch version however it seems noone
>> has yet cooked a proper fix for the ppc issue. Are you aware of anyone
>> working on it?
>
> Does https://patchwork.ozlabs.org/patch/535537/ fix the issue?

No; it is a failure at the inline handling due GCC 5.2 behaviour change.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

