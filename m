Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEF9DC30653
	for <webhook@archiver.kernel.org>; Thu,  4 Jul 2024 20:27:22 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web10.3897.1720124834344639255
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jul 2024 13:27:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RPEBbl4I;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.171, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2ebe40673e8so12852081fa.3
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 13:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1720124832; x=1720729632; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PK9sffvZV32cssbjh9R4Wszk7mC+Xm46d/C7ZEU11/s=;
        b=RPEBbl4IQ3/sYq53MSRj9/ckH/UOlml/ZJSlHGNSGPuf/G5ZG0+udVrz6FzLh2W+eU
         KQxAwIOdHfr7ZWdZRl9b+4VW6fNnGrlKqVy5lnOd+SwjcPGO/x+xnNX0Xdm6cDjZpqLF
         GAWNwWA82gowoFDErhPb+YzNmG0hS4ZuqR7N4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720124832; x=1720729632;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PK9sffvZV32cssbjh9R4Wszk7mC+Xm46d/C7ZEU11/s=;
        b=hN67CWMv5CRZsSdyn00U37/T96+KeZcLWGQp0UAjnl2ff7NFF7JR6fTgvwJ8u2TBPW
         PYxVXbJHJGo1GP8US2GXMhfXCNMXrLohBbzkUcp+XllHzn9qMMqSngLFHSfiR54nsOeu
         LMbwc9yleTsoYtBmqn4OmxkXfaegYfJTmQU9WyEvODxgVhlrmaib/pTdheAXrSWIbIYz
         mPWd6jCUY8v8cmODmf8vaYM6rMntW0peIfeTJrCrFgrdIkv3ea+YP79bISrkX+gIlm8D
         2uAG8jbTS4lTq9fvD+Ea1PrkMlzw0c44eHCSbHq6Klu6CVg5m2CGD7nNhKM4sB81pneh
         WLow==
X-Forwarded-Encrypted: i=1; AJvYcCW10ufvA2EU5zQq4yv3oIVbb/FIQvcM9juUSfdzyNs1N6Q5djzIagMBbgZxKGwhYnPH84BpmT7IvkDWaVSg3DGKAjappqByolfcTSdNUKZHjnQ5qLqx2nGe
X-Gm-Message-State: AOJu0YyrQmHwHtL+KZIhKgsz7AcLeRmtHbfPGGInQKy+6CdlQNOEZMJU
	qcH9sN03xPuaG8WNiVJcqh+GISLM5GkbIc4UsytOUjcun7WMQ4V83m/Ax+zXEa4=
X-Google-Smtp-Source: AGHT+IEES6Em6ykCFBW7kgDp/hRZCcZi27ECuJfcsZqIuwrPSV3CJVhu/0SDzb0zVwAW+X3XTlwJHA==
X-Received: by 2002:a2e:8e82:0:b0:2ec:617b:4757 with SMTP id 38308e7fff4ca-2ee8ed8c869mr16463431fa.13.1720124832173;
        Thu, 04 Jul 2024 13:27:12 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:51b8:7897:e495:c586? ([2001:8b0:aba:5f3c:51b8:7897:e495:c586])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a188edasm35882055e9.0.2024.07.04.13.27.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 13:27:11 -0700 (PDT)
Message-ID: <9821df03d3beadfc51c83eb4924152d7977704f9.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH v2] openssh: upgrade 9.7p1 -> 9.8p1
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: quaresma.jose@gmail.com, openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Date: Thu, 04 Jul 2024 21:27:10 +0100
In-Reply-To: <20240704124559.194237-2-jose.quaresma@foundries.io>
References: <20240704124559.194237-2-jose.quaresma@foundries.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 20:27:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201586

