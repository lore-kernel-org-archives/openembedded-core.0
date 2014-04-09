Return-Path: <fathi.boudra@linaro.org>
Received: from mail-la0-f50.google.com (mail-la0-f50.google.com
	[209.85.215.50])
	by mail.openembedded.org (Postfix) with ESMTP id 09E9465E34
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Apr 2014 19:25:31 +0000 (UTC)
Received: by mail-la0-f50.google.com with SMTP id pv20so1500075lab.23
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Apr 2014 12:25:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=Q7IeYi+C0SbjzJPym9TrGmuQXqIBekCT5Gk04lj/EiE=;
	b=kex//AhR7l+KpD4NpLbGdskwgRr26y+GLj3Tu1pwsGd67CFbHvsFB+vYD/QvetmBjv
	lrVRksrUbIWqR1Mwi+29d8M4zeDF/rM5rFAlAebBU/xdF3gY5Iv7fgNDPJG1NYPRTqV+
	z9PswIMZQnuVs3LaGYr8+cDSM8l7GxfFDMNKGbStbMoZRWho/GAn1XMjpRV3GvzmjtNi
	Y+tmP+CA2dY7oZjzEtffXCbsYsydd/yMFuuyEOnjcg6kkiW/oj8pU4Dc7lRMIXdsMacu
	hNljmnefKA91wi83URAgmMFXFyvRhFwMpLADcwNPAkKOEOl0nDK++gmcjujyeTMJEIoC
	lHKA==
X-Gm-Message-State: ALoCoQm/PYymNe9Uds90qw3HLC8lMqeY39XHcprgAosTTlm7AnyWNOrj2FofDbT+BwhHlxgDvFfg
MIME-Version: 1.0
X-Received: by 10.112.135.106 with SMTP id pr10mr8257888lbb.24.1397071531168; 
	Wed, 09 Apr 2014 12:25:31 -0700 (PDT)
Received: by 10.112.145.229 with HTTP; Wed, 9 Apr 2014 12:25:31 -0700 (PDT)
In-Reply-To: <CABcZANmn9=b_onZz-mCSicPeDgxg=u4ebuDhE1KExvRDbN00Tg@mail.gmail.com>
References: <1396965637-4802-1-git-send-email-fathi.boudra@linaro.org>
	<1396965637-4802-2-git-send-email-fathi.boudra@linaro.org>
	<CAMKF1so-wo3wsD73dfbUEXYpCEMTxXgPBzqiKucCMVDYnFu+Sw@mail.gmail.com>
	<CAGNsrLC-RbVJd+uD15XTto9oYFQHrWckBnoGWBjLZ+k6bLvcsQ@mail.gmail.com>
	<CABcZANmMZ4LDyk+iG=MveJZKi66JukS65o3W8Muo_HrFymgxWA@mail.gmail.com>
	<CAGNsrLDUXVSukrJCg=rs8AuT6DTa6y_kfnZTUVroFm0-zb3qwQ@mail.gmail.com>
	<CABcZANmn9=b_onZz-mCSicPeDgxg=u4ebuDhE1KExvRDbN00Tg@mail.gmail.com>
Date: Wed, 9 Apr 2014 22:25:31 +0300
Message-ID: <CAGNsrLDp9m9q4a9fSO5TZGRbqoPs6=p6EyboKX+8K5fBLJFF=Q@mail.gmail.com>
From: Fathi Boudra <fathi.boudra@linaro.org>
To: Chris Larson <clarson@kergoth.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 1/2] trace-cmd/kernelshark: update to 2.3.2 release (latest stable branch)
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
X-List-Received-Date: Wed, 09 Apr 2014 19:25:32 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 9 April 2014 22:15, Chris Larson <clarson@kergoth.com> wrote:
>
> On Wed, Apr 9, 2014 at 9:18 AM, Fathi Boudra <fathi.boudra@linaro.org>
> wrote:
>>
>> On 9 April 2014 18:02, Chris Larson <clarson@kergoth.com> wrote:
>> >
>> > On Tue, Apr 8, 2014 at 10:16 AM, Fathi Boudra <fathi.boudra@linaro.org>
>> > wrote:
>> >>
>> >> On 8 April 2014 20:05, Khem Raj <raj.khem@gmail.com> wrote:
>> >> > On Tue, Apr 8, 2014 at 7:00 AM, Fathi Boudra
>> >> > <fathi.boudra@linaro.org>
>> >> > wrote:
>> >> >>  do_install() {
>> >> >> -       oe_runmake prefix="${prefix}" DESTDIR="${D}" install
>> >> >> +       ${MAKE} NO_PYTHON=1 prefix=${prefix}
>> >> >> plugin_dir=${libdir}/trace-cmd/plugins DESTDIR=${D} install
>> >> >>  }
>> >> >
>> >> > can you explain/document this change
>> >>
>> >> sure. trace-cmd doesn't have a build system generated Makefile. It's
>> >> hand written.
>> >> To do the install properly, one has to pass prefix/plugin_dir.
>> >> In addition, the previous command in the recipe doesn't do the right
>> >> thing anymore (you'll end with duplicated prefix /usr/usr/).
>> >
>> >
>> > You don't need to avoid the use of oe_runmake to pass variables in,
>> > that's
>> > what EXTRA_OEMAKE is for :) See
>> > https://github.com/MentorEmbedded/meta-mentor/commit/4639877 for a
>> > version
>> > of this fix that uses it instead.
>>
>> You don't need oe_runmake or EXTRA_OEMAKE to properly build and
>> install the files in the right path either :)
>> You can even drop inherit pkgconfig pythonnative since they aren't
>> used. My version is also slightly shorter to achieve the same goal.
>
>
> oe_runmake is the convention used by nearly every recipe in oe-core.
> Breaking that convention for no good reason accomplishes nothing.

you can argue as you prefer. reality is that  using oe_runmake on this
particular software accomplishes nothing.

my 2cts.

