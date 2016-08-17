Return-Path: <iwamatsu@nigauri.org>
Received: from mail-it0-f68.google.com (mail-it0-f68.google.com
	[209.85.214.68])
	by mail.openembedded.org (Postfix) with ESMTP id 5DD50731FA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Aug 2016 21:57:41 +0000 (UTC)
Received: by mail-it0-f68.google.com with SMTP id j124so671316ith.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Aug 2016 14:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nigauri-org.20150623.gappssmtp.com; s=20150623;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=sqtd9TKI6RlX0h9DCopu8plavFKs0P5qPZcqI9dIAnc=;
	b=lGNhlPs/zXNfpVbL9VG/9kMMXSQVo5HRygsHt6idsc/HNbfi8/8Rf7DT7U5LSBsgUR
	rCYLRZkPLhbxMfprUy/HYbpOL39eOLKpU0cwwXAJ0A7SEVdgJC/6BUzTxDJBSbufIUbt
	1RwfkNVC2NyAFIPWGG9ssAaxARjwvNuEka3qOHkZvk7dzdtDpF1e6Drrze4MJ49tXvr/
	DXnS6p985HT0uFZRCAUojVo96KqDARcc4rM2FwIqVLvlsmBj5klWu6OT3pYR7f6ki1HU
	nI6vPJoqFP1oBY3rxdnyNF2fCvjBx8z5TrW3zizX9PpFh6KQ7xd7wHXFyCdlB049cc8t
	8x7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=sqtd9TKI6RlX0h9DCopu8plavFKs0P5qPZcqI9dIAnc=;
	b=irGXe43x41LG/uy+Djb4lQpzmXQAevPfuS2WFZajzyqMvAhrRQf0SJuDduLYdJDOt3
	KgUfOqlQJHzXES3+hLJiq6D02zPhTV2JzBVqwuQGqOtdKExZH+ml9dKTxedEgx3WEUDy
	bednY3+JelK4TIgO2UZyd61m7rw/I5N88PBnrSKCapuwWJCCS06F7R/ZBZoD5pUsiYjm
	vWlwQ1FA+ORkHSYQ+gZc6Osbsy+MOCdXRXax5z56PeaTbjF7h6pT1lau73AI7Mb8Tz3A
	GM5k3bRWLk6d3yTrVWor29sTVuZ0SN3i13tQ9CisjHMPGnSOT1+vl9KGknz8kajv1m9Q
	rHgA==
X-Gm-Message-State: AEkoouuCxI2NZ0fK/WllDKr9qQRuFDMpTbPEDwJF9zwuFf79YcQ3C76nL45gt7xK7N36OGeseVgRRlYLOjcqBw==
X-Received: by 10.36.0.4 with SMTP id 4mr7160542ita.34.1471471061997; Wed, 17
	Aug 2016 14:57:41 -0700 (PDT)
MIME-Version: 1.0
Sender: iwamatsu@nigauri.org
Received: by 10.107.138.86 with HTTP; Wed, 17 Aug 2016 14:57:11 -0700 (PDT)
In-Reply-To: <CAJTo0LbugaY9L8YZ8ZOooZMYiPy_51fxAe7DTc6j+=1YVtEKjQ@mail.gmail.com>
References: <1470581318-33390-1-git-send-email-iwamatsu@debian.org>
	<1470604793.8166.21.camel@linuxfoundation.org>
	<CABMQnVLd=-S__w==bheAeTwg_hkdy47F8=b+w0h0ZB7L65qNZw@mail.gmail.com>
	<CAJTo0LbugaY9L8YZ8ZOooZMYiPy_51fxAe7DTc6j+=1YVtEKjQ@mail.gmail.com>
From: Nobuhiro Iwamatsu <iwamatsu@debian.org>
Date: Thu, 18 Aug 2016 06:57:11 +0900
X-Google-Sender-Auth: k7VlNPx0bGBTBANW2xWrE442Kog
Message-ID: <CABMQnVJjdbpPammLQfFhq3nR6nBHt+=75vED9sVdZwsYnzunaQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mmc-utils: update to latest git revision
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
X-List-Received-Date: Wed, 17 Aug 2016 21:57:44 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

2016-08-08 19:25 GMT+09:00 Burton, Ross <ross.burton@intel.com>:
>
> On 8 August 2016 at 11:09, Nobuhiro Iwamatsu <iwamatsu@debian.org> wrote:
>>
>> mmc-utils will change the revision of Git in version 0.1. We are using
>> the now of any revision in PV,
>> we do not know from version of package.
>> Because I want to be seen that this revision from the package, I has
>> been added SRCPV to PV.
>
>
> The question was why should we build an arbitrary git snapshot instead of a
> tested release?
>
> Ross

Thank you for your point.
I did not know about the update of git snapshot.
Please let question. If the software is not been released by the version ,
whether we are the right to manage how a recipe?

Best regards,
  Nobuhiro

-- 
Nobuhiro Iwamatsu
   iwamatsu at {nigauri.org / debian.org}
   GPG ID: 40AD1FA6