On Thu, 2024-07-04 at 13:46 +0100, Jose Quaresma via
lists.openembedded.org wrote:
> Release notes at https://www.openssh.com/txt/release-9.8
>=20
> Security
> =3D=3D=3D=3D=3D=3D=3D=3D
>=20
> This release contains fixes for two security problems, one critical
> and one minor.
>=20
> 1) Race condition in sshd(8)
>=20
> A critical vulnerability in sshd(8) was present in Portable OpenSSH
> versions between 8.5p1 and 9.7p1 (inclusive) that may allow arbitrary
> code execution with root privileges.
>=20
> Successful exploitation has been demonstrated on 32-bit Linux/glibc
> systems with ASLR. Under lab conditions, the attack requires on
> average 6-8 hours of continuous connections up to the maximum the
> server will accept. Exploitation on 64-bit systems is believed to be
> possible but has not been demonstrated at this time. It's likely that
> these attacks will be improved upon.
>=20
> Exploitation on non-glibc systems is conceivable but has not been
> examined. Systems that lack ASLR or users of downstream Linux
> distributions that have modified OpenSSH to disable per-connection
> ASLR re-randomisation (yes - this is a thing, no - we don't
> understand why) may potentially have an easier path to exploitation.
> OpenBSD is not vulnerable.
>=20
> We thank the Qualys Security Advisory Team for discovering, reporting
> and demonstrating exploitability of this problem, and for providing
> detailed feedback on additional mitigation measures.
>=20
> 2) Logic error in ssh(1) ObscureKeystrokeTiming
>=20
> In OpenSSH version 9.5 through 9.7 (inclusive), when connected to an
> OpenSSH server version 9.5 or later, a logic error in the ssh(1)
> ObscureKeystrokeTiming feature (on by default) rendered this feature
> ineffective - a passive observer could still detect which network
> packets contained real keystrokes when the countermeasure was active
> because both fake and real keystroke packets were being sent
> unconditionally.
>=20
> This bug was found by Philippos Giavridis and also independently by
> Jacky Wei En Kung, Daniel Hugenroth and Alastair Beresford of the
> University of Cambridge Computer Lab.
>=20
> Worse, the unconditional sending of both fake and real keystroke
> packets broke another long-standing timing attack mitigation. Since
> OpenSSH 2.9.9 sshd(8) has sent fake keystoke echo packets for
> traffic received on TTYs in echo-off mode, such as when entering a
> password into su(8) or sudo(8). This bug rendered these fake
> keystroke echoes ineffective and could allow a passive observer of
> a SSH session to once again detect when echo was off and obtain
> fairly limited timing information about keystrokes in this situation
> (20ms granularity by default).
>=20
> This additional implication of the bug was identified by Jacky Wei
> En Kung, Daniel Hugenroth and Alastair Beresford and we thank them
> for their detailed analysis.
>=20
> This bug does not affect connections when ObscureKeystrokeTiming
> was disabled or sessions where no TTY was requested.
>=20
> Future deprecation notice
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
>=20
> OpenSSH plans to remove support for the DSA signature algorithm in
> early 2025. This release disables DSA by default at compile time.
>=20
> DSA, as specified in the SSHv2 protocol, is inherently weak - being
> limited to a 160 bit private key and use of the SHA1 digest. Its
> estimated security level is only 80 bits symmetric equivalent.
>=20
> OpenSSH has disabled DSA keys by default since 2015 but has retained
> run-time optional support for them. DSA was the only mandatory-to-
> implement algorithm in the SSHv2 RFCs, mostly because alternative
> algorithms were encumbered by patents when the SSHv2 protocol was
> specified.
>=20
> This has not been the case for decades at this point and better
> algorithms are well supported by all actively-maintained SSH
> implementations. We do not consider the costs of maintaining DSA
> in OpenSSH to be justified and hope that removing it from OpenSSH
> can accelerate its wider deprecation in supporting cryptography
> libraries.
>=20
> This release, and its deactivation of DSA by default at compile-time,
> marks the second step in our timeline to finally deprecate DSA. The
> final step of removing DSA support entirely is planned for the first
> OpenSSH release of 2025.
>=20
> DSA support may be re-enabled in OpenBSD by setting "DSAKEY=3Dyes"
> in Makefile.inc. To enable DSA support in portable OpenSSH, pass
> the "--enable-dsa-keys" option to configure.
>=20
> Potentially-incompatible changes
> --------------------------------
>=20
> =C2=A0* all: as mentioned above, the DSA signature algorithm is now
> =C2=A0=C2=A0 disabled at compile time.
>=20
> =C2=A0* sshd(8): the server will now block client addresses that
> =C2=A0=C2=A0 repeatedly fail authentication, repeatedly connect without e=
ver
> =C2=A0=C2=A0 completing authentication or that crash the server. See the
> =C2=A0=C2=A0 discussion of PerSourcePenalties below for more information.
> =C2=A0=C2=A0 Operators of servers that accept connections from many users=
, or
> =C2=A0=C2=A0 servers that accept connections from addresses behind NAT or
> =C2=A0=C2=A0 proxies may need to consider these settings.
>=20
> =C2=A0* sshd(8): the server has been split into a listener binary,
> sshd(8),
> =C2=A0=C2=A0 and a per-session binary "sshd-session". This allows for a m=
uch
> =C2=A0=C2=A0 smaller listener binary, as it no longer needs to support th=
e SSH
> =C2=A0=C2=A0 protocol. As part of this work, support for disabling privil=
ege
> =C2=A0=C2=A0 separation (which previously required code changes to disabl=
e) and
> =C2=A0=C2=A0 disabling re-execution of sshd(8) has been removed. Further
> =C2=A0=C2=A0 separation of sshd-session into additional, minimal binaries=
 is
