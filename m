Return-Path: <twoerner@gmail.com>
Received: from mail-yw0-f193.google.com (mail-yw0-f193.google.com
	[209.85.161.193])
	by mail.openembedded.org (Postfix) with ESMTP id 050066012A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 23:42:51 +0000 (UTC)
Received: by mail-yw0-f193.google.com with SMTP id u134so3275405ywu.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 16:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=y6gx9RIAwSY4dkr2m9F6VYPu7LXlGGbyi6TFuNApw7A=;
	b=FT8t/GESryG4ifaz4jeTYUnHVSrNjQKXCPwkEwMbLHjdQX2jfTe2clIzJpPv6wWrWd
	aFppMoecJcNZPjrJUGy//PUkwBxYTf12/4RSTtFiJTTxPxGK759Q3CBEousIy2RgXjnj
	iANFqj+OP+YuGOGJ4lpSc5tIf3pfQ+tpq9/Pb5RhP0JwVKgbvhOgFgaxr3QGFLrUmN3b
	4I7EEEBQV/Q6AJRaWeNWBqxQg/mPWEkTPUPoiLd4KFZHnTjC5/3OdhlgfiFZuQDc3h0E
	xY8wYDN6cLVMWHSyrq0kw4c3bLLgWWLqyQJLly/ezRWKx4/p3Rm64sz16ej+sLLsJ6dp
	m8DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=y6gx9RIAwSY4dkr2m9F6VYPu7LXlGGbyi6TFuNApw7A=;
	b=D0YrkFKd/cuv7uK+qFqRsgbWlAbHm15TL0Tcydiq3eJL6yOWLw4H8hGmdy20xrSN5Z
	qCLynK8ztiezgEtVAf+03rTQQVCV9KvAnsmr2BGApj998fEMgcR9bEiDX6oWwwsdyAyg
	BsRbQ173DdCiGBm39lm83MpJA03LD0czpDznGpD/3EIKnUlTVkJl0B7r/MWo3Nw36eqE
	dEG/n9lCoSkiESprP/Ma9jw0kB21pRnd6n/NcKwys/vCNOj7LxJryTFPkX+oXQmIe3is
	gihJopJtFz0EN009uSjImOGbd9qVSApDYlEOrSSgIUVkrlW2opR63OwxJbVhs1qK6W6p
	j45g==
X-Gm-Message-State: AHPjjUhTvJ1p1tcoD6R1vXkr6QtV+nsmx56cXcr6EHn7iYncL9bTxIQS
	sqQVkkI8WWeFOP7Mt3RQ/FS9Fi31XShX67l4IFo=
X-Google-Smtp-Source: AOwi7QD9kcuU8P64hQEXhLps1UexWcIo0O6fv0cRr9DGn/euAxEWslqGE5ppkj5YLfhFeyMvC/UaMSVYrOKh2qjexHo=
X-Received: by 10.37.187.7 with SMTP id z7mr12844703ybg.81.1505259773119; Tue,
	12 Sep 2017 16:42:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.4.205 with HTTP; Tue, 12 Sep 2017 16:42:52 -0700 (PDT)
In-Reply-To: <CAMKF1sp1R_wnW6Zkh96WWJKgC9zzgtbO-__JvqgEYWp_B6whzw@mail.gmail.com>
References: <20170910131446.4555-0-nathan@nathanrossi.com>
	<CAJTo0LaqHGMPDF=JHGw5NcBzvTkFbP2bQfmgcG8o-Zx0hTeD3g@mail.gmail.com>
	<CAMKF1sp1R_wnW6Zkh96WWJKgC9zzgtbO-__JvqgEYWp_B6whzw@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
Date: Tue, 12 Sep 2017 16:42:52 -0700
Message-ID: <CAHUNapT0zPy9SUv+g7OBKp86BF_s8_=_RPrmNhMJQa7S8LbM8w@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] Recipes for Open Source Verilog and Lattice iCE40 FPGAs tools
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
X-List-Received-Date: Tue, 12 Sep 2017 23:42:52 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 12, 2017 at 4:21 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Mon, Sep 11, 2017 at 1:58 AM, Burton, Ross <ross.burton@intel.com> wrote:
>> On 10 September 2017 at 14:14, Nathan Rossi <nathan@nathanrossi.com> wrote:
>>>
>>> Please note whilst this series is sent for oe-core it may be better
>>> located in another layer? (e.g. meta-oe). However since the recipes and
>>> the tools they build are not specific to a single BSP it did not make
>>> sense to keep in a BSP specific layer.
>>
>>
>> Sounds like a dedicated FPGA layer would be ideal.
>>
>
> I think a layer for 2 recipes might be too much. Put it under recipes-devtools
> in meta-oe for now.

5?

Am I reading this patch correctly? There are 5 recipes?

