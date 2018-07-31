Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f43.google.com (mail-oi0-f43.google.com
	[209.85.218.43])
	by mail.openembedded.org (Postfix) with ESMTP id 2C4AC607E0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2018 07:27:56 +0000 (UTC)
Received: by mail-oi0-f43.google.com with SMTP id k81-v6so26101423oib.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2018 00:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zs+1i4uHwk3ReDlCcyi4RuwZdD54dldPYpFC+L5ETNk=;
	b=xDEmTSfZ0W/zu2mX/WOO9VY/OHfiXtUZP9gYoiBkTKSChriFKfRxbS2M1i0LlQDkFD
	WIq6MQQFcz9yBy+/XTVjyL8yj+UcPfUPX7uEfotaIE9NS+nPxTBIjFJuYfidr9PBEheO
	yQ/8KDBFk01SXHmpGWGkk1qCzs6UfmAoxckiPdgh7jLE6i5he/w4U5c7DLj4kW8XaRpH
	iIJZ2wlGBJjzzFsWlbtHd3nHhed3Jb9CbxKN7SVuGa+TJj8WECcUs/wcfs22mszDPTuZ
	CKdHz/F0GikWtab/byBjlmC7eZ1VNvGCo1Ua1WYBUicYLGTKfjUhj2ns4iV9i0D9Lr6V
	126g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zs+1i4uHwk3ReDlCcyi4RuwZdD54dldPYpFC+L5ETNk=;
	b=DR03kNyay13J3tqo+AiEsx6N6rJEZXG+a5KsHyb888xsqhkxFi7Z2zz5DI+wgOEwra
	pl2FP13PkORqd7SB5utYu9YyQXz9PDMLMbJXG/zTQ9/VPFEpJW3h3jQgCUoNGsLZbEWq
	aPXNVoq76u7h6HuDJpVZOKYgHc2DcsWXdXyipeTCGwaLwkTwfvvPVxmq5nUF6noDjSB9
	5mKJNhlIlJMyYxkbqjIcyV5TAVmaO8amnbShwHUDwzQoFSCHlDEu8kj1il1d5Vb6mLaF
	385f2aqG4LqSEacjvdggnelIBZyYFJWiWQ9i4VNI/FP0lmlCMbHbZ/1b6NjjjmfuToxq
	ElEg==
X-Gm-Message-State: AOUpUlGrziY6g36cUB5QnubLqbQ+ORN/It4f8M3ox7wjKtXSjlEPQAuz
	3Es0aqOB0TLIGtP3qBps6ce3fpMJo7Ydrb34cOpb0A==
X-Google-Smtp-Source: AAOMgpezLn/BXDA1WiROVW3RAowk9Btl4PLMYPsXebEDw98qqhkU7nW9+eUbh1scmJAUiMY7nh/3BZ0QTlwyVlCNAqY=
X-Received: by 2002:aca:f409:: with SMTP id
	s9-v6mr22512308oih.102.1533022077266; 
	Tue, 31 Jul 2018 00:27:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:6845:0:0:0:0:0 with HTTP; Tue, 31 Jul 2018 00:27:36
	-0700 (PDT)
In-Reply-To: <CAJ86T=WuS3DBEYkLqrKACKdWQT9CZw6=_LLQj1KWFh3TzFjEcQ@mail.gmail.com>
References: <CAJ86T=WuVBc-WEE4+fKSd_qeTKJmd1VTmRGvB03KXqTZvB031Q@mail.gmail.com>
	<44b28ecdf9da3f1edab59861a7b32c4e11d0eead.camel@linuxfoundation.org>
	<CAJ86T=WuS3DBEYkLqrKACKdWQT9CZw6=_LLQj1KWFh3TzFjEcQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 31 Jul 2018 08:27:36 +0100
Message-ID: <CAJTo0LbPF8k0-LjYxswQtWtfk2SEGmyse+=FUwbe=1kV_EE5FA@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: Is a dependency on hostperl-runtime-native actually useful?
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
X-List-Received-Date: Tue, 31 Jul 2018 07:27:56 -0000
Content-Type: text/plain; charset="UTF-8"

On 31 July 2018 at 02:06, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Mon, Jul 30, 2018 at 3:23 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> On Mon, 2018-07-30 at 14:44 -0700, Andre McCurdy wrote:
>>> Currently the openssl 1.0 recipe defines a dependency on
>>> hostperl-runtime-native and the openssl 1.1 recipe does not. Both run
>>> "perl ./Configure ..." as part of do_configure().
>>>
>>> Since hostperl-runtime-native is included in ASSUME_PROVIDED, is it
>>> really useful for the openssl 1.0 recipe to list it in DEPENDS?
>>>
>>> ie is the openssl 1.0 recipe being unnecessarily complex or is the
>>> openssl 1.1 recipe being too simplistic?
>>
>> It is useful for things to list their dependencies and we did have an
>> effort to actually list things out so we know ASSUME_PROVIDED is
>> correct. This means we can spot areas we might be able to trim back
>> dependencies (amongst other reasons).
>>
>> With the introduction of HOSTTOOLS, its perhaps less needed than it was
>> but in principle it is still useful to know which things need a given
>> item, particularly where its more unusual. I'd still be interested in
>> trying to cut back HOSTTOOLS a bit more.
>>
>> The 1.1 recipe was pretty heavily cut back, probably too much so based
>> on some of the patches we've been getting...
>
> Thanks. Is there an obvious reason why both recipes shouldn't be using
> perl-native rather than hostperl-runtime-native? Building with
> perl-native seems to work fine.

Because using the host perl means not depending on perl-native, which
should only be used if we need to run a module that we built.

Ross

