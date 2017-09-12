Return-Path: <matt@madison.systems>
Received: from mail-lf0-f47.google.com (mail-lf0-f47.google.com
	[209.85.215.47])
	by mail.openembedded.org (Postfix) with ESMTP id EA53C780CE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 11:57:49 +0000 (UTC)
Received: by mail-lf0-f47.google.com with SMTP id d17so25714606lfe.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 04:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=J+EBGGNamp4ZUAxnhCmGgiauk/7CBgNyi9FDxN538cc=;
	b=bact6LlfgOenHSL8txwm97i8aKnn+taOGeh+8CW6sLrWf+W0URGn4M+ec0RdYPc0D5
	qhEo65pHiciWgSbY0R+DLjrXsiX5HwFh3gtunT5MZdBhHOOM8LmWMGwlllJg7kPXOEa9
	+1Bs2u7rosSsHofvALEf/oBWhVHhzkh+7pWR6C9SjY4BvBCxqgE30X6FaUM3TnTIBYWR
	62ZscOoJS86uX7Z78mWp+KztfRIz50WfJjVkLHlV9Ykb9kIhsfas56ZqNwofapNXmf+V
	BqrXKQmejA6G0Bz7NaEW0BwZinCdtpL2XRlypzBGESAbAyfuIUNXfa5j1MGmnL4qZIdR
	t1Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=J+EBGGNamp4ZUAxnhCmGgiauk/7CBgNyi9FDxN538cc=;
	b=fGHAzHkERA3FlC9/OxG9OIALQAfU5aWSIOVCflx5owV+BUKcDDfAuyFMsDtYYi/yLb
	xwrJ6yaCMvtbdgfwaiu4g3MCH/jNnoRzogpjX4b33PSz22W3WJpQuhYb3Z9DrDwgcLeJ
	+WJrXA0LY3BHYKCn9vxtfGyWg/JyCTzYsX2M+qYjhmvLfWi4xMgTY5z84JiFoCa+wgXc
	LbP4bp49if8dzk7DuqrveubgaRWc61A6xxuwRob7no9DCgyN3IlTW9a7/Er0KMAM5R/1
	BQyN+wA0yJRkHNM1iUbPdVaOxdpmp3iw8UdEF9JeDHjQSWtsjDPL+NM2JEGs/7hTqOK1
	6GIA==
X-Gm-Message-State: AHPjjUhWfEdCta4H+wD1UdXsMG3m/h0NqGwWUqjdYntRJBzMs82vD1pP
	6Wzdlk0/nxG0NHfD8R9bLDmApjM8NF+Q
X-Google-Smtp-Source: AOwi7QDyfJ2BX6PPI0K86qv1aJD+UPOgBqb/sjgOIBzPeJmAqvFW+ZqaoQM83vSymPFvqN9iYG5ppeZD4ivLmyPOZgQ=
X-Received: by 10.25.215.38 with SMTP id o38mr4396075lfg.124.1505217470438;
	Tue, 12 Sep 2017 04:57:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.213.146 with HTTP; Tue, 12 Sep 2017 04:57:49 -0700 (PDT)
In-Reply-To: <CA+chaQcH+Sk7G24o3SGSn=Yw=cvStUHXdU+LtC7A0wts0p9Uhw@mail.gmail.com>
References: <20170911182853.11076-1-otavio@ossystems.com.br>
	<1505209529.18640.15.camel@linuxfoundation.org>
	<CA+chaQcH+Sk7G24o3SGSn=Yw=cvStUHXdU+LtC7A0wts0p9Uhw@mail.gmail.com>
From: Matt Madison <matt@madison.systems>
Date: Tue, 12 Sep 2017 04:57:49 -0700
Message-ID: <CAGgRHJpJ87iJzPj3icuxNFxSLvEy5fvp19P1VmbQ9Sq1OR3B1w@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>,
	Otavio Salvador <otavio@ossystems.com.br>, Will Newton <willn@resin.io>
Subject: Re: [PATCH v7 00/12] Revamp the Go support
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
X-List-Received-Date: Tue, 12 Sep 2017 11:57:50 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 12, 2017 at 2:58 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> Interesting I've seen this issue only for PN-staticdev package
> ERROR: QA Issue: go-dep-staticdev rdepends on bash, but it isn't a build
> dependency, missing bash in DEPENDS or PACKAGECONFIG? [build-deps]
>
> and the bash is already in RDEPENDS (the warning is shown in our builds,
> because we use busybox as RPROVIDER for bash).
>
> So maybe this file isn't always included? Or something else might be
> non-deterministic.

Depends on which patch set you were testing against.  One of the
recent go.bbclass changes moved the sources from the -staticdev
package to the -dev package (which is more appropriate, since the
sources are also the header files).  I thought I had updated the
go-dep recipe along with that, but I may have missed it.

-Matt


>
> On Tue, Sep 12, 2017 at 11:45 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>>
>> On Mon, 2017-09-11 at 15:28 -0300, Otavio Salvador wrote:
>> > This improves the Go support on OE-Core.
>> >
>> > We are trying to port as much as possible work done by Matt on
>> > meta-golang back to OE-Core and also to avoid carrying old releases
>> > as
>> > there is no need to support more versions of Go toolchain.
>> >
>> > This fixes issues in existing support as well as add support for SDK
>> > generation which supports Go.
>>
>>
>> https://autobuilder.yocto.io/builders/nightly-no-x11/builds/471/steps/BuildImages/logs/stdio
>>
>> ERROR: go-dep-0.3.0-r0 do_package_qa: QA Issue:
>> /usr/lib/go/src/github.com/golang/dep/vendor/github.com/pelletier/go-toml/test.sh
>> contained in package go-dep-dev requires /bin/bash, but no providers found
>> in RDEPENDS_go-dep-dev? [file-rdeps]
>> ERROR: go-dep-0.3.0-r0 do_package_qa: QA run found fatal errors. Please
>> consider fixing them.
>> ERROR: go-dep-0.3.0-r0 do_package_qa: Function failed: do_package_qa
>>
>> Should be easy to fix hopefully!
>>
>> Cheers,
>>
>> Richard
>>
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

