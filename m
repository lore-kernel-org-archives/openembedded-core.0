Received: from mail-qc0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SLN9F-0005c2-Vv
	for openembedded-core@lists.openembedded.org;
	Sat, 21 Apr 2012 01:21:54 +0200
Received: by qcso7 with SMTP id o7so6213755qcs.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Apr 2012 16:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=wMWSIUC9Z7hXemJe8VRIC59A+H1to+SIfPy3hkbri6M=;
	b=V+nboSgQQBT48+Q6eRmayFKF4xuy6RjV2S/Myyp+IHW+tViIKwvHNvY8vs8DmSi+Uh
	j1DD+IJ5SyyK1a0OescnyyjVWgXJi4ab60nN2N12VBAfYmHDOZSW5h0jKkjP1a7zCj8u
	0Q0IfHihh3lDkpEZERa+AybWlwc9gC7VdaSjhsTMsFurzAHQzHH3CpkpC5jCfDT8UncJ
	LHTclgiW7WwZb3DPktlUwsC/uneGm6nbfczqDW8IPVER5CAgZ8f1+ebu6GJeaAvLo6bD
	/cQL30gcLpA+pqEa8WYsj3N/0FQhhOWN0bc1gRBgz/ehL2FFy7zMfqyCpRjronV7x2NF
	f+Sw==
Received: by 10.224.108.193 with SMTP id g1mr8624895qap.7.1334963543286; Fri,
	20 Apr 2012 16:12:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.79.79 with HTTP; Fri, 20 Apr 2012 16:12:02 -0700 (PDT)
In-Reply-To: <cover.1334677440.git.kergoth@gmail.com>
References: <cover.1334677440.git.kergoth@gmail.com>
From: Chris Larson <kergoth@gmail.com>
Date: Fri, 20 Apr 2012 16:12:02 -0700
Message-ID: <CABcZAN=Whe+DEayANrbC25cX7rRNCtHcup_uC6LXuwsfYRX2cw@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/6] external csl toolchain improvements (v2)
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
X-List-Received-Date: Fri, 20 Apr 2012 23:21:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 17, 2012 at 8:45 AM, Christopher Larson <kergoth@gmail.com> wro=
te:
> This cleans up the recipe and simplifies it, fixes up locale handling,
> silences QA packaging warnings, and includes toolchain version in the met=
adata
> checksums for target recipes. Obviously this is intended for after the fi=
nal
> release.
>
> The following changes since commit 4e1a8ed1ab7e7bd950e511c79ddfe072cb280a=
6e:
>
> =C2=A0bitbake.conf: Include abi_version.conf in a early stage (2012-04-16=
 12:51:50 +0100)


Bah, ignore this series too, need to fix one of the patches. *rolls eyes*
--=20
Christopher Larson


