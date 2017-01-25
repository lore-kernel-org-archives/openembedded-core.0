Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 7D1C071CB3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2017 19:41:19 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id r144so48952923wme.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2017 11:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=wOgKeFM3Rh2QxqXOwmPUB3LfZwJNndoMoa5DLmCAuBU=;
	b=Zzo2osPqVPEA6QgD9o8P54tOCsgkm5TS8HYw8dJHRaWgro9jWKoR1x0w9PhiKfoxp9
	v3VuErYK+H9+PXIn+XZ5/F27C5P3CrNHExsVhYX/BwfhZ1eI4Iy8fmNwg87h/CJZ0cr4
	OyZ5/y/zwDk4mGwpk3kdV7imnhViSL1s33YQ+nX++vg5JLqfbi7pjo1bAEdfHbhAoZQ4
	/dWNIu0SqPAMNVOtj2U0bFjmKjvQf4772xlxi+86fZXcnLI3ooKZ0Xt01uKDx1HyuoMw
	U6xcM3KTuEM0QaQrvNl4DBOf/a4XnUAihrMa8X6653a9uIPwGHdAw5znq7W9wqH7BTVM
	hzgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=wOgKeFM3Rh2QxqXOwmPUB3LfZwJNndoMoa5DLmCAuBU=;
	b=cBIwvfYM3sXzHNZaeaJNLuOY2J2DNcZH/MPmyGCLyI7812X/6YVtuV0PU62THLT74D
	OFPULbMpX+lKxoQdR9RtT6oJL5/6l0fbnmD79XL2pkAKBMwCh7r8LTLxB0rz+YkNR6kO
	6UmczHcRiQ4LDOqnqmRwOK52Tr+OWCNYHi124KGfiC8bwuua00WZ5rDWKtHC6L0B4Qj+
	XoknCTpqZTk5rGxNTQhxwdxStnVpxU3eataBfw2hT3SNAbINjImPJcPpXq5z6jzfcoyt
	xd6a6iIzStskrefDlmpGjXzGXz7/1YMyJps81BByCO3UvgxsLDdJhcSjfj6bi/PkEvNu
	S2Zg==
X-Gm-Message-State: AIkVDXKv+2TiAtL9h5npZdXy9t/LaRdgDPlIkAzCNPQpDSX1ac3ybd6MG/y9v7pp9NVQdINdAXojvEE5nE6oLw==
X-Received: by 10.28.13.16 with SMTP id 16mr23050864wmn.101.1485373279854;
	Wed, 25 Jan 2017 11:41:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.52.78 with HTTP; Wed, 25 Jan 2017 11:40:59 -0800 (PST)
In-Reply-To: <F7334516-0C0C-4709-88ED-8FAB7FFA5548@gmail.com>
References: <20161110003935.1858-1-raj.khem@gmail.com>
	<a186e3be-242a-5ba1-36fe-f5f3d561552c@mlbassoc.com>
	<F7334516-0C0C-4709-88ED-8FAB7FFA5548@gmail.com>
From: =?UTF-8?Q?Maciej_Borz=C4=99cki?= <maciej.borzecki@rndity.com>
Date: Wed, 25 Jan 2017 20:40:59 +0100
Message-ID: <CAD4b0_KNSRXs7mGyePjD1SQHGfb_hpBZ56qJVnSiJS4HfJfrLA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Gary Thomas <gary@mlbassoc.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] go: Add recipes for golang compilers and tools
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
X-List-Received-Date: Wed, 25 Jan 2017 19:41:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 12, 2016 at 7:02 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
> On Dec 12, 2016, at 4:36 AM, Gary Thomas <gary@mlbassoc.com> wrote:
>
> Looking at these recipes and they seem like a good starting point.
> I did have some issues though:
>
> * bitbake go - didn't create any target installable packages, although th=
e
>  .../image directory seemed to be well populated.
>
>
> Yeah mostly, I was concentrating on cross builds but this is something to
> look at.
>
> * bitbake go-helloworld - had these errors:
> ERROR: go-helloworld-0.1-r0 do_populate_lic: QA Issue: go-helloworld:
> LIC_FILES_CHKSUM points to an invalid file: /MIT [license-checksum]
>
>
> Thats new, somehow it did not happen for me. I will check again.
>
> ERROR: go-helloworld-0.1-r0 do_compile: Function failed: do_compile (log
> file is located at
> /build/p0382_2016-01-13/tmp/work/cortexa9hf-neon-amltd-linux-gnueabi/go-h=
elloworld/0.1-r0/temp/log.do_compile.31170)
> ERROR: Logfile of failure stored in:
> /build/p0382_2016-01-13/tmp/work/cortexa9hf-neon-amltd-linux-gnueabi/go-h=
elloworld/0.1-r0/temp/log.do_compile.31170
> Log data follows:
> | DEBUG: Executing shell function do_compile
> | stat helloworld.go: no such file or directory
> | WARNING: exit code 1 from a shell command.
> | ERROR: Function failed: do_compile (log file is located at
> /build/p0382_2016-01-13/tmp/work/cortexa9hf-neon-amltd-linux-gnueabi/go-h=
elloworld/0.1-r0/temp/log.do_compile.31170)
> ERROR: Task
> (/local/poky-cutting-edge/meta/recipes-extended/go-examples/go-helloworld=
_0.1.bb:do_compile)
> failed with exit code '1'
>
> I forced the compiler to my target (rsync is _my_ friend) and was
> able to run 'helloword.go'.  I've not tested much past this point,
> but I am enthusiastic about getting 'go' into OE-core
>
>
>
> Thanks Gary for your feedback it will help. I know I have a rev2 due for
> this patchset. Haven=E2=80=99t yet includes all needed changes for v2.

I would like to revive the discussion on including Go toolchain in
OE-core. Recipe specific sysroot changes have shown that external Go
layers may be a bit fragile. At least oe-meta-go, which we are using
right now, required some changes. Hopefully, the patches which were
posted today will get merged soon and everything will be back to
normal again.

There were some concerns previously about including Go in OE-core.
I''m not sure if these were eventually resolved. If not OE-core, how
about meta-go in OE layers? Maybe it would be a better match for the
already existing meta-{python,ruby,perl} layers. As long as there's a
single go-to layer for Go, everyone would benefit from this work.

Khem, do you need any help with v2 of the patchset you posted
previously? I think we should be able to spare some hours helping out
with this in Mender.

Cheers,
--=20
Maciej Borzecki
RnDity

