Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18EF8C3271F
	for <webhook@archiver.kernel.org>; Fri,  5 Jul 2024 10:34:37 +0000 (UTC)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
 by mx.groups.io with SMTP id smtpd.web10.14230.1720175673932994707
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jul 2024 03:34:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DJMCqrlr;
 spf=pass (domain: gmail.com, ip: 209.85.222.46, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-810418672fcso130348241.1
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Jul 2024 03:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720175673; x=1720780473; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nQ5vJN8z5mCNfrC+kxZ6YujsuwPwNt8jOzenSfhLviI=;
        b=DJMCqrlrlNHUoYnhqdUJ9ypHcucCWV3Ywp1/ByBGUMPw1s42tdIzT/jUan2ex6EVvX
         ffBCalWZ8PzJVpcSbbYZqiz9jfpUte9IxPuVpn0M+dlI00kL+lmO0GaHPbmiVNZ40CKx
         QaqM0sD3zhEDCJgSvxZoSw0pivNQ6Gi/GGckHMdQPCZIEqoK/Wxe1uju5QHtaDcgxTgx
         VBW1Bjyv/jKu23u4PaAALz3svNFl61CV9xB5cYGNAANy3gpmN6wWP0rSY3IonRrDNLeV
         dQqp4tdvNqfjW7VBJMNQJkk4692lAB8hRTqZsgqKxNgbyMgujmC/qTpJkcmN3txUlai5
         Loaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720175673; x=1720780473;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nQ5vJN8z5mCNfrC+kxZ6YujsuwPwNt8jOzenSfhLviI=;
        b=RzIfqTmulh0xpRqH2hP47q+KUdufsi/9Ci/BOGlh8cp3erWFU2lyofPFY3G6QLUI4v
         G71QRw7tt2lAxmsbDrOAVtu4pfAkIELDQFX7LzCR3R/z3ak4Ru9zdUau5rsbLdnE4D4j
         8z2eopnGg+GAcQS0jy55zFWM5EQzGVk0SeUL5lOd3GkuRxGFc4Z6BO0xk+v5EDS8meTa
         IaHcw71XjE1FmynBa58uCDV6OYuA5WYF+D/joCI6gbx3COXCTElsVP/qh3MBqslZEF/B
         zVfDeJmgdqMxQ8aud5d93LKB1ALDQO3HJGFjaP8WPQrTpSZbNthruCooqwDP9o9+/ZqS
         y7zQ==
X-Gm-Message-State: AOJu0YxSPepkl8UoAfq6vhjhQ+eVYCiVS9U38FjdVERTvziPgc84vtcB
	ioMbuM4Wha4YwKYeP3k38I4IjuIdiv6534IftvIplt7/VBfFNxaXnIgeV+TosDgJiFpayO1y7lL
	Ncv5CCsLpvfrL6X4O7cAff4AwBGDb/g==
X-Google-Smtp-Source: AGHT+IFUJKjHnBkKmB9asSW/t5NGhnkZuvsmz05tmNKzdIQ1fSuErYCSbKxb2x01bw+6/dtMwVXhloYfIKfc+LFSQp0=
X-Received: by 2002:a67:e293:0:b0:48f:eb67:9239 with SMTP id
 ada2fe7eead31-48fee916a5fmr4354204137.32.1720175672626; Fri, 05 Jul 2024
 03:34:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240704124559.194237-2-jose.quaresma@foundries.io> <9821df03d3beadfc51c83eb4924152d7977704f9.camel@linuxfoundation.org>
In-Reply-To: <9821df03d3beadfc51c83eb4924152d7977704f9.camel@linuxfoundation.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Fri, 5 Jul 2024 11:34:21 +0100
Message-ID: <CANPvuRmYM7R_dMLPRz9Fye7T8GUHAOnvDRdds2vpTq9k96nbZQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH v2] openssh: upgrade 9.7p1 -> 9.8p1
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: multipart/alternative; boundary="000000000000eb1745061c7d9b1c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jul 2024 10:34:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201599

--000000000000eb1745061c7d9b1c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Richard Purdie <richard.purdie@linuxfoundation.org> escreveu (quinta,
4/07/2024 =C3=A0(s) 21:27):

