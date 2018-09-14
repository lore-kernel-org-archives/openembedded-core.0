Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
	[209.85.210.67])
	by mail.openembedded.org (Postfix) with ESMTP id 615DB799D6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Sep 2018 16:48:49 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id 36-v6so5206649oth.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Sep 2018 09:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=GLLGzzaEqgk+IP+qVFU/sNO2r/E2qLyBTZ55UOC3oWE=;
	b=sVeWeoAfXuxl6wcegKgY+cZoK0jJFjsbB4F/cYt8gXoBGMfiBraUqH1FU8NRkq1fNl
	e93URdLVEn8i/8csZd9oomc1/n1/Ot6LfzVr3SKZXOj4N/1mb3kW9C7W716zSC9EXDF/
	M9u78S/wsp8dlMdFQSuNUQoCJp8cCs1lA6uKqOfdS4d6mf5x3zpmrMGYSEIG1utSYYFP
	gjUM0/g48YDe32bWeTjJbebq4k3qbhPRdHwHdfDK+kHvyaJkpj7i5bDEICYzEwbrvae/
	HIptyCSLxGOfkZF6jo4KwbCiI44FaeADLY79um2xBBKogIjt82MUylZF7BEJ4xQAc/pM
	nWRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=GLLGzzaEqgk+IP+qVFU/sNO2r/E2qLyBTZ55UOC3oWE=;
	b=NAXpJwTZ0ZKTQ+AkT3O1MLsSDlsfc5XwRO7l+i0UpxJ/2rKEP5xmUMGuyzQg0Iyp3h
	0sNYwi7+4zGVWOb7fCF+cAW+PqU7JxsyXqcSSs/K4cIsn3qE+czxRjPoBWVXajBvZLiM
	fHU7Xnqe6wcGSRtfMu+Scs2hVJj1l9lp5xn0HVCw68Guy0th+OL/sHGxQtqNBLgdTc4t
	CYSsl7jAgbglRYwhzfcq4T2ieDwcBz5DVl04IUYWejD+O8wkzTHqeng9hBLpqGoPV3TG
	xLdovWNiZM2HDTAUqFiLsWBHvH7z+6dbIU2ajI7ie2JP84C0a0APnewSgd1DifVbkZJx
	lZjw==
X-Gm-Message-State: APzg51CKlvTzgipQaLI3zN15F5ziwoekxghF1e4zvoM09q7Xi8oTYkD+
	DA8fh4wYVvvH3S3WTT7xxY6P2DDFWrv0uAZHuli75qrn
X-Google-Smtp-Source: ANB0VdaID6Ozq3rqzHADJxms3ZnS197i4ozqVQzOKd56r2EUyvY8sCa2Y1MKU2jn/rd8vK4jYSSiziQKuSYj0QGzkPQ=
X-Received: by 2002:a9d:2816:: with SMTP id
	m22-v6mr4706641otb.22.1536943730376; 
	Fri, 14 Sep 2018 09:48:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:b48b:0:0:0:0:0 with HTTP; Fri, 14 Sep 2018 09:48:49
	-0700 (PDT)
In-Reply-To: <d8c0d4fe-ae89-5b3d-0305-96820fd22141@xilinx.com>
References: <1536868179-5111-1-git-send-email-geissonator@gmail.com>
	<CAJTo0Lb8EDKyH16i5JcpyTQuLG1vPZaxes=B3hUM3=zn0_chsw@mail.gmail.com>
	<CAJTo0LZoPhfR4Ahd_CqXeouPfHoH8+zth_3qr6__rd2xCg2Y9A@mail.gmail.com>
	<d8c0d4fe-ae89-5b3d-0305-96820fd22141@xilinx.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 14 Sep 2018 18:48:49 +0200
Message-ID: <CANNYZj9Mbpaf=gXupynTRvXiM1hPB4+pTsZ+0C+0fQVQkfomzg@mail.gmail.com>
To: Alejandro Hernandez <alejandro.enedino.hernandez-samaniego@xilinx.com>
Cc: Andrew Geissler <geissonator@gmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] python/python3: Move test files to test package
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
X-List-Received-Date: Fri, 14 Sep 2018 16:48:49 -0000
Content-Type: text/plain; charset="UTF-8"

We should probably do another dig at ridding oe-core of py2 :)

Alex

2018-09-14 18:35 GMT+02:00 Alejandro Hernandez
<alejandro.enedino.hernandez-samaniego@xilinx.com>:
> Hey Ross,
>
>
> I believe that if we want to go with this approach we would need to add
> these packages as "special_packages" on the manifest script, that way the
> script will simply avoid checking dependencies for them and will pass them
> without modifications, this will also cause these packages to appear earlier
> on the list, it does require some tweaking because directories such as
> lib/python/email shouldnt be on the email package itself, so we would need
> to take out such directories from the packages and rerun the script, that
> will repopulate the email package (ad others) correctly  with the files
> needed instead of the directory, but to be quite honest it might be easier
> to go with the first approach and delete such files on do_install()
>
>
> Cheers,
>
> Alejandro
>
>
> On 9/13/2018 4:49 PM, Burton, Ross wrote:
>>
>> On 14 September 2018 at 00:30, Burton, Ross <ross.burton@intel.com> wrote:
>>>
>>> I suspect simply adding python3.5/*/test/ will catch the bulk of this
>>> now and in the future.
>>
>> Gave this a go and annoyingly the manifest generation must sort the
>> list because the glob works for everything apart from packages after
>> tests alphabetically, so the tkinter and unittest tests don't get
>> moved.
>>
>> I guess we could change the manifest to put the tests package at the
>> top of the list, and be sure to respect the order when generating the
>> lists.
>>
>> Ross
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

