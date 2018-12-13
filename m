Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by mail.openembedded.org (Postfix) with ESMTP id D9E4F6C4C9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 16:41:36 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id l10so2046056lfh.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 08:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=QIneWhKkQ/R85jS4UQyA/x8Ev04KXbvwjCJ2kj+oJSA=;
	b=DoKGqGHG86vF6WMCYlR9eKBWmoUyYipu0Uw4ZUK6gHKzEkpQo05QqN5lXeu0OCMZ7H
	WfoiSTlcN1WT5Vwc8Ltqjd5J7WoNXhvlYAY2DsUPLNgFtxG6XhILG6Cfku2hFLWGpVLD
	F2i38O4dhPcc/g3ertQZXH9vqGft1vqBHmmWaeDqMAO/64v0HfjRB/4z8b2LFt2sgQQ4
	Hti/GNkfIQsvfBFn0luJK2eX3amxzgzI7+sjdU03KedQL/rtI+hRcbBwEZSenCBe/uJG
	BiZ7GR6Li8GUzrtBBdCEABKc0Ee0NvjmdM7Q+IfQiKteSYFlISSP7b9ZNAZx2KY486Fh
	ldpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=QIneWhKkQ/R85jS4UQyA/x8Ev04KXbvwjCJ2kj+oJSA=;
	b=ZnQpmlAf5Co+Cy4QqjOr0UWwKPAPYgyULpI5KnKGzpdaQQjrDdmR0KAhQvibyYb7pE
	TNsHSQKFBK/LQNeWfnUv2OjLhp62RjBMoqDHtCuL4kFuGDpClhmXbU3djT7RmOnyrBe2
	MF5wfLNn2iVfOPsX3OIN3nodJtOUJ4C7WFg4sPUmVDpQslLIC0s/GQDlIDpX9lTDlcOK
	jLyThFUKGn+2MPKjGNtKCb2T6ITDCKu11Hmyonf27lSpwU0OeU/aqzMwecSXT9Ya/3/B
	/TuNMRGwBnb9pGV1mg9E6meDBg0RuPzw2PPsGKXkdaGh6fX9HI+9IAEycNV6nAdJIRXl
	s2Eg==
X-Gm-Message-State: AA+aEWZnF2RsCKF3VS35kIT3kA38n112ycDTrvTdfyV1PonEtZ40jUxn
	BD7GVRFsVkQSQn+Bfhqo8bN9gaHX2VKGWCoijUI=
X-Google-Smtp-Source: AFSGD/VcU2jPyVKK9ZSwKg9ifxkrHXFXNVwVL12BX+IUgzioVsS8LnqiQIC43naMiPCt5azm/g5rLO+7QqkDXKzsFfw=
X-Received: by 2002:a19:910d:: with SMTP id t13mr4646885lfd.98.1544719297287; 
	Thu, 13 Dec 2018 08:41:37 -0800 (PST)
MIME-Version: 1.0
References: <CAPybu_0YGwMPD1N4kfN0KUb6snAowee6MfN2+tJNVaHqrUddrA@mail.gmail.com>
	<17edc46703e7423f1a730bdea6cc3f0e1877d9d6.camel@linuxfoundation.org>
In-Reply-To: <17edc46703e7423f1a730bdea6cc3f0e1877d9d6.camel@linuxfoundation.org>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Thu, 13 Dec 2018 17:41:20 +0100
Message-ID: <CAPybu_2uF6YPM+74Afne3_NPJg8LCdaF3BsgdR=yjQJRUO6i9w@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Multiconfig and native recipes
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
X-List-Received-Date: Thu, 13 Dec 2018 16:41:37 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Richard

Thanks for your fast response
On Thu, Dec 13, 2018 at 5:19 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2018-12-13 at 16:19 +0100, Ricardo Ribalda Delgado wrote:
> > Hi
> >
> > I have a setup with 3 multiconfigs
> >
> > If I try to build:
> > bitbake  multiconfig:*:erlang-native
> >
> > Bitbake executes 3 tasks on the same workdir
> > tmp/work/x86_64-linux/erlang-native/
> >
> > which of course crashes. Is this expected behaviour? a bug? I have a
> > wrong config?
> >
> > Thanks!
>
> You haven't said how your configurations were different.
>
> With multiconfig you have to use it responsibly and a little caution.
>
> It sounds like you're using the same TMPDIR for these builds but the
> builds are differently configured. That wouldn't be expected to work.
> The builds can only share TMPDIR if the configurations are compatible
> with each other (same DISTRO type config, different MACHINE for
> example).
>

That is exactly my usecase. I wan to build for all the machines with
exactly the same distro:

ricardo@neopili:~/curro/yocto/europa/build$ for a in
conf/multiconfig/*; do echo $a; cat $a; done
conf/multiconfig/inteli7.conf
MACHINE = "inteli7"
conf/multiconfig/qt5022.conf
MACHINE = "qt5022"
conf/multiconfig/qt5506.conf
MACHINE = "qt5506"

I am now trying to hack bitbake/lib/bb/cooker.py to convert all tasks
multiconfig:*:AAAAA-native into AAAAA-native
it might not be the final sollution, but maybe we can use it to
discuss further options.


> Its hard to be specific without the configuration though.
>
> Cheers,
>
> Richard
>
>
>
>
>
>


-- 
Ricardo Ribalda

