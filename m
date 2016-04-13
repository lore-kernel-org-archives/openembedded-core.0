Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pf0-f169.google.com (mail-pf0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id 82E9D73174
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Apr 2016 13:47:15 +0000 (UTC)
Received: by mail-pf0-f169.google.com with SMTP id n1so34498990pfn.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Apr 2016 06:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=VlwRzGi+VQlF8G+rbcXSAVImkcYjLN5kxfycWbOJg/o=;
	b=USBJbWLWUkFmCckZBqGfy7gw/BqmOHxqDo/fCYJBorIIutsxFI0/x1nT/dBp2rbmwB
	qQntaJXM0ZUn8RN7gZc+fwTyIWd//rajG64rdC8IX4Njm9ihLYRPv5S6GuDOcI248aPi
	ugc/gcBZIVWq6mORvXY5sYOJ9hSTd9BYrx7cOFd6NnCTFhJ+Nd7VyvvendwCTZEcCSGx
	C3jDMkjQzURq8WgoQoXx8bG65S9Xim4cqjXpqMDK12RnzYNsibuw22uKlqV7acKj2lEu
	58JuipwRZ5rOhxLLhvne2OkcuScIS2lF874I9rEE3y8Vr2EB9qcwU+U0QiRl6NEeFWx2
	9J9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=VlwRzGi+VQlF8G+rbcXSAVImkcYjLN5kxfycWbOJg/o=;
	b=nJ5uIBduv3vCzGk9o03btWgBMH1D4Rg3RDqtpZ11GLoagb+a2DvnLpKqA/NdHCHliX
	y12w2GM63KHio5K+Vsfx7WynWL8dSuJlRAkRkF0qhGD0C8//dRNSekwrS7JM+bC3V2c1
	SPeBzwLLAF8htASZTttHUDefrmD0oLHkzlMMqK6DeNUJYPk48E1QHmJqKJ83dZ4YMPE6
	zSeaN1QKZtA0/U6SOp13+5I1VqOdvG5tQbosP/KPezXZ6DW2fIWFc017vQIX8Sf1K67K
	u3Vdg2felU2VeTPewUYGeF31BqVkpDwCeLxgULmZVBCauKfaqtBynzCt86IFTzG+jsfJ
	qTmw==
X-Gm-Message-State: AOPr4FVZCyi0QNz9kraYxZl2SVqSMgE3VU76EKGoFn4xYnQ2emRfEcLEojYzH/OmbsFFPA==
X-Received: by 10.98.79.7 with SMTP id d7mr12841912pfb.77.1460555235795;
	Wed, 13 Apr 2016 06:47:15 -0700 (PDT)
Received: from mail-pf0-f170.google.com (mail-pf0-f170.google.com.
	[209.85.192.170]) by smtp.gmail.com with ESMTPSA id
	88sm51389607pfj.20.2016.04.13.06.47.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Apr 2016 06:47:14 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pf0-f170.google.com with SMTP id c20so34517536pfc.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Apr 2016 06:47:14 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.98.31.218 with SMTP id l87mr13064335pfj.101.1460555233899;
	Wed, 13 Apr 2016 06:47:13 -0700 (PDT)
Received: by 10.67.3.163 with HTTP; Wed, 13 Apr 2016 06:47:13 -0700 (PDT)
In-Reply-To: <1460494253.9308.70.camel@linuxfoundation.org>
References: <20160329125626.GA11712@mcrowe.com>
	<1459260670.21672.25.camel@linuxfoundation.org>
	<20160412185126.GA14627@mcrowe.com>
	<1460494253.9308.70.camel@linuxfoundation.org>
Date: Wed, 13 Apr 2016 10:47:13 -0300
X-Gmail-Original-Message-ID: <CAP9ODKrgznCG2ezJLxF7fRsa13-ffD+3tLSttEegp832OoDFog@mail.gmail.com>
Message-ID: <CAP9ODKrgznCG2ezJLxF7fRsa13-ffD+3tLSttEegp832OoDFog@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Mike Crowe <mac@mcrowe.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Over-pruning the sstate cache
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
X-List-Received-Date: Wed, 13 Apr 2016 13:47:16 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Apr 12, 2016 at 5:50 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2016-04-12 at 19:51 +0100, Mike Crowe wrote:
>> On Tuesday 29 March 2016 at 15:11:10 +0100, Richard Purdie wrote:
>> > On Tue, 2016-03-29 at 13:56 +0100, Mike Crowe wrote:
>> > > 80b3974081c4a8c604e23982a6db8fb32c616058 implies that at least
>> > > some
>> > > people
>> > > are pruning the sstate cache based on file access time.
>> > >
>> > > Is there a recommended way to ensure that all the sstate cache
>> > > files
>> > > are
>> > > touched, even those that are not actually required to build the
>> > > image
>> > > currently due to task optimisation?
>> > >
>> > > Does anyone have any better ideas?
>> >
>> > generate the "locked-sigs" inc file (bitbake XXX -S none) and then
>> > with
>> > a script touch all the objects listed in that file?
>>
>> I'm most of the way through writing a script to do this. I've
>> discovered
>> that the sstate filenames contain bits that aren't in the locked-sigs
>> file
>> such as ${PV}, ${PR}, ${TARGET_VENDOR}, ${TARGET_OS},
>> ${SSTATE_VERSION}.
>> The hash is the important bit for identifying the file uniquely so
>> these
>> bits can either be hard coded or wildcarded as appropriate.
>>
>> There's also the need to apply native OS name prefix for native
>> packages.
>>
>> Is there a a way of getting hold of those bits so I can avoid the
>> wildcards?
>
> In theory the key part is the hash, all the other pieces are there just
> to make human understandable filenames/layout (and would be encoded
> into the hash in most cases). Whilst we could generate that info, I'm
> not sure it would help much since the hashes should uniquely identify
> the files?

Couldn't this to be done, similar to the fetchall task?


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

