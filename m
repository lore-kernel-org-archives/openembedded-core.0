Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f50.google.com (mail-pg0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id 7F0FE719AF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Aug 2017 21:54:05 +0000 (UTC)
Received: by mail-pg0-f50.google.com with SMTP id u5so55168514pgn.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Aug 2017 14:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=S56XwUweIj7c9BA8qPsmdgfPWxRN81NEkyUZ0PYoRyA=;
	b=apo/v1RNB32C0dVQqbk4/oGOGUFVMDt3lWKJ3zlj5sfC1VdXPunlrL3PL9e6PuLKoy
	B2PDVbA1l+zW8ZLMXaEy3gVS/qixK3FApr2q7a4yyqM31jaAlay/RHx6jAHutk5qbBZ7
	11NI+v1DIcVXgh+l/qX2nJl/pOSXFxH7LFXo7Xi8gIXvS878i8qe6n6CbQ6KoPtQgrGv
	RE3xXXJajUHHs7E0V8B+AgOMlLTfo/2oEkvbWVN0Ul+a/8aNLr2TlfyLsPm9XuaoCHI5
	k1sd0Qbi+w8X10iBHVgR1UaS9oj0NqnODWoxlAczxBS7Kmyjan+rZkZL7kRakkpyFXg/
	lhhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=S56XwUweIj7c9BA8qPsmdgfPWxRN81NEkyUZ0PYoRyA=;
	b=TI9y5aZxZ3tdWsyIsJVHwbmEhtuJqkjamH+otUfNhGLoivP2nKT4Jl2qPa5n2HF9L4
	+X3TJ2covvmh13RixIy2Da7Vixo8AKJ6ngn6cQ/k9HPw8Kd0CG42+p60GO0bjj/y50XQ
	3eEZ66H6OMSs8Ed/w5aTSRM0lUVScz1PhS//96HGiklx8CKXMZY5sGa3rp7XqH8RALWp
	Y2E+7oGEjpfZ0rRzch28RTKIBe/xQ3bfFkMy0vSVr4ZUrDMOH4W7/+HrWRpmC9JnqSfd
	rK76ogn4OZkJgA9KnDqVJNvmPIvEKlL/bHxrYXBgZuw37XzUIfUWlZ/pzT5FzRFjLVjA
	fo0g==
X-Gm-Message-State: AHYfb5iKMFn4sR52Oq2iuwJWVfwJXYpW/OozgSsOt1Ln+d6rtMTxxMJm
	MBmDenY11gNv4GZt/x8mhkpzX2XA4Q==
X-Received: by 10.84.149.139 with SMTP id m11mr28788570pla.376.1502747647611; 
	Mon, 14 Aug 2017 14:54:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.167.2 with HTTP; Mon, 14 Aug 2017 14:53:37 -0700 (PDT)
In-Reply-To: <1502747056.13978.40.camel@linuxfoundation.org>
References: <007BD92917A2324FA403BCF9A464CF84CF3D645F@ALA-MBD.corp.ad.wrs.com>
	<1502747056.13978.40.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 14 Aug 2017 14:53:37 -0700
Message-ID: <CAMKF1srLP3e_5L7mC1a65X3WniHh434ODDGX28VwQXk=br+37Q@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: master-next
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
X-List-Received-Date: Mon, 14 Aug 2017 21:54:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 14, 2017 at 2:44 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Mon, 2017-08-14 at 19:24 +0000, Slater, Joseph wrote:
>> Is there something =E2=80=9Cdifferent=E2=80=9D about this branch?  I fin=
d that if I
>> have a local master and master-next, and am on master, when I do a
>> pull master-next will wind up both ahead and behind origin/master-
>> next.  If I switch to master-next and rebase, it might fail, or it
>> might leave me with one or more =E2=80=9Clocal=E2=80=9D commits that are=
 not mine.
>> For the case I tried today, it is commit 3d4f241 which seems to only
>> be on my local master-next, but came from Mark Horn/Ross Burton on
>> August 2.
>>
>> Can anyone explain this?
>
> master-next rebases. The patch in question was in master-next, it
> failed tests and I booted it out until it gets fixed.
>
> master never rebases by comparison.

may be using branch namespace might make it better ?
something like $user/branch means its a private branch
and branches in global namespaces are public branches

>
> Cheers,
>
> Richard
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

