Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
	[209.85.222.176])
	by mail.openembedded.org (Postfix) with ESMTP id C91A47E85E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2019 15:49:07 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id d15so8882636qkl.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2019 08:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=M4wM/XOmbgUMkTXkfWSic4cnQet4RrCz+tkwd8lZ27g=;
	b=kZ0KcMkIp+51L8YDOsS8ub2pHqjPm3/qY3GH6HlHdCoBDVY1P4pYaD3x2XR+flPIPb
	dS4O5ojnQGRd1Kvu4wTTUu32MScmzfFs9hScxWlUh2YEO7/fkIClzc9RQ+AanjHkHPWq
	S6QvQ4mM0vDA7KoBz6Q/T++MhG4iufePOWUeLeu3CC6QQwr3yBJCyxlQxMw1wv/H905v
	qp7qJk1+97TuUjqmXNRiBPYxCUQrNi5zG4Qixhz2K0b7GxHi5iJwTeiA2DyrMEMRe2MZ
	cqi+vQNuGAVJYvlst+2CGSsbOF6AiIb0eWog6+hbtkzZrjCjDvP67bxjMbpiwrENdMDc
	b84w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=M4wM/XOmbgUMkTXkfWSic4cnQet4RrCz+tkwd8lZ27g=;
	b=Rn4xBIOUaXj+y8ZP3zbTYKnfSOOlXCamAnJvQSD31B56I44Sx07b1mILPJIyDn6IWd
	7HbcMUNBnVHQMGjJHHTHIsIUMui5t4VK75hrfK6Z4k0mVsR2klLW3JFvueEa05xtt6Ev
	eIIZ54J396KD2bWECnaocNXY4YLYAEpZF20pFYuwKszaod++70c+J+eFJp8qoBswHRjG
	y1WC9ZtoBZxm6lD0w/yYSHnVHEs411MDaSsvkDndh4+QugnGlo87LOjJaBfcACHkJMua
	GN7Q2HIzeu6HAMbqTL2TUZfRrtTFxUUnTU/54/tsubXU96wHyBU3bOCSj8GSOZMbaZY1
	TyhA==
X-Gm-Message-State: APjAAAX6ojWz2LLNQdR214UoDjIGhKJYnOz7k21rVijbIC5oKRdiJGo4
	8BvXPmI16/KW/icV9WK/Ljre8x/4jFKv9q3e+AI=
X-Google-Smtp-Source: APXvYqzxTAU1DQW/6ut+Xtz6dH2CzqAwFSiAm3v6IjkD5uAgzMrtuZvTsFah5W01ZUE3lOMtcHkxQtSzThc6N7St/iE=
X-Received: by 2002:a37:a017:: with SMTP id j23mr94452922qke.258.1560872948549;
	Tue, 18 Jun 2019 08:49:08 -0700 (PDT)
MIME-Version: 1.0
References: <CANNYZj9rVD4cZ-AN7rvF=0fuc4d99brU_Tt_wQeRMGm=L83M2w@mail.gmail.com>
	<201906171422.x5HEMKtf012735@dan.rpsys.net>
	<CANNYZj_vg_jzcMRhfQ35C_2kDnyH-yxVj52pKk2WpfZxfo5iOw@mail.gmail.com>
	<591c1c8752c4c0526d18d5cd6596a35bc41c6645.camel@rpsys.net>
	<CANNYZj-6ZbpdR9WHkhrjFL77U290ZM=B_c0W12b1aVT8oKjG3g@mail.gmail.com>
In-Reply-To: <CANNYZj-6ZbpdR9WHkhrjFL77U290ZM=B_c0W12b1aVT8oKjG3g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 18 Jun 2019 08:48:42 -0700
Message-ID: <CAMKF1srWM7ZzHMXGLbxH57pC1Ki-x6w0HyRTxYZWk3+T52_C4g@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: "Eggleton, Paul" <paul.eggleton@intel.com>,
	Richard Purdie <rpurdie@rpsys.net>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [AUH] lttng-ust: upgrading to 2.10.4 FAILED
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
X-List-Received-Date: Tue, 18 Jun 2019 15:49:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 18, 2019 at 4:10 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Mon, 17 Jun 2019 at 17:26, Richard Purdie <rpurdie@rpsys.net> wrote:
>>
>>
>> I think that perhaps:
>>
>> a) we should have a bug for this as devtool shouldn't be giving
>> tracebacks?
>
>
> Bug filed:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D13404
>
>>
>> b) we could add some kind of "reset" command that AUH could run between
>> builds which would clean things up?
>
>
> There is such a command  - 'devtool reset' and AUH does run it, however i=
n this case it does not work because the recipe in devtool workspace is hal=
f-complete. (I think devtool reset looks up the recipe to be reset in works=
pace/appends, which is empty because of the traceback).
>

may be there should be devetool reset --force to override everything
and bring workspace to original state.

> Alex
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

