Return-Path: <alistair23@gmail.com>
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	by mail.openembedded.org (Postfix) with ESMTP id 252F662133
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Jan 2019 01:32:34 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id y14so12081410lfg.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Jan 2019 17:32:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=TaY/xT+LMDnxj3/LDUepCDiIHa/noNM0poMhzjiDDt8=;
	b=ZPU8wIQJQX6cPhnhYayX419fGW8CD+Cxeobf81EGPMrm8Dhth5zkfGbNVEhY/rHpTd
	Ni9wk4TR/3Ypz5SfderDzZFiJZrD/T8BDy2Dq9Nl29B5QogqziqEBitdWYHpWfg6NhIq
	u+x0qV9fFaCqi6iM/PoZal0FTqhF1GK5St1qc3hCLUfW7YtlTIHJfa3kJhZHto2SLeUZ
	QIgeLoLim32xBleChOE5G7KG8orIX4sESvgM3wja2JroBKrkkc0ZIMwgs3Ms+qCediTH
	Xme8KKwCg18BpKtm26ruNuX0tMU7UrtFLO8UNj8WtHofKNRNWQvmD5NeHar9CB+8GG3g
	4tfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=TaY/xT+LMDnxj3/LDUepCDiIHa/noNM0poMhzjiDDt8=;
	b=YC45Z/hSjMHYNIDgfaCAZFL68o9aRgfr9wHDHk6F/Kt7MckKb0idpYB94PvJfhM63k
	g0ikMJ4H7vtCFP0dbdFyxZYG7iJViAIA2Iv6Tc5xCIWmtC8dVQW3WVP1xYC7j3nkre9V
	r3Eo8J6QJVu5HeAD00y7HsIV/6ZQCbWu6d/9QhB6J1nG0LXgRLY1cUauv+oNmQt3ligW
	cZWzTVYlCv61UbYZDZITwQup4eWZ5hf71Qu8uxxzxxBVm8oLdIH/ujNcu9tl+8gd5cCB
	HQ8u5eFDhr3I1g+2AfcgohO2m7SFrGE37SGtgfqWE2ENDxfp4MmbgISLPGBIEogA5Hmx
	d7Ag==
X-Gm-Message-State: AJcUukc8yyHG7pysRVbhBwavww/s8288UvAzKOEep/N/g4haUGL2Xdkt
	FRMYy9go424vukiWbHFOeOHNhq6c/xOAWmlkcW4=
X-Google-Smtp-Source: ALg8bN6YQh5CxitUpfcBT8jzlh6T0nYPPvcGdEH9BRWGL1if4sVHp1wqHDpqzJUze0Y+NueFPGtZHZ7p5zW5N2A8oOw=
X-Received: by 2002:a19:c18d:: with SMTP id r135mr8568914lff.59.1547256755431; 
	Fri, 11 Jan 2019 17:32:35 -0800 (PST)
MIME-Version: 1.0
References: <20190110195121.13070-1-alistair.francis@wdc.com>
	<CAJTo0La+pRHTRkRtKUOKChgmRGtO6wp6LKiku-AMun8mgMo7UA@mail.gmail.com>
	<CAKmqyKPEvPOrn+Xds5FOqF9+xs_KdjOLMJL=9+fT9_4bW4CKCg@mail.gmail.com>
	<CAJTo0LavX1oxCPyK=g84LiaBsveo=n2bMOndEHWFPBhHPBRJ6w@mail.gmail.com>
	<CAKmqyKMpV3Po2oknYimYn=u4+Cv=s9cLki+gn7_-wM1P_XynyA@mail.gmail.com>
	<CAJTo0LZobTXvEG1cEMyirNLz=EQcA3x6K1QDQQ-qqejA-RRHFQ@mail.gmail.com>
In-Reply-To: <CAJTo0LZobTXvEG1cEMyirNLz=EQcA3x6K1QDQQ-qqejA-RRHFQ@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 11 Jan 2019 17:32:08 -0800
Message-ID: <CAKmqyKMMWMJfPRmX=krJd5A95q25L8qTwZZor9RAVaOYrf_BWw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] libinput: Enable gui PACKAGECONFIG by default
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
X-List-Received-Date: Sat, 12 Jan 2019 01:32:35 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 10, 2019 at 3:54 PM Burton, Ross <ross.burton@intel.com> wrote:
>
> On Thu, 10 Jan 2019 at 23:14, Alistair Francis <alistair23@gmail.com> wrote:
>>
>> > libinput isn't useful without a graphical debugging tool?  That seems quite a stretch.
>>
>> I meant that libinput isn't useful without the gui support.
>>
>> I think that this is worth having the extra packages as libinput is
>> not really useful without gui support.
>
>
> Sure, but the gui packageconfig just does -Ddebug-gui=yes, which just builds the libinput-debug-gui binary.  Surely that isn't essential?

Hmm... I thought it was, but apparently it isn't. Looks like we don't
need this then.

Alistair

>
> Ross

