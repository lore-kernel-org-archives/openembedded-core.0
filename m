Return-Path: <ulfalizer@gmail.com>
Received: from mail-ua0-f194.google.com (mail-ua0-f194.google.com
	[209.85.217.194])
	by mail.openembedded.org (Postfix) with ESMTP id F2B5671A53
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Oct 2016 23:02:34 +0000 (UTC)
Received: by mail-ua0-f194.google.com with SMTP id 49so98912uac.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Oct 2016 16:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=QKDuQTn0ZwwwI213QQYqKRQYeVCWGoPftufViDxhx6I=;
	b=wucakKIpbkWUGIin19Q2CoTKtZGvCUeKY8JnZSe6a6QCi2RJKUjxBiv5jIWA4J74Tl
	JK9NfGlM6olL3OD+vt3gIxMYs3ierQ8ZBI1NdQTe9ENdxor+nXeWSiNj8Pnpjoy4soa7
	ERslj6099pKmdjmH27DBIlISweuTYr9KbNxENXDRDWvtY+bbXOioPZkcEP5n1pUPJn+F
	Rq5MkLzkomO8fTM/YzycStOiquM3P6yVd3JMMoUIPGw77sBrM6UyMsm005VSGfd/tNjs
	28mzkPp0H3Sp3gGsBquNvTKkxnJEGdd6mTjhUWX+xGmw4pL1nYsmdAJQuvAPfjUTm0yg
	+BiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=QKDuQTn0ZwwwI213QQYqKRQYeVCWGoPftufViDxhx6I=;
	b=mIbr1avFKYgifNE9ENhkZtJ5dV646PLX9iD9XiyVhIOeUPqKSae8yScersFtnaTxRy
	2B5h9jY/iiXS+RWAcBXl96x+bpE97g5J2D+LVhuDYjg7bcuPs6BNZmZcaT1KNMtungSI
	9kC31JxwIsciH9lwL8TpIM8bfyMg+hRHiucem50ln1HdnBpTJeD2UGUb9lFRtW94wdqs
	qTW2+9Z8oBlZa08ctQ+FFh3I7d+VXwK7jEI/3cw8FaCtix45pj1sRS51+e9SQyM5nA7h
	zj94yfGFXBDv8tzYxGKJXPWDqIweuzEKAqCH+OzZ0WT0E+Zok0ckzd4rVSRqP3SeTO1U
	Gsyg==
X-Gm-Message-State: AA6/9RnM9EIlAdxjyDwo37o3l/seunW9niBeTt+mePHkGEPB0PN8MCficdcrOdyssMBlnJ65OWe9ygqEBcUk/g==
X-Received: by 10.159.39.227 with SMTP id b90mr8848320uab.60.1475708555865;
	Wed, 05 Oct 2016 16:02:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.140.8 with HTTP; Wed, 5 Oct 2016 16:02:35 -0700 (PDT)
In-Reply-To: <1475705707.30475.498.camel@linuxfoundation.org>
References: <1475290031-20568-1-git-send-email-ulfalizer@gmail.com>
	<1475290031-20568-23-git-send-email-ulfalizer@gmail.com>
	<CAFkk2KQHNzLOTfMPf_-V+a+2W1Rp81t7VmbstpsOJq=hXYH3PQ@mail.gmail.com>
	<1475705707.30475.498.camel@linuxfoundation.org>
From: Ulf Magnusson <ulfalizer@gmail.com>
Date: Thu, 6 Oct 2016 01:02:35 +0200
Message-ID: <CAFkk2KTm7GugFc4+TZX-eDBPPqaNL+RNed8rNvmAPTsk3cwDdw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 22/22] cmake: Use bb.fatal() instead of raising FuncFailed
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
X-List-Received-Date: Wed, 05 Oct 2016 23:02:36 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Oct 6, 2016 at 12:15 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2016-10-05 at 22:26 +0200, Ulf Magnusson wrote:
>> On Sat, Oct 1, 2016 at 4:47 AM, Ulf Magnusson <ulfalizer@gmail.com>
>> wrote:
>> >
>> > This sets a good example and avoids unnecessarily contributing to
>> > perceived complexity and cargo culting.
>> >
>> > Motivating quote below:
>> >
>> > < kergoth> the *original* intent was for the function/task to error
>> > via
>> >            whatever appropriate means, bb.fatal, whatever, and
>> >            funcfailed was what you'd catch if you were calling
>> >            exec_func/exec_task. that is, it's what those functions
>> >            raise, not what metadata functions should be raising
>> > < kergoth> it didn't end up being used that way
>> > < kergoth> but there's really never a reason to raise it yourself
>> >
>> > FuncFailed.__init__ takes a 'name' argument rather than a 'msg'
>> > argument, which also shows that the original purpose got lost.
>> >
>> > Signed-off-by: Ulf Magnusson <ulfalizer@gmail.com>
>> > ---
>> >  meta/recipes-devtools/cmake/cmake_3.6.1.bb | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/meta/recipes-devtools/cmake/cmake_3.6.1.bb
>> > b/meta/recipes-devtools/cmake/cmake_3.6.1.bb
>> > index 67ba9c4..850d6de 100644
>> > --- a/meta/recipes-devtools/cmake/cmake_3.6.1.bb
>> > +++ b/meta/recipes-devtools/cmake/cmake_3.6.1.bb
>> > @@ -14,7 +14,7 @@ python () {
>> >      docdir=d.getVar("docdir", True)
>> >
>> >      if not docdir.startswith(prefix):
>> > -        raise bb.build.FuncFailed('docdir must contain prefix as
>> > its prefix')
>> > +        bb.fatal('docdir must contain prefix as its prefix')
>> >
>> >      docdir_stripped = docdir[len(prefix):]
>> >      if len(docdir_stripped) > 0 and docdir_stripped[0] == '/':
>> > --
>> > 2.7.4
>> >
>> Thanks for merging these!
>>
>> There's now some documentation that mentions FuncFailed as well:
>> https://www.yoctoproject.org/docs/2.2/bitbake-user-manual/bitbake-use
>> r-manual.html#bitbake-style-python-functions-versus-python-functions
>
> It did break one of the tests in oe-selftest but we've fixed that...
>
> Cheers,
>
> Richard

Sorry about that. I wasn't even aware of oe-selftest until now.

Yeah... the format for fetch failures changed slightly.

Cheers,
Ulf

