Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 02E0271633
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 13:55:43 +0000 (UTC)
Received: by wicfv10 with SMTP id fv10so12828576wic.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 06:55:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=B1fxth5eEkWA2exDYo3hrlHyYjqKvqueyDEu5Z4jjNU=;
	b=fwGWHxA8bT78FnyBVcUKpk6ttMeQjAZRpy61UUvk8PDnbrJ99HS3MzWLLrUXdxgiWd
	vXnx5olz+Zh68XFPGrrT9QQocew3CULKrnSeEG1foI6la7SAGzP/Y/COej/8t+xzO8cw
	r/Rb0q9bIqIHwR02BIo+nVO2P0DJLpyXRrNexKt5ZcOJ6C6HY+xifVHgyw4vkewa5/nf
	byYt1e0I/jxbvfEhRiaR2Jp7I4/CeJqii3k9u0XRFw4wFtkQ1usk+GCdgNgWS9XVUgb6
	hB2Jt9eaXsdQFexh4SZ7IpCsTRE+luD/A4cpv94h2ON1Sbv/anTguzhPpVVTh4LDcR1t
	5HVw==
X-Gm-Message-State: ALoCoQk/tBk7Q7fuOp4RyOjSnJ+ZQD4gB57WV7+II2+IdtegcOcsWjmh8LribraLfyPuSUNFj0/d
X-Received: by 10.180.208.81 with SMTP id mc17mr4565258wic.93.1440770143161;
	Fri, 28 Aug 2015 06:55:43 -0700 (PDT)
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com.
	[209.85.212.169]) by smtp.gmail.com with ESMTPSA id
	ma4sm8163790wjb.38.2015.08.28.06.55.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 28 Aug 2015 06:55:42 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by wieo17 with SMTP id o17so16673710wie.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 06:55:41 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.194.120.198 with SMTP id le6mr11514326wjb.133.1440770141945; 
	Fri, 28 Aug 2015 06:55:41 -0700 (PDT)
Received: by 10.28.135.72 with HTTP; Fri, 28 Aug 2015 06:55:41 -0700 (PDT)
In-Reply-To: <26B844B8-BE69-427B-8DA7-B649C46A5632@gmail.com>
References: <cover.1440678731.git.paul.eggleton@linux.intel.com>
	<762e79dfb769e885758bdcc627fadbe4dc6454fd.1440678731.git.paul.eggleton@linux.intel.com>
	<26B844B8-BE69-427B-8DA7-B649C46A5632@gmail.com>
Date: Fri, 28 Aug 2015 10:55:41 -0300
Message-ID: <CAP9ODKr4bJH2ZWyNw6qdxaEg63ndbc+u5b8zCtBS34wn_YW5DQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
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
X-List-Received-Date: Fri, 28 Aug 2015 13:55:44 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Aug 28, 2015 at 3:07 AM, Khem Raj <raj.khem@gmail.com> wrote:
>
>> On Aug 27, 2015, at 5:36 AM, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:
>>
>> Allow restricting recipes brought from a layer to a specified list. This
>> is similar in operation to blacklist.bbclass, but instead specifies a
>> per-layer whitelist of recipes (matched by PN or BPN) that are able to
>> be built from the layer - anything else is skipped. This is potentially
>> useful where you want to bring in a select set of recipes from a larger
>> layer e.g. meta-oe.
>
> For the record, I am not in favor of such feature in OE, Distros can still use BBMASK if they wish to

I am also not in favor of the merge of this.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

