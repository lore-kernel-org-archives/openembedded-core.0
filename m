Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f42.google.com (mail-vb0-f42.google.com
	[209.85.212.42])
	by mail.openembedded.org (Postfix) with ESMTP id 5FFBF605A0
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jul 2013 13:05:38 +0000 (UTC)
Received: by mail-vb0-f42.google.com with SMTP id i3so4573862vbh.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Jul 2013 06:05:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=uTnz9Qv8CuXgVK4Zw1hP2BLvQBOQEf8vZM+rjJXzFyw=;
	b=TmMeE1oy3GygTd43ckC6lLDKc9s5z5BTD3N0hqm4qRz0I0P0nC2OIIcLbdxMRNCS/0
	JXZn2H4HyI+julc3vPIp5FHS/roE50hDj7a06i49AiQirOglJ1Uh3gZzW6eWfpZ432V7
	O2geWHld2IDx0Ad6rjWbhpVjITwD3NzJqirJIX4G1j6+ZEQ8cljaW9KcUifYfvmQnifb
	yXwwQYrNQAjyYHD3h7czeQiZXU9ZaEmb9v59jn0ju7kGtxxwuFfUf6NF1VBAMoKny9RM
	rZJ910p8i8mQ+YGObxvFFN+gH+UkpUynUPKSP/tz8M+B7kwjs1hMmfpsCgg0804BY6nN
	OHLQ==
X-Received: by 10.58.171.4 with SMTP id aq4mr11170536vec.26.1372770339117;
	Tue, 02 Jul 2013 06:05:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.13.144 with HTTP; Tue, 2 Jul 2013 06:05:19 -0700 (PDT)
In-Reply-To: <20130702114403.GA3285@jama>
References: <cover.1372707180.git.Martin.Jansa@gmail.com>
	<5fe62449a23d73dcdae54d7e8f37f2a178ad0751.1372707180.git.Martin.Jansa@gmail.com>
	<CAJTo0Lah0em7+be56wFOAHP+eCZy7NJqN=BY+T1SN47bXdKbwQ@mail.gmail.com>
	<20130702114403.GA3285@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 2 Jul 2013 14:05:19 +0100
Message-ID: <CAJTo0LZ9r00qQFj2o8c65bEYyyPWzYmPG4m4aZ4+KkfF5P-orw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Gm-Message-State: ALoCoQlRlu1Mp7QIf4tO5qAZoK25P8bbrnGft1f6Imd27ArEU48fSlpPPswX7wnm14kWU5Vpyy0W
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/4] mesa: bump SRCREV in git recipe, refresh patches
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
X-List-Received-Date: Tue, 02 Jul 2013 13:05:38 -0000
Content-Type: text/plain; charset=UTF-8

On 2 July 2013 12:44, Martin Jansa <martin.jansa@gmail.com> wrote:
>> > -# 9.1.3 commit
>> > -SRCREV = "f32ec82a8cfcabc5b7596796f36afe7986651f02"
>> > +SRCREV = "5a925cc5504575c22dbb7d29842d7fc5babcb5c7"
>> >  PV = "9.1.3+git${SRCPV}"
>>
>> git describe doesn't call this a descendent of 9.1.x so I presume this
>> is a master commit.  Can you change PV to reflect that somehow?
>>
>> That said I've discovered that our rpm doesn't support ~, so calling
>> it "9.2.0~git" isn't going to work.
>
> yes it's from master and I think that we always used this syntax
> ${OLD_RELEASED_VERSION}+git${SRCPV}
>
> IIRC "9.2.0~git" isn't supported in opkg too.

dpkg and opkg supports it, and the other fork of rpm does too - it's
just our chosen fork of rpm that apparently doesn't (or our tooling
around it doesn't, I didn't investigate much).

Ross

