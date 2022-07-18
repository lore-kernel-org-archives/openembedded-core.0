Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B94BAC43334
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 14:45:22 +0000 (UTC)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com
 [209.85.166.47])
 by mx.groups.io with SMTP id smtpd.web12.28170.1658155521204659404
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 07:45:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Aa1mc+SE;
 spf=pass (domain: gmail.com, ip: 209.85.166.47, mailfrom: sakoman@gmail.com)
Received: by mail-io1-f47.google.com with SMTP id u20so9417254iob.8
        for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 07:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=65Issv5ocHnD1Yq1bMHVu6KVaDQyWN37zbesksHBJnU=;
        b=Aa1mc+SE9eVcryMpiqYzCC5pyUQVKhRsSdZhrxw0JhZgruZKXDU5ye6Z0Is3sl4Olx
         erLsx9iFpM3K8WAUI+eAslxuU7dFMP5F90C+d+UrPYCbJe/i6hHqbq2npukFFqDucJAN
         +c31w+b19my5sJWx8Iz04cTBB6XVFEnDk3dYZ3mEhXkFCuO0WwN9Dd2qhyyMejcj4N/q
         hDibl5qCSb+qbntX48QpKemOvp188GnMF7wP1x0NVdsXAh28J9GyvNpRWMsLTwF2PoBt
         uR0Wr6lGJKtqN18M2L6w1sCSVpApz6llgU96yqLGT5Ca5PhGrwr1atn/XifKN19tFQQs
         JXfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=65Issv5ocHnD1Yq1bMHVu6KVaDQyWN37zbesksHBJnU=;
        b=Phnw9Fzl24F0z6v9gVux8I1JLmIqHJR6ARfNeII6gpSbH8vd9rA+6qZw7Hkl/HES+i
         zXrVnc0U1sU36JIdYMmecw4JD3PygwCMA8l8JDekk5I2n72osOPsPXpduOSvH9SjyN4q
         td+SX0xitG7CQKGNPffnLb63JkkbAsAitnfIWtAnToV+gaXbft6K2pGYbml2Z8KWPNcF
         APjV0+XWr1GmsjFW0WrWYN8iqXbhYcUFkQu4w1lrEkf5fCAJcq8ML6VIb2k4g5OgpSDF
         tpyRiYXqSGsYgwce6ldglv1R7xtfA2guJDJ7TNgXLEVRk1HKOzFJiXBVLvm7GsEcxRbB
         DRCA==
X-Gm-Message-State: AJIora+4ZbcUeHUR4fsOO7poOUCY+RgGL0zDJQL0z3nW6K4PaItb0sjm
	cw3MeXpPlqdUOGrhIkF2zsql73u0hfcvqieYmhg=
X-Google-Smtp-Source: 
 AGRyM1u3DTmCk0qwMXffkvWVwpo3VaprkTERvCijuPStGX3iQ0Vg/d+XKeAJizJDaVqiPj8NHVmmhu9dAFMoENZVACw=
X-Received: by 2002:a02:a68c:0:b0:33f:46d4:918e with SMTP id
 j12-20020a02a68c000000b0033f46d4918emr13632970jam.58.1658155520387; Mon, 18
 Jul 2022 07:45:20 -0700 (PDT)
MIME-Version: 1.0
References: <1653381225-6080-1-git-send-email-wangmy@fujitsu.com>
 <f9a77fc2-4ecd-2481-b5eb-71ef67d79d0a@windriver.com>
In-Reply-To: <f9a77fc2-4ecd-2481-b5eb-71ef67d79d0a@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 18 Jul 2022 04:45:09 -1000
Message-ID: 
 <CAGDS+nnXoSz0XrbbAhVrgwnpNYvkdrsgXSLCA8CR4RFt2+Zudg@mail.gmail.com>
Subject: Re: [PATCH] [OE-core] [PATCH] bind: upgrade 9.18.2 -> 9.18.3
To: Yi Zhao <yi.zhao@windriver.com>
Cc: wangmy <wangmy@fujitsu.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Jul 2022 14:45:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168199

