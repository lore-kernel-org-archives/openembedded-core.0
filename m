Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f54.google.com (mail-pg0-f54.google.com [74.125.83.54])
	by mail.openembedded.org (Postfix) with ESMTP id DCC41600EA
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Oct 2017 02:29:40 +0000 (UTC)
Received: by mail-pg0-f54.google.com with SMTP id r25so8387707pgn.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Oct 2017 19:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=mTc1xPuEeYnWj/5PcHS5DDQ2GC/xZRULjWonkGF0wMM=;
	b=Ry8VloaC4sxFhQF82vqB46ZwPn4WmKUPpbX1mtlz/+XVronvVSydShpPjrftk3Qogc
	hmlqT5gI+1o1L9DPvM2QIIPe5iPhH78bTNUbx9YTsufeXmrHy813hQWZdKf4OiQh/H4Z
	M0usLIEzeohYPV+QrnmqIKer64clCgKcf8yjis7mmCBBAX5gZ8ECnN5BrAgadj67Si4v
	m970vIOtkFg6FtiZz+hRwR7bhibTQCdIhyl7pOvaplYTXa+1GetDRpeBc6c+J4alA9El
	3Swy9o+7SIWTjpv8OPXpphcJkVZXtcoax4moSBwbSwg4xp4eSPduZItQ28+H23KlEFsz
	o+Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=mTc1xPuEeYnWj/5PcHS5DDQ2GC/xZRULjWonkGF0wMM=;
	b=sDKeLga4rBp1Wg/sjDrhW0apbWezyLKYuZRQh0XypnVHgiuBF2AuX+GdK/7edfO0q4
	MCn1KaYRab302jRRs2+5wWrObqWYKhRi4YPAeIAJrlm+DszYRE/T8guIkmtypv/dR5B0
	juPwp2oM+IKUhjhIkMHNhTb9eTrhOeDaWtXUgwpbtradFR87/MEb90QRTXr9diKhokRw
	4+fT9keNPhV9hvQzPA5dLJrsndG5C+eIhpnyjCCAukk3oqn1GMACYiSl+iCoRincFmGH
	8wjb/D3D4VRo4tYIDcoi/PWkttWX5I+KkNIrmHAWgaI9t3d7pldH0VTloPPWU/383HIp
	Wh1Q==
X-Gm-Message-State: AMCzsaWRwTDnZYCFBIagE1QdIB/1iM5aWt1v8WNqND4wNx7DjLbdYTzA
	ROaI7l4I99W7aVXVY1v0biiG1aSZXh9dbvLhVlAUqQ==
X-Google-Smtp-Source: AOwi7QAw/TMdKGOULEn9vZm/cUIoMgQaNtY2GaIQyfYdAXUwR6nAl35kWOI+MD71zCKZTZ4OH2V8iZa2R0yyErrj4i4=
X-Received: by 10.101.86.196 with SMTP id w4mr3609470pgs.341.1507343381779;
	Fri, 06 Oct 2017 19:29:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.135.23 with HTTP; Fri, 6 Oct 2017 19:29:11 -0700 (PDT)
In-Reply-To: <CAPyrkgxRNsTbD=o7op_xi7T+f85rT3-4XF9d0bvkqVpvphiKaQ@mail.gmail.com>
References: <CAPyrkgxRNsTbD=o7op_xi7T+f85rT3-4XF9d0bvkqVpvphiKaQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 6 Oct 2017 19:29:11 -0700
Message-ID: <CAMKF1soSC=kKnRZRuy5dnyvkLsashUXsin35bMKfPQ0F+iq8Ww@mail.gmail.com>
To: Paul Barker <pbarker@toganlabs.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Illegal instruction when running go binaries in qemux86
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
X-List-Received-Date: Sat, 07 Oct 2017 02:29:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 5, 2017 at 7:23 AM, Paul Barker <pbarker@toganlabs.com> wrote:
> So, after fixing all my build issues I now have runtime issues :(
>
> Software written in go fails on qemux86 with illegal instruction traps:
>
>     root@qemux86:~# netns ls
>     [   18.984298] traps: netns[491] trap invalid opcode ip:807b541
> sp:bf9694bc error:0[   18.985354]  in netns[8048000+1c3000]
>     Illegal instruction
>     root@qemux86:~# runc
>     traps: runc[492] trap invalid opcode ip:807b561 sp:bff6ec1c
> error:0[   21.604966]  in runc[8048000+457000]
>     Illegal instruction
>
> I've done a git bisect and tracked this down to commit 20b35747
> "qemuboot.conf: make cpus match built artifacts" on master. This has
> been backported to pyro as commit d9456782 and I've confirmed that I
> have the same issue on pyro. On pyro in particular this is a
> regression as the patch was backported after pyro was released.
>
> The important change is:
>
>     -QB_CPU_x86 =3D "-cpu qemu32"
>     +QB_CPU_x86 =3D "-cpu pentium2"
>

We use -march=3Di586 for qemux86 which actually maps to pentium not
pentium2 which is i686 I think, this should be corrected to be with the
spirit of the patch. From gcc speak i586 means Intel Pentium CPU with
no MMX support.
and pentium2 means Intel Pentium II CPU, based on Pentium Pro core
with MMX instruction set support, I am assuming qemu means same.

> So my guess was that the go toolchain isn't limiting itself to the
> instructions supported by pentium2.
>
> To fix things I've added the following line to meta/classes/go.bbclass
> and meta/recipes-devtools/go/go-common.inc:
>
>     export GO386 =3D "387"
>
> As documented in https://golang.org/doc/install/source, this ensures
> that sse2 instructions aren't used. This fixes the issue and I now
> have working go binaries on qemux86 :)
>
> So my question is: should we just set GO386 =3D "387" so that it applies
> to all go binaries and accept the slight loss of performance on x86
> systems that do support sse2 instructions? Or should we make this
> MACHINE specific so that sse2 instructions can be used where
> supported?
>

We should have goarch set correctly, since i586 really did not have
sse2, we need this mapping based on -march added in go recipes
much like arm

> Whatever we do will need backporting to pyro as well.
>
> Cheers,
>
> --
> Paul Barker
> Tog=C3=A1n Labs Ltd
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