> =C2=A0=C2=A0 planned for the future.
>=20
> =C2=A0* sshd(8): several log messages have changed. In particular, some
> =C2=A0=C2=A0 log messages will be tagged with as originating from a proce=
ss
> =C2=A0=C2=A0 named "sshd-session" rather than "sshd".
>=20
> =C2=A0* ssh-keyscan(1): this tool previously emitted comment lines
> =C2=A0=C2=A0 containing the hostname and SSH protocol banner to standard =
error.
> =C2=A0=C2=A0 This release now emits them to standard output, but adds a n=
ew
> =C2=A0=C2=A0 "-q" flag to silence them altogether.
>=20
> =C2=A0* sshd(8): (portable OpenSSH only) sshd will no longer use argv[0]
> =C2=A0=C2=A0 as the PAM service name. A new "PAMServiceName" sshd_config(=
5)
> =C2=A0=C2=A0 directive allows selecting the service name at runtime. This
> =C2=A0=C2=A0 defaults to "sshd". bz2101
>=20
> =C2=A0* (portable OpenSSH only) Automatically-generated files, such as
> =C2=A0=C2=A0 configure, config.h.in, etc will now be checked in to the po=
rtable
> =C2=A0=C2=A0 OpenSSH git release branch (e.g. V_9_8). This should ensure =
that
> =C2=A0=C2=A0 the contents of the signed release branch exactly match the
> =C2=A0=C2=A0 contents of the signed release tarball.
>=20
> Changes since OpenSSH 9.7
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
>=20
> This release contains mostly bugfixes.
>=20
> New features
> ------------
>=20
> =C2=A0* sshd(8): as described above, sshd(8) will now penalise client
> =C2=A0=C2=A0 addresses that, for various reasons, do not successfully com=
plete
> =C2=A0=C2=A0 authentication. This feature is controlled by a new sshd_con=
fig(5)
> =C2=A0=C2=A0 PerSourcePenalties option and is on by default.
>=20
> =C2=A0=C2=A0 sshd(8) will now identify situations where the session did n=
ot
> =C2=A0=C2=A0 authenticate as expected. These conditions include when the =
client
> =C2=A0=C2=A0 repeatedly attempted authentication unsucessfully (possibly
> =C2=A0=C2=A0 indicating an attack against one or more accounts, e.g. pass=
word
> =C2=A0=C2=A0 guessing), or when client behaviour caused sshd to crash (po=
ssibly
> =C2=A0=C2=A0 indicating attempts to exploit bugs in sshd).
>=20
> =C2=A0=C2=A0 When such a condition is observed, sshd will record a penalt=
y of
> =C2=A0=C2=A0 some duration (e.g. 30 seconds) against the client's address=
. If
> =C2=A0=C2=A0 this time is above a minimum configurable threshold, then al=
l
> =C2=A0=C2=A0 connections from the client address will be refused (along w=
ith
> any
> =C2=A0=C2=A0 others in the same PerSourceNetBlockSize CIDR range) until t=
he
> =C2=A0=C2=A0 penalty expire.
>=20
> =C2=A0=C2=A0 Repeated offenses by the same client address will accrue gre=
ater
> =C2=A0=C2=A0 penalties, up to a configurable maximum. Address ranges may =
be
> =C2=A0=C2=A0 fully exempted from penalties, e.g. to guarantee access from=
 a set