> On Thu, 2024-07-04 at 13:46 +0100, Jose Quaresma via
> lists.openembedded.org wrote:
> > Release notes at https://www.openssh.com/txt/release-9.8
> >
> > Security
> > =3D=3D=3D=3D=3D=3D=3D=3D
> >
> > This release contains fixes for two security problems, one critical
> > and one minor.
> >
> > 1) Race condition in sshd(8)
> >
> > A critical vulnerability in sshd(8) was present in Portable OpenSSH
> > versions between 8.5p1 and 9.7p1 (inclusive) that may allow arbitrary
> > code execution with root privileges.
> >
> > Successful exploitation has been demonstrated on 32-bit Linux/glibc
> > systems with ASLR. Under lab conditions, the attack requires on
> > average 6-8 hours of continuous connections up to the maximum the
> > server will accept. Exploitation on 64-bit systems is believed to be
> > possible but has not been demonstrated at this time. It's likely that
> > these attacks will be improved upon.
> >
> > Exploitation on non-glibc systems is conceivable but has not been
> > examined. Systems that lack ASLR or users of downstream Linux
> > distributions that have modified OpenSSH to disable per-connection
> > ASLR re-randomisation (yes - this is a thing, no - we don't
> > understand why) may potentially have an easier path to exploitation.
> > OpenBSD is not vulnerable.
> >
> > We thank the Qualys Security Advisory Team for discovering, reporting
> > and demonstrating exploitability of this problem, and for providing
> > detailed feedback on additional mitigation measures.
> >
> > 2) Logic error in ssh(1) ObscureKeystrokeTiming
> >
> > In OpenSSH version 9.5 through 9.7 (inclusive), when connected to an
> > OpenSSH server version 9.5 or later, a logic error in the ssh(1)
> > ObscureKeystrokeTiming feature (on by default) rendered this feature
> > ineffective - a passive observer could still detect which network
> > packets contained real keystrokes when the countermeasure was active
> > because both fake and real keystroke packets were being sent
> > unconditionally.
> >
> > This bug was found by Philippos Giavridis and also independently by
> > Jacky Wei En Kung, Daniel Hugenroth and Alastair Beresford of the
> > University of Cambridge Computer Lab.
> >
> > Worse, the unconditional sending of both fake and real keystroke
> > packets broke another long-standing timing attack mitigation. Since
> > OpenSSH 2.9.9 sshd(8) has sent fake keystoke echo packets for
> > traffic received on TTYs in echo-off mode, such as when entering a
> > password into su(8) or sudo(8). This bug rendered these fake
> > keystroke echoes ineffective and could allow a passive observer of
> > a SSH session to once again detect when echo was off and obtain
> > fairly limited timing information about keystrokes in this situation
> > (20ms granularity by default).
> >
> > This additional implication of the bug was identified by Jacky Wei
> > En Kung, Daniel Hugenroth and Alastair Beresford and we thank them
> > for their detailed analysis.
> >
> > This bug does not affect connections when ObscureKeystrokeTiming
> > was disabled or sessions where no TTY was requested.
> >
> > Future deprecation notice
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> >
> > OpenSSH plans to remove support for the DSA signature algorithm in
> > early 2025. This release disables DSA by default at compile time.
> >
> > DSA, as specified in the SSHv2 protocol, is inherently weak - being
> > limited to a 160 bit private key and use of the SHA1 digest. Its
> > estimated security level is only 80 bits symmetric equivalent.
> >
> > OpenSSH has disabled DSA keys by default since 2015 but has retained
> > run-time optional support for them. DSA was the only mandatory-to-
> > implement algorithm in the SSHv2 RFCs, mostly because alternative
> > algorithms were encumbered by patents when the SSHv2 protocol was
> > specified.
> >
> > This has not been the case for decades at this point and better
> > algorithms are well supported by all actively-maintained SSH
> > implementations. We do not consider the costs of maintaining DSA
> > in OpenSSH to be justified and hope that removing it from OpenSSH
> > can accelerate its wider deprecation in supporting cryptography
> > libraries.
> >
> > This release, and its deactivation of DSA by default at compile-time,
> > marks the second step in our timeline to finally deprecate DSA. The
> > final step of removing DSA support entirely is planned for the first
> > OpenSSH release of 2025.
> >
> > DSA support may be re-enabled in OpenBSD by setting "DSAKEY=3Dyes"
> > in Makefile.inc. To enable DSA support in portable OpenSSH, pass
> > the "--enable-dsa-keys" option to configure.
> >
> > Potentially-incompatible changes
> > --------------------------------
> >
> >  * all: as mentioned above, the DSA signature algorithm is now
> >    disabled at compile time.
> >
> >  * sshd(8): the server will now block client addresses that
> >    repeatedly fail authentication, repeatedly connect without ever
> >    completing authentication or that crash the server. See the
> >    discussion of PerSourcePenalties below for more information.
> >    Operators of servers that accept connections from many users, or
> >    servers that accept connections from addresses behind NAT or
> >    proxies may need to consider these settings.
> >
> >  * sshd(8): the server has been split into a listener binary,
> > sshd(8),
> >    and a per-session binary "sshd-session". This allows for a much
> >    smaller listener binary, as it no longer needs to support the SSH
> >    protocol. As part of this work, support for disabling privilege
> >    separation (which previously required code changes to disable) and
> >    disabling re-execution of sshd(8) has been removed. Further
> >    separation of sshd-session into additional, minimal binaries is
> >    planned for the future.
> >
> >  * sshd(8): several log messages have changed. In particular, some
> >    log messages will be tagged with as originating from a process
> >    named "sshd-session" rather than "sshd".
> >
> >  * ssh-keyscan(1): this tool previously emitted comment lines
> >    containing the hostname and SSH protocol banner to standard error.
> >    This release now emits them to standard output, but adds a new
> >    "-q" flag to silence them altogether.
> >
> >  * sshd(8): (portable OpenSSH only) sshd will no longer use argv[0]
> >    as the PAM service name. A new "PAMServiceName" sshd_config(5)
> >    directive allows selecting the service name at runtime. This
> >    defaults to "sshd". bz2101
> >
> >  * (portable OpenSSH only) Automatically-generated files, such as
> >    configure, config.h.in, etc will now be checked in to the portable
> >    OpenSSH git release branch (e.g. V_9_8). This should ensure that
> >    the contents of the signed release branch exactly match the
> >    contents of the signed release tarball.
> >
> > Changes since OpenSSH 9.7
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> >
> > This release contains mostly bugfixes.
> >
> > New features
> > ------------
> >
> >  * sshd(8): as described above, sshd(8) will now penalise client
> >    addresses that, for various reasons, do not successfully complete
> >    authentication. This feature is controlled by a new sshd_config(5)
> >    PerSourcePenalties option and is on by default.
> >
> >    sshd(8) will now identify situations where the session did not
> >    authenticate as expected. These conditions include when the client
> >    repeatedly attempted authentication unsucessfully (possibly
> >    indicating an attack against one or more accounts, e.g. password
> >    guessing), or when client behaviour caused sshd to crash (possibly
> >    indicating attempts to exploit bugs in sshd).
> >
> >    When such a condition is observed, sshd will record a penalty of
> >    some duration (e.g. 30 seconds) against the client's address. If
> >    this time is above a minimum configurable threshold, then all
> >    connections from the client address will be refused (along with
> > any
> >    others in the same PerSourceNetBlockSize CIDR range) until the
> >    penalty expire.
> >
> >    Repeated offenses by the same client address will accrue greater
> >    penalties, up to a configurable maximum. Address ranges may be
> >    fully exempted from penalties, e.g. to guarantee access from a set
> >    of trusted management addresses, using the new sshd_config(5)
> >    PerSourcePenaltyExemptList option.
> >
> >    We hope these options will make it significantly more difficult
> > for
> >    attackers to find accounts with weak/guessable passwords or
> > exploit
> >    bugs in sshd(8) itself. This option is enabled by default.
> >
> >  * ssh(8): allow the HostkeyAlgorithms directive to disable the
> >    implicit fallback from certificate host key to plain host keys.
> >
> > Bugfixes
> > --------
> >
> >  * misc: fix a number of inaccuracies in the PROTOCOL.*
> >    documentation files. GHPR430 GHPR487
> >
> >  * all: switch to strtonum(3) for more robust integer parsing in most
> >    places.
> >
> >  * ssh(1), sshd(8): correctly restore sigprocmask around ppoll()
> >
> >  * ssh-keysign(8): stricter validation of messaging socket fd GHPR492
> >
> >  * sftp(1): flush stdout after writing "sftp>" prompt when not using
> >    editline. GHPR480
> >
> >  * sftp-server(8): fix home-directory extension implementation, it
> >    previously always returned the current user's home directory
> >    contrary to the spec. GHPR477
> >
> >  * ssh-keyscan(1): do not close stdin to prevent error messages when
> >    stdin is read multiple times. E.g.
> >    echo localhost | ssh-keyscan -f - -f -
> >
> >  * regression tests: fix rekey test that was testing the same KEX
> >    algorithm repeatedly instead of testing all of them. bz3692
> >
> >  * ssh_config(5), sshd_config(5): clarify the KEXAlgorithms directive
> >    documentation, especially around what is supported vs available.
> >    bz3701.
> >
> > Portability
> > -----------
> >
> >  * sshd(8): expose SSH_AUTH_INFO_0 always to PAM auth modules
> >    unconditionally. The previous behaviour was to expose it only when
> >    particular authentication methods were in use.
> >
> >  * build: fix OpenSSL ED25519 support detection. An incorrect
> > function
> >    signature in configure.ac previously prevented enabling the
> > recently
> >    added support for ED25519 private keys in PEM PKCS8 format.
> >
> >  * ssh(1), ssh-agent(8): allow the presence of the WAYLAND_DISPLAY
> >    environment variable to enable SSH_ASKPASS, similarly to the X11
> >    DISPLAY environment variable. GHPR479
> >
> >  * build: improve detection of the -fzero-call-used-regs compiler
> >    flag. bz3673.
> >
> >  * build: relax OpenSSL version check to accept all OpenSSL 3.x
> >    versions.
> >
> >  * sshd(8): add support for notifying systemd on server listen and
> >    reload, using a standalone implementation that doesn't depend on
> >    libsystemd. bz2641
> >
> > Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> > ---
> >
> > v2:
> >  - fix musl build
> >  - fix sshd-session packing on openssh-sshd
> >  - rebase on top of the CVE-2024-6387 fix sent
>
> Thanks for the fixes. Unfortunately I think there is still one issue
> remaining as the openssh ptests appear to be hanging on both arm and
> x86:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/6600
> https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/6778
>
> On a previous build run I ended up stopping them after 24h+ but I
> wasn't sure if that was related to other issues with the update or not.
> It now looks like it is a separate issue :(
>

I will take a look on this ptests failings.
Thanks for reporting.

Jose


>
> Cheers,
>
> Richard
>


--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000eb1745061c7d9b1c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Richard Purdie &lt;<a href=3D"mailto:=
richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&=
gt; escreveu (quinta, 4/07/2024 =C3=A0(s) 21:27):<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">On Thu, 2024-07-04 at 13:46 +0100, Jose Q=
uaresma via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a> wrote:<br>
&gt; Release notes at <a href=3D"https://www.openssh.com/txt/release-9.8" r=
el=3D"noreferrer" target=3D"_blank">https://www.openssh.com/txt/release-9.8=
</a><br>
&gt; <br>
&gt; Security<br>
&gt; =3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; <br>
&gt; This release contains fixes for two security problems, one critical<br=
>
&gt; and one minor.<br>
&gt; <br>
&gt; 1) Race condition in sshd(8)<br>
&gt; <br>
&gt; A critical vulnerability in sshd(8) was present in Portable OpenSSH<br=
>
&gt; versions between 8.5p1 and 9.7p1 (inclusive) that may allow arbitrary<=
br>
&gt; code execution with root privileges.<br>
&gt; <br>
&gt; Successful exploitation has been demonstrated on 32-bit Linux/glibc<br=
>
&gt; systems with ASLR. Under lab conditions, the attack requires on<br>
&gt; average 6-8 hours of continuous connections up to the maximum the<br>
&gt; server will accept. Exploitation on 64-bit systems is believed to be<b=
r>
&gt; possible but has not been demonstrated at this time. It&#39;s likely t=
hat<br>
&gt; these attacks will be improved upon.<br>
&gt; <br>
&gt; Exploitation on non-glibc systems is conceivable but has not been<br>
&gt; examined. Systems that lack ASLR or users of downstream Linux<br>
&gt; distributions that have modified OpenSSH to disable per-connection<br>
&gt; ASLR re-randomisation (yes - this is a thing, no - we don&#39;t<br>
&gt; understand why) may potentially have an easier path to exploitation.<b=
r>
&gt; OpenBSD is not vulnerable.<br>
&gt; <br>
&gt; We thank the Qualys Security Advisory Team for discovering, reporting<=
br>
&gt; and demonstrating exploitability of this problem, and for providing<br=
>
&gt; detailed feedback on additional mitigation measures.<br>
&gt; <br>
&gt; 2) Logic error in ssh(1) ObscureKeystrokeTiming<br>
&gt; <br>
&gt; In OpenSSH version 9.5 through 9.7 (inclusive), when connected to an<b=
r>
&gt; OpenSSH server version 9.5 or later, a logic error in the ssh(1)<br>
&gt; ObscureKeystrokeTiming feature (on by default) rendered this feature<b=
r>
&gt; ineffective - a passive observer could still detect which network<br>
&gt; packets contained real keystrokes when the countermeasure was active<b=
r>
&gt; because both fake and real keystroke packets were being sent<br>
&gt; unconditionally.<br>
&gt; <br>
&gt; This bug was found by Philippos Giavridis and also independently by<br=
>
&gt; Jacky Wei En Kung, Daniel Hugenroth and Alastair Beresford of the<br>
&gt; University of Cambridge Computer Lab.<br>
&gt; <br>
&gt; Worse, the unconditional sending of both fake and real keystroke<br>
&gt; packets broke another long-standing timing attack mitigation. Since<br=
>
&gt; OpenSSH 2.9.9 sshd(8) has sent fake keystoke echo packets for<br>
&gt; traffic received on TTYs in echo-off mode, such as when entering a<br>
&gt; password into su(8) or sudo(8). This bug rendered these fake<br>
&gt; keystroke echoes ineffective and could allow a passive observer of<br>
&gt; a SSH session to once again detect when echo was off and obtain<br>
&gt; fairly limited timing information about keystrokes in this situation<b=
r>
&gt; (20ms granularity by default).<br>
&gt; <br>
&gt; This additional implication of the bug was identified by Jacky Wei<br>
&gt; En Kung, Daniel Hugenroth and Alastair Beresford and we thank them<br>
&gt; for their detailed analysis.<br>
&gt; <br>
&gt; This bug does not affect connections when ObscureKeystrokeTiming<br>
&gt; was disabled or sessions where no TTY was requested.<br>
&gt; <br>
&gt; Future deprecation notice<br>
&gt; =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D<br>
&gt; <br>
&gt; OpenSSH plans to remove support for the DSA signature algorithm in<br>
&gt; early 2025. This release disables DSA by default at compile time.<br>
&gt; <br>
&gt; DSA, as specified in the SSHv2 protocol, is inherently weak - being<br=
>
&gt; limited to a 160 bit private key and use of the SHA1 digest. Its<br>
&gt; estimated security level is only 80 bits symmetric equivalent.<br>
&gt; <br>
&gt; OpenSSH has disabled DSA keys by default since 2015 but has retained<b=
r>
&gt; run-time optional support for them. DSA was the only mandatory-to-<br>
&gt; implement algorithm in the SSHv2 RFCs, mostly because alternative<br>
&gt; algorithms were encumbered by patents when the SSHv2 protocol was<br>
&gt; specified.<br>
&gt; <br>
&gt; This has not been the case for decades at this point and better<br>
&gt; algorithms are well supported by all actively-maintained SSH<br>
&gt; implementations. We do not consider the costs of maintaining DSA<br>
&gt; in OpenSSH to be justified and hope that removing it from OpenSSH<br>
&gt; can accelerate its wider deprecation in supporting cryptography<br>
&gt; libraries.<br>
&gt; <br>
&gt; This release, and its deactivation of DSA by default at compile-time,<=
br>
&gt; marks the second step in our timeline to finally deprecate DSA. The<br=
>
&gt; final step of removing DSA support entirely is planned for the first<b=
r>
&gt; OpenSSH release of 2025.<br>
&gt; <br>
&gt; DSA support may be re-enabled in OpenBSD by setting &quot;DSAKEY=3Dyes=
&quot;<br>
&gt; in Makefile.inc. To enable DSA support in portable OpenSSH, pass<br>
&gt; the &quot;--enable-dsa-keys&quot; option to configure.<br>
&gt; <br>
&gt; Potentially-incompatible changes<br>
&gt; --------------------------------<br>
&gt; <br>
&gt; =C2=A0* all: as mentioned above, the DSA signature algorithm is now<br=
>
&gt; =C2=A0=C2=A0 disabled at compile time.<br>
&gt; <br>
&gt; =C2=A0* sshd(8): the server will now block client addresses that<br>
&gt; =C2=A0=C2=A0 repeatedly fail authentication, repeatedly connect withou=
t ever<br>
&gt; =C2=A0=C2=A0 completing authentication or that crash the server. See t=
he<br>
&gt; =C2=A0=C2=A0 discussion of PerSourcePenalties below for more informati=
on.<br>
&gt; =C2=A0=C2=A0 Operators of servers that accept connections from many us=
ers, or<br>
&gt; =C2=A0=C2=A0 servers that accept connections from addresses behind NAT=
 or<br>
