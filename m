Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A550D601D3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Nov 2015 09:17:12 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tAM9H8fw008937
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 22 Nov 2015 01:17:08 -0800 (PST)
Received: from [128.224.162.160] (128.224.162.160) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 22 Nov 2015 01:17:08 -0800
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, OE Core mailing list
	<openembedded-core@lists.openembedded.org>
References: <alpine.LFD.2.20.1511220407380.13727@localhost>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <56518812.2030705@windriver.com>
Date: Sun, 22 Nov 2015 17:17:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.20.1511220407380.13727@localhost>
Subject: Re: what is the value of 'BBPATH ?= ""' in layer.conf?
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
X-List-Received-Date: Sun, 22 Nov 2015 09:17:13 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 11/22/2015 05:10 PM, Robert P. J. Day wrote:
>
>    perusing some wind river layers, and in the layer.conf file here:
>
> https://github.com/WindRiver-OpenSourceLabs/wr-kernel/blob/LB21_7.0_RCPL0002/conf/layer.conf
>
> i see the opening snippet:
>
>    BBPATH ?= ""
>    # We have a conf and classes directory, add to BBPATH
>    BBPATH := "${LAYERDIR}:${BBPATH}"
>
> what is the purpose of that initial assignment
>
>    BBPATH ?= ""

There would be a warning when BBPATH is null, but that had been fixed,
so we don't need it nowadays.

// Robert

>
> if that variable has no value, won't it just expand to the empty
> string so that the eventual effect is the same? or is there something
> more subtle happening here?
>
> rday
>

