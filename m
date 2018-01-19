Return-Path: <alistair23@gmail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id C94A271B1D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jan 2018 01:06:38 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id m8so116540lfc.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jan 2018 17:06:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=CwWf0DGbq4g+01aWZqek9zDhBJsWpIuz7jWWX5v9ppQ=;
	b=Euds3+u5KjaMrD8GIIchOQu8hX3/E0uVSH+3P7I0J7HQmcEBpy86RrqBYrGjqOUvnL
	NDrosIeqpfJs1306LtFWGNBsp8NpDL4HuaatyQrILClyJCljdRqDuMotN8o1H1t/yUOZ
	SJ9UYm4e1FqjQvxsa0KaaNizRPrPjSbY++b7OwFBefw0EpX8hFUCG/hBJu0sxzp/e1C7
	99D0vp+m0sThPb+x3gxnypqgqJTH7MbdCXTanAF3SbM/+GYChHE8Q7ZYp/RDf3SWb5F2
	qh+Tzv5Dh46EzC9fb8hEpsiD2iFkf2X623WJ+rhJnC+whnyVMLcXbLIZoZ33y/CEotUw
	k5OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=CwWf0DGbq4g+01aWZqek9zDhBJsWpIuz7jWWX5v9ppQ=;
	b=WLuz8aAeIHKLr78KwLPE9T4fKjAm6EkO8t3R9yZaZc/64uX1yVeteLbLkfouRqey3s
	PYt7Mt0PuLWtrPvS6HPIKCTcLKnRfKnV9dbgPATD4wFtoeP7GQFGXVR/7D1r9YBJtkGX
	kgG/eWiJWtZc6eP2aHcPPwXbszDlP93+Ut81bCKe+1PtIWivD15fJYJXWRTRAFP9/ld3
	waBkYzfTLykeUwMmQPchDxCQKdHuDxOXgq0mrODwBzFFxy+U7Y5Q6QJXdGPtEbnAz+Yt
	a2Qcz7Po8J2xt+hqzlguv0a3XqWGnasx1aiojoiW33IgY29T2xV2te1YUhgdrrN1jqUL
	99tA==
X-Gm-Message-State: AKwxytdwM5lqE7vdfbbqATPLiJQwEYerBMmRuw+5L29uTQfvnKTCqhgV
	aDXbXS7YfuHrNtlkLC7b7fY5oVfDI69Puh0wqmg=
X-Google-Smtp-Source: ACJfBovndm4zoB0pg83P319qUKNLvjiP8YfrTXRg8YnxfBnsVUvFX309zYT2OUeYgjAR9zESJZnLTPu6rSU2NM9XTKg=
X-Received: by 10.46.18.217 with SMTP id 86mr14334227ljs.126.1516323999342;
	Thu, 18 Jan 2018 17:06:39 -0800 (PST)
MIME-Version: 1.0
Sender: alistair23@gmail.com
Received: by 10.46.0.86 with HTTP; Thu, 18 Jan 2018 17:06:08 -0800 (PST)
In-Reply-To: <CAJTo0LZBo8PT1=PUXpTVo6di2xYGZ6cA_OSj=sxyXPjZSH7cgw@mail.gmail.com>
References: <20180118191245.9490-1-alistair.francis@xilinx.com>
	<CAJTo0LZBo8PT1=PUXpTVo6di2xYGZ6cA_OSj=sxyXPjZSH7cgw@mail.gmail.com>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Thu, 18 Jan 2018 17:06:08 -0800
X-Google-Sender-Auth: j2hLEnjLuFmiOybqygTYJHAQ7oc
Message-ID: <CAKmqyKMTdiRXUWDTtKh59pQ58h4Rtc83Wvu+7FfGr3+r-N0avg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glib-2.0: Re-add the gettext depend
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
X-List-Received-Date: Fri, 19 Jan 2018 01:06:39 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 18, 2018 at 12:02 PM, Burton, Ross <ross.burton@intel.com> wrote:
> On 18 January 2018 at 19:12, Alistair Francis <alistair.francis@xilinx.com>
> wrote:
>>
>> Commit "glib-2.0: rationalise build dependencies"
>> (8b0ca0cb54c91611213556bdb99316d5e7ac5b3b) broke mingw glib builds with
>> the following error:
>
>
> The error is missing from the log, but is this the libintl problem?  If so
> that's what the libintl dependency a few lines up is for, the problem is in
> meta-mingw.  I submitted a patch earlier but it wasn't merged by the
> maintainer so I just pushed it myself.

That is the problem, it is fixed now. Thanks for fixing that Ross.

Alistair

>
> Ross
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