&gt; =C2=A0=C2=A0 proxies may need to consider these settings.<br>
&gt; <br>
&gt; =C2=A0* sshd(8): the server has been split into a listener binary,<br>
&gt; sshd(8),<br>
&gt; =C2=A0=C2=A0 and a per-session binary &quot;sshd-session&quot;. This a=
llows for a much<br>
&gt; =C2=A0=C2=A0 smaller listener binary, as it no longer needs to support=
 the SSH<br>
&gt; =C2=A0=C2=A0 protocol. As part of this work, support for disabling pri=
vilege<br>
&gt; =C2=A0=C2=A0 separation (which previously required code changes to dis=
able) and<br>
&gt; =C2=A0=C2=A0 disabling re-execution of sshd(8) has been removed. Furth=
er<br>
&gt; =C2=A0=C2=A0 separation of sshd-session into additional, minimal binar=
ies is<br>
&gt; =C2=A0=C2=A0 planned for the future.<br>
&gt; <br>
&gt; =C2=A0* sshd(8): several log messages have changed. In particular, som=
e<br>
&gt; =C2=A0=C2=A0 log messages will be tagged with as originating from a pr=
ocess<br>
&gt; =C2=A0=C2=A0 named &quot;sshd-session&quot; rather than &quot;sshd&quo=
t;.<br>
&gt; <br>
&gt; =C2=A0* ssh-keyscan(1): this tool previously emitted comment lines<br>
&gt; =C2=A0=C2=A0 containing the hostname and SSH protocol banner to standa=
rd error.<br>
&gt; =C2=A0=C2=A0 This release now emits them to standard output, but adds =
a new<br>
&gt; =C2=A0=C2=A0 &quot;-q&quot; flag to silence them altogether.<br>
&gt; <br>
&gt; =C2=A0* sshd(8): (portable OpenSSH only) sshd will no longer use argv[=
0]<br>
&gt; =C2=A0=C2=A0 as the PAM service name. A new &quot;PAMServiceName&quot;=
 sshd_config(5)<br>
