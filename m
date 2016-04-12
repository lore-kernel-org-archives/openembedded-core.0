Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 56F3C65CBB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 00:32:24 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id a140so1350375wma.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Apr 2016 17:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=z6Xwoo2y8AhwWy33egLRkUFJdIWSf9flbED/V7Agy3Q=;
	b=uBZ1FQ3MMZRapdV/lUKVV88Kl1qVLxXHLCN0fh9u24MbJEBpNx45u1aIuW4+RVW60S
	eYC0c3q2BzGCWIRvaBR6KdNECJwHspLto4YpqMpIdz/4X7GOnH9xtJdQzKG4sq2eVzDN
	ApdgsWrDpYHwimYND48VnXWgLwD+RxgenxNjqwud+tu6dcz58P7DGYbH4McbR2L9ssco
	s0K8bw2aeVBDP5SohFwFnmQ6BISYEm8vwtJ1y0d5SY/98V8h5RjlxcIdtR4KRMCB/Yif
	PQHEp9JEYmLJxcBpEw6pHmkm45uMv00ZESW/02eeUlFaalx9cWfQalH6eKqZ6pQZX9A3
	enWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=z6Xwoo2y8AhwWy33egLRkUFJdIWSf9flbED/V7Agy3Q=;
	b=W2MosC9sydBvolXhWZpPDNfq+4Ewtou4zAz4RE9VU/JRBxxbOLai5q9FcS1x8VJguZ
	bpLqcRVOQNYvSKiPjcHgZoZXTgQFj4p0gBoQXTKIJWi09gYV6oI81gxu21l74pFTO7DU
	WRuwOmA378VYeq2+GV4e5buCcs9UJ+kFfDf+ge3nruw2TyatEnZSyE7kpmpVC7ILPnFF
	SrWc+EUBSnMF/AMEsZA0RFwEAtWa86p/wu8uU4H5zU99S8Yomzr+qascZhUPZ0ULY4gi
	14/LIrz1WYrjQRzr6q7z/ViSOzBZ8wdCZ7CsVj5YKVY1q3YRvdrVhD/+aXS/EoXJglBd
	GUww==
X-Gm-Message-State: AOPr4FV1uuzj2tdgL6duh4L5j+hGH03kPwGue/+4Dyd6zuBFpaYzjZ0Fkhb3t6RfJKpD7CgzQQx15KewIgaOuA==
MIME-Version: 1.0
X-Received: by 10.28.173.137 with SMTP id w131mr5259560wme.72.1460421145413;
	Mon, 11 Apr 2016 17:32:25 -0700 (PDT)
Received: by 10.194.201.104 with HTTP; Mon, 11 Apr 2016 17:32:25 -0700 (PDT)
In-Reply-To: <CAJ86T=UO6JrOUVsjN=d56DN5TvuOG6jDNh9G0QEiAdzTNivLWg@mail.gmail.com>
References: <cover.1460085139.git.liezhi.yang@windriver.com>
	<a9ea8a660f37bbcf917c71360512ab155241114e.1460085139.git.liezhi.yang@windriver.com>
	<CAJTo0LY9PMgCJXqAL8qw=u37UyTo+o=ykzGdb8Vv_4w+5O58ag@mail.gmail.com>
	<CAJTo0LZkC4Q22PNMKnjSA97v-7T1yxvne6kraBydNS9-PVOqjQ@mail.gmail.com>
	<CAJ86T=UO6JrOUVsjN=d56DN5TvuOG6jDNh9G0QEiAdzTNivLWg@mail.gmail.com>
Date: Mon, 11 Apr 2016 17:32:25 -0700
Message-ID: <CAJ86T=U-kXfqEcRU31yr2U0ZE=tVzjUUxOJE3L8_L1B739Ht6g@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] pbzip2: fix for rebuild
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
X-List-Received-Date: Tue, 12 Apr 2016 00:32:26 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Apr 11, 2016 at 4:43 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Mon, Apr 11, 2016 at 7:48 AM, Burton, Ross <ross.burton@intel.com> wrote:
>>
>> On 11 April 2016 at 15:46, Burton, Ross <ross.burton@intel.com> wrote:
>>>
>>> Wouldn't "oe_runmake clean" be simpler?
>>
>> Or not disabling do_configure in the recipe, as base.bbclass's do_configure
>> includes an invocation to make clean.
>
> Since the bzip2 source files were changed, updating bzip2's PR (r5 ->
> r6) to force a full rebuild of pbzip2 might be a more robust solution?

To answer my own question, updating bzip2's PR doesn't help. It's the
pbzip2 recipe which needs fixing.

> More curious though is that after cleansstate, pbzip2-native doesn't
> build for me at all - the LIC_FILES_CHKSUM is wrong following the
> update from pbzip2 1.1.12 -> 1.1.13
>
>   http://git.openembedded.org/openembedded-core/commit/?id=80712b7c0959c197ccb21efd5e7a963d1d2e83ae
>
> ???
>
>> Ross
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>

