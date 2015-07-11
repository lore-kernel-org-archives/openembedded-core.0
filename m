Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f179.google.com (mail-ie0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 11B5D6017E;
	Sat, 11 Jul 2015 05:47:06 +0000 (UTC)
Received: by ietj16 with SMTP id j16so35149181iet.0;
	Fri, 10 Jul 2015 22:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=dWjaulvSBs0oX22z9HbEkBI2oi1U+5QPAOMPoDIpsQY=;
	b=TnWR3AM0ln55xE7BS/nze5bzMfqBVC/F5PWS1zWadv8KmaDXjbNWi9Swprbt5DjdMM
	/8JE+xgkota1JLDUCZ1rJRW+s8bQKmcZ5k/ew2DHQU1R07hpnwts/P70pQ0t3qZXw8lA
	mvvfzbUtwQNTpHwBPszr1JRy2hGe1Z7OW2DF+CZK10UbSFSXj5W1Zi4DVSupgWUxINz5
	q0t+CF4DpIm5wHgDUYDoVzPvZUIHvqtV+mVw3vqON+l+xqqtms8m6OTQHhVK3BQWEfyF
	ugoFXt/sBSfJfX2KZ4zl83Bbp+dtzKTZEYBWCwhnncPh3QZf3IgzcZYKl0YtQLTShZS3
	US0A==
X-Received: by 10.107.132.215 with SMTP id o84mr7031254ioi.36.1436593626515;
	Fri, 10 Jul 2015 22:47:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.20.83 with HTTP; Fri, 10 Jul 2015 22:46:37 -0700 (PDT)
In-Reply-To: <CAJTo0Lbgx2chtAA+AuHgsTBvrV50wRgdqsJCZxG7tW=6ZBMPyQ@mail.gmail.com>
References: <2219152.1ss8pFxefq@peggleto-mobl.ger.corp.intel.com>
	<559E8BC3.2060300@gmail.com>
	<CAJTo0Lbgx2chtAA+AuHgsTBvrV50wRgdqsJCZxG7tW=6ZBMPyQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 10 Jul 2015 22:46:37 -0700
Message-ID: <CAMKF1squWxP004gwX0_7K126+Pq9v7Sf03hoeAHwHXzUMd4E5g@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] RFC: libav vs. ffmpeg, redux
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
X-List-Received-Date: Sat, 11 Jul 2015 05:47:07 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jul 9, 2015 at 8:02 AM, Burton, Ross <ross.burton@intel.com> wrote:
> On 9 July 2015 at 15:57, akuster808 <akuster808@gmail.com> wrote:
>
>> That make sense to me. Also libav has LICENSE_FLAGS = "commercial" so the
>> change which will simplify things too.
>>
>
> Why isn't that the case for ffmpeg too?

it remains same, commercial is for the folks who ship the code to be
aware that there might be algorithms implemented in the code
which are governed by patents, so if you start making money on that
code then they might want a share of it. So you have to have agreement
with patent folks as ffmpeg code is not available under commercial
license.