&gt; =C2=A0=C2=A0 directive allows selecting the service name at runtime. T=
his<br>
&gt; =C2=A0=C2=A0 defaults to &quot;sshd&quot;. bz2101<br>
&gt; <br>
&gt; =C2=A0* (portable OpenSSH only) Automatically-generated files, such as=
<br>
&gt; =C2=A0=C2=A0 configure, <a href=3D"http://config.h.in" rel=3D"noreferr=
er" target=3D"_blank">config.h.in</a>, etc will now be checked in to the po=
rtable<br>
&gt; =C2=A0=C2=A0 OpenSSH git release branch (e.g. V_9_8). This should ensu=
re that<br>
&gt; =C2=A0=C2=A0 the contents of the signed release branch exactly match t=
he<br>
&gt; =C2=A0=C2=A0 contents of the signed release tarball.<br>
&gt; <br>
&gt; Changes since OpenSSH 9.7<br>
&gt; =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D<br>
&gt; <br>
&gt; This release contains mostly bugfixes.<br>
&gt; <br>
&gt; New features<br>
&gt; ------------<br>
&gt; <br>
&gt; =C2=A0* sshd(8): as described above, sshd(8) will now penalise client<=
br>
&gt; =C2=A0=C2=A0 addresses that, for various reasons, do not successfully =
complete<br>
&gt; =C2=A0=C2=A0 authentication. This feature is controlled by a new sshd_=
config(5)<br>
&gt; =C2=A0=C2=A0 PerSourcePenalties option and is on by default.<br>
&gt; <br>
&gt; =C2=A0=C2=A0 sshd(8) will now identify situations where the session di=
d not<br>
&gt; =C2=A0=C2=A0 authenticate as expected. These conditions include when t=
he client<br>
&gt; =C2=A0=C2=A0 repeatedly attempted authentication unsucessfully (possib=
ly<br>
&gt; =C2=A0=C2=A0 indicating an attack against one or more accounts, e.g. p=
assword<br>
&gt; =C2=A0=C2=A0 guessing), or when client behaviour caused sshd to crash =
(possibly<br>
&gt; =C2=A0=C2=A0 indicating attempts to exploit bugs in sshd).<br>
&gt; <br>
&gt; =C2=A0=C2=A0 When such a condition is observed, sshd will record a pen=
alty of<br>
&gt; =C2=A0=C2=A0 some duration (e.g. 30 seconds) against the client&#39;s =
address. If<br>
&gt; =C2=A0=C2=A0 this time is above a minimum configurable threshold, then=
 all<br>
