Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 6876B60111
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 May 2017 18:33:33 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id y10so15492252wmh.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 May 2017 11:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=fYQb0atA83TZiHHVpUTm3aQt20R2UyWDlxQavQZIaDI=;
	b=rboEcmOkiaSHm5kuyYpPp7fiZdkMjEQEYmhRRNXb9A2bmt0HsxMprV9+RjrBwJsd3+
	kL93lGBxH63YOjBlQfqANw8lOK3bMGHvJWBE+MDy7ay6txIuRwO0yCENEL7IOVURHWqf
	HvOSfCTDsWtIm9L8CWR7sTicC3cXs7lVkwlZuBuaoT7JoFQbyvZzmU2bbHTA5CpDllKi
	4Y5NxIguWTywu94R4NCaL+O+runPO194hbzeNrna9Q9+RakKfu8Ay8gA0A6gOIwyXgXi
	1gVaaeje1eSJPZHD5ktgrDJGgwf1fd/8RzO2OUidZXXRzV29lUAhpbghudhFy4sIYh3i
	Hi9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=fYQb0atA83TZiHHVpUTm3aQt20R2UyWDlxQavQZIaDI=;
	b=GlN6laqdXO7xnJMM86cn9lcHlYd1NIm5E1U9hiDqYLD1IyWzHr7R6b48zgPUKxKsZa
	dgaH5q9O1XcBRCsz02rfpd8bsFWKL9Amwafd9oTYE90HeNAgCk22m9SueQCvwYbEXfWu
	D33PpdCj4NUCNKKKtZYAEtO19MURXrAfq/lLRpyWMqL+beD+jDtFsOq5zyM4ODBRXOgN
	wbGelzBaVE68kw8TcEaOibv8ot9/4nhs4Zf1763mrQCBCPl/jPlFWCXLmKxuAIdyZIXs
	YRu/p4l+hl/Oi76lNfk7Xp5mnik6BYM8Zo1qiPb7djWJgTp2t+ja/fZh4zl8JEWDT5ss
	k3Mw==
X-Gm-Message-State: AODbwcCYJYY1JRkqmnKocoyc/m4onbSQyOGKRIglGV6ABO80WLbXUJMc
	ICTMOC9srclhJ6heqrWUdGqiXzCuXg==
X-Received: by 10.80.151.5 with SMTP id c5mr4600503edb.30.1494614014933; Fri,
	12 May 2017 11:33:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.195.143 with HTTP; Fri, 12 May 2017 11:33:04 -0700 (PDT)
In-Reply-To: <20170512181507.GJ28053@denix.org>
References: <cover.1494425038.git.alexander.kanavin@linux.intel.com>
	<655290B7709079438B7932553958E60D16D2C5FA@ESS-EX01.essvote.corp.local>
	<7f60f107-1157-3991-b5bc-0fa4564e6905@linux.intel.com>
	<655290B7709079438B7932553958E60D16D2C67F@ESS-EX01.essvote.corp.local>
	<6f1e8992-7469-12bc-1307-2a9d0ca7d61e@linux.intel.com>
	<811d49ba-ac83-5a52-6687-e3447d06659b@mlbassoc.com>
	<abc26baf-5417-7565-cb69-08aff5559e95@linux.intel.com>
	<CAMKF1sqvc3YsrMNxkyv1ZHXF82Uy1hYRUL4sduaayYcf1Le5_g@mail.gmail.com>
	<655290B7709079438B7932553958E60D16D2C9F2@ESS-EX01.essvote.corp.local>
	<CAMKF1sr8ZypyM4mk=s1-W9oajRr952x7iVe9L8eDu-Hddthzpg@mail.gmail.com>
	<20170512181507.GJ28053@denix.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 12 May 2017 11:33:04 -0700
Message-ID: <CAMKF1srWVmtrMTJw1ueVbNX5=wMN5gRNNWXBtK33XJT=umbF+Q@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Gary Thomas <gary@mlbassoc.com>
Subject: Re: [RFC PATCH 00/10] Add openssl 1.1
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
X-List-Received-Date: Fri, 12 May 2017 18:33:35 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, May 12, 2017 at 11:15 AM, Denys Dmytriyenko <denis@denix.org> wrote:
> On Wed, May 10, 2017 at 02:08:26PM -0700, Khem Raj wrote:
>> On Wed, May 10, 2017 at 1:48 PM, Davis, Michael
>> <michael.davis@essvote.com> wrote:
>> > I think most of the major distros have either switched or are in the process
>> > this year.
>> >
>>
>> are there some info on the policy decisions of other distros ?
>> we should try to follow the suite then
>
> Khem,
>
> https://wiki.debian.org/OpenSSL-1.1
>
> Binary packages have X.Y version in the package name:
> libssl1.1_1.1.0c-2~bpo8+1_amd64.deb
> libssl1.0.0_1.0.2k-1~bpo8+1_amd64.deb
>
> As of OE, we've handled such updates with incompatible API in the past
> similarly - gstreamer vs. gstreamer010

yes we have, my point was if were flying against the headwind
or not,

