Return-Path: <peter@berginkonsult.se>
Received: from mailrelay2.public.one.com (mailrelay2.public.one.com
	[91.198.169.125])
	by mail.openembedded.org (Postfix) with ESMTP id 9F06A77BFD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Mar 2017 18:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=berginkonsult.se; s=20140924;
	h=from:subject:date:message-id:to:mime-version:content-type:
	content-transfer-encoding:in-reply-to:references;
	bh=L5woexBCvMpfQly7AX5Tg2EpSyUm52ev5NXFi5OlYMo=;
	b=JkeVwCr4mSJ6YMFFyfEcT/6dPBWMdwj8l6h1QaM+lPEA2b3FMGwNNRV59R2hqHfv+vwYoT3nyNurs
	bUV9sN3dYsSZV3bPcEV4BOr+RJEpnOGUW9/SlADj3OFODlrbIDMRsdxywwXi/YcchNssBwHKtYEDTa
	MeDZNfUBtK8N28Os=
X-HalOne-Cookie: 1020ecabd165a78e18ff8735f9d78dbd5db235a4
X-HalOne-ID: 167e6cd2-14ad-11e7-bc04-b82a72d03b9b
Received: from [192.168.100.217] (unknown [37.123.162.211])
	by smtpfilter2.public.one.com (Halon) with ESMTPSA
	id 167e6cd2-14ad-11e7-bc04-b82a72d03b9b;
	Wed, 29 Mar 2017 18:25:30 +0000 (UTC)
To: openembedded-core@lists.openembedded.org
References: <1490731726-14536-1-git-send-email-peter@berginkonsult.se>
	<1490742158.13980.296.camel@linuxfoundation.org>
	<2b16b764-38e0-4112-48b4-9e17cbe129c3@berginkonsult.se>
	<1490783069.13980.307.camel@linuxfoundation.org>
	<CAJ86T=VJjTvtwBPvY+jW1+P8tDMMjMJuRgsHTZXSgj=F=vjbxA@mail.gmail.com>
	<20170329172506.jgwc676imi7jk3ps@pengutronix.de>
From: Peter Bergin <peter@berginkonsult.se>
Message-ID: <ded5ae42-931f-eef0-9048-1165084a6c87@berginkonsult.se>
Date: Wed, 29 Mar 2017 20:25:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170329172506.jgwc676imi7jk3ps@pengutronix.de>
Subject: Re: [PATCH] busybox: move default config fragments to defconfig
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
X-List-Received-Date: Wed, 29 Mar 2017 18:25:33 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit

On 2017-03-29 19:25, Ulrich Ölmann wrote:
> On Wed, Mar 29, 2017 at 08:23:00AM -0700, Andre McCurdy wrote:
>> On Wed, Mar 29, 2017 at 3:24 AM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>>> Also, in case its not apparent, you can work around this today by
>>> providing empty fragment files in your own layer. These would override
>>> the default ones in the main recipe if you set it up right.
>> Or use SRC_URI_remove = "file://login-utilities.cfg" etc.
> But for both suggested approaches you need to know the existance and name of the
> config fragment file(s), don't you?
>
> Regards
> Ulrich

That is correct. With these approaches you need to specify all present 
.cfg files either in SRC_URI_remove or as empty files in your local layer.

Best regards,
/Peter



