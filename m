Return-Path: <pascal.bach@siemens.com>
Received: from gecko.sbs.de (gecko.sbs.de [194.138.37.40])
	by mail.openembedded.org (Postfix) with ESMTP id DE6047317D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 16:23:04 +0000 (UTC)
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id u12GN2u8015260
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Feb 2016 17:23:02 +0100
Received: from [139.16.76.217] (MD1FZU9C.ww002.siemens.net [139.16.76.217])
	by mail2.sbs.de (8.15.1/8.15.1) with ESMTP id u12GN2kx004792
	for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Feb 2016 17:23:02 +0100
To: openembedded-core@lists.openembedded.org
References: <56B0AE88.3090103@siemens.com> <56B0BC99.5050405@topic.nl>
From: Pascal Bach <pascal.bach@siemens.com>
Message-ID: <56B0D7E6.9080604@siemens.com>
Date: Tue, 2 Feb 2016 17:23:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <56B0BC99.5050405@topic.nl>
Subject: Re: Default value for FULL_OPTIMIZATION
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
X-List-Received-Date: Tue, 02 Feb 2016 16:23:05 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit



Am 02.02.2016 um 15:26 schrieb Mike Looijmans:
> You'd have to check the GCC documentation to be sure, but I suspect that all of "-fexpensive-optimizations -fomit-frame-pointer -frename-registers" are already in effect at -O2 optimization level, so they're redundant.
>

- "-fexpensive-optimizations" is included in -O2
- "-fomit-frame-pointer" is included in -O but "only on machines where doing so does not interfere with debugging", whatever that means ;)
- "-frename-registers" doesn't seem to be included

Soruce: https://gcc.gnu.org/onlinedocs/gcc-5.2.0/gcc/Optimize-Options.html

