Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi0-f42.google.com (mail-oi0-f42.google.com
	[209.85.218.42])
	by mail.openembedded.org (Postfix) with ESMTP id 7BD6378DD5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jul 2018 12:58:31 +0000 (UTC)
Received: by mail-oi0-f42.google.com with SMTP id v8-v6so21007016oie.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jul 2018 05:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=J3pjam+WcnPPx0S5PbmVA1YHFg48TX501/Q2T+0koo8=;
	b=Q7LPIWDs29wKvZV/UT7Fu91S42mwwn1RFchWvPTO9Bk/FfDepo9OdkUAh6ff+uFi71
	H01BsND67hwScoCX0YJhkYBhCrfKj7MjWQC3tR+yZIXzldmrW/+m/VXG7cQLfOiE418e
	cudd6ozMjj35FF8hcwOiGySy/S4xDEunie8dVJLtnXT5aN0vuEyc03CRjeFyiPW3jr/D
	F/kLyS5Goz4XNAM67m8rjksl2ESAyy4T0t7l/RImkwe9pg+e87ohVgDEfPS7vAt0S1kg
	ubV2EIMBc3Y3ASAScpIwjPUktnmsnlk0UU8e356I9TQQXnMZhcgdT1fVYTod8p+s1bSb
	MoWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=J3pjam+WcnPPx0S5PbmVA1YHFg48TX501/Q2T+0koo8=;
	b=LaMh6v+ejRB4zCtZGDJnOuqspkYd3LbjmnXpr3v06DGKRSfn2iYqVxIBCwQU4wzqB3
	cRVyA/z7U/XjZ74zK51Qj1B6sAciISR2vhNuhUeJ4M3r28ULpixSGCbR4yYPDljJFzFD
	2pVbylz1sbr+rT34nbgykFAhd9UTdKMpDkvVn/3lPnkGjXatLRyRtVR0TkqXECw/2E7H
	e1PBwqWxZk7DhD+lCZkA4Q4LAl6xIr5HpS+l+1nkk8pUMr88j3IbDNuKonB+qn8ePZ9Q
	6xn9ejaQuTfGTxgBajzGcQzAAa9dDktvNzgsoGvNu9yW4gyZUpp1uef3giJHHS1osa6z
	7CTw==
X-Gm-Message-State: AOUpUlFVd4laaO6nQ+qSuKaZy8Q39ncqhzQrKKUnP2Do9U6FxbXLG8AS
	dN0U7aBCut4mA1kem0tuAgGKrtIkrEpuCSaMC3c=
X-Google-Smtp-Source: AAOMgpffxKjGXXj75eqXDLrfapIVBHxE4f9ahNX8V0IOajx+N82Wg/fNTbT7Flhq8HkJNSi14IO6ByPjD43mUguzAgI=
X-Received: by 2002:aca:560d:: with SMTP id
	k13-v6mr16874531oib.190.1532955512334; 
	Mon, 30 Jul 2018 05:58:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:90c5:0:0:0:0:0 with HTTP; Mon, 30 Jul 2018 05:58:31
	-0700 (PDT)
In-Reply-To: <cf6a8d01-cdc3-c160-c586-e1a7b5bcf8b8@windriver.com>
References: <cf6a8d01-cdc3-c160-c586-e1a7b5bcf8b8@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 30 Jul 2018 14:58:31 +0200
Message-ID: <CANNYZj9pA1yfOhLfHtNcbn199=wG7xie3PRSyWajijS+A2ZMKQ@mail.gmail.com>
To: ChenQi <Qi.Chen@windriver.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Why do we use sysklogd as the default syslog?
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
X-List-Received-Date: Mon, 30 Jul 2018 12:58:31 -0000
Content-Type: text/plain; charset="UTF-8"

2018-07-30 8:48 GMT+02:00 ChenQi <Qi.Chen@windriver.com>:
> I just noticed that we are using sysklogd as the default syslog.
> meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb:VIRTUAL-RUNTIME_syslog
> ?= "sysklogd"
>
> sysklogd has stopped development for about 4 years, and as far as I can see,
> nobody is maintaining it.
> Is there some specific reason why we want to keep it as the default syslog
> for our reference images? small size?


You are welcome to improve this. Quite often the answer to such
questions is 'because no one is aware of the situation'.

Alex

