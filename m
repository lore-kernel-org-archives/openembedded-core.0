Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f193.google.com (mail-io0-f193.google.com
	[209.85.223.193])
	by mail.openembedded.org (Postfix) with ESMTP id 098CE6FFED
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2018 18:51:29 +0000 (UTC)
Received: by mail-io0-f193.google.com with SMTP id y128so7883096iod.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2018 11:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=mfjFN+l3mrKIH4pfFQxYgb5hwHyWTxH7lrOaM6Mz/mA=;
	b=za3qt0y9aJANN6K0RHVyIL5GygQ1c98zrqP1IRp885nUUiDhDjoq7b/ldrel45VAXq
	6AXFtXPgEd7Kywtg/wB1/dDzh8VQ2ooEUOfmXnYfdldqWtIv46nGau0iHJKMEvd+shlj
	vnRmBv7GXxww8j35ERIMIoFxtJo9M/V/rVrrWmiNiq/DjInTJ4V5hwiDSrklIG2IbBxS
	UQCeJIwWvKcbRV7/n+6J9tV+86m0mn/D4Tt1shtdgVzahxxNqb6feVKkxKqZMDbUV02q
	xZ6hG8J/sR3GYE0vm2sxDPoLv38WSMhOQ2aRJqCIoqNqoDkwpvD54Qgw/ARDCsO/B+jm
	vI8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=mfjFN+l3mrKIH4pfFQxYgb5hwHyWTxH7lrOaM6Mz/mA=;
	b=sOx6Z8Smuo3zssR+RUzhLXgWQX4MTY5x61WAZLY4oiaIQ+JglFSk/5iKa0MN36SU6j
	koTncm6sXGOh6u8W68DH6uxK8mwK8Y7D2kt7LYI10gxx1dWO1XXuZN8cX+EVvFhCus4C
	tvXo2Vk6YHuzLoP8wwHUbmX7o38k/70JqT8rNAi+tq175mjwZsfrXaHlZF4LsoAGWRrq
	MsooYofhCi2EiD19ClOuQgbjIB3oZ1jYXHZHOQLeIX7dHjxfT+fHHjZy3qVB7nT/Gbsf
	ZEWDZb2wegJgwm+wH63+sWeUPW00aZ9y9Br40IbkZhTEXKox5pFFzePQnSbyMkAFgzl6
	k0FQ==
X-Gm-Message-State: AElRT7HXJVfnwfsGi0MmeElEjkQjNqMCB7pN/pJCTo9hZiSsyNBGP7WO
	tTGSCbvJ+yWMsb7LdL2YKf2Yq1xJgX5zD/I7I+Fs3Q==
X-Google-Smtp-Source: AG47ELtbEQg8hykcjyFzcaSyTVuS0pYs/H7l5HDGsmNaMWQPR4GxaWzJqt55Kt4CK7upDpNV3njCl6ZggIT/0E6mj3s=
X-Received: by 10.107.37.212 with SMTP id l203mr21488709iol.20.1521658290692; 
	Wed, 21 Mar 2018 11:51:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.30.9 with HTTP; Wed, 21 Mar 2018 11:51:10 -0700 (PDT)
In-Reply-To: <CAMKF1srT=6-+Sm5Lf-eFB-8xzrZj4ktgB-TOpHAzW7Gaq97XLQ@mail.gmail.com>
References: <1521617238-23436-1-git-send-email-anuj.mittal@intel.com>
	<CAMKF1srT=6-+Sm5Lf-eFB-8xzrZj4ktgB-TOpHAzW7Gaq97XLQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 21 Mar 2018 18:51:10 +0000
Message-ID: <CAJTo0LbdeWLb0Wy0yCu3VBa=Le+wagxyj7XsGe_-AMqah7z5gQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] librepo: disable building of tests and docs
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
X-List-Received-Date: Wed, 21 Mar 2018 18:51:30 -0000
Content-Type: text/plain; charset="UTF-8"

No, they were not installed.

Ross

On 21 March 2018 at 18:25, Khem Raj <raj.khem@gmail.com> wrote:
> On Wed, Mar 21, 2018 at 12:27 AM, Anuj Mittal <anuj.mittal@intel.com> wrote:
>> Also remove libcheck dependency which was required only for tests.
>>
>
> Does this affect ptest converge ?
>
>> Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
>> ---
>>  meta/recipes-devtools/librepo/librepo_1.8.1.bb | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/librepo/librepo_1.8.1.bb b/meta/recipes-devtools/librepo/librepo_1.8.1.bb
>> index 0324104..4569885 100644
>> --- a/meta/recipes-devtools/librepo/librepo_1.8.1.bb
>> +++ b/meta/recipes-devtools/librepo/librepo_1.8.1.bb
>> @@ -11,11 +11,11 @@ SRCREV = "7b9b7bf388f3f059529c6f50c40b30919fef30f9"
>>
>>  S = "${WORKDIR}/git"
>>
>> -DEPENDS = "curl expat glib-2.0 openssl attr libcheck gpgme"
>> +DEPENDS = "curl expat glib-2.0 openssl attr gpgme"
>>
>>  inherit cmake distutils3-base pkgconfig
>>
>> -EXTRA_OECMAKE = " -DPYTHON_INSTALL_DIR=${PYTHON_SITEPACKAGES_DIR} -DPYTHON_DESIRED=3"
>> +EXTRA_OECMAKE = " -DPYTHON_INSTALL_DIR=${PYTHON_SITEPACKAGES_DIR} -DPYTHON_DESIRED=3 -DENABLE_TESTS=OFF -DENABLE_DOCS=OFF"
>>
>>  BBCLASSEXTEND = "native nativesdk"
>>
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

