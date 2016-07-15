Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f68.google.com (mail-pa0-f68.google.com
	[209.85.220.68])
	by mail.openembedded.org (Postfix) with ESMTP id 6DCB7606D0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2016 14:27:17 +0000 (UTC)
Received: by mail-pa0-f68.google.com with SMTP id dx3so6219923pab.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2016 07:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=KuR2RUl6wyGLQgEhbwWahzwXawJL/GOAwr+tPCuW8XI=;
	b=Yc5NZ88PVQ9Gys2epvIGMLp7USkpnhZvSQZUKV1E72FS/U5HNWf8Izprst/vNV1yTA
	XgF0NAMc9cxTVRvk1MHr5J6rY9bc+tgPFQtXTvMUIF6IjJWTMwbd6NsTwdyJLCrotA4E
	jiWX1IBPmrY/XwVhyaghaweKtxiBK5j5gHoMj5HyQ777v5WjPZy3gH+d+PpixDqjgIU/
	vaG2RdkXFfppP7GYzBiZcd/3IUdQEVnZm/j0SiKqu8sdL+i9n2SilcBf6hfOxw/9/Bmv
	TbwHqrHVmdHvIu6SehvwwnlsEY4vEa/rOzlnXUNTvSlnTROYSh7HSYHcGP7jL89/h7VF
	hQXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=KuR2RUl6wyGLQgEhbwWahzwXawJL/GOAwr+tPCuW8XI=;
	b=fBc+3n8SBCN3PKzzcbS8KOG8ffSBkC7FDQl4ZnJdxxr5tvInbTDbaWcyQX/6UFLuXn
	gUE9i1W036ezndFC+ouaMPziyb1B2muTHZOCqelsa8zePMyADULzs/FDUOyRMJ7S7WhH
	67YL3UZ1ldnkRsevvhYml/aTUxviFjaiNToXfg2QWgyaPS6e5nGItnPIswJWMuJGvhQG
	GiX06O6PmKmtNJJFb3g9i3FjoQTFYOsJrvKTCjPaLHMOsjMW1mcEXPsRGcwe+DLjKD0L
	TLIeqsauGgzHKAawHmhyhTyGsW2geB0GLP5wMkaQl0G02xts66a+WyRZHyegGyjI8q/B
	hmmw==
X-Gm-Message-State: ALyK8tJJopZaZY04kQG9U24TxU2Gdh01QMa49FRCqJEyaDI/JgUg7Jjxb5E7SNVp2TXJqw==
X-Received: by 10.66.157.40 with SMTP id wj8mr32003105pab.53.1468592838723;
	Fri, 15 Jul 2016 07:27:18 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:194d:2232:d2ef:3b9c?
	([2601:202:4001:9ea0:194d:2232:d2ef:3b9c])
	by smtp.googlemail.com with ESMTPSA id
	t80sm5899323pfj.38.2016.07.15.07.27.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Jul 2016 07:27:17 -0700 (PDT)
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1468546499.git.timothy.t.orling@linux.intel.com>
	<ba010ae55186d533ee35ed38839d7761d7b004a3.1468546499.git.timothy.t.orling@linux.intel.com>
	<5788EAC8.5090701@gmail.com>
	<CAJTo0LY8M1k=XoHYYfTXo9uvCcBgqU6C7mttOvPdeqyR1_XbZw@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <5788F2C3.800@gmail.com>
Date: Fri, 15 Jul 2016 07:27:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LY8M1k=XoHYYfTXo9uvCcBgqU6C7mttOvPdeqyR1_XbZw@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [krogoth][PATCH 1/8] pkgconfig: Fix build with gcc-6
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
X-List-Received-Date: Fri, 15 Jul 2016 14:27:18 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit



On 07/15/2016 07:08 AM, Burton, Ross wrote:
> On 15 July 2016 at 14:53, akuster808 <akuster808@gmail.com> wrote:
> 
>> So this is the host gcc not the one in OE?
>>
> 
> Yes, the situation was host with gcc6 building krogoth.

Thanks. After looking further down the queue I found the PATCH 0/8 and
it explained.

The original master commits are cryptic on which GCC 6 has the issue.

thanks,
- Armin
> 
> Ross
> 

