Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1TKXBK-0006oP-Pq
	for openembedded-core@lists.openembedded.org;
	Sat, 06 Oct 2012 18:24:51 +0200
Received: by mail-pa0-f47.google.com with SMTP id fa11so2561604pad.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 06 Oct 2012 09:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=8SCpC3j+fHS/WSMwL8B7wAbVbZp8gEoGfYBo/8Ndgo8=;
	b=wwbTCaqZRiNKXRbv+KppviLib7kaPagV50Gieo+jY1QuPEl0qaqvPI0BAu5gSid1W7
	ZP+f9lJTW96vRMkMjHsAzYqYiDYlm0MwMCzakJMni9sLG98dAyQMpUn5QVLPysQZtM4E
	5xh4DQc8qvrw7huTuA4taCWIKompxFxH5nykyUtcLdNqC7fYrf/uassr3eWFFpumxOz2
	+9aM69HJlBbNGwqF2UR0wGPxQUpxWvrvG5XsbduDt1uP/MIzdG1fH7oAbX8d3IeeG0Zg
	OYcwzH+4Enak7aJccpWNOLdR98p7ruedKIDQeRX+MOHyBMD1h/QnQX9HHlm5z8yMbyBA
	z6sQ==
Received: by 10.68.225.34 with SMTP id rh2mr39631651pbc.78.1349539906155;
	Sat, 06 Oct 2012 09:11:46 -0700 (PDT)
Received: from [192.168.1.100] ([94.205.106.112])
	by mx.google.com with ESMTPS id qd6sm7838272pbb.34.2012.10.06.09.11.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 06 Oct 2012 09:11:41 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1283)
From: Elvis Dowson <elvis.dowson@gmail.com>
In-Reply-To: <CAMKF1sqJ==O+AO-Si-CWQSOoZZhppepLjVmjQnipiXuSHWXLMQ@mail.gmail.com>
Date: Sat, 6 Oct 2012 20:11:35 +0400
Message-Id: <DD7C6112-A450-4E5D-8B49-647705625792@gmail.com>
References: <7dacdb4ffd32fe781e4cd0c54b428cf86b96b693.1345518098.git.raj.khem@gmail.com>
	<8a3cf0ce40dbc72a43f08bfed56e61569fe7a910.1345518098.git.raj.khem@gmail.com>
	<48919519-8CA2-41A8-96EA-F5D7F91DE33F@gmail.com>
	<CAMKF1sou8jjkoktbC4J1O+b-KbxZ43MyF3aPq68S74p8wC_qwQ@mail.gmail.com>
	<C309CEF1-33E5-4DD0-BA0E-8414EB53802C@gmail.com>
	<CAMKF1srk7SJSGiCDztiyx71NJZUgG530=QbhYCMm88t6ndgSbw@mail.gmail.com>
	<F0DDC3CE-D71C-4CBE-ACA4-B6E66DEDD4FC@gmail.com>
	<CAMKF1sqJ==O+AO-Si-CWQSOoZZhppepLjVmjQnipiXuSHWXLMQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Mailer: Apple Mail (2.1283)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/9] gcc-cross: Make gcc-cross-initial as the only intermediate gcc stage
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 06 Oct 2012 16:24:51 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi Khem,

On Oct 6, 2012, at 7:41 PM, Khem Raj wrote:

> On Fri, Oct 5, 2012 at 11:59 PM, Elvis Dowson <elvis.dowson@gmail.com> =
wrote:
>>=20
>> I've narrowed down the init problem, to the application of the above =
patch,
>> but I'm unable to figure out why it is failing. Any suggestions?
>>=20
>=20
> is it eglibc 2.13 ? or 2.16 one thing  I see is that it is disabling
> ssp but otherwise it looks not to so much than changing eglibc to
> use gcc-initial

It's eglibc-2.13. I will try without disabling ssp.=20

I also cherry-picked this patch

=
http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=3D800ce0f1d09f2d=
4fc489c98ecca04cf695d707fa
gcc-cross-initial: Reinstate limits.h generation fix

and I think I'll need to backport this patch to gcc-4.5.1,=20

=
http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=3D42f0f96903ac31=
2881ef841ae4380b4d1c72980f
gcc-4.7: Backport libgcc fixes to appease the new build sequence

FYI, I also briefly tested the latest poky master as of today, for the =
powerpc440 target, but no change from the previous sitatuation, with =
gcc-4.7.x and eglibc-2.16, which is init=3D/bin/sh gives no bash prompt. =
It just finishes loading the kernel and stops with no prompt. If I click =
on the enter key, the display scrolls up, but that's it.=20

With gcc-4.5.1, and specific commits, it varies with things working =
correctly and giving a bash prompt; to a kernel panic when attempting to =
run the bash prompt.=20

Best regards,

Elvis Dowson=


