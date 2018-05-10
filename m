Return-Path: <danismostlikely@gmail.com>
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3AA73751CA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2018 15:47:49 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id z142-v6so3651665lff.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2018 08:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/5HbTUWXnBFTaEejB0gapaXOlOWtxonbJ6NZQvp3Rk8=;
	b=vCkE8NemJLxjW2ilgxtAQ0/KUegpr9AzW66DsZ24uXW2eiDWC8ol2XGPVyQ8j7ZgJL
	AlKf9i6HK8FQaD22WXZprA3WBn84bY881U6x3JIzVx5szoGckElIMDKQiF8vm2vsgCaM
	LjgB0sJ0pl0xEojU6xduAKyxjgidI5NPyZzsgQ6BW7+RWUFsDhYzQgAondLqWg3dRlj6
	TyI5kFlM1Xoj8FnFnDtL+yi5ZV9syIJW2oMh6NdtRXxMjIiPbfoq5+8y2Y1+sJaexnM9
	PTjeh/B+1g9aFB+gC06SxB+c7MAwPyhkwQT5vVS17CO6QNQISoIwneEpgLtD8wSlg3Qf
	N5xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/5HbTUWXnBFTaEejB0gapaXOlOWtxonbJ6NZQvp3Rk8=;
	b=QC3DloJxoFiVeeexcpLoRco4+war8JrHAHzyr1txhKn2B6i+brdOYE2DMp+7+HBjCE
	9S+LBiCNgobLuP3iS4XEQh3vJJG9Mu8Evyy11sepVdtKOtQC3Lp2xsX3FgoCAb9HFnfV
	ibO2VV0rNHHfzf38X/pWCHid6jK4HCW6Ss2xBsZhfILkbK2FQ6RE76JhDWnrC+TtPZ11
	CbbJsEDT3neGTwP1pKtIBoF1ZfuW/IAA9V2VsM3MQ33Tt4o082iOOqPbgrKyjB5ZFYRm
	NlvTHN18ASMpc2Xfnv+k4E5JEAXrpQalZuJt2UNXUSFg/SVo8aVxVFUbLksHH4MChGy+
	QjBA==
X-Gm-Message-State: ALKqPweT5Tc3aaiAM6TVorQaLBHEQaX9oBt8Szh+rBpGJB7S7uxWxne6
	01S/qfFLkX1dUcGM9n5OBGzuNcasHGfk7ZrcVgs=
X-Google-Smtp-Source: AB8JxZphwqBeG3RMMPRvZn0yLjyWHg5c/P6jPtTxJBJkMZ4FN4kZpFctJZPVLeWgTR0Hq8yBVkRL8ueNSMcu2x6SdLg=
X-Received: by 2002:a2e:300c:: with SMTP id
	w12-v6mr1606506ljw.98.1525967270540; 
	Thu, 10 May 2018 08:47:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a19:380e:0:0:0:0:0 with HTTP; Thu, 10 May 2018 08:47:49
	-0700 (PDT)
In-Reply-To: <86e5dada-7bd6-5cbb-95ff-0bf9ccdf0e1e@gmail.com>
References: <1525922097-15292-1-git-send-email-armccurdy@gmail.com>
	<1525922097-15292-3-git-send-email-armccurdy@gmail.com>
	<86e5dada-7bd6-5cbb-95ff-0bf9ccdf0e1e@gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
Date: Thu, 10 May 2018 09:47:49 -0600
Message-ID: <CACS+7ZSzjg6f3jpEk+BHAs7XbmUGiPZN_P4HYcnNWvmvjKpYQw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] bitbake.conf: drop _build-${BUILD_OS} over-ride
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
X-List-Received-Date: Thu, 10 May 2018 15:47:50 -0000
Content-Type: text/plain; charset="UTF-8"

On 9 May 2018 at 23:44, Khem Raj <raj.khem@gmail.com> wrote:
>
>
> On 5/9/18 8:14 PM, Andre McCurdy wrote:
>>
>> Building on a host OS other than a recent version of Linux is not
>> recommended or supported. Drop the historical _build-${BUILD_OS}
>> over-ride to avoid giving the impression that other host OS's might
>> be supported.
>
>
> if this is not causing issues, I would suggest to keep this in.

I'm with Khem. meta-darwin and meta-mingw are things, even if they
haven't been updated in years. If interest arises they shouldn't have
too many barriers to starting development again. I've also started to
attempt to build on a FreeBSD host.

>
>
>>
>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>> ---
>>   meta/classes/cross.bbclass  | 1 -
>>   meta/classes/native.bbclass | 1 -
>>   meta/conf/bitbake.conf      | 2 +-
>>   3 files changed, 1 insertion(+), 3 deletions(-)
>>
>> diff --git a/meta/classes/cross.bbclass b/meta/classes/cross.bbclass
>> index 4e85cab2..34d7951 100644
>> --- a/meta/classes/cross.bbclass
>> +++ b/meta/classes/cross.bbclass
>> @@ -37,7 +37,6 @@ CPPFLAGS = "${BUILD_CPPFLAGS}"
>>   CFLAGS = "${BUILD_CFLAGS}"
>>   CXXFLAGS = "${BUILD_CFLAGS}"
>>   LDFLAGS = "${BUILD_LDFLAGS}"
>> -LDFLAGS_build-darwin = "-L${STAGING_LIBDIR_NATIVE}"
>>     TOOLCHAIN_OPTIONS = ""
>>   diff --git a/meta/classes/native.bbclass b/meta/classes/native.bbclass
>> index ad7e98a..ddccfe2e1 100644
>> --- a/meta/classes/native.bbclass
>> +++ b/meta/classes/native.bbclass
>> @@ -44,7 +44,6 @@ CPPFLAGS = "${BUILD_CPPFLAGS}"
>>   CFLAGS = "${BUILD_CFLAGS}"
>>   CXXFLAGS = "${BUILD_CXXFLAGS}"
>>   LDFLAGS = "${BUILD_LDFLAGS}"
>> -LDFLAGS_build-darwin = "-L${STAGING_LIBDIR_NATIVE} "
>>     STAGING_BINDIR = "${STAGING_BINDIR_NATIVE}"
>>   STAGING_BINDIR_CROSS = "${STAGING_BINDIR_NATIVE}"
>> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>> index a772cab..702f498 100644
>> --- a/meta/conf/bitbake.conf
>> +++ b/meta/conf/bitbake.conf
>> @@ -735,7 +735,7 @@ DISTRO_NAME ??= "OpenEmbedded"
>>   #
>>   # This works for  functions as well, they are really just environment
>> variables.
>>   # Default OVERRIDES to make compilation fail fast in case of build
>> system misconfiguration.
>> -OVERRIDES =
>> "${TARGET_OS}:${TRANSLATED_TARGET_ARCH}:build-${BUILD_OS}:pn-${PN}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}:${CLASSOVERRIDE}${LIBCOVERRIDE}:forcevariable"
>> +OVERRIDES =
>> "${TARGET_OS}:${TRANSLATED_TARGET_ARCH}:pn-${PN}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}:${CLASSOVERRIDE}${LIBCOVERRIDE}:forcevariable"
>>   LIBCOVERRIDE ?= ""
>>   CLASSOVERRIDE ?= "class-target"
>>   DISTROOVERRIDES ?= "${@d.getVar('DISTRO') or ''}"
>>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

