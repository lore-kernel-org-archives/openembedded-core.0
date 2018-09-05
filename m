Return-Path: <armccurdy@gmail.com>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id 45EF67602A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Sep 2018 02:04:54 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id q184-v6so2112840vke.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Sep 2018 19:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Z4LN/nhu/8jElMk7c+/F3iT8aH4/f4jaBTy6KzYl/Cw=;
	b=sSl+29ZpEtXlYLZJYZviA9tFrmRLggJuay2/fAsLYKYkXayKzlpQU88PTR8hPwtLq9
	zPHrBBrVF9hKcW8hvaPAPf/o7Xgs4s4ogQr5XZ8ESs8HaL8DE+4IyyHer3j/gwXLNmat
	Czr0IdmP7reg+nuYkMnYX5+fsBmVpNmFaFEk1OdAz14RrCsRaaFURE73VzE6bO7ssEml
	rKHYsRbKnxC4BiUGEjWihlTE2XAocDnj3qdIU9jza7Lhdsf8qF+JTM7LqPiY348FbAWj
	dQI8jc7cQWuzsExe5XEoWYMD8Ph3/st0LwtY+hqDCR9EatwM6jbwGcmV3nEh4/jOWmKr
	8Lgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Z4LN/nhu/8jElMk7c+/F3iT8aH4/f4jaBTy6KzYl/Cw=;
	b=B/a3JiVb6jn5iaQzhoPhc4DfRbfk7FZmF0Zqkbb8APzOGWFr6OdDsMeZp76kKZK1SD
	CkJYVTLwvSMUJRNJqpVm6ir0d7UfX9Awbo0VcMVW6t+P6E5HjJl4LHgXUWfqcQdCsirm
	WZV1AENymhMwkB+OwgQlkT5mIkX7Czfm+kQps7eqHAqRXRqWPKf9Vw4lwwhg5loapYLa
	QxB3eq/61ko19W4rH7AfNTpOnWKnVIHtYyfc9CDa7+UT7LMOxO2suwL2/Nnq2e8x88VL
	AtSbqMACvrzjn0xKhW92yoJcmxwq+8jtqCDPMAWuoC+xakWQaFx+9A0O9rs3IeXGUAl1
	dPcg==
X-Gm-Message-State: APzg51B501uu917cKgwFnJ1JuRoXrNdiriwPJkXOfc2ysBMyeCQolTYe
	sEUmHjK8/3NG4l+RNC6OvpMvBblDF+oFKU4+wyM=
X-Google-Smtp-Source: ANB0VdYqoJsnXxOoGspooVmF3uCjDdm/c7W9aOf/KU9cd7fJbPnjXEiixbp4hSblNwqRKy4z89sWUkR/An2HPtsc6MI=
X-Received: by 2002:a1f:c252:: with SMTP id
	s79-v6mr17579335vkf.127.1536113096010; 
	Tue, 04 Sep 2018 19:04:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:2904:0:0:0:0:0 with HTTP;
	Tue, 4 Sep 2018 19:04:55 -0700 (PDT)
In-Reply-To: <23275ba8a359cdc7edd4f0f85bcecda99bd60aaf.camel@linuxfoundation.org>
References: <20180904155000.3715-1-ross.burton@intel.com>
	<CAJ86T=VeOq1i0Vg7EnWfP=4hJmXFDvnzdO1ADkk5U081_g2LxA@mail.gmail.com>
	<23275ba8a359cdc7edd4f0f85bcecda99bd60aaf.camel@linuxfoundation.org>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 4 Sep 2018 19:04:55 -0700
Message-ID: <CAJ86T=V1rPqM8EYT+y-U2gt0znODtNZ7enaGM5TVBMnPmefgVw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Joshua Lock <joshua.g.lock@intel.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] os-release: fix to install in the expected location
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
X-List-Received-Date: Wed, 05 Sep 2018 02:04:55 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 4, 2018 at 3:36 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2018-09-04 at 13:19 -0700, Andre McCurdy wrote:
>> On Tue, Sep 4, 2018 at 8:50 AM, Ross Burton <ross.burton@intel.com>
>> wrote:
>> > From: Joshua Lock <joshua.g.lock@intel.com>
>> >
>> > os-release (5) recommends that the os-release file be installed in
>> > /usr/lib/os-release and that /etc/os-release be a relative symlink
>> > to it.
>> >
>> > Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
>> > Signed-off-by: Ross Burton <ross.burton@intel.com>
>> > ---
>> >  meta/recipes-core/os-release/os-release.bb | 7 ++++---
>> >  1 file changed, 4 insertions(+), 3 deletions(-)
>> >
>> > diff --git a/meta/recipes-core/os-release/os-release.bb
>> > b/meta/recipes-core/os-release/os-release.bb
>> > index f9887047561..c6e36001dc5 100644
>> > --- a/meta/recipes-core/os-release/os-release.bb
>> > +++ b/meta/recipes-core/os-release/os-release.bb
>> > @@ -1,7 +1,7 @@
>> >  inherit allarch
>> >
>> >  SUMMARY = "Operating system identification"
>> > -DESCRIPTION = "The /etc/os-release file contains operating system
>> > identification data."
>> > +DESCRIPTION = "The /usr/lib/os-release file contains operating
>> > system identification data."
>> >  LICENSE = "MIT"
>> >  INHIBIT_DEFAULT_DEPS = "1"
>> >
>> > @@ -42,6 +42,7 @@ python do_compile () {
>> >  do_compile[vardeps] += "${OS_RELEASE_FIELDS}"
>> >
>> >  do_install () {
>> > -    install -d ${D}${sysconfdir}
>> > -    install -m 0644 os-release ${D}${sysconfdir}/
>> > +    install -d ${D}${libdir}
>> > +    install -m 0644 os-release ${D}${libdir}/
>> > +    lnr ${D}${libdir}/os-release ${D}${sysconfdir}
>>
>> This probably needs an "rm -f ${D}${sysconfdir}/os-release" too to
>> prevent problems if install is run twice as lnr doesn't handle the
>> case where the target already exists.
>
> Doesn't do_install clean out ${D} each time it reruns though?

Yes, it does. Sometimes it's useful to rerun the run.do_install script
manually though.

