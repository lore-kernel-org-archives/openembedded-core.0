Return-Path: <fathi.boudra@linaro.org>
Received: from mail-la0-f46.google.com (mail-la0-f46.google.com
	[209.85.215.46])
	by mail.openembedded.org (Postfix) with ESMTP id 3C62765E75
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Apr 2014 17:13:04 +0000 (UTC)
Received: by mail-la0-f46.google.com with SMTP id hr17so7188953lab.33
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Apr 2014 10:13:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=Qt4rnOgveGwODfR09lGXz5wM9QSKpYZGFscORZdPKnI=;
	b=SMt0cZJTkyC6FFG8t2hyPagquShmhBegL0ouKjSbZwa1UjdKhk7j5S3027KuqbkPcJ
	I2Nqx3/D8I7A5dPSpCIQplFR53fqZ70nK7QYXnko0T1S2YqXrG/zj3IV9ypCWKWZKslJ
	2mJhrlekf21kVTiZn5sHMVa1YlGgk4xCXclikQpTmk62zwe3x3YJ56zbrMIlb4+JJEyf
	usETo4wNuuH7NQvWP3hwM4kmaC6mhIB+0mLqyg3uSDyrWthtzXrSb6m7LJu+qlGw0E6B
	MOsYEEBEAeesU6y3t0xiKnV8CRLcnzzx+FAMVOfhyU8GU13MiEaIrdZ85+O+5X3SzHoV
	za8g==
X-Gm-Message-State: ALoCoQl90NfGXihKu8ugMoaIE1on0VF4Rz490qwpXECw0P8LzKnizrdA1NvJF3pfqpjAZD3EPW1a
MIME-Version: 1.0
X-Received: by 10.112.128.131 with SMTP id no3mr1884942lbb.57.1397581984777;
	Tue, 15 Apr 2014 10:13:04 -0700 (PDT)
Received: by 10.112.145.229 with HTTP; Tue, 15 Apr 2014 10:13:04 -0700 (PDT)
In-Reply-To: <8474154.NWdoUUSmHp@peggleto-mobl5.ger.corp.intel.com>
References: <1396965637-4802-1-git-send-email-fathi.boudra@linaro.org>
	<CABcZANmn9=b_onZz-mCSicPeDgxg=u4ebuDhE1KExvRDbN00Tg@mail.gmail.com>
	<CAGNsrLDp9m9q4a9fSO5TZGRbqoPs6=p6EyboKX+8K5fBLJFF=Q@mail.gmail.com>
	<8474154.NWdoUUSmHp@peggleto-mobl5.ger.corp.intel.com>
Date: Tue, 15 Apr 2014 20:13:04 +0300
Message-ID: <CAGNsrLAbBeUxD4GPEPTYn-88qLCK7waz_z5BvFc1-r3eQDFmqQ@mail.gmail.com>
From: Fathi Boudra <fathi.boudra@linaro.org>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Tue, 15 Apr 2014 17:13:05 -0000
Content-Type: text/plain; charset=UTF-8

On 15 April 2014 20:04, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:
> On Wednesday 09 April 2014 22:25:31 Fathi Boudra wrote:
>> On 9 April 2014 22:15, Chris Larson <clarson@kergoth.com> wrote:
>> > On Wed, Apr 9, 2014 at 9:18 AM, Fathi Boudra <fathi.boudra@linaro.org>
>> >
>> > wrote:
>> >> On 9 April 2014 18:02, Chris Larson <clarson@kergoth.com> wrote:
>> >> > On Tue, Apr 8, 2014 at 10:16 AM, Fathi Boudra <fathi.boudra@linaro.org>
>> >> >
>> >> > wrote:
>> >> >> On 8 April 2014 20:05, Khem Raj <raj.khem@gmail.com> wrote:
>> >> >> > On Tue, Apr 8, 2014 at 7:00 AM, Fathi Boudra
>> >> >> > <fathi.boudra@linaro.org>
>> >> >> >
>> >> >> > wrote:
>> >> >> >>  do_install() {
>> >> >> >>
>> >> >> >> -       oe_runmake prefix="${prefix}" DESTDIR="${D}" install
>> >> >> >> +       ${MAKE} NO_PYTHON=1 prefix=${prefix}
>> >> >> >> plugin_dir=${libdir}/trace-cmd/plugins DESTDIR=${D} install
>> >> >> >>
>> >> >> >>  }
>> >> >> >
>> >> >> > can you explain/document this change
>> >> >>
>> >> >> sure. trace-cmd doesn't have a build system generated Makefile. It's
>> >> >> hand written.
>> >> >> To do the install properly, one has to pass prefix/plugin_dir.
>> >> >> In addition, the previous command in the recipe doesn't do the right
>> >> >> thing anymore (you'll end with duplicated prefix /usr/usr/).
>> >> >
>> >> > You don't need to avoid the use of oe_runmake to pass variables in,
>> >> > that's
>> >> > what EXTRA_OEMAKE is for :) See
>> >> > https://github.com/MentorEmbedded/meta-mentor/commit/4639877 for a
>> >> > version
>> >> > of this fix that uses it instead.
>> >>
>> >> You don't need oe_runmake or EXTRA_OEMAKE to properly build and
>> >> install the files in the right path either :)
>> >> You can even drop inherit pkgconfig pythonnative since they aren't
>> >> used. My version is also slightly shorter to achieve the same goal.
>> >
>> > oe_runmake is the convention used by nearly every recipe in oe-core.
>> > Breaking that convention for no good reason accomplishes nothing.
>>
>> you can argue as you prefer. reality is that  using oe_runmake on this
>> particular software accomplishes nothing.
>
> It accomplishes as much as it does anywhere else. I don't see that this recipe
> needs to be special by not using it. In any case, you've run the recipe
> through oe-stylize to make it conform to OE style guidelines that that script
> handles, surely it's not a big thing to conform to this expected style as
> well?

In that case, you might be able to replace ${MAKE} by oe_runmake in
the patchset and everybody will be happy.

> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre

