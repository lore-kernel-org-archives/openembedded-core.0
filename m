Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f49.google.com (mail-vk0-f49.google.com
	[209.85.213.49])
	by mail.openembedded.org (Postfix) with ESMTP id 684806FFA4;
	Thu,  1 Dec 2016 19:59:27 +0000 (UTC)
Received: by mail-vk0-f49.google.com with SMTP id p9so134628996vkd.3;
	Thu, 01 Dec 2016 11:59:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=NfXwFwCxx+g9j6Uqp/wfk2zuUinjYgia+sn5ihCiWc8=;
	b=kOi4TF77NP/8PVyrv+hu/lbqtuuSM1zL/50pVUf0TsKVPvD59DgipJkabMVzPkt2Yz
	JE8zU3QnE3JFqz65YfSord2ESU0XLiIyWQaUVBZhmc+QUmKICMyxZb1lEpkm6b/ilfde
	6hORcjEW5GmLhNnH1EDxEjdTjmCVXeZGyhqXxsDf1b5+5r85m8v1+cLblzdhJO3twspy
	iO1SBshdoAqfIJG6xoBDRrLd1MSLWJwclRf+A5nEuI2j8EuNJv/edwSnno4ICZYm26ir
	WqKh/jTOzKZPb1LVEtEkkZwL2lhIJrNRffx7dgUQAL4cK1FUp2dJFpJwIZPEb0x1eZSE
	fK1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=NfXwFwCxx+g9j6Uqp/wfk2zuUinjYgia+sn5ihCiWc8=;
	b=GqeMV31hXb84ogq3/YE4KtIheDNtcy8UkKSZ5Jmw4nsHiHa1Y4K85jhCPc3Lu6ISSj
	6IsHMs0pWL5gVGNEGgAbmKo23bjQPazhL4FqVvBsTe3y8nsdRG3MaFZrnMxJ37+mCa6M
	niVqQkiVID4Anv0beTyt1CxBdXcM2+EWf5NiBj9iJZ48aq2DG8PZ4In5E7TRHY4EAUDn
	cJdB6t3O8HK+HTaSyii4hRlzhhAHcfnQGhDZbakt7hmrCfKWDU+bFsmGjZuWzV9iJCUL
	t9BeDF4cXJm36VXQoXLUYbPG/uhGP11Pu43rtJe31W3O40k7fLlOwpVWyScoRiz14Oli
	aKiA==
X-Gm-Message-State: AKaTC03nRelIBVFXa/pZvnKs/ayV/JuCR6X9jpely+ZDyIDtXVRnqxLFHuRU9md9SOTlshowbxalj04We5/mJA==
X-Received: by 10.31.234.199 with SMTP id i190mr14774433vkh.31.1480622368309; 
	Thu, 01 Dec 2016 11:59:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.87 with HTTP; Thu, 1 Dec 2016 11:58:57 -0800 (PST)
In-Reply-To: <CAJTo0LYTYa4A42+FA9Ou=bVA6ddH8gzVBpJZJvNfa9Jyb9QQfA@mail.gmail.com>
References: <20161128225759.9756-1-raj.khem@gmail.com>
	<CAJTo0LZ+2+MhZ4TepH1dDzC3LyG7gz70TNEzoDjXgaBTjvHOsg@mail.gmail.com>
	<o1jct4$pvp$1@blaine.gmane.org>
	<CAJTo0LYLgFFR+6d3SDkso6X28N00tVAnUGuJg4sPG-msMKWU6A@mail.gmail.com>
	<8632C69E-1C6B-482D-AF15-965F55F0AF88@gmail.com>
	<CAJTo0LYTYa4A42+FA9Ou=bVA6ddH8gzVBpJZJvNfa9Jyb9QQfA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 1 Dec 2016 11:58:57 -0800
Message-ID: <CAMKF1spw8bvo8guTWkhYeQcn+Vs0kU-2X5D-03etwOj3dGroaw@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][PATCH] libva: Import from meta-intel and update to 1.7.3
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
X-List-Received-Date: Thu, 01 Dec 2016 19:59:27 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Dec 1, 2016 at 9:19 AM, Burton, Ross <ross.burton@intel.com> wrote:
> On 1 December 2016 at 03:42, Khem Raj <raj.khem@gmail.com> wrote:
>
>> >> If libva goes in, can we get libva-intel-driver in as well? Those go
>> >> hand-in-glove currently.
>> >>
>> >
>> > Khem, does the AMD BSP use that?  I'd have thought that bit was actually
>> > meta-intel specific.
>>
>> its intel BSPs specific
>
>
> So I'd endorse libva for oe-core, and the intel-driver remains in
> meta-intel.

I am fine with proposal. This is time for someone to raise objections.

>
> Ross
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