> =C2=A0=C2=A0 of trusted management addresses, using the new sshd_config(5=
)
> =C2=A0=C2=A0 PerSourcePenaltyExemptList option.
>=20
> =C2=A0=C2=A0 We hope these options will make it significantly more diffic=
ult
> for
> =C2=A0=C2=A0 attackers to find accounts with weak/guessable passwords or
> exploit
> =C2=A0=C2=A0 bugs in sshd(8) itself. This option is enabled by default.
>=20
> =C2=A0* ssh(8): allow the HostkeyAlgorithms directive to disable the
> =C2=A0=C2=A0 implicit fallback from certificate host key to plain host ke=
ys.
>=20
> Bugfixes
> --------
>=20
> =C2=A0* misc: fix a number of inaccuracies in the PROTOCOL.*
> =C2=A0=C2=A0 documentation files. GHPR430 GHPR487
>=20
> =C2=A0* all: switch to strtonum(3) for more robust integer parsing in mos=
t
> =C2=A0=C2=A0 places.
>=20
> =C2=A0* ssh(1), sshd(8): correctly restore sigprocmask around ppoll()
>=20
> =C2=A0* ssh-keysign(8): stricter validation of messaging socket fd GHPR49=
2
>=20
> =C2=A0* sftp(1): flush stdout after writing "sftp>" prompt when not using
> =C2=A0=C2=A0 editline. GHPR480
>=20
> =C2=A0* sftp-server(8): fix home-directory extension implementation, it
> =C2=A0=C2=A0 previously always returned the current user's home directory
> =C2=A0=C2=A0 contrary to the spec. GHPR477
>=20
> =C2=A0* ssh-keyscan(1): do not close stdin to prevent error messages when
> =C2=A0=C2=A0 stdin is read multiple times. E.g.
> =C2=A0=C2=A0 echo localhost | ssh-keyscan -f - -f -
>=20
> =C2=A0* regression tests: fix rekey test that was testing the same KEX
> =C2=A0=C2=A0 algorithm repeatedly instead of testing all of them. bz3692
>=20
> =C2=A0* ssh_config(5), sshd_config(5): clarify the KEXAlgorithms directiv=
e
> =C2=A0=C2=A0 documentation, especially around what is supported vs availa=
ble.
> =C2=A0=C2=A0 bz3701.
>=20
> Portability
> -----------
>=20
> =C2=A0* sshd(8): expose SSH_AUTH_INFO_0 always to PAM auth modules
> =C2=A0=C2=A0 unconditionally. The previous behaviour was to expose it onl=
y when
> =C2=A0=C2=A0 particular authentication methods were in use.
>=20
> =C2=A0* build: fix OpenSSL ED25519 support detection. An incorrect
> function
> =C2=A0=C2=A0 signature in configure.ac previously prevented enabling the
> recently
> =C2=A0=C2=A0 added support for ED25519 private keys in PEM PKCS8 format.
>=20
> =C2=A0* ssh(1), ssh-agent(8): allow the presence of the WAYLAND_DISPLAY
> =C2=A0=C2=A0 environment variable to enable SSH_ASKPASS, similarly to the=
 X11
> =C2=A0=C2=A0 DISPLAY environment variable. GHPR479
>=20
> =C2=A0* build: improve detection of the -fzero-call-used-regs compiler
> =C2=A0=C2=A0 flag. bz3673.
>=20
> =C2=A0* build: relax OpenSSL version check to accept all OpenSSL 3.x
> =C2=A0=C2=A0 versions.
>=20
> =C2=A0* sshd(8): add support for notifying systemd on server listen and
> =C2=A0=C2=A0 reload, using a standalone implementation that doesn't depen=
d on
> =C2=A0=C2=A0 libsystemd. bz2641
>=20
> Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> ---
>=20
> v2:
> =C2=A0- fix musl build
> =C2=A0- fix sshd-session packing on openssh-sshd
> =C2=A0- rebase on top of the CVE-2024-6387 fix sent

Thanks for the fixes. Unfortunately I think there is still one issue
remaining as the openssh ptests appear to be hanging on both arm and
x86:

https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/6600
https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/6778

On a previous build run I ended up stopping them after 24h+ but I
wasn't sure if that was related to other issues with the update or not.
It now looks like it is a separate issue :(

Cheers,

Richard

