Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f179.google.com (mail-ie0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id E68AC6FE41;
	Tue, 29 Jul 2014 00:41:46 +0000 (UTC)
Received: by mail-ie0-f179.google.com with SMTP id rl12so7422102iec.24
	for <multiple recipients>; Mon, 28 Jul 2014 17:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=CEaIV9sJ2Fxdu0RjQkFVW1PEaj82mnQNf64kOTLfGuc=;
	b=k2MJRwV1Q0GiKvtvaPQZTsBl2c/U439MVpbL+IJPj+qnSt2450qQyWRgIQD7l1IeIM
	aJ0dmkhdcynOZ4oB5a5WU3R/ZuhamXno0UW5pTb1V6hWy/BerbDB+7TDRPFyZx1NC9Pu
	scqFkrtBANdc1mBLFUE0+41EeBAkMqyNcUWuV8SPh1DyzSqHJMMaG3X4Uad3p9Vf6kyj
	idv1cGnaSZiaNnBtfpA+Hwy2IhNFll3X9OtmJzW+hB1VNTshGbFsNYmZIcdtZtUbAZVu
	Vz+hnHxeAOqEQ5706NAe8lpsF36H2AezPtHGwdPmVw4vYmBvrmJcMg/rb6VJZ5qmBU9i
	phgg==
X-Received: by 10.42.90.74 with SMTP id j10mr770776icm.29.1406594507024; Mon,
	28 Jul 2014 17:41:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.78.105 with HTTP; Mon, 28 Jul 2014 17:41:16 -0700 (PDT)
In-Reply-To: <53D6EAC1.2030802@mvista.com>
References: <53D2DE13.9010007@mvista.com>
	<CAMKF1son3T9fsuF9X0Px4hirfk7Ezguy4s5Zit6-0JvfmXDV5A@mail.gmail.com>
	<53D65F40.7010701@windriver.com> <53D6EAC1.2030802@mvista.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 28 Jul 2014 17:41:16 -0700
Message-ID: <CAMKF1sqs+WMPnctwwZ7-BkR6VvMjFSxPO2q=7Oz2wyQ5cWVMsA@mail.gmail.com>
To: akuster <akuster@mvista.com>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: libpcap-ng
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
X-List-Received-Date: Tue, 29 Jul 2014 00:41:47 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jul 28, 2014 at 5:28 PM, akuster <akuster@mvista.com> wrote:
>>>
>>> I think at very least you can propose it for meta-oe if not or-core.
>
>
> I think core libcap-ng recipe belongs in a common layer and not maintained
> in two places.

yes meta-oe is kind of extended common layer besides oe-core, if it
can be proven that we can drop libpcap and replace its use completely
with libpcap-ng you might have a better case to include it in oe-core,

>
>
>>> But I also wonder why meta-selinux is not a sub-layer under
>>> meta-security,
>>>
>>
>> meta-selinux existed first... no other reason.
>>
>>
>> The last time I looked at meta-security (well over a year ago), it
>> wasn't terribly useful.
>
>
> Well when a security package like 'snort' and maybe others are in other
> locations, I can see why meta-security won't be very useful.
>
>
>  It was just a random collection of
>>
>> security-like packages, some worked, some didn't.
>
>
> Hopefully that will change.

