Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5789778303
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Oct 2017 20:02:32 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id j3so5149995pga.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Oct 2017 13:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+5x+QA07TUgLR4EFeRqYn4MCkA67BsFB7121k9MBkxI=;
	b=uOcHxlkOqesfKqa6tyD8aiTYWuxtkxe55JAP1OnmDMSSHG24cC1UM86vAWfbFRJ3la
	a0TVR18SqfaEKZCxOqKKgpa1yVADbYPZbcOTsKdm66E75n6LPbYOoOBSFpL7Aa3fYXGP
	JhO0D8WuDDxmlRxznOU2MqdpfowjwISz8hT/D1cDz8O2qE9Syk10dV0fOhE++pwI6QQq
	mkPkVA2abQMVQ1nGr6jzSRvTHFsCD4YfrkfTNB5w9A8o72heCHWPRldwiG9PQnvaH/9m
	SnMi/W1LxOKqon+lCBRRdey3vR+QlsSRhUqRqElhwQ/p4HCKO/qsfo9T3N9AHlEuH5OM
	ubNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+5x+QA07TUgLR4EFeRqYn4MCkA67BsFB7121k9MBkxI=;
	b=m8372BWZZxrNy3D1YF1rFBX6t9YS5AqKZOvv1yrXUZ3josLVRsanPwBN17UuEoZ6aD
	JDJ6HXsthi96CN0Vmeco6T027hh4+yRTYd7FR5gj4VxHrR9RyWY0r0Hj0qFS51Flj4h8
	0nvHiDtI3qRrvOrdB9BYfeOHSc8nmxOTvYE+5hwCFhvEykSLewC628mM0cbAHuuWGADk
	pFIlLZwQVoP5HPi41t9DOnRB7hxbaFqmupPzRHRNt2CWz2TtsEXfIxeGRquHgeqDT72T
	pIlU3GVucPv0ADJZgMNajbU22pFXEUjJOk1A+oNWkYpzPByZwyPZbowbcEbQx/+iYmsA
	tOOg==
X-Gm-Message-State: AMCzsaXCM71jAo4HyRhNEfpIzwRFhdLpILHNg4xCyOCSVwXy7hReC6zX
	gwcy0h7F+FrZxak7x/JrTHQg4XWDEyf2f++qX6I=
X-Google-Smtp-Source: AOwi7QCiEwUFYKUvM7ckiX1y5Qfpy2NT8pbJ2UdmqsLWBCppZqCtXn2FDuF6Ql7zQFM2L33IaTst5XOvJcOS92D7vNI=
X-Received: by 10.84.138.1 with SMTP id 1mr16249452plo.404.1508356953536; Wed,
	18 Oct 2017 13:02:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.187.66 with HTTP; Wed, 18 Oct 2017 13:02:03 -0700 (PDT)
In-Reply-To: <CAMKF1sq0qcqrRt9S2bkZ6QYw+n1Ld4niJStsNRwr_2hL-Du25g@mail.gmail.com>
References: <20171014154858.35123-1-raj.khem@gmail.com>
	<20171014154858.35123-5-raj.khem@gmail.com>
	<CAJTo0LZYB+FTUBLWaFEeyAz3wYMCnr+gSbySYvz0K4d3RwsvpA@mail.gmail.com>
	<CAMKF1spgYS0YcfVrHZ8aUHtFsv90AUQRpT75vvnRvt56K3rkuA@mail.gmail.com>
	<CAJTo0LarSyL9OGCX8SM-7mRE7qmNjq9dROiGAb86mG0vnjyEiA@mail.gmail.com>
	<CAMKF1sq0qcqrRt9S2bkZ6QYw+n1Ld4niJStsNRwr_2hL-Du25g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 18 Oct 2017 13:02:03 -0700
Message-ID: <CAMKF1soD0qJssZgmA19OGrk5Cp55TzFM1Zr=8H=2894oyP3Npw@mail.gmail.com>
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
X-List-Received-Date: Wed, 18 Oct 2017 20:02:32 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 17, 2017 at 5:43 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Tue, Oct 17, 2017 at 1:10 PM, Burton, Ross <ross.burton@intel.com> wrote:
>> On 17 October 2017 at 20:25, Khem Raj <raj.khem@gmail.com> wrote:
>>>
>>> On Tue, Oct 17, 2017 at 5:33 AM, Burton, Ross <ross.burton@intel.com>
>>> wrote:
>>> > On 14 October 2017 at 16:48, Khem Raj <raj.khem@gmail.com> wrote:
>>> >>
>>> >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> >> ---
>>> >>  .../libcheck/{libcheck_0.10.0.bb => libcheck_git.bb}          | 11
>>> >> ++++++-----
>>> >
>>> >
>>> > Why not 0.11.0?
>>> >
>>>
>>> I was getting printf format related security warnings. Latest built
>>> with clang/gcc and musl
>>
>>
>> Not a massive fan of "random SHA", can we cherry-pick the patches?
>>
>
> Sure, let me do that and since the libevdev issue, I might be lucky
> that it was somewhere in my layer mix there were errors.


OK now I see, so many context switches and I forgot. The
issue is actually happening on morty branch, but the fix
should fly through master and eventually land in morty

