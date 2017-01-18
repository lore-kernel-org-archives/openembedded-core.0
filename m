Return-Path: <nathan@nathanrossi.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id F032371AC2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jan 2017 12:08:23 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id a29so1299983qtb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jan 2017 04:08:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=TXugbSHxaVzl3+76z7jCtVLm2wKcyP6bO4hSaVlkn1c=;
	b=a2QLVSHjk47VIdaWMhNokYIzU3ECiYsfQs4FO2AD8CBd4EvbwGDtPCCioYeWhAcnk+
	5k92bab3t5layOuh9LANLk4WjXgETeSAQRHia8ocnUdJv9hRI5ZYm3JbX+VpPiw6KZ+2
	HtPndQ+pokZTyJ7+fEG1qbS/eWZQlIOApaKoIJ8womkIU7Znu6vQxGRjkf38N3UMZk6N
	sYLbDolVpD2cqjMP3pMcwk662laQW+Zo1MnC/RvlqifTHTOBZ1qIQF7+3+JU5oPBFJKa
	vStQ6gPlnoZRAwFNQ9tT+ONtGzJyk8Va4A4DMs3rBI5coZVP+KHk8cqYhNzxCUVkzq/U
	mqaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=TXugbSHxaVzl3+76z7jCtVLm2wKcyP6bO4hSaVlkn1c=;
	b=s0aMA4GOYRLjfc3nutih4+plOS0XKPdHiONThdAyUiMJD1yykLbmUdUND0ltgzoEFF
	IpPIdGGiU7hCcjL9ZnsdugphBtKdMz4oOENGPINpeD5wurx94oyumedSyMq8RFsHczQP
	Uxzaqhw0KOylINvqb/rI+6gUF4jDOoR5Xd47owpbGG1RDjknEC+BYhCPhxyLAmD4vAyX
	ZC+bsvaRyVhWm0wtYR+Z7E7BUHy7+SsNFpD00kUWqU3DOcQ5PcxBoMn5A34OEstjCRAu
	bYMipao6x18SNpivWbfc1gz/hURC3882eEB7YqNI3cVzs/YOfKGYoeVCjvmWFdwo6r+f
	bncg==
X-Gm-Message-State: AIkVDXLS3m5+zBHF9E7F3XTeJZjfm/hEH2r7vvLCCBeITkHjMsdrhf01icsvmV/q0JaWA19C34YMUArNzwwWjw==
X-Received: by 10.237.46.162 with SMTP id k31mr2560016qtd.133.1484741304189;
	Wed, 18 Jan 2017 04:08:24 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.137.175 with HTTP; Wed, 18 Jan 2017 04:08:23 -0800 (PST)
In-Reply-To: <05c7dfd0-38f3-b684-db94-38121b086a67@topic.nl>
References: <1479848501-5451-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
	<CAMKF1spiS9_qTRf2_01rVRTfwKLoZ+WDYm7Hy4_Dr5On7eDLXw@mail.gmail.com>
	<14EB1FFCA0C8D24A8B04EDEC1EA78C2453DBB31E@XSJ-PSEXMBX01.xlnx.xilinx.com>
	<05c7dfd0-38f3-b684-db94-38121b086a67@topic.nl>
From: Nathan Rossi <nathan@nathanrossi.com>
Date: Wed, 18 Jan 2017 22:08:23 +1000
Message-ID: <CA+aJhH03XW19tEX5nP7WgoV6au9xmms6GuASEHMmRvA-1qhh8w@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: Mike Looijmans <mike.looijmans@topic.nl>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH][Morty] binutils-2.27.inc: Fix alignment frags for aarch64
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
X-List-Received-Date: Wed, 18 Jan 2017 12:08:24 -0000
Content-Type: text/plain; charset=UTF-8

On 18 January 2017 at 19:37, Mike Looijmans <mike.looijmans@topic.nl> wrote:
> Could someone at least please say "yes" or "no"?
>
> I now have three projects waiting for this patch to be included in morty. If
> it's not going to happen, I'll have to add a bbappend to these layers to fix
> it.
>
> On 16-01-17 18:49, Manjukumar Harthikote Matha wrote:
>>
>> Ping, this has been applied to master

Armin, you mentioned on IRC ~1 week ago that you had merged it to your
staging branch? Any updates?

Also I had a look and could not find the change in
http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=akuster/morty-next?
Maybe I am looking in the wrong place though for your staging tree?

Thanks,
Nathan

