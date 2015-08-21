Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id 4407E75794
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 10:31:06 +0000 (UTC)
Received: by iods203 with SMTP id s203so76829485iod.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 03:31:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=xg5xFr8nsA+wnC+UTSTLg/xYev1lfjX/d4fzud/OhQo=;
	b=TM1X725S1bHCuAvJxmJMI9B0lU1KI9tqjCvv0AIsgLcKoAH2qtSjwAwbRFH/8bCkEC
	6dDGJZsej7nDkDsHuvsfHKGd8I6VAIzMbtAGrVX3QbrtIHo0DUjkjN36JZEJxNwsVDmn
	R3BMSxXmyYCiqowiNBob8FBv3PEACyN1/m8ajRmxSYLZ4M7vZBwatiJWveXg0JnYthix
	Jlmjf7saEucE64AF+RlHZam+HcgJ0qholPKZOPLqXROTr1FY+rYH8qZPYVcNOfMVSNao
	bairsm3yFf6nMTltmwH//nAvLl3O8cZBtuuQaPMaGWHvzjHOwvBL9PBT63QltatmN6QO
	W6mA==
X-Gm-Message-State: ALoCoQkwfqvACP00Fos0N4fz/xpLo4L+lb2DSHUDS04HV4Vclqo1k1APrm24G1vXdFmz8i3nCtSN
X-Received: by 10.107.10.144 with SMTP id 16mr6100726iok.72.1440153066881;
	Fri, 21 Aug 2015 03:31:06 -0700 (PDT)
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com.
	[209.85.213.175])
	by smtp.gmail.com with ESMTPSA id r8sm5644649ioi.10.2015.08.21.03.31.05
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 21 Aug 2015 03:31:05 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by igfj19 with SMTP id j19so10987101igf.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 03:31:05 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.50.66.166 with SMTP id g6mr1811020igt.19.1440153065553; Fri,
	21 Aug 2015 03:31:05 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Fri, 21 Aug 2015 03:31:05 -0700 (PDT)
In-Reply-To: <CAMKF1srx_Jzv1gfwQ=VAiepAqL3GHfP4SJduup_GiwCSvL0MoQ@mail.gmail.com>
References: <1440055967-28503-1-git-send-email-coldnew.tw@gmail.com>
	<CAMKF1srx_Jzv1gfwQ=VAiepAqL3GHfP4SJduup_GiwCSvL0MoQ@mail.gmail.com>
Date: Fri, 21 Aug 2015 07:31:05 -0300
Message-ID: <CAP9ODKrs70dX-K2zJ9Rhx1J+yqeDXQDX7u7UpH_bM5KGPrDa0g@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] uclibc: Add SRCBRANCH for use by SRC_URI
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
X-List-Received-Date: Fri, 21 Aug 2015 10:31:12 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Aug 20, 2015 at 11:19 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Thu, Aug 20, 2015 at 12:32 AM, Yen-Chin Lee <coldnew.tw@gmail.com> wrote:
>> -SRC_URI = "git://uclibc.org/uClibc.git;branch=master \
>> +SRCBRANCH ??= "master"
>> +
>> +SRC_URI = "git://uclibc.org/uClibc.git;branch=${SRCBRANCH} \
>
> this is ok. Just call is BRANCH instead of SRCBRANCH

Personally I prefer SRCBRANCH. This is personal option though.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

