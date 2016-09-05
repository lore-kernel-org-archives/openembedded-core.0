Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6193C773B3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Sep 2016 13:51:07 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id v189so3206669vkv.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Sep 2016 06:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=wJ3is3+x2W5ZoHX8VtIccow2JJihpQN4+l8fbcY8Z8M=;
	b=Ocr3Dm5I5ADAww827CUqHNTdscqVipatiRKhXevEXzvaM4uDnzj2iT0v5yGOybNsGe
	y3vIECP3+2/mx2SyfZTqeBEt7DDP3ePnX2spDqXz/oPDDU2o4WXd56wz1FHjbSmbcxim
	nhIi5qLulxrcXrQqzGPlkNHnlNRqFlLSKYhfdC3nqI3BOzLOUzIQ8E5MkTKMLkDfo2bv
	C0PfLhlDhpeQLRLxgEUC+lC81bM+GVgOpxVPufjFBAup9tNkeElKvvl06tyRxSe+6mpr
	eVI1NBKkk1CbeietN18hC8zJID15OuCn+7Tx240Tk6Cwlz5Zm2BwwWoRJCDsG5+PTU6z
	JvUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=wJ3is3+x2W5ZoHX8VtIccow2JJihpQN4+l8fbcY8Z8M=;
	b=Mu+OlF1Pqqx1A9nQ9mfnRQhLEclgeMgf5/PQwscmQ3ur7oVsDs1rtWLEF5EYdKcTam
	EqmUCVe+vS8M8n8kp/o0/bDcC/5Is9PSqTOH7nAFOg4R1mTo5np028VSbiIR7FTvSNd/
	39U2UP0ZOuaV4+5/BztZqtmZrlwYiL0b4JYapNOYUCInFWsTS+1EgyxTqiksEucJC2F/
	OGgYyndQ8VOfq4ToDRFtfqH9YHzJ1gL5KkOqoHde13c0QiaN2ESTH0TupWzABLay8h/l
	Da7QRHF143CVdiUXXhuJ5UoYvHlc1xsRfgXZnEXk14Aayk7ge7Cxa/AVFLxOiP/u2Lfv
	5pRA==
X-Gm-Message-State: AE9vXwOQ3cikH9Xf/4Qnx4d6xMbzjRBVIfO5rseeCeXhsr7QxIhADZS2UGjvjiztsh2kNA==
X-Received: by 10.31.168.81 with SMTP id r78mr21935417vke.8.1473083467960;
	Mon, 05 Sep 2016 06:51:07 -0700 (PDT)
Received: from mail-ua0-f182.google.com (mail-ua0-f182.google.com.
	[209.85.217.182])
	by smtp.gmail.com with ESMTPSA id 6sm4135436uar.8.2016.09.05.06.51.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Sep 2016 06:51:06 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ua0-f182.google.com with SMTP id 31so26186992uao.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Sep 2016 06:51:06 -0700 (PDT)
X-Received: by 10.176.82.204 with SMTP id w12mr21617749uaw.131.1473083465810; 
	Mon, 05 Sep 2016 06:51:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.154.68 with HTTP; Mon, 5 Sep 2016 06:51:05 -0700 (PDT)
In-Reply-To: <1fbc36ad-f031-9f85-7861-1ba302273ace@denx.de>
References: <20160904162130.13313-1-marex@denx.de>
	<1473024487.20226.3.camel@linuxfoundation.org>
	<9f3a5dfd-8303-b6d0-cd5e-07f2aac7c588@denx.de>
	<1473027091.20226.4.camel@linuxfoundation.org>
	<252ea4f7-871c-60a5-0a2f-f59a5d35683e@denx.de>
	<00e9ef55-2e08-5c92-0a5a-32e9ce1f61fa@denx.de>
	<1473073354.20226.9.camel@linuxfoundation.org>
	<1fbc36ad-f031-9f85-7861-1ba302273ace@denx.de>
Date: Mon, 5 Sep 2016 10:51:05 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqO1ffXbra1QU0F6CwyXWW2sU5A9UoSuXeNtyMu=DbHAg@mail.gmail.com>
Message-ID: <CAP9ODKqO1ffXbra1QU0F6CwyXWW2sU5A9UoSuXeNtyMu=DbHAg@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] u-boot: Factor out common bits
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
X-List-Received-Date: Mon, 05 Sep 2016 13:51:09 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Sep 5, 2016 at 8:04 AM, Marek Vasut <marex@denx.de> wrote:
> On 09/05/2016 01:02 PM, Richard Purdie wrote:
>> On Mon, 2016-09-05 at 00:33 +0200, Marek Vasut wrote:
>>> On 09/05/2016 12:23 AM, Marek Vasut wrote:
>>>> On 09/05/2016 12:11 AM, Richard Purdie wrote:
>>>>> On Sun, 2016-09-04 at 23:49 +0200, Marek Vasut wrote:
>>>>>> On 09/04/2016 11:28 PM, Richard Purdie wrote:
>>>>>>> On Sun, 2016-09-04 at 18:21 +0200, Marek Vasut wrote:
>>>>>> Yes, except when new version of U-Boot comes out and we want to
>>>>>> perform
>>>>>> update of the u-boot{,mkimage,fw-utils} recipes, with this
>>>>>> current
>>>>>> patch
>>>>>> as is, we'd only have to rename these recipes and change the
>>>>>> version
>>>>>> in
>>>>>> u-boot-common.inc . With your proposal, we'd have to not only
>>>>>> rename
>>>>>> the
>>>>>> recipes and tweak u-boot-common.inc, but also edit their
>>>>>> content and
>>>>>> change the "require u-boot-common_20yy.mm.inc" bit, which adds
>>>>>> some
>>>>>> toil.
>>>>> Unless its:
>>>>>
>>>>> require u-boot-common_${PV}.inc
>>>>>
>>>>> since it should be able to extract PV from the filename...
>>>> Ah right, thanks :)
>>>>
>>>> I'll rebuild/retest and send a V2 .
>>>>
>>> I was a bit hasty, the u-boot.inc includes u-boot-common.inc without
>>> having PV set. Any idea how to deal with that ?
>>
>> Just put includes in the versioned files rather than from u-boot.inc?
>
> Wouldn't that break some BSPs ? I factored out code from the u-boot.inc
> afterall.

It will but I consider this fine for master as this clean up the
recipes and ensures people goes on the review process while upgrading
it.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

