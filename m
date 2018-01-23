Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id B69D178771
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jan 2018 15:55:09 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id w17so559363pgv.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jan 2018 07:55:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Pj18Osoz/xNS8zTdZEqvaVfPLjWQyw8eomrWT3BQe2g=;
	b=fq7R/FqIiQagebGVMH9J2AdPfrGoajKhpDv0fk93WmPO9VR3jsnbBAfQIg+TCoPmvu
	Aeh5UQSiOkXgBajCPJXuN74Wyd54iE1OXEW82MqzsTMWZVf01OiIUREm9eL7ZJCdvii4
	ioNiPCor+3MlnhNLszBn6UN1lHg7H3340574QsSgS9aJN3Hb0ZzQsSy79Qewkasuynmh
	VfdL0j7LzMrVdbCwf7z6GPG+/sGEVEAe48p/1OokRjkGQqqm2F8iJvVb4ZLXB0UMFPQQ
	d2Vp0qhaHccxNM3074bis98P2P1NcGjdoXWzpBn7XJ2KWklO9Tp0Z8dHov9uvFDiPhGY
	A2Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Pj18Osoz/xNS8zTdZEqvaVfPLjWQyw8eomrWT3BQe2g=;
	b=gvB7WkUDrKTH4FbUzXHny3ZDzaWKa5GWPyYeDrzQAKb8Ceke8hVjgzxuOYaLlYXzXH
	R689TuzrT1uvSWD8mmi8/cQIboghnPL8p0zc5cMThGGZmcb2WF2vqnbzhG8m8W5ydsFV
	YovxoYJW4Is68QY8XYzQ7QtALmeSRM37sVt3OpI8lhfwnzEA4Edb4NhLaYjeef3MJfv0
	SsZP1WQr65/Y6hJz1NIQHsvGrKoZuvC2lYr+iMj476rDx8eR1pY5c85gPZQWSaazuelM
	R0/BK/M6u7zf5OOH4bhqeAzRi+U1AHJLnaO5LmVT52ybJJXqbx1SbPbWeTI/nsCDuhEO
	BolQ==
X-Gm-Message-State: AKwxytdg5sAJxxGI3zMgKAK7raJOSTAVSCZ98KvocwpC2C2+VLf205so
	rYODyntXTS2VLEbNu0mxMUxbtNLGRKf2u70bfbs=
X-Google-Smtp-Source: AH8x2259i4QjrjLLIaDCUJZeM5r30VmfQ+MfwNpQsLBaWgh4wCQ36LA7ZQLrFmgRa3EVNQW6IHQeWgjZqOvRr5LHUYY=
X-Received: by 10.99.111.68 with SMTP id k65mr9200123pgc.446.1516722910595;
	Tue, 23 Jan 2018 07:55:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.161.170 with HTTP; Tue, 23 Jan 2018 07:54:40 -0800 (PST)
In-Reply-To: <1516661989-26346-1-git-send-email-juro.bystricky@intel.com>
References: <1516661989-26346-1-git-send-email-juro.bystricky@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 23 Jan 2018 09:54:40 -0600
Message-ID: <CAMKF1spfw=Z6UJRM6x5GD7bUs=yJdTe2YbDT3n4naBM-0_N6+w@mail.gmail.com>
To: Juro Bystricky <juro.bystricky@intel.com>
Cc: Juro Bystricky <jurobystricky@hotmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] libc6: improve reproducibility
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
X-List-Received-Date: Tue, 23 Jan 2018 15:55:09 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 22, 2018 at 4:59 PM, Juro Bystricky
<juro.bystricky@intel.com> wrote:
> Building various libraries (libc6, libc6-pic, libc6-staticdev, libc6-dbg, ...)
> can be non-deterministic because they may be built with two different versions
> of intl/plural.c. in two otherwise identical builds. We may or may not re-generate
> the file plural.c from the file plural.y, based on bison being installed or not
> and based on mtimes of those two files, as the Makefile contains:
>
> plural.c: plural.y
>         $(BISON) $(BISONFLAGS) $@ $^
>
> If the above rule does not fire, we use a "fallback" plural.c, otherwise
> we use plural.c re-generated from plural.y.
> The fix is to always require bison to be installed and unconditionally
> re-generate plural.c. (This is achieved by touching plural.y).
>
> [YOCTO #12291]

2.27 will be there for next release. So I wonder if we should just wait.

>
> Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
> ---
>  meta/recipes-core/glibc/glibc_2.26.bb | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/glibc/glibc_2.26.bb b/meta/recipes-core/glibc/glibc_2.26.bb
> index 04d9773..0ee5bdb 100644
> --- a/meta/recipes-core/glibc/glibc_2.26.bb
> +++ b/meta/recipes-core/glibc/glibc_2.26.bb
> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSES;md5=e9a558e243b36d3209f380deb394b213 \
>        file://posix/rxspencer/COPYRIGHT;md5=dc5485bb394a13b2332ec1c785f5d83a \
>        file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
>
> -DEPENDS += "gperf-native"
> +DEPENDS += "gperf-native bison-native"
>
>  SRCREV ?= "77f921dac17c5fa99bd9e926d926c327982895f7"
>
> @@ -103,6 +103,10 @@ do_configure () {
>  # version check and doesn't really help with anything
>          (cd ${S} && gnu-configize) || die "failure in running gnu-configize"
>          find ${S} -name "configure" | xargs touch
> +        # "plural.c" may or may not get regenerated from "plural.y" so we
> +        # touch "plural.y" to make sure it does. (This should not be needed
> +        # for glibc version 2.26+)
> +        find ${S}/intl -name "plural.y" | xargs touch
>          CPPFLAGS="" oe_runconf
>  }
>
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

