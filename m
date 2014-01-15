Return-Path: <paul.betafive@gmail.com>
Received: from mail-ob0-f174.google.com (mail-ob0-f174.google.com
	[209.85.214.174])
	by mail.openembedded.org (Postfix) with ESMTP id 486CE6E2E9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2014 16:13:52 +0000 (UTC)
Received: by mail-ob0-f174.google.com with SMTP id wo20so1354611obc.19
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2014 08:13:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=GDzJ2OXL1Lmvxw1aFsmFrkeJMwTL39r3ysigBijAGf8=;
	b=DpiLo0NM8zojqHiNcevplU4Mt7AQ8SmUJgIDDcV4NZxu91VL8FliR2NtVAuvlLkBRL
	t0f4aAqhODCM3Yf+eICwLTlbjuqc/0F1jCJDCjNACwrnD4cRypdNlP60G3IU2FBoM1Kt
	g1q64qxLuYH3MGkl0Xyr1KyYWE8EpMLPX+iho80RrdTwk3auUUSaTidTbGHP0SYTXrVT
	15W4AaAQyc51FtezGfXzlaaTBCNnhqN5gR0m6GYfL8/U2FhGqi/ApJAiWI8sHwT/WbG4
	BwzfxlJ97Ig7YaQrT5mh1u+TE0OsvNB/tgf/LfNgAEZMgHvM5SD9kSUr5RC5BOtJQPRt
	Y+wA==
X-Received: by 10.182.241.8 with SMTP id we8mr2153810obc.62.1389802432952;
	Wed, 15 Jan 2014 08:13:52 -0800 (PST)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.76.122.171 with HTTP; Wed, 15 Jan 2014 08:13:12 -0800 (PST)
In-Reply-To: <52D6A554.2050705@linux.intel.com>
References: <1389752246-4296-1-git-send-email-paul@paulbarker.me.uk>
	<1389752246-4296-4-git-send-email-paul@paulbarker.me.uk>
	<52D6A554.2050705@linux.intel.com>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Wed, 15 Jan 2014 16:13:12 +0000
X-Google-Sender-Auth: J1-8GWS9dSpAGI6lrFyLyTrJGyw
Message-ID: <CANyK_8cBWSps_v=eF-ktk6YbUKo76KfGTufa09m2gVsgQk7NRQ@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] opkg: No longer PROVIDES update-alternatives
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
X-List-Received-Date: Wed, 15 Jan 2014 16:13:52 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 15 January 2014 15:12, Saul Wold <sgw@linux.intel.com> wrote:
> On 01/14/2014 06:17 PM, Paul Barker wrote:
>>
>> The new provider is the opkg-utils recipe.
>>
> This seems to have triggered a failure on the AB:
>
> | Computing transaction...error: Can't install
> nativesdk-shadow-4.1.4.3-r13@i686_nativesdk: no package provides
> nativesdk-update-alternatives-opkg
>

I've not really done much with nativesdk, but my guess is I just need to change

    BBCLASSEXTEND = "native"

to

    BBCLASSEXTEND = "native nativesdk"

in the opkg-utils recipe so that nativesdk-* packages are built for
that recipe. Does that sound correct? If so, I'll re-spin the patches
with that change.

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

