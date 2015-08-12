Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id 98B20766E1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Aug 2015 14:08:32 +0000 (UTC)
Received: by igfj19 with SMTP id j19so14287442igf.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Aug 2015 07:08:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=P49aBjeCqHvW/oRawsNbIlEoVacsguM9I6GnB/0pEJ4=;
	b=B640yZ/H8c6ll5BcHsoZNA+gE7sM1DiKLHNnFpa/d0AU2/rni1zNnnTxQ3sV8oFeiN
	mgXjYwCS8CeIOUvEPpEeLzkKH219tFmraOh+onEZEkJqvSxbZsv0e1rSsb4500sCkTc1
	UKKOR7rzIh+remGw2uWsq6Uwp5n3nploFjMrDABH/iNEF/Mg4sPhy54USN5x9byVsZ3S
	Z/HwvektPe4nyxChBD35QuLZMVSgVi/92hbcMNBkYGhRQapCyjqDwPGTO9dD3FIfeqds
	I3+c4+y4VtIwDTCwxtPDli8rK0SLdSky22/zUQA7LEOaqrWL7Efjv41udFg741lP9uSf
	SMmw==
X-Gm-Message-State: ALoCoQkHL1t3rwOP0lCQEnU98bGzAuX75Z5qxXaLMS/JB0m7jv+RQP+XJIYVNoy4fOJNvYeDffqI
X-Received: by 10.50.25.167 with SMTP id d7mr23515829igg.59.1439388512714;
	Wed, 12 Aug 2015 07:08:32 -0700 (PDT)
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com.
	[209.85.213.179]) by smtp.gmail.com with ESMTPSA id
	p132sm3903527ioe.41.2015.08.12.07.08.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Aug 2015 07:08:31 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by igui7 with SMTP id i7so62113043igu.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Aug 2015 07:08:31 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.50.178.133 with SMTP id cy5mr25623647igc.5.1439388511185;
	Wed, 12 Aug 2015 07:08:31 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Wed, 12 Aug 2015 07:08:31 -0700 (PDT)
In-Reply-To: <10432947.mp7xZ4UyrG@peggleto-mobl.ger.corp.intel.com>
References: <cover.1438269391.git.liezhi.yang@windriver.com>
	<55CAABC2.50008@windriver.com>
	<CAP9ODKqw2QCuWD+NG3uGQONhFQGfc0SQihC4979mCCb5esuNEg@mail.gmail.com>
	<10432947.mp7xZ4UyrG@peggleto-mobl.ger.corp.intel.com>
Date: Wed, 12 Aug 2015 11:08:31 -0300
Message-ID: <CAP9ODKqfLcvcDjOc8kmwMNaCwJ2iGs6Q81Pu4hooT3q7xqgpcQ@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] base.bbclass/blacklist.bbclass: remove doc item when d.getVarFlags()
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
X-List-Received-Date: Wed, 12 Aug 2015 14:08:35 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 12, 2015 at 11:04 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Wednesday 12 August 2015 10:45:29 Otavio Salvador wrote:
>> On Tue, Aug 11, 2015 at 11:13 PM, Robert Yang <liezhi.yang@windriver.com>
> wrote:
>> > On 08/11/2015 08:45 PM, Otavio Salvador wrote:
>> >> On Thu, Jul 30, 2015 at 12:18 PM, Robert Yang <liezhi.yang@windriver.com>
>> >>
>> >> wrote:
>> >>> The FOO[doc] is set in meta/conf/documentation.conf, we need remove it
>> >>> from d.getVarFlags()'s return dict when it causes many loops.
>> >>>
>> >>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> >>
>> >> It seems your commit log is incomplete or so as I couldn't understand
>> >> why this is need.
>> >>
>> >> Also as Andre says, we ought to not break existing layer without a
>> >> very strong reason and if needed, changing documentation.conf instead
>> >> of this seems more adequate.
>> >
>> > The code in base.bbclass is: (no remove PACKAGECONFIG[doc])
>> >
>> >     pkgconfigflags = d.getVarFlags("PACKAGECONFIG") or {}
>> >
>> >     if pkgconfigflags:
>> >        <foo>
>> >
>> > And documentation.conf:
>> > PACKAGECONFIG[doc] = "This variable provides a means of enabling or
>> > disabling features of a recipe on a per-recipe basis."
>> >
>> > This will make "if pkgconfigflags:" always be true and cause many unneeded
>> > loops since there is always PACKAGECONFIG[doc].
>> >
>> > Remove PACKAGECONFIG[doc] or comment it sounds good to me.
>>
>> So documentation.conf needs change.
>
> I'm not sure I'm particularly happy with this. Whilst its actual practical use
> is relatively recent (i.e. Toaster), documentation.conf and the doc varflag
> predate PACKAGECONFIG by quite some time. The fact that one layer has gone and
> used it is unfortunate but not unfixable.

I understand but this kind of magic keyword is misleading and
confusing for users.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