&gt; =C2=A0=C2=A0 connections from the client address will be refused (alon=
g with<br>
&gt; any<br>
&gt; =C2=A0=C2=A0 others in the same PerSourceNetBlockSize CIDR range) unti=
l the<br>
&gt; =C2=A0=C2=A0 penalty expire.<br>
&gt; <br>
&gt; =C2=A0=C2=A0 Repeated offenses by the same client address will accrue =
greater<br>
&gt; =C2=A0=C2=A0 penalties, up to a configurable maximum. Address ranges m=
ay be<br>
&gt; =C2=A0=C2=A0 fully exempted from penalties, e.g. to guarantee access f=
rom a set<br>
&gt; =C2=A0=C2=A0 of trusted management addresses, using the new sshd_confi=
g(5)<br>
&gt; =C2=A0=C2=A0 PerSourcePenaltyExemptList option.<br>
&gt; <br>
&gt; =C2=A0=C2=A0 We hope these options will make it significantly more dif=
ficult<br>
&gt; for<br>
&gt; =C2=A0=C2=A0 attackers to find accounts with weak/guessable passwords =
or<br>
&gt; exploit<br>
&gt; =C2=A0=C2=A0 bugs in sshd(8) itself. This option is enabled by default=
.<br>
&gt; <br>
&gt; =C2=A0* ssh(8): allow the HostkeyAlgorithms directive to disable the<b=
r>
&gt; =C2=A0=C2=A0 implicit fallback from certificate host key to plain host=
 keys.<br>
