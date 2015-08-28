Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 3B0D971633
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 14:09:20 +0000 (UTC)
Received: by wibgu7 with SMTP id gu7so10575983wib.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 07:09:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=9fXEEjd4Sb6XiM4DAUJhw33vfhztbnpcTbGDJmUemM0=;
	b=A69fqUzaAU0n+hRtw3FTrTjDf+FOMdzgSzjeV9k0vwyEFa7f1zQ8fBUjGieMulBoLm
	0VX1hXL1550Au3HY+YgF1So1CvJrPmLKt6pMe+xTVAj6FVXfDpZl/6SonlaEgbzy8j6P
	p+5DwIYEzlOm33rAQdffaPRIKiXLbrHZKXH9Ir4KB9W9xs+rLoMcMO4cYKUthq5CBaSh
	Dbc1rmZ5BVUUHUbdCmTEIH8r3ca9zdVY5ZrGVsfQ9EceD0hS07gn9fQ/6AWu4QQ0n7xB
	qAKGdyVcARuS0J6YWPrUkosG72W/i6XOTVhmBwHSDoSmULX8g12odOUpe5jiD2rstj0x
	m5xA==
X-Gm-Message-State: ALoCoQnho20hWDV+cfaK21vhDOYb0zr1o+DF+x8ZzLwM4qSFRTY0WMKNSWH8mZZacP/0oX5dF8IF
X-Received: by 10.194.87.102 with SMTP id w6mr11249968wjz.111.1440770960858;
	Fri, 28 Aug 2015 07:09:20 -0700 (PDT)
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com.
	[209.85.212.174]) by smtp.gmail.com with ESMTPSA id
	mc18sm3952827wic.23.2015.08.28.07.09.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 28 Aug 2015 07:09:19 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by wieo17 with SMTP id o17so17099799wie.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 07:09:19 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.180.72.230 with SMTP id g6mr581201wiv.79.1440770959751; Fri,
	28 Aug 2015 07:09:19 -0700 (PDT)
Received: by 10.28.135.72 with HTTP; Fri, 28 Aug 2015 07:09:19 -0700 (PDT)
In-Reply-To: <3982576.S6LufBxnUW@peggleto-mobl.ger.corp.intel.com>
References: <cover.1440678731.git.paul.eggleton@linux.intel.com>
	<26B844B8-BE69-427B-8DA7-B649C46A5632@gmail.com>
	<CAP9ODKr4bJH2ZWyNw6qdxaEg63ndbc+u5b8zCtBS34wn_YW5DQ@mail.gmail.com>
	<3982576.S6LufBxnUW@peggleto-mobl.ger.corp.intel.com>
Date: Fri, 28 Aug 2015 11:09:19 -0300
Message-ID: <CAP9ODKogFOzQxfJkQ-vm=H9H7ozcSk5esYrozOigrhNUKb6mEQ@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/1] classes/whitelist: add class to allow whitelisting recipes from a layer
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
X-List-Received-Date: Fri, 28 Aug 2015 14:09:24 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Aug 28, 2015 at 11:00 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Friday 28 August 2015 10:55:41 Otavio Salvador wrote:
>> On Fri, Aug 28, 2015 at 3:07 AM, Khem Raj <raj.khem@gmail.com> wrote:
>> >> On Aug 27, 2015, at 5:36 AM, Paul Eggleton
>> >> <paul.eggleton@linux.intel.com> wrote:
>> >>
>> >> Allow restricting recipes brought from a layer to a specified list. This
>> >> is similar in operation to blacklist.bbclass, but instead specifies a
>> >> per-layer whitelist of recipes (matched by PN or BPN) that are able to
>> >> be built from the layer - anything else is skipped. This is potentially
>> >> useful where you want to bring in a select set of recipes from a larger
>> >> layer e.g. meta-oe.
>> >
>> > For the record, I am not in favor of such feature in OE, Distros can still
>> > use BBMASK if they wish to
>>
>> I am also not in favor of the merge of this.
>
> Do you have a practical alternative that has less downsides?

I do want people using full layers and offer tools to make fancy
combinations does not enhance our quality in long term.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