On Sun, Jul 17, 2022 at 8:42 PM Yi Zhao <yi.zhao@windriver.com> wrote:
>
> Hi Steve,
>
>
> On 5/24/22 16:33, wangmy wrote:
> > Changelog:
> > ==========
> > [security]
> >   Fix a crash in DNS-over-HTTPS (DoH) code caused by
> >   premature TLS stream socket object deletion.
> >   (CVE-2022-1183) [GL #3216]
>
>
> There is a CVE fix in this minor update. Is there any plan to backport
> it to kirkstone ?

Since this is a stable branch update I can take it. I'll add it to my
next patch set for testing.

Steve

> >
> > [bug]
> >   RPZ NSIP and NSDNAME rule processing didn't handle stub
> >   and static-stub zones at or above the query name.  This
> >   has now been addressed. [GL #3232]
> >   Fixed a deadlock that could occur if an rndc
> >   connection arrived during the shutdown of network
> >   interfaces. [GL #3272]
> >
> >   Refactor the fctx_done() function to set fctx to
> >   NULL after detaching, so that reference counting
> >   errors will be easier to avoid. [GL #2969]
> >
> >   udp_recv() in dispatch could trigger an INSIST when the
> >   callback's result indicated success but the response
> >   was canceled in the meantime. [GL #3300]
> >
> >   Work around a jemalloc quirk which could trigger an
> >   out-of-memory condition in named over time. [GL #3287]
> >
> >   If there was a pending negative cache DS entry,
> >   validations depending upon it could fail. [GL #3279]
> >
> >   dig returned a 0 exit status on UDP connection failure.
> >   [GL #3235]
> >
> >   Fix an assertion failure when using dig with +nssearch
> >   and +tcp options by starting the next query in the
> >   send_done() callback (like in the UDP mode) instead
> >   of doing that recursively in start_tcp(). Also
> >   ensure that queries interrupted while connecting
> >   are detached properly. [GL #3144]
> >
> >   Don't remove CDS/CDNSKEY DELETE records on zone sign
> >   when using 'auto-dnssec maintain;'. [GL #2931]
> >
> > [contrib]
> >   Avoid name space collision in dlz modules by prefixing
> >   functions with 'dlz_'. [GL !5778]
> >
> >   dlz: Add FALLTHROUGH and UNREACHABLE macros. [GL #3306]
> >
> > [func]
> >   Add new named command-line option -C to print built-in
> >   defaults. [GL #1326]
> >
> >   Introduce the concept of broken catalog zones described
> >   in the DNS catalog zones draft version 5 document.
> >   [GL #3224]
> >
> >   Add DNS Extended Errors when stale answers are returned
> >   from cache. [GL #2267]
> >
> >   Implement support for catalog zones change of ownership
> >   (coo) mechanism described in the DNS catalog zones draft
> >   version 5 document. [GL #3223]
> >
> >   Implement support for catalog zones options new syntax
> >   based on catalog zones custom properties with "ext"
> >   suffix described in the DNS catalog zones draft version
> >   5 document. [GL #3222]
> >
> >   Implement reference counting for TLS contexts and
> >   allow reloading of TLS certificates on reconfiguration
> >   without destroying the underlying TCP listener sockets
> >   for TLS-based DNS transports. [GL #3122]
> >   Add support for remote TLS certificates
> >   verification, both to BIND and dig, making it possible
> >   to implement Strict and Mutual TLS authentication,
> >   as described in RFC 9103, Section 9.3. [GL #3163]
> >
> > [cleanup]
> >   Remove use of exclusive mode in ns_interfacemgr in
> >   favor of rwlocked access to localhost and localnets
> >   members of dns_aclenv_t structure. [GL #3229]
> >
> >   Remove the task exclusive mode use in ns_clientmgr.
> >   [GL #3230]
> >
> > Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> > ---
> >   .../0001-avoid-start-failure-with-bind-user.patch               | 0
> >   .../0001-named-lwresd-V-and-start-log-hide-build-options.patch  | 0
> >   .../bind-ensure-searching-for-json-headers-searches-sysr.patch  | 0
> >   .../bind/{bind-9.18.2 => bind-9.18.3}/bind9                     | 0
> >   .../bind/{bind-9.18.2 => bind-9.18.3}/conf.patch                | 0
> >   .../bind/{bind-9.18.2 => bind-9.18.3}/generate-rndc-key.sh      | 0
> >   .../init.d-add-support-for-read-only-rootfs.patch               | 0
> >   .../make-etc-initd-bind-stop-work.patch                         | 0
> >   .../bind/{bind-9.18.2 => bind-9.18.3}/named.service             | 0
> >   .../bind/{bind_9.18.2.bb => bind_9.18.3.bb}                     | 2 +-
> >   10 files changed, 1 insertion(+), 1 deletion(-)
> >   rename meta/recipes-connectivity/bind/{bind-9.18.2 => bind-9.18.3}/0001-avoid-start-failure-with-bind-user.patch (100%)
> >   rename meta/recipes-connectivity/bind/{bind-9.18.2 => bind-9.18.3}/0001-named-lwresd-V-and-start-log-hide-build-options.patch (100%)
> >   rename meta/recipes-connectivity/bind/{bind-9.18.2 => bind-9.18.3}/bind-ensure-searching-for-json-headers-searches-sysr.patch (100%)
> >   rename meta/recipes-connectivity/bind/{bind-9.18.2 => bind-9.18.3}/bind9 (100%)
> >   rename meta/recipes-connectivity/bind/{bind-9.18.2 => bind-9.18.3}/conf.patch (100%)
> >   rename meta/recipes-connectivity/bind/{bind-9.18.2 => bind-9.18.3}/generate-rndc-key.sh (100%)
> >   rename meta/recipes-connectivity/bind/{bind-9.18.2 => bind-9.18.3}/init.d-add-support-for-read-only-rootfs.patch (100%)
> >   rename meta/recipes-connectivity/bind/{bind-9.18.2 => bind-9.18.3}/make-etc-initd-bind-stop-work.patch (100%)
> >   rename meta/recipes-connectivity/bind/{bind-9.18.2 => bind-9.18.3}/named.service (100%)
> >   rename meta/recipes-connectivity/bind/{bind_9.18.2.bb => bind_9.18.3.bb} (98%)
> >
> > diff --git a/meta/recipes-connectivity/bind/bind-9.18.2/0001-avoid-start-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind-9.18.3/0001-avoid-start-failure-with-bind-user.patch
> > similarity index 100%
> > rename from meta/recipes-connectivity/bind/bind-9.18.2/0001-avoid-start-failure-with-bind-user.patch
> > rename to meta/recipes-connectivity/bind/bind-9.18.3/0001-avoid-start-failure-with-bind-user.patch
> > diff --git a/meta/recipes-connectivity/bind/bind-9.18.2/0001-named-lwresd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind-9.18.3/0001-named-lwresd-V-and-start-log-hide-build-options.patch
> > similarity index 100%
> > rename from meta/recipes-connectivity/bind/bind-9.18.2/0001-named-lwresd-V-and-start-log-hide-build-options.patch
> > rename to meta/recipes-connectivity/bind/bind-9.18.3/0001-named-lwresd-V-and-start-log-hide-build-options.patch
> > diff --git a/meta/recipes-connectivity/bind/bind-9.18.2/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind-9.18.3/bind-ensure-searching-for-json-headers-searches-sysr.patch
> > similarity index 100%
> > rename from meta/recipes-connectivity/bind/bind-9.18.2/bind-ensure-searching-for-json-headers-searches-sysr.patch
> > rename to meta/recipes-connectivity/bind/bind-9.18.3/bind-ensure-searching-for-json-headers-searches-sysr.patch
> > diff --git a/meta/recipes-connectivity/bind/bind-9.18.2/bind9 b/meta/recipes-connectivity/bind/bind-9.18.3/bind9
> > similarity index 100%
> > rename from meta/recipes-connectivity/bind/bind-9.18.2/bind9
> > rename to meta/recipes-connectivity/bind/bind-9.18.3/bind9
> > diff --git a/meta/recipes-connectivity/bind/bind-9.18.2/conf.patch b/meta/recipes-connectivity/bind/bind-9.18.3/conf.patch
> > similarity index 100%
> > rename from meta/recipes-connectivity/bind/bind-9.18.2/conf.patch
> > rename to meta/recipes-connectivity/bind/bind-9.18.3/conf.patch
> > diff --git a/meta/recipes-connectivity/bind/bind-9.18.2/generate-rndc-key.sh b/meta/recipes-connectivity/bind/bind-9.18.3/generate-rndc-key.sh
> > similarity index 100%
> > rename from meta/recipes-connectivity/bind/bind-9.18.2/generate-rndc-key.sh
> > rename to meta/recipes-connectivity/bind/bind-9.18.3/generate-rndc-key.sh
> > diff --git a/meta/recipes-connectivity/bind/bind-9.18.2/init.d-add-support-for-read-only-rootfs.patch b/meta/recipes-connectivity/bind/bind-9.18.3/init.d-add-support-for-read-only-rootfs.patch
> > similarity index 100%
> > rename from meta/recipes-connectivity/bind/bind-9.18.2/init.d-add-support-for-read-only-rootfs.patch
> > rename to meta/recipes-connectivity/bind/bind-9.18.3/init.d-add-support-for-read-only-rootfs.patch
> > diff --git a/meta/recipes-connectivity/bind/bind-9.18.2/make-etc-initd-bind-stop-work.patch b/meta/recipes-connectivity/bind/bind-9.18.3/make-etc-initd-bind-stop-work.patch
> > similarity index 100%
> > rename from meta/recipes-connectivity/bind/bind-9.18.2/make-etc-initd-bind-stop-work.patch
> > rename to meta/recipes-connectivity/bind/bind-9.18.3/make-etc-initd-bind-stop-work.patch
> > diff --git a/meta/recipes-connectivity/bind/bind-9.18.2/named.service b/meta/recipes-connectivity/bind/bind-9.18.3/named.service
> > similarity index 100%
> > rename from meta/recipes-connectivity/bind/bind-9.18.2/named.service
> > rename to meta/recipes-connectivity/bind/bind-9.18.3/named.service
> > diff --git a/meta/recipes-connectivity/bind/bind_9.18.2.bb b/meta/recipes-connectivity/bind/bind_9.18.3.bb
> > similarity index 98%
> > rename from meta/recipes-connectivity/bind/bind_9.18.2.bb
> > rename to meta/recipes-connectivity/bind/bind_9.18.3.bb
> > index 1c77aceb9f..b511b77f2e 100644
> > --- a/meta/recipes-connectivity/bind/bind_9.18.2.bb
> > +++ b/meta/recipes-connectivity/bind/bind_9.18.3.bb
> > @@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
> >              file://0001-avoid-start-failure-with-bind-user.patch \
> >              "
> >
> > -SRC_URI[sha256sum] = "2e4b38779bba0a23ee634fdf7c525fd9794c41d692bfd83cda25823a2a3ed969"
> > +SRC_URI[sha256sum] = "0ad8da773bd93cba0ef66cc81999698ebdf9c3e51faed5e5c8c1eb75cad2ae6f"
> >
> >   UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
> >   # follow the ESV versions divisible by 2
> >
> >
> >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#168192): https://lists.openembedded.org/g/openembedded-core/message/168192
> Mute This Topic: https://lists.openembedded.org/mt/91307116/3617601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [sakoman@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

