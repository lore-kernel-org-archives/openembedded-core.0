Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id D9706606D1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 13:49:41 +0000 (UTC)
Received: by mail-qk0-f171.google.com with SMTP id t145so10148501qke.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 06:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=mVa/+mOQujOe/6hgFNzJSKSPjdM0RSqd0hZOo8emfVk=;
	b=US9xp9Q9swF0CZnmiVGpD/MqcEioOtdX1Jbe+5r9aGaUNB/+ePYfYcjBNkyf4rgiSJ
	yeMzlrEy0kL+HNnPUkj1MvklssvMXsfH38gTJwZCZaRZ5pzGueKlwbLMH+vKsMeX7Pf+
	Y1kVaTnZJeECpCby7i+FCHkAc2BCahjhj4TnZll+WVVP0N+TBrQPq76WMFthGCoHdAMN
	DYRZWMHPQvwd4CQ8DgF5NDAZvdWit7b5h++DWyKlTFRmvVTFpwnoSsiWX9GEzVS8JLCZ
	rqrUfLvextZ26lMUZTcytuvODwzk2OOiDbpYozushez3BMYZZO+1QI8z9/FeLJpqlOmk
	4jjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=mVa/+mOQujOe/6hgFNzJSKSPjdM0RSqd0hZOo8emfVk=;
	b=ITvN1N3bBu6K5jUHiTDkXp4aNut6WN2pdT47rafu2vmpDSOfI9r4SQ5lFfSMYoGQpG
	wT61V+NHAskIAYazO6CT3SDyBlvuXcza0+P1wl4pW1NQjJQkPsAcm4kRIs/EP3Exbx0+
	MLJdQsjWrDzCIoiLz/GXMhg+iRYSYhlAXDLGgUaj+Wf8y6QQrAzqeFi07jl4zUMl1rIm
	Ews9Um7K75oHZ+EL3eFoHZ5gxOVFEBdGdoTxuQVSFAGHLyslwCMCRZ4LbT5f7i2qZe9p
	UENkBuniWr7SWprgRPRvTVr46lYXx6aYI42Yg5CKs7C910sOlh6GPBpbi81IB47UM4dW
	Sz0g==
X-Gm-Message-State: ALyK8tKgGBAI8DjOXcbu4xCFPeFmVrTlWNTlRzhqteqiw4IRSksdFSzl6eKa4yygfCR+bPrlvzCQSr4upIu4uw==
X-Received: by 10.55.107.132 with SMTP id g126mr3531444qkc.152.1464097782005; 
	Tue, 24 May 2016 06:49:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.130.196 with HTTP; Tue, 24 May 2016 06:49:12 -0700 (PDT)
In-Reply-To: <CAJTo0LZEcWDsN=S+RhdNhaFBxoNNJqnDUG4RT32NRZ=s2kg0mg@mail.gmail.com>
References: <e889a21f09e4bcbddd05ee90a914600d33540dfa.1462489051.git.chris_larson@mentor.com>
	<1463763860-4124-1-git-send-email-kergoth@gmail.com>
	<CAMKF1sozc-Xjvd_CPAT5DEeE=oNmqRnWV+qk0QDuq+4S=rk0Wg@mail.gmail.com>
	<1464010266.3095.41.camel@intel.com>
	<CABcZAN=Zcm901n3Lvffh2y6aUqmLtHOWz=rx5ztQK2x26cVQ1Q@mail.gmail.com>
	<CAJTo0LZEcWDsN=S+RhdNhaFBxoNNJqnDUG4RT32NRZ=s2kg0mg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 24 May 2016 16:49:12 +0300
Message-ID: <CAMKF1socrhORWjJVh2bFHXJ+b6MDXTm5LpY47RXPwDKW31pghA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv3] mkelfimage: obey LDFLAGS, sort out HOST_ flags
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
X-List-Received-Date: Tue, 24 May 2016 13:49:42 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, May 23, 2016 at 11:07 PM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 23 May 2016 at 20:59, Christopher Larson <kergoth@gmail.com> wrote:
>>
>> I'm not opposed to reverting this, as the issue being fixed was clearly
>> not as bad as this result, but I'm completely unable to repro this for
>> beaglebone with meta-ti, either with the internal toolchain or the external
>> sourcery toolchain. Was this with clang, or some specific toolchain version?
>> Or perhaps ostro is doing something special there?
>
>
> Ostro enables the security flags, which impacts the linking.

Same here. All my testing is with security flags enabled.

>
> Ross
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

