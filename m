Return-Path: <jc@vtkloud.com>
Received: from mail-ve0-f169.google.com (mail-ve0-f169.google.com
	[209.85.128.169])
	by mail.openembedded.org (Postfix) with ESMTP id 791C36C8EC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2013 17:45:30 +0000 (UTC)
Received: by mail-ve0-f169.google.com with SMTP id db12so4578643veb.14
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2013 10:45:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=EZg34i0tXQs05CP02BQJRup2YW1DuSIVCzkVcgRf/Jc=;
	b=IeBpY4wIr8wceryMXUSmNUG5naWtNwJ6QZUQqtpCTTcD4i/ZRo/Jy2UOYNLrT4Mgqv
	F5Cz1epr8xKH8iCaee5DhfjvE7Kx+o8E8QnTQcTLs7YrwuAkpPzi5j4PEdb3aeeECXkX
	ipyFpAPCErdiOaVMq1Vj/l9rBKkol5jxX8bg2OXKn/tMcE6Wn0g80g1xfNPGh06BQ0EL
	cnlQwilc+aVf6A/alhQ6P/X3ZoUmPARfbE/T9HNTztEWv9lV4zpuvdvVpFHymyHCAzJs
	8aCeKEkDVpLyYkx2XFXXkrvRjT0x0St4bI/2FJaG2EcqP5AVqks4hE14rfCfQAbOzgex
	dj+Q==
X-Gm-Message-State: ALoCoQnzmI71BFk7pcKHsxhCyM6ENET+oCrvMQldinFHYe5lyjInUwzthETm8RgPh8S75udtgf9d
X-Received: by 10.52.35.142 with SMTP id h14mr244232vdj.61.1379439932319;
	Tue, 17 Sep 2013 10:45:32 -0700 (PDT)
Received: from [128.31.34.121] (31-34-121.wireless.csail.mit.edu.
	[128.31.34.121])
	by mx.google.com with ESMTPSA id jw6sm25137917veb.3.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 17 Sep 2013 10:45:31 -0700 (PDT)
Message-ID: <5238953A.1010309@vtkloud.com>
Date: Tue, 17 Sep 2013 13:45:30 -0400
From: JC <jc@vtkloud.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130803 Thunderbird/17.0.8
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <1379416979-10333-1-git-send-email-jc@vtkloud.com>
	<2046387.NLfZYpzpll@helios> <52386CA6.8070206@vtkloud.com>
	<1676874.raqzZUa4qa@helios>
In-Reply-To: <1676874.raqzZUa4qa@helios>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Integration of former (deprecated?) libao recipe from https://github.com/tworaz/oe-tworaz/blob/master/meta-jlime/recipes-support/libao/libao_1.1.0.bb
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
X-List-Received-Date: Tue, 17 Sep 2013 17:45:30 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 17/09/2013 13:39, Paul Eggleton wrote:
> On Tuesday 17 September 2013 10:52:22 JC wrote:
>> On 17/09/2013 09:18, Paul Eggleton wrote:
>>> Right. A few other things:
>>>
>>> 1) Since nothing in OE-Core needs this at the moment, this should really
>>> be added to meta-multimedia (within the meta-openembedded repository) and
>>> sent to the openembedded-devel mailing list marked with [meta-multimedia]
>>> in the subject.
>>>
>>> 2) Please use ${BP} in SRC_URI rather than ${P} so that multilib builds
>>> can work
>>>
>>> 3) It would be nice to have SUMMARY and HOMEPAGE set in the recipe (and
>>> possibly also DESCRIPTION if you have a longer description).
>> I sent a new one trying to comply with your reco. But I could not work
>> on head anymore, since it's broken (at least for me). I'm afraid the
>> patch appears to belong to "dylan" but I'm not a git guru enough to
>> check how to commit it at the right place (I mean, I could simply use my
>> non working git clone of HEAD and commit it untested but I'm not sure
>> that's the way to go).
>>
>> I'm not sure how to add the [meta-multimedia] tag to the git send-mail,
>> also. Sorry for being dumb :(
> It's not being dumb, we all had to go through this at some point :)
>
> You just need to re-send your latest version using git-send-email with the
> --subject-prefix="meta-multimedia][PATCH" option to the openembedded-
> devel@lists.openembedded.org mailing list rather than this one.
>
> FWIW I did a quick build-test on top of master and it built successfully at
> least.

Thanks a lot Paul, I just did as instructed...

Jay

> Cheers,
> Paul
>


