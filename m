Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 977BD78288
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 19:41:18 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id g127so35672595wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 12:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zfabXtJ77Fu5VvTT70+CbJ7/nvreiyNZiNl5hFwz/ak=;
	b=WOohk0iWmsC2V1DrpiRJpBIo8MH7efiGsgNk2peWKMqu2mlBntuRtNlBiaY832ixWV
	ih4UW+NlAqx+HdlIkptLb4e+DjVbDLG5pz1TpeToFsJgrbbyi8+m3wbJ32/5h68prAn0
	tuWmF2tp6MDfyyJn9R0zFw/S3FxZaswxsIuhPbYlgkYEW44zqq9wQuWb9suMw0UN7SLa
	CCq2yC3l9oLO7pf1y274Tsg6VXMcabY4+H4BC6MIXc5w2AKPkr+Mxr7uHq2IL+DcBYZe
	vG8ae+5pKu1BaYKoaVspRJ23Bi4zlzJ9FrywXM0MTnVtiKHRw3+yz01GENVTvbTjdCPi
	MuaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zfabXtJ77Fu5VvTT70+CbJ7/nvreiyNZiNl5hFwz/ak=;
	b=WjBu8uMo2a1WkWNZtoe8OtcWOKpwr6zJQXPPCY30UiT/al+uc8GN3AYQDw14bUPlIx
	k2hZXCwIEsVBpNEi6zcZzQQvBHk2vD6t5AKVnMCII3OKzBz5vcq2+mPoI+HNb+DzDc1Y
	v7TLITJBkQ7FF4wTfdsUpwzAckio0e36lDkOB/o7ZUhoA9FkbxQsn5dmRFR1ROX/03tP
	ha01C3iq802y385iMhrNbWAbePjdN7t/Cu78rz7Od8abjzb66/9Pi1gcUMyjYny4U1xf
	DI99T3XEhluGv1g8OIpX8lmqfhIkQz+UZUeuiKNhJi4GqRk4ci7PnPGfNx76sxreoihi
	u5pA==
X-Gm-Message-State: AIVw111BFG+eW4OiaWdxx4CQtuz/QqNW4bnqXnlwfBc+L5qhUI2d7ic3
	QyaLIkCk5v0VxSNiLxSQYIRw2dbcVg==
X-Received: by 10.80.147.197 with SMTP id o63mr3947822eda.194.1500579679346;
	Thu, 20 Jul 2017 12:41:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.149.173 with HTTP; Thu, 20 Jul 2017 12:40:48 -0700 (PDT)
In-Reply-To: <CAJTo0LZ-goETzCb25RXab_ewnSENbcFucUDoEPmo48epdAfAdw@mail.gmail.com>
References: <1500417901-4667-1-git-send-email-juro.bystricky@intel.com>
	<CAMKF1spivq5cRcMDz-uehbqWRUzXyJf6TQ53sOtmFJu+_i1iqw@mail.gmail.com>
	<CAJ86T=XT9yufogwxMbV-0dW1ooYdvy5DOequ_X4fRQ7=nFWdOQ@mail.gmail.com>
	<CAMKF1soRVeHPLh_LFSxpcGG=1u1OcKvMv3yEifihP_Y7Y-eXUw@mail.gmail.com>
	<6E51916E4A1F32428260031F4C7CD2B6119BDF6B@ORSMSX112.amr.corp.intel.com>
	<CAJ86T=XYR9Z=aMO-BAAZYJ2Lh=ZXQy+J5J-LjSuT-n_Hx-1ayA@mail.gmail.com>
	<CAMKF1soYE49jfc-pkYMLgdh5DJVuA0wyLFiA90Z_3OB7i6tUOw@mail.gmail.com>
	<CAKV_0egoE8wJPJGd3qZyePgOS6q0gVzDG-pvPvTpZ5UWQYasYA@mail.gmail.com>
	<CAMKF1srdmXi-uxH9eX2wK2VYXpmCpkTLTvfZxY+5_OZo65Q-Sg@mail.gmail.com>
	<CAJTo0LZ-goETzCb25RXab_ewnSENbcFucUDoEPmo48epdAfAdw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 20 Jul 2017 15:40:48 -0400
Message-ID: <CAMKF1sp8bYF__F+jqZugwav+dzNvv_YGw0j6Nvxv0KgKLdCnRw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-7.inc: add new warning "Wnot-cross-compiler"
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
X-List-Received-Date: Thu, 20 Jul 2017 19:41:18 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 20, 2017 at 3:18 PM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 20 July 2017 at 19:51, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> it does cause harm, by making the behaviour inconsistent and highly
>> dependent
>> upon build host.
>
>
> It *stops* behaviour being dependent on the build host, surely.  The problem
> is that some recipes use the host compiler when they're not meant to be and
> this can cause subtle (or not so subtle) breakage.
>

I think I do understand what it does, all of you dont have to keep
repeating that :), my concern is a bit different as explained. Because
such
patches are sticky forever, if they dont get accepted into gcc, look
at the cross include poisoning patch. If you run it via gcc ml, its
possible
they have better suggestions to get the same thing done.

> Ross
>

