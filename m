Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
	[209.85.222.181])
	by mail.openembedded.org (Postfix) with ESMTP id 1B4747FC2B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Nov 2019 17:39:59 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id m4so11411699qke.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Nov 2019 10:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=b+nJe60yufCKufSZIWmCHhqFr4YbPz6+4PdwtrAlGeE=;
	b=Bc+6XaL+JtKOI/WgN6vAC9kyzLbJ7uEXyXpWEpPNy0WUUVczNTJ0DSx8P11qG/ROCy
	zKnLijnQ/eja8UZWGa2eb6lK2AHV+HP93YfNFWh0NZn2kqLMSPjJQVw4w3VwLB8wSt7o
	DDO23btUpaVrE9fChVsL3jxdwuWQRug7+VLCSN9GRjSo2wHfqsdSdzkIiKrc0Y69Xq5j
	TckDojtLiptTDKDdC6bTlbNF/rNIl4LP0MHs6GQKL5J25XSGUzShidhQuuM8ZMW5/8E3
	juH0jZC9N4ZRMAYw1VEPS1BpbOIMute2zc1Sneho7kQbNH8o6dkZyfiul6qes87AfAeb
	zUKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=b+nJe60yufCKufSZIWmCHhqFr4YbPz6+4PdwtrAlGeE=;
	b=sgNVzjr4asbBo5NlO72yAHsHAdPCTS72YohoyiChISQ+FR9DYfNBOviHO9KHkNOxxP
	zxsEq0RMlstByufjfPl1hUpfLAewjeKrm7IZsArm5FI+iP16dbuu9aTgHcjfSYoXH1CT
	87mGTBkO5I+hj3gdiM/MKwvNgtVdzCyFxvm5g//KxJ4WBDV8II+asSVeRCcRVq6kHRqT
	UNCkyrTZPlI81gr18C0QKlgb6PdPUUHNtmi7QRPVvqLcut17y/AdTqNHHhsnMWJq17Wo
	YTExIGYiYd+4/WeQTTnqxIL4tE6I0oyBRsA9pJbVGDcfNqBTEaK9Mh4AoGERcvtg+wFf
	yjmQ==
X-Gm-Message-State: APjAAAVEXwDOos4OWT/vNFkQeMamevtb0l28ghI7czeHvpwT7dH2xP2j
	cvwcPIhzIUB2yE6it9+U3U/MWG3cvqmnge1R/pM=
X-Google-Smtp-Source: APXvYqw4L5m+tTDfu21yqDeBPJNRJ4QLGmMiIikUk1CUHH9ZJCfWrl9pllIIdNNDLDdDfV7V+2oXSPmpY9K8LEODOe0=
X-Received: by 2002:ae9:f010:: with SMTP id l16mr7079190qkg.212.1572630000593; 
	Fri, 01 Nov 2019 10:40:00 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1572341125.git.akuster808@gmail.com>
	<ba94d467df1cb0b67842408de3db193612aebdcd.1572341125.git.akuster808@gmail.com>
	<CAHtQpK501hXXF_iwe=SHVQkUvpvj4iPoym45CxD_piWfygEHEg@mail.gmail.com>
In-Reply-To: <CAHtQpK501hXXF_iwe=SHVQkUvpvj4iPoym45CxD_piWfygEHEg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 1 Nov 2019 10:39:34 -0700
Message-ID: <CAMKF1so_jt85yTaTznmBFreOEfB=E_-E_7T7i_rdVnb4-1ge4Q@mail.gmail.com>
To: Andrey Zhizhikin <andrey.z@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [warrior 18/19] go: fix CVE-2019-16276
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
X-List-Received-Date: Fri, 01 Nov 2019 17:40:00 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 1, 2019 at 10:33 AM Andrey Zhizhikin <andrey.z@gmail.com> wrote:
>
> Hello Armin,
>
> On Tue, Oct 29, 2019 at 10:50 AM Armin Kuster <akuster808@gmail.com> wrote:
> >
> > From: Chen Qi <Qi.Chen@windriver.com>
> >
> > Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > (cherry picked from commit e31f87e289dfd3bbca961e927447a9c7ba816d3f)
> > Signed-off-by: Armin Kuster <akuster808@gmail.com>
> > (cherry picked from commit e02e8fa2e82cceaaa6a433466f52f97b0984762a)
> > Signed-off-by: Armin Kuster <akuster808@gmail.com>
> > ---
>
> This  patch didn't apply clean on warrior, but same patch on master
> seems to be OK. I got a hunk in transport_test.go which has been
> resolved by build, but since this is security-related patch I wanted
> to bring some attention here.
>

if its failing in testcase as a last report we can drop that if that
hunk is not backportable.
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
> --
> Regards,
> Andrey.
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

