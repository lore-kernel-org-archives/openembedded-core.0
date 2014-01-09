Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id 95B236A463
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jan 2014 15:07:20 +0000 (UTC)
Received: by mail-ig0-f178.google.com with SMTP id ut6so7769165igb.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jan 2014 07:07:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=BIeNGozjG/h1Wn8gRgDjh+ZUMLyTXJpO4sd5I82yT2M=;
	b=g7IyBVaowSiLxpqqLjI03m1xYi2VF+tEKn48aDx22fcO0Ih8w1kqo40BzAOCpctEji
	UL2yvFLG/kxZcudbv7nIKPuBT4P1rcwdq85laZPRLm1GqlbmznI8zdCMcAm6wMMg5Krg
	i1NtwPi7wgLbget2U2PmQ2OsWqg1HBleouKRS1Cfkc9GMNUzCglJZ9TAZgNj6K63JGxl
	Ib7+p/1S7tz1HsKz9U/3Tyy0q6BGatpIKDFysrTbKa1LGfMmrQIFKpe9uoDNjAEdb6Uk
	laT+5W949owUQoeJ1KY3MuKGWu3O3ZDcWCQekv042WhNRisKg5SiJRmSg0lxJh6bPY0b
	7GcQ==
X-Gm-Message-State: ALoCoQlDMp2sjweKzuD3TNKVeCWfztssNbjx08BpUOfmWhfkb3DSYdfIMJ7ZhiSjl5nq2uGWN0O+
X-Received: by 10.50.12.103 with SMTP id x7mr3898560igb.11.1389280041342;
	Thu, 09 Jan 2014 07:07:21 -0800 (PST)
Received: from [192.168.141.83] (69-165-220-158.dsl.teksavvy.com.
	[69.165.220.158])
	by mx.google.com with ESMTPSA id l7sm8163183igx.2.2014.01.09.07.07.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 09 Jan 2014 07:07:20 -0800 (PST)
Message-ID: <52CEBB27.10709@linaro.org>
Date: Thu, 09 Jan 2014 10:07:19 -0500
From: Trevor Woerner <trevor.woerner@linaro.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <52CDDD3E.7040508@linaro.org>
	<52CE8075.8040700@communistcode.co.uk>
In-Reply-To: <52CE8075.8040700@communistcode.co.uk>
Subject: Re: bug scrub - RFC
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
X-List-Received-Date: Thu, 09 Jan 2014 15:07:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 01/09/14 05:56, Jack Mitchell wrote:
> On 08/01/14 23:20, Trevor Woerner wrote:
>> questions:
>> 1) Currently it has been suggested this should be a 2-day event, should
>> these two days be during the week or over a weekend? In either case,
>> which 2 days?
>>
> If it's two days long then why don't you do the best of both worlds and
> have a Friday/Saturday or Sunday/Monday combination?

I was thinking of doing it either fully during the week, or fully on a
weekend since my feeling is that most people either work with OE/Yocto
during the weekdays or on the weekend. There's nothing to say we
couldn't run this "bug scrub" during the week, then run a second "bug
scrub" 2 months from now on a weekend (or visa versa).

>> 2) Since this is an OE event, should it focus only on OE bugs[2], or
>> should it be generalized for any bug?
> I don't think we should be limiting people to what they can work on
> while "participating".

Since this is an OE TSC event I didn't want any hard feelings ;-) I also
thought that maybe it would be easier to get people interested if this
"bug scrub" was targeted at a specific project. I thought there's a
chance it might help get people interested if we said "let's have a bug
event where we target these 30 bugs" instead of saying "there are 1000's
of bugs in the bugzilla, pick one and try to do something about it".

>> 4) It would be cool to be able to provide incentives to help people get
>> interested and contributing to knocking some bugs around. So if anyone
>> (*cough* Intel) has any neat hardware (*cough* Galileo, Edison) they
>> could offer as an incentive (or, conversely, if there's a board you'd
>> like to see Yocto target) please see about making that happen.
>>
> A unified effort towards a "new trendy" board would be a fun goal, but I
> worry that hardware teething issues would then eat up run of the mill
> bug fixing time, handouts for participation however, (bug fixed/reviewed
> by/tested by) would be a great idea.
>
Sorry, yes, this is what I meant.

