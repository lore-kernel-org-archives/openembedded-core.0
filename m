Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SBr3e-0003gv-RK
	for openembedded-core@lists.openembedded.org;
	Sun, 25 Mar 2012 19:16:46 +0200
Received: by lbbgi4 with SMTP id gi4so3340713lbb.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Mar 2012 10:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=4iyuXWkGVdIP08Ya76pYEIBtkpfM6Kuqu6eEQU8H//o=;
	b=w9T5nShaQPjYgiHzIBm+t79wKHGjcjCAn2P5ghmV78oSYLppLEzj2UgoEUgi+NNzaU
	sbpNEMDTwUo6y74pQCaEzi2Ohyvi8bu8sElXyaVRa1FYfsa+fGXW2TWWNIBh2EAvT7ad
	kbpUYWciy97AhAPf1IlGVdM87HFnKR1+l1SZnMHAKNlQ1WXROLgGcgrrQRYaLVnXWjsn
	3Y0iRj611+zMzSDLBkYsmDj70AiC3sp69Nef9JTLqVzZYyufq49WYXnI1yYv94dE/m0a
	LpzDrx9T+KBO2dqjTcD9nvsQi33AdiTOavSd99BjlpsXO4UVkDSvHBO+nyP+WDSvR8v8
	b4PA==
Received: by 10.112.23.38 with SMTP id j6mr7235157lbf.15.1332695267823; Sun,
	25 Mar 2012 10:07:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.3.161 with HTTP; Sun, 25 Mar 2012 10:07:17 -0700 (PDT)
In-Reply-To: <CAHEoWwvDxL4YCD=NNy=wVfWS+xMcSnQDG43Bftrg1jqzpYd5Tw@mail.gmail.com>
References: <CAHEoWwvDxL4YCD=NNy=wVfWS+xMcSnQDG43Bftrg1jqzpYd5Tw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 25 Mar 2012 10:07:17 -0700
Message-ID: <CAMKF1sqwv=WyUAKzoSc3mGJFzWQvPG3ax=eatLAqT2dfjan6XA@mail.gmail.com>
To: Mike Williamson <michael.williamson@criticallink.com>
Cc: mac@mcrowe.com, openembedded-core@lists.openembedded.org
Subject: Re: libtool-cross patch thread : follow up on do_install...
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 25 Mar 2012 17:16:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 25, 2012 at 8:51 AM, Mike Williamson
<michael.williamson@criticallink.com> wrote:
> Hi,
>
> I was investigating a build issue using a local recipe inheriting autotoo=
ls
> employing libtool (a compile of unixodbc, needed by the new php recipe)
> and ran into an issue that appears to be solved by=C2=A0modifying the
> do_install() method of libtool-cross according to comments made
> in this patch thread:
>
> http://patches.openembedded.org/patch/15065/
>
> Basically, replace the do_install with "oe_runmake DESTDIR=3D${D} install=
"
> suggested by Khem Raj. =C2=A0 Mike Crowe seemed to think that it cleaned
> up issues he was having, but the thread seems to die at that point.
>
> The current recipe for libtool-cross does not reflect the modification
> mentioned, so I am wondering if this is not appropriate?
> Am I doing more harm than good?

Mike Crowe did not report back so if he saw no issues we should have this p=
atch
in with required alteration.

>
> Thanks.
>
> -Mike