&gt; <br>
&gt; Bugfixes<br>
&gt; --------<br>
&gt; <br>
&gt; =C2=A0* misc: fix a number of inaccuracies in the PROTOCOL.*<br>
&gt; =C2=A0=C2=A0 documentation files. GHPR430 GHPR487<br>
&gt; <br>
&gt; =C2=A0* all: switch to strtonum(3) for more robust integer parsing in =
most<br>
&gt; =C2=A0=C2=A0 places.<br>
&gt; <br>
&gt; =C2=A0* ssh(1), sshd(8): correctly restore sigprocmask around ppoll()<=
br>
&gt; <br>
&gt; =C2=A0* ssh-keysign(8): stricter validation of messaging socket fd GHP=
R492<br>
&gt; <br>
&gt; =C2=A0* sftp(1): flush stdout after writing &quot;sftp&gt;&quot; promp=
t when not using<br>
&gt; =C2=A0=C2=A0 editline. GHPR480<br>
&gt; <br>
&gt; =C2=A0* sftp-server(8): fix home-directory extension implementation, i=
t<br>
&gt; =C2=A0=C2=A0 previously always returned the current user&#39;s home di=
rectory<br>
&gt; =C2=A0=C2=A0 contrary to the spec. GHPR477<br>
&gt; <br>
&gt; =C2=A0* ssh-keyscan(1): do not close stdin to prevent error messages w=
hen<br>
&gt; =C2=A0=C2=A0 stdin is read multiple times. E.g.<br>
&gt; =C2=A0=C2=A0 echo localhost | ssh-keyscan -f - -f -<br>
&gt; <br>
&gt; =C2=A0* regression tests: fix rekey test that was testing the same KEX=
<br>
&gt; =C2=A0=C2=A0 algorithm repeatedly instead of testing all of them. bz36=
92<br>
&gt; <br>
&gt; =C2=A0* ssh_config(5), sshd_config(5): clarify the KEXAlgorithms direc=
tive<br>
&gt; =C2=A0=C2=A0 documentation, especially around what is supported vs ava=
ilable.<br>
&gt; =C2=A0=C2=A0 bz3701.<br>
&gt; <br>
&gt; Portability<br>
&gt; -----------<br>
&gt; <br>
&gt; =C2=A0* sshd(8): expose SSH_AUTH_INFO_0 always to PAM auth modules<br>
&gt; =C2=A0=C2=A0 unconditionally. The previous behaviour was to expose it =
only when<br>
&gt; =C2=A0=C2=A0 particular authentication methods were in use.<br>
&gt; <br>
&gt; =C2=A0* build: fix OpenSSL ED25519 support detection. An incorrect<br>
&gt; function<br>
&gt; =C2=A0=C2=A0 signature in <a href=3D"http://configure.ac" rel=3D"noref=
errer" target=3D"_blank">configure.ac</a> previously prevented enabling the=
<br>
&gt; recently<br>
&gt; =C2=A0=C2=A0 added support for ED25519 private keys in PEM PKCS8 forma=
t.<br>
&gt; <br>
&gt; =C2=A0* ssh(1), ssh-agent(8): allow the presence of the WAYLAND_DISPLA=
Y<br>
&gt; =C2=A0=C2=A0 environment variable to enable SSH_ASKPASS, similarly to =
the X11<br>
&gt; =C2=A0=C2=A0 DISPLAY environment variable. GHPR479<br>
&gt; <br>
&gt; =C2=A0* build: improve detection of the -fzero-call-used-regs compiler=
<br>
&gt; =C2=A0=C2=A0 flag. bz3673.<br>
&gt; <br>
&gt; =C2=A0* build: relax OpenSSL version check to accept all OpenSSL 3.x<b=
r>
&gt; =C2=A0=C2=A0 versions.<br>
&gt; <br>
&gt; =C2=A0* sshd(8): add support for notifying systemd on server listen an=
d<br>
&gt; =C2=A0=C2=A0 reload, using a standalone implementation that doesn&#39;=
t depend on<br>
&gt; =C2=A0=C2=A0 libsystemd. bz2641<br>
&gt; <br>
&gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@found=
ries.io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
&gt; ---<br>
&gt; <br>
&gt; v2:<br>
&gt; =C2=A0- fix musl build<br>
&gt; =C2=A0- fix sshd-session packing on openssh-sshd<br>
&gt; =C2=A0- rebase on top of the CVE-2024-6387 fix sent<br>
<br>
Thanks for the fixes. Unfortunately I think there is still one issue<br>
remaining as the openssh ptests appear to be hanging on both arm and<br>
x86:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/82/build=
s/6600" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/82/builds/6600</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/81/build=
s/6778" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/81/builds/6778</a><br>
<br>
On a previous build run I ended up stopping them after 24h+ but I<br>
wasn&#39;t sure if that was related to other issues with the update or not.=
<br>
It now looks like it is a separate issue :(<br></blockquote><div><br></div>=
<div>I will take a look on this ptests=C2=A0failings.</div><div>Thanks for =
reporting.</div><div><br></div><div>Jose</div><div>=C2=A0</div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--000000000000eb1745061c7d9b1c--

