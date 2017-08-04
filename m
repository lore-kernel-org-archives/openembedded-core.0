Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id A8EFF71A91
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Aug 2017 16:36:51 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id y206so6249725wmd.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Aug 2017 09:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=p7LLjbq9J0HLjgYyDePBxOB/mzSJZ+nABEjJxD/N5XE=;
	b=rXsEhCfeABfvwTEiJoN2gONTqotOQoY9mZs16mySf9RirMn6Y53tAcGxVa2yGQcoup
	4rlbjyrrg4FivkunvWnoA/GhDyZypNlb60DfGSDG6x9wB8H6SidIOAWv9cnuifuVDOZJ
	HhguGvLiUibyS61evOzWKY+tXMAaMWf1tI6JHFLchLfL2qx8lPHyO4pCBk4pg+g5zriM
	KvD/1fmXxasEbyw3Qpc86zVx7quSLquYKBH8hXEhVUaAQ+y7ylbpyFMcU1OLPdWkvjJ9
	JGAy3KXdquL/64DL79k28eZF8kxy6v0TjvIJHb5KnbnYcx2BQXH6QUAsZQJ/AmV0jigT
	AA2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=p7LLjbq9J0HLjgYyDePBxOB/mzSJZ+nABEjJxD/N5XE=;
	b=Ot5QGdCFR11RB/443M9k39XGjOM5e3cq5N8x2WS0vpBE5aiyd87+hNb7Dsm9DsfeU9
	9UYamHeKlwbuIS5NLw5hzjOQM+cPgEIJQRbe3re94T4SLXXNVHYK7wABdL9WN94r5qxz
	w0yXxeNZJT2CDq75rtnn4izgW2rBnjpKzoY7Y0HYG+QYLXjSUQ1rjP8QehIky6Rz2bFm
	lCYkGDm7bRTNHTunz3RozjNFKvuBmZFk1nhEsQc2NIf4KRMWQJdXAhnXL1Q2ArGxkR0f
	Y0tLLbs9Hp0T+JwoLCfwKkrSmaHg9MqcbfInHn5B3B/Kb+7myL0r2mG8kYnsOOaPH7uM
	yrSg==
X-Gm-Message-State: AIVw111yFXvllDSsM5UWwiy0AjupnBqskNumwOXlQAEYPo6IfNNmveCf
	IuF/81RCUaVZtWZULXb55asiI8eZQQ==
X-Received: by 10.80.159.227 with SMTP id c90mr3095393edf.11.1501864612427;
	Fri, 04 Aug 2017 09:36:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.149.181 with HTTP; Fri, 4 Aug 2017 09:36:22 -0700 (PDT)
In-Reply-To: <CAJTo0LZgSq1AmrvQaPp9hZwFYcnjG=6O9tgz0JdWY0NHVFK1Rg@mail.gmail.com>
References: <20170804094421.13226-1-ross.burton@intel.com>
	<4f118163-c586-1772-f8e3-85652a0a1b69@gmail.com>
	<CAJTo0LZgSq1AmrvQaPp9hZwFYcnjG=6O9tgz0JdWY0NHVFK1Rg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 4 Aug 2017 09:36:22 -0700
Message-ID: <CAMKF1spgPRdFxsKnoOo=9J+qhGiXC5NOFhYQvBQz2YSnF+ebCQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] checkpkg_exceptions: add LLVM
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
X-List-Received-Date: Fri, 04 Aug 2017 16:36:52 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 4, 2017 at 9:24 AM, Burton, Ross <ross.burton@intel.com> wrote:
> Awesome, good to know.
>
> Can you try to remember to verify checkpkg works, and remove this line?  If
> we both try to remember then hopefully one of us will...

OK entered into SRAM

>
> Ross
>
> On 4 August 2017 at 17:12, Khem Raj <raj.khem@gmail.com> wrote:
>>
>>
>>
>> On 8/4/17 2:44 AM, Ross Burton wrote:
>> > The git mirror of LLVM doesn't have any tags we can track for release
>> > announcements, so exclude llvm from the checkpkg test.
>>
>> we will switch to tarball based release once 5.0 is out.
>>
>> >
>> > Signed-off-by: Ross Burton <ross.burton@intel.com>
>> > ---
>> >  meta-selftest/files/distrodata/checkpkg_exceptions | 1 +
>> >  1 file changed, 1 insertion(+)
>> >
>> > diff --git a/meta-selftest/files/distrodata/checkpkg_exceptions
>> > b/meta-selftest/files/distrodata/checkpkg_exceptions
>> > index ff54cf0baed..d87a80de7a7 100644
>> > --- a/meta-selftest/files/distrodata/checkpkg_exceptions
>> > +++ b/meta-selftest/files/distrodata/checkpkg_exceptions
>> > @@ -8,6 +8,7 @@ gst-player
>> >  kmscube
>> >  libxcalibrate
>> >  linux-firmware
>> > +llvm
>> >  lsb
>> >  mmc-utils
>> >  ovmf
>> >
>>
>

