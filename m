Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f50.google.com (mail-pl0-f50.google.com
	[209.85.160.50])
	by mail.openembedded.org (Postfix) with ESMTP id E3CC27870F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2018 15:50:59 +0000 (UTC)
Received: by mail-pl0-f50.google.com with SMTP id g20-v6so912332plo.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2018 08:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nrfU5kst0/jZRAHVs9iNd1pS9iAsO7Ropo/2XEf9IcI=;
	b=PERFoyKseUBL/x3WKFNtcO0P/f7CYpYLnu1NZpou3KUWPdJ5nPsQrQa3UA96QBoxhs
	Sp/hQ36S72+p1tgYAn1p0db2Ax9Xqj0nYyfdWkg0VQYtDklsAOXxr9e4caE+MsnRaOaP
	hnvrK2A6przBAMBYR+vlaYQLd6RJR2ORbCRA2wvPxofip9lQgOtXG2D1lMs4TKNqppUL
	ZPRd87siiNkwPwx+S7sS1wfm5RxVld9ZXFkPzDz+iaxz90qmauJTdytzFMb9a2FXzMM3
	El3wHBslcPhJKvfh1Qd5SvZUUVBzTEwLd2q/SbZieTaZ8DOIkUyrYL27s7pPURdQd1/k
	jxbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nrfU5kst0/jZRAHVs9iNd1pS9iAsO7Ropo/2XEf9IcI=;
	b=AcFUZJ69xlHNeliWFmgr6WMuLUwEVjMgXqsneb62ttZtAjY0cPLPyyq82ciQlH6Gr1
	R1VI1yaUgAnFRVp5mgKJ46xgEijHC+fFzMPLToJ8zD1mpvWqtpZQ5cu5Jot3kOL3OTeO
	aPMxx0QqgbkIpjWDddytIdHkA+45speA1vWqITOJ/DRErq1RBf8ZM8STVsJ/mb1+lerW
	AaJnMldgxrWVq3MZzq5DJ5t5R7crd0075RfvfCnjuS3OQEyO/mtpri1Dk5XuuXLnbHVE
	pS6B95Chp0H0xcEdUfx0MQqZnQ4SkC633RIO0aYbcY0kuJyVYWzaVFFwoNDUwvN3nKEd
	VIwQ==
X-Gm-Message-State: AElRT7ECa8yn7kAb0fLgTFBOkbuvurN2KntRN0CGYSxbuK+Ls4P8YS5a
	q9ifFSFEO8hQC0p5nRxgPn9dBlS2dy8Du/RjaDQ=
X-Google-Smtp-Source: AG47ELt01LdnA14+NmdL6e7oibkcn7hNZ/T4Brbdy7nX3sa4REy3sgutAgs6ZarNg/NI5+8Eac/5hI0SQCZ2LFMLqYE=
X-Received: by 2002:a17:902:158b:: with SMTP id
	m11-v6mr40888685pla.300.1522079460814; 
	Mon, 26 Mar 2018 08:51:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.236.173.149 with HTTP; Mon, 26 Mar 2018 08:50:30 -0700 (PDT)
In-Reply-To: <4d0ac28b-690a-fdf1-e4b8-79e5dd415738@gmail.com>
References: <cover.1521989435.git.akuster@mvista.com>
	<d4761381-c70a-3c8c-7e69-c7ff884f78e0@linux.intel.com>
	<4d0ac28b-690a-fdf1-e4b8-79e5dd415738@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 26 Mar 2018 08:50:30 -0700
Message-ID: <CAMKF1soVoM5sfjX_GFWgESuHE5nez9xp63DDtsxcdJjRjBWGXw@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: akuster <akuster@mvista.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/21] PKG updates and QA warning fix
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
X-List-Received-Date: Mon, 26 Mar 2018 15:51:00 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 26, 2018 at 7:47 AM, akuster808 <akuster808@gmail.com> wrote:
>
>
> On 03/26/2018 02:27 AM, Alexander Kanavin wrote:
>> On 03/25/2018 06:00 PM, Armin Kuster wrote:
>>> Cover letter only
>>>
>>> Please consider these updates for master-next.
>>> nss has an outstanding patch sitting in the queue somewhere.
>>> Passed AB except failures not related to these changes.
>>
>> Why only cover letter?
> Do you know how many electronic trees I have to cut down to provide this
> kind of electronic copy for you?
>

as long as the logs of these e-trees are not hogging patchwork. Some
large patches have strangled
patchwork in past

>> Can we see the patches please?
> done.
> - Armin
>>
>> Alex
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

