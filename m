Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by mx.groups.io with SMTP id smtpd.web11.9612.1588338448726892623
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 May 2020 06:07:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b=a9RrA2GD;
 spf=pass (domain: gmx.de, ip: 212.227.17.20, mailfrom: dominic.sacre@gmx.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1588338446;
	bh=cUVyoyPGfpqnlmwSzxkyjW0kR1Bdb2Ga1bJlpddFR3U=;
	h=X-UI-Sender-Class:From:Subject:To:Date;
	b=a9RrA2GD02hzyRkn0FU22LfMd/su2H4dG4wcMqFS5RMnhvqnXuoXPmj0BHcpV42c9
	 AqbTQM04a2yOxW1GgiRjnWBxlByTmkVqfCthn+oIfbfbSYePaxfpkiKr3dAp2Vuiri
	 LIbVvmY2pMh/7IjVYBl41ZZZ0NXvIsObMYJL1VLI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.42.23] ([90.186.109.32]) by mail.gmx.com (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N7zFj-1j9YKr3GJn-014zP7 for
 <openembedded-core@lists.openembedded.org>; Fri, 01 May 2020 15:07:26 +0200
From: dominic.sacre@gmx.de
Subject: Incorrect environment-setup script in SDK using musl
To: openembedded-core@lists.openembedded.org
Message-ID: <608debd1-f655-21ac-9e77-1ffbaf70d49a@gmx.de>
Date: Fri, 1 May 2020 15:05:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:EaASTGR2xC1Ie3GLPzuXDnlUqizJhRLMZfcXQaQNURQJ73qAVdl
 8VXUeCffC4yMjQqjPtoGNWaIIcWGn8S/6a1hEpd0/xOKs06eIi7H3a8l2WMvVEzXrnPPHSG
 aNDIItzTpCBasDVOTQCdKcoOuOQ9WsuNCqh4vyzXTcHJhQQ7AR8LJpk8Totumxk4aZjeOU5
 oPCVrELbQCht7ZihcKA9g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:X1SYD4wzJt0=:KwRKynLIGzdRGzc/BL2boS
 8frwKgJZHAYqBR76ij95BDrANizOyGIRWddD40g1/VmjR0KosW+gHdQINfsU5JN1V41bZ7U4D
 i+i5iNw45tdW77Uylb+sYQwqDcN2WnKN9DYus3VYRTI8JcY4FaFt6vpNlaUcLj2DKIwX8bQfz
 5OtWzJiIeWhU9wdpPoctJdWGCBzBkh3qIXdLL8dOkiHsP08LT14KsOP0Lr1N0Ocw39gVL5Kk2
 4x5p6WLp7Zf58dnfm+Euxn20TCDainCqqN0fHxpaR1eSphT4x35iIeVlKPJq56niSHK8pK1ej
 Ch0RwDiS8yfTFqL3zzWqXE/S/TYcKY9TQYlpOAMW4d7W3SFmAAl7GFyMM0pKYVeHWO0uomuq5
 rKVEjLxpnPpDrbQYqjb9js5LXjhGsp71rh292fN8zOHpkTQJTC1aV5eOnsvklPdgSbD1HRvld
 /xwpIoc3oDWA9wrMN8Xq498+Jrhfv2riXiaACbGZBDxu5ri5PBihlyJedXkZI41StZEdkLIW2
 qiueQJQwZS4tE7jB+MdfsFXHTTWPS+QvwMh20FT+f0B/uCHIqVwGwhZkX1CChOSR0ItpAdYFH
 GAzcRKXvgD5HtV7dwHOig29O8Hku/39O5tD4AquN1OU+60xUvGIN9idA1YWmf6wZ1rf9K0M7W
 R27tLHcZ+mQEbsVYFl7m2iyUNBpMtiBZVxQ0+/6FYzXGdN59k8D+pbLReZgHS8AQt0OomV+0n
 V5egzpst6aMC5Mzsx3Gcbzybu5glrMKe9YRNRHomOOQhcEe8QZ7XwJ8nApYORiekGJBQRFKSx
 rKJXlhcdOvcB/rPYBBYXNzYwteq//8km+dBwdwN+hfP0kywaQCbpNhfyXyCURQF/Mj+RWvem5
 uGfYsCSfqVsBi/S0dJdtTmgzfBwNcYJT6cVldgf2w8sM2xJEbzKJULMPFkFC0/Mn4CK6CSP3p
 acBxTQZEEq5ZRmlX3LUH/NbxO4l9cl5G1F9q22yqHhTxa4MaRHKCNlID9e4y6PjUi8qa84WVM
 A5eaavPypxhIrZ0I3dSe3B0ABZdElkocZrkJrxecJziFXHAGqvylhAh+qw7ZmBipvj/CtLhFB
 2fGlH0erkJcj0zlky6fgBsO/m7kG0CW0ATwINHaOZKLgoQQJyHJWF6l9r+NOX+cr/3nQ+lJmX
 bjrCcGZGGNWvSOiz+edkCJ90o1iDFyziWB5mxSdnSd6RbWImSpCUsrFGX/cHq7wtUy5CpNjBM
 JPl+2F3s1DTXghmVj
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi,

I'm trying to build an SDK for an image that uses musl. The problem is
that the environment-setup script in the SDK lacks the -mmusl compiler
flag, so binaries produced by sourcing the environment and running $CC
will not run on the image.

As far as I can see, the flag should have been added by this line in
toolchain-scripts.bbclass:

TARGET_CC_ARCH_append_libc-musl =3D " -mmusl"

However, the libc-musl override is not set when building
meta-environment, which I've tracked down to this snippet from
cross-canadian.bbclass:

NATIVESDKLIBC ?=3D "libc-glibc"
LIBCOVERRIDE =3D ":${NATIVESDKLIBC}"

I had successfully been using a similar setup based on thud, which was
before those two lines were added.

What's the correct fix here? What's the purpose of changing LIBCOVERRIDE
in cross-canadian.bbclass?


Thanks
Dominic
