Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 64E7476DE8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 17:32:59 +0000 (UTC)
Received: by wicne3 with SMTP id ne3so25185987wic.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 10:32:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=JDxszGZFd5Ir1QVhEV5uom7+3C6EpOD1du6C17xM9B0=;
	b=EA0HKx8F8uK4z34vyN8JcOQVlCxRXgx+MVlojg+QRukz3ZCrBL2lGmhb3+nNJw6P/t
	ooU92xry/TKnWdb4wT42eeFpdfnP+N9LAVDCxCgfBU6TomydxYFhxHglJ0HJbHWZhQS3
	pSwej937fUvn1JJXwGLiTP3oxfyi/mT5D9hH8WMQK2Ekerql5KMw6mkqL2meH1K0c42o
	oqUD7B+kalAEaAeoWY3peBc7801yphhLIiSifq+LF2Ww2iiUCUOLLD6vOp9W0DAZ53YI
	mA87YjtGpgrZ2ThexunqBSsnket23EGfcg09yqb+guMmGMabITu/A+o3A8on9PDagz4W
	LbQA==
X-Gm-Message-State: ALoCoQlIUhQKXEGFqlfjAl+JhcW0SJYcyeh0tocsYXA6o138A0xk8i9ohGXf/nhJliY3bgxGfH6r
X-Received: by 10.180.102.74 with SMTP id fm10mr5964883wib.25.1440783179505;
	Fri, 28 Aug 2015 10:32:59 -0700 (PDT)
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com.
	[209.85.212.180])
	by smtp.gmail.com with ESMTPSA id r19sm4739108wib.7.2015.08.28.10.32.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 28 Aug 2015 10:32:58 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by wiae7 with SMTP id e7so3387016wia.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 10:32:58 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.180.72.230 with SMTP id g6mr1551177wiv.79.1440783178286;
	Fri, 28 Aug 2015 10:32:58 -0700 (PDT)
Received: by 10.28.135.72 with HTTP; Fri, 28 Aug 2015 10:32:58 -0700 (PDT)
In-Reply-To: <4561951.P3JYBJt1QK@peggleto-mobl.ger.corp.intel.com>
References: <cover.1440678731.git.paul.eggleton@linux.intel.com>
	<3982576.S6LufBxnUW@peggleto-mobl.ger.corp.intel.com>
	<CAP9ODKogFOzQxfJkQ-vm=H9H7ozcSk5esYrozOigrhNUKb6mEQ@mail.gmail.com>
	<4561951.P3JYBJt1QK@peggleto-mobl.ger.corp.intel.com>
Date: Fri, 28 Aug 2015 14:32:58 -0300
Message-ID: <CAP9ODKo0LSYQ7B6BePUGwYm97AwUv2OTyEM8QaJQANMNc8i-5A@mail.gmail.com>
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
X-List-Received-Date: Fri, 28 Aug 2015 17:33:03 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Aug 28, 2015 at 11:19 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Friday 28 August 2015 11:09:19 Otavio Salvador wrote:
>> On Fri, Aug 28, 2015 at 11:00 AM, Paul Eggleton
>>
>> <paul.eggleton@linux.intel.com> wrote:
>> > On Friday 28 August 2015 10:55:41 Otavio Salvador wrote:
>> >> On Fri, Aug 28, 2015 at 3:07 AM, Khem Raj <raj.khem@gmail.com> wrote:
>> >> >> On Aug 27, 2015, at 5:36 AM, Paul Eggleton
>> >> >> <paul.eggleton@linux.intel.com> wrote:
>> >> >>
>> >> >> Allow restricting recipes brought from a layer to a specified list.
>> >> >> This
>> >> >> is similar in operation to blacklist.bbclass, but instead specifies a
>> >> >> per-layer whitelist of recipes (matched by PN or BPN) that are able to
>> >> >> be built from the layer - anything else is skipped. This is
>> >> >> potentially
>> >> >> useful where you want to bring in a select set of recipes from a
>> >> >> larger
>> >> >> layer e.g. meta-oe.
>> >> >
>> >> > For the record, I am not in favor of such feature in OE, Distros can
>> >> > still
>> >> > use BBMASK if they wish to
>> >>
>> >> I am also not in favor of the merge of this.
>> >
>> > Do you have a practical alternative that has less downsides?
>>
>> I do want people using full layers and offer tools to make fancy
>> combinations does not enhance our quality in long term.
>
> OK, sure - but you do appreciate that we do have an underlying problem here
> irrespective of whether this class gets taken into OE-Core or not, right?
>
> Look, if people are really opposed to this then fine, I withdraw it. I just
> hope that it's understood that this class or other equivalent methods *will*
> get used until we fix the problem properly - all it means is the class will get
> copied around instead of being in one place.

I don't think we (as OE) should help people to do bad things; people
are good in inventing ways of doing bad things and we should try to
provide them guidance to avoid those, not promote tools to help them
in doing bad development practices.

OE-Core shouldn't handle and maintain this infrastructure, in my view.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

