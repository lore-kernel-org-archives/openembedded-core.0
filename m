Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 462CE731E7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Feb 2016 21:33:21 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id a4so44611751wme.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Feb 2016 13:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=/Qh5LlPCHxPf4BLNLV63Lmbo1bpzkeQ09E3LHIMVWe8=;
	b=R+ESNECe6KonZv7degTdhK/5NZ9uOZVBa6/k/aAfZBrk+LHx9cdgaeHThNu1ftPaJq
	3hgMjjhPfPH+y0CNdHSi06Q+PDX2Qrfi6uKk2zXK3lh1jgfBLztTxdOt0Syxrqxi2f78
	C2iTJH1eeZYnhC71n9ABnQVRNnJFkChAAz17iklc0c76UNhpbffZUlcNTot0paRLkdf1
	vfHT8CtUqieQ7N9G9NZ3TIiVap42bJmXjTD79XK1UGBHhQP1SghUcXybq5edPYYYOOEx
	w+RNchMlDu7ZQ+KoziqOdgITwJwLMlKCCR2zvuJhkAFzIin/aA4aAx+nSB2lcoDVjWnE
	nOtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=/Qh5LlPCHxPf4BLNLV63Lmbo1bpzkeQ09E3LHIMVWe8=;
	b=fyMD/UczgLDPHxz2yNpOnkYe9aS4XxjLlG2rs+rOo1LWruKT6JQ4XXVVlHym58STm6
	nm47axFd9KxmtVaE8TkwUXpbfvpP2RcR941fd6hFS4pJMtlVcv4aNL6t+gQo0tLI0AV2
	JMu2h0K26ISGWrUbD0ope5RQt/LfMU7U8VKTnQWYk6Nskje4BgRiyOhXa/wPVxVmv/ox
	H8pjPfVzh3cNqr5H4mDIp27ORv7S9F/1FtsnOGvoR8JCV0Rnkp3NTePOxRrfvTlF4Qvz
	Do7WY8VwMDscX4DsP7WT1gUic/Cv6KyPsYCjL9djxKJ8iMD3r6x/QdJ9aVA2Ase2EwUS
	zVWQ==
X-Gm-Message-State: AG10YOTVcS9DMbdIqLt18YkBzvaH/TBNYCFrpjxfboCkvU6nTOtKgQkTBp77rL9OOXoxhwjs19H7XJ2qOIXeig==
MIME-Version: 1.0
X-Received: by 10.28.146.8 with SMTP id u8mr5212093wmd.72.1455831202501; Thu,
	18 Feb 2016 13:33:22 -0800 (PST)
Received: by 10.194.209.131 with HTTP; Thu, 18 Feb 2016 13:33:22 -0800 (PST)
In-Reply-To: <2046956.ogQECgGtmI@peggleto-mobl.ger.corp.intel.com>
References: <1455823285-32028-1-git-send-email-armccurdy@gmail.com>
	<1455823285-32028-3-git-send-email-armccurdy@gmail.com>
	<CA+chaQcvFnZAjNKCsc3xvPq36zPWXK5xrmi+goTonnu-i4j7sQ@mail.gmail.com>
	<2046956.ogQECgGtmI@peggleto-mobl.ger.corp.intel.com>
Date: Thu, 18 Feb 2016 13:33:22 -0800
Message-ID: <CAJ86T=WUd+Zi5feRe4iVShnkj5qdFHTPM42NCthbZc5-RrjcXg@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] libsoup-2.4: disable libsoup-gnome by default
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
X-List-Received-Date: Thu, 18 Feb 2016 21:33:22 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Feb 18, 2016 at 12:24 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> Hi Martin,
>
> On Thu, 18 Feb 2016 20:39:08 Martin Jansa wrote:
>> IIRC this will rename the resulting package (because there will be only one
>> shared library now).
>>
>> that will probably break on device upgrade-path
>>
>> I'm not sure if someone still cares about upgrade-paths.. there are too
>> many issues going in unnoticed.
>
> The only way we're going to fix that is if we have some automated mechanism for
> picking up on such problems. We have some of the building blocks but so far
> nobody has stepped up to write something more complete that can warn us when
> such a change has occurred.

Aside from automated detection of such problems, what's the best fix
in this particular case?

  1) Use LEAD_SONAME to force renaming, even in the case when the
libsoup-2.4 package contains both shared libs.

  2) Split libsoup-gnome-2.4 into it's own package, so that both
libsoup-2.4 and libsoup-gnome-2.4 get renamed.

  3) Use DEBIAN_NOAUTONAME to prevent renaming, even when the
libsoup-2.4 package only contains one shared lib.

  4) Drop the gnome PACKAGECONFIG option so that people can't mess
with it (in combination with one of the above).

?

> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre

