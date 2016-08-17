Return-Path: <ulfalizer@gmail.com>
Received: from mail-ua0-f181.google.com (mail-ua0-f181.google.com
	[209.85.217.181])
	by mail.openembedded.org (Postfix) with ESMTP id DE56273CBD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Aug 2016 14:14:30 +0000 (UTC)
Received: by mail-ua0-f181.google.com with SMTP id n59so173458258uan.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Aug 2016 07:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=wAsXjoWMKYX6IftAH/LrcJymlewwzSh2JQt3uMyZ1ts=;
	b=L7p6D030lQKvsQNZu8N1huskoGlx3yaYZeS8h5fhE3PPOY1qHOItiOuj9n9IDXfqL3
	seVL3KvY6UR/VSEb8OGmgyOKGiv+zAt9RXd01I+HmQNXBAqGSm4Za2sb43GUjhHiFqlI
	MMvQNxLoHd3EAmkEuhid7e9/hYtcf7pa6j4PIzNRdyYy4qaLue9maFd2FHRD4FBvENTM
	T8B/oQyKypBXyWQN3pskfNACtWUzN1DvPajbremXuFEtmkgS2zRAAxeidvDvN3Zl+EV5
	2x9UVXmK/YsrayVmBhm7enIviw41WG7etXQTdT87Zl0wg8ScqazTdSUH7+uJJrobdNbL
	44/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wAsXjoWMKYX6IftAH/LrcJymlewwzSh2JQt3uMyZ1ts=;
	b=d66RFcQz/ROCrOsWzaq0RxDPiS6mciPcdPVCrtSXxxUlyjgCWPzCuks44HlbOlHa2s
	+D3vjyMVNLHh6DuxqgZX2AUizvp7Kk0UH54pUv8oyZxo0JN5DxOhEJdbpjMpOEiFjFc9
	XPShwqdOoYJfoXAiSMse/cI5znpzUuLJItmf0S2IT4gIWOVU9nF5mokg8Juu2ndyHnMC
	2s4c6N89gIEjau71Muapa2XxyoJqqe++3J98l9EDV/r17rXvwdeNrbDhdrXuiWCPveuD
	MyS8Y5Q2rZUU3v0/Ai/U9rv/RIStBZwc2PdpLn21GbgI+4gwSPes/nFVvnzlZDymTTAK
	hUQw==
X-Gm-Message-State: AEkooutWdNvy6Bh+eTffqTMkLqSqrvOKFcyYaOZZRhOlfIWzaUBJR+TAvzDdmc2mQTBjoEWckeRDjp9BjgPTpQ==
X-Received: by 10.31.6.18 with SMTP id 18mr19739605vkg.43.1471443270710; Wed,
	17 Aug 2016 07:14:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.124.70 with HTTP; Wed, 17 Aug 2016 07:14:30 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.20.1608170913100.11255@ca624034.mitel.com>
References: <alpine.LFD.2.20.1608160956340.7804@ca624034.mitel.com>
	<CAFkk2KRY=fWTOSUbxV_gm-np9r=4JBrsQ+Zy0FZb0H4Gbhfd+A@mail.gmail.com>
	<alpine.LFD.2.20.1608161147270.9338@ca624034.mitel.com>
	<CAFkk2KSVc3rqAieBHzkayJQT7YHxJhYoD0PSqp-YFL0CYMLkvg@mail.gmail.com>
	<92B4EF25-FE41-4310-B78A-554EA37BF507@gmail.com>
	<alpine.LFD.2.20.1608170913100.11255@ca624034.mitel.com>
From: Ulf Magnusson <ulfalizer@gmail.com>
Date: Wed, 17 Aug 2016 16:14:30 +0200
Message-ID: <CAFkk2KSt7rLiTim2oiHZMVKezVgtuegSraR0ePQWmdBhxbd6SQ@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: subtle weirdness when you combine "_append" with "+="?
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
X-List-Received-Date: Wed, 17 Aug 2016 14:14:31 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 17, 2016 at 3:21 PM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> On Tue, 16 Aug 2016, Khem Raj wrote:
>
>   ... big snip ...
>
>> the _append/_prepend in conjunction with += is a undocumented
>> behavior however, I do not see it as much a side effect. But in
>> future bitbake may silently change its behavior, so I agree its
>> always good to stay in safe waters.
>
>   so just to finalize this discussion, my thoughts on a reasonable and
> meaningful standard for append/prepend/etc/etc would be to *always*
> use the "mathematical" operators +=/.=/=+/=. except in two situations:
>
>   1) when parsing *must* be delayed until the end, or

I agree as long as that *must* also includes the kind of situation
described for foo.bbclass in
https://www.yoctoproject.org/docs/2.2/bitbake-user-manual/bitbake-user-manual.html#override-style-operation-advantages.
I think you ought to follow the principle of least surprise.

>   2) when combining the operation with an override (for which i'm
>      quite sure there is no equivalent when using +=, etc, right?)
>
> i'm a big fan of simplicity, in the sense that, if an append operation
> does not *require* "_append", it shouldn't use it. because if i see an
> expression:
>
>   VAR_append = "..."
>
> then i immediately wonder if there is a *reason* for using "_append"
> rather than "+=" or ".=", or if that is just the developer's personal
> preference. and i really, really, really hate having to guess.
>
>   oh, and of course, never, ever combine "_append" with "+=" or ".=".
> does that sound like a reasonable coding style?

Sounds reasonable to me. Using _append rather than += can also be
a bug in certain situations. For example, the following does not
guarantee that " value1 value2" appears right after "--flag":

FLAGS = "--flag"
FLAGS_append = " value1"
FLAGS_append = " value2"

Any earlier FLAGS_append value would appear before those two.

Cheers,
Ulf

