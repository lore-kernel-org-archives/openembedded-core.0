Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id E89B4719A5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Oct 2017 00:43:54 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id a8so2621145pfc.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Oct 2017 17:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=mgGwkvu+O5szZqLGTjnurZsZttqxXQVEWIL5+qTwq5M=;
	b=b9IWLQWQpWyRxtY3Kkzyxd+cEkHvwY+leHP92dNG3MdoWASp7HVXJgpZwL8yPXcqa3
	7n85YeE6HgMpOgxkjIW3FatdZLTc8DW6L0vcqCvO2mr44YZwvf8Xfe2W4Kfu/VYpKAHl
	lMjGmpaJ2x+rCgg9N5dInSLVdCbQM4hpoNh+rJ2LBNmKnucE7fGuVV2U1rwRvT+jFRft
	NIEJc18Me7pngU9OYDyQiRbDNXnLgXhtLyZogQs6P5FwQU9VdgrIG/uyQucqP/cW1bn1
	566mIVx1fiSWCxMeYMphkUVhlKEB9o5//8hCUZhHy0oo4TFKGJMn7OKMllc6OZ2VS+/w
	eV5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=mgGwkvu+O5szZqLGTjnurZsZttqxXQVEWIL5+qTwq5M=;
	b=Etgns4WHsofnPymyg0dUrmnbBEMrtArORnI04GRsDoAAoKLasD0IT4pQl+nuZtBdOx
	IBhgXr17JbSPDzOEQN+gCg+oc9g2YRygR9e+tSmv/ufGXYF2ktOLPJ9fyZ3MlITle04M
	mwsiy/0CWUIkALeQmhNfoxgfkp0DUkivKvM5nahtRITkN3bzS5wyUSDr9V/4+R4CmH30
	obzytpXQNeLuWOGvuyLXyOE68eJMHYu9qfH613QRi578MjRq7L81UZ9KgU4myjZ+7lt9
	gJcp9eWxGYbf9y/FNJnhjT0STr3ne0OWAAUc3h6X1OR0+gIMJaITfmQLd3bg146kD3s/
	knbQ==
X-Gm-Message-State: AMCzsaXJfyAof3BzO3/66oSlneMyydumSOteRYHvFEJCPc/USL2VHosP
	rAeSSJxAOm4yu57eccNc3IR+oP0cgm3Y5qDFHFc=
X-Google-Smtp-Source: AOwi7QAu9Xj9SdGf8BiDshNJCl4WY7goRB3jOxAySpm0vROvnap5adRHylx941q/zyWH5Kq4NQlst5pt1wdO7A3TtUA=
X-Received: by 10.98.102.132 with SMTP id s4mr13506323pfj.168.1508287435803;
	Tue, 17 Oct 2017 17:43:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.187.66 with HTTP; Tue, 17 Oct 2017 17:43:25 -0700 (PDT)
In-Reply-To: <CAJTo0LarSyL9OGCX8SM-7mRE7qmNjq9dROiGAb86mG0vnjyEiA@mail.gmail.com>
References: <20171014154858.35123-1-raj.khem@gmail.com>
	<20171014154858.35123-5-raj.khem@gmail.com>
	<CAJTo0LZYB+FTUBLWaFEeyAz3wYMCnr+gSbySYvz0K4d3RwsvpA@mail.gmail.com>
	<CAMKF1spgYS0YcfVrHZ8aUHtFsv90AUQRpT75vvnRvt56K3rkuA@mail.gmail.com>
	<CAJTo0LarSyL9OGCX8SM-7mRE7qmNjq9dROiGAb86mG0vnjyEiA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 17 Oct 2017 17:43:25 -0700
Message-ID: <CAMKF1sq0qcqrRt9S2bkZ6QYw+n1Ld4niJStsNRwr_2hL-Du25g@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/7] libcheck: Upgrade to 0.11.0+
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
X-List-Received-Date: Wed, 18 Oct 2017 00:43:55 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 17, 2017 at 1:10 PM, Burton, Ross <ross.burton@intel.com> wrote:
> On 17 October 2017 at 20:25, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> On Tue, Oct 17, 2017 at 5:33 AM, Burton, Ross <ross.burton@intel.com>
>> wrote:
>> > On 14 October 2017 at 16:48, Khem Raj <raj.khem@gmail.com> wrote:
>> >>
>> >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> >> ---
>> >>  .../libcheck/{libcheck_0.10.0.bb => libcheck_git.bb}          | 11
>> >> ++++++-----
>> >
>> >
>> > Why not 0.11.0?
>> >
>>
>> I was getting printf format related security warnings. Latest built
>> with clang/gcc and musl
>
>
> Not a massive fan of "random SHA", can we cherry-pick the patches?
>

Sure, let me do that and since the libevdev issue, I might be lucky
that it was somewhere in my layer mix there were errors.

> Ross

