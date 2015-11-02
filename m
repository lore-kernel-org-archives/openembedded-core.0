Return-Path: <armccurdy@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id AE62375CC2
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Nov 2015 18:52:04 +0000 (UTC)
Received: by wicll6 with SMTP id ll6so56019450wic.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Nov 2015 10:52:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=9ZZClqBgO+96HyX6yaM5/2ZHJ11coacfY5Nay7g/i9k=;
	b=LQAO8bjTrhjwj8Oc7t6JnFiEWsUNxK9+l8kBjScNWODj1MorTmHbxDUVvD4LIp8RaZ
	ah6eWiWsxkLcQjsrrlQyvL171pdFU4uiTq8Els+EMiuF36RuOblySOspRYLh8cJA+2rT
	haiSZfNdOeJVDtis+5P2k6mnlt/mjI7i4UO+nXkXl/paXcvcdLT/7RB2xEFtmv49uudC
	MjlfbKcqPjnBH6Wkyzd4UWWH8YEzxCldY8cfw2kdiDh0Z9NsAkFzHilCRxLX7vH5rWPY
	8vEy2ESGhd3ax7vE7eANWR6TwL15D3Uipf0Hu0lzYnzkdAAyHyCttMR1sjnqYXD3kgCu
	p8Ag==
MIME-Version: 1.0
X-Received: by 10.194.175.100 with SMTP id bz4mr25156186wjc.123.1446490323985; 
	Mon, 02 Nov 2015 10:52:03 -0800 (PST)
Received: by 10.194.140.38 with HTTP; Mon, 2 Nov 2015 10:52:03 -0800 (PST)
In-Reply-To: <CAJTo0Lb3YOuRWMNMnTOq=4gUuzX4Kr4egur7mxVE7widHBty2g@mail.gmail.com>
References: <cover.1444976827.git.kai.kang@windriver.com>
	<5631E434.7010006@windriver.com>
	<CAJTo0Lb3YOuRWMNMnTOq=4gUuzX4Kr4egur7mxVE7widHBty2g@mail.gmail.com>
Date: Mon, 2 Nov 2015 10:52:03 -0800
Message-ID: <CAJ86T=V7GwD_T-O0RYnVXSzmwB=jB7wxrXCecMS9XcC7bvPtpg@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] Upgrade sqlite to 3.9.0
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
X-List-Received-Date: Mon, 02 Nov 2015 18:52:04 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Nov 2, 2015 at 4:16 AM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 29 October 2015 at 09:17, Kang Kai <Kai.Kang@windriver.com> wrote:
>>>
>>> Kai Kang (1):
>>>    sqlite: 3.8.10.2 -> 3.9.0
>>
>>
>> Ping.
>
> As Stephen's weekly status mails show, we're frozen whilst 2.0 is being
> prepared.  This patch has been merged into my staging branch (ross/mut) for
> when we thaw.

Hi Ross,

Is there a ross/mut branch of oe-core somewhere? Or only poky?

> Ross
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

