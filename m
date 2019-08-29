Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id 221E77F31C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2019 12:27:53 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id e24so2809460ljg.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2019 05:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=dJ1JdoFW8Dk+KqyXCX3VF8oanlXWwJe/7vZHSjrtFoM=;
	b=o70USdV7WXs5x7IS4Uzu/djDu+Vuh2gvmyTuY1/8WJjQmsC+37eXQt6HglE6qcB/8A
	dG7WiWzCgKM1u/ZnMCSpxLTAox6Fk6RdYXMeQ/Vd9PfFZFHTBBSqNni70EQd8glSfbkF
	OPkd0mVXYih46/FqDFQTDQ4Awhm+KpthsNxQkDM9n9AivJk2waQaE5PQJsr9cfUpmoyF
	0HhpKG7IWRvfsydpg+UI9q54T0aY2tB0/0O+fL5ijKvkyGcumEaOmtf7yz1YC5Ya8M0k
	i5qfLFQSY00+kLywdxE/5Zi72+XYgBEafKBCPnKhIZHCIoH2iHYDZODb7oXW3VIVA94L
	ZXvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=dJ1JdoFW8Dk+KqyXCX3VF8oanlXWwJe/7vZHSjrtFoM=;
	b=It0c2ut1EfywPT0Mv/NsHWWIRVujxRRYl3ih+fgPd2yPT/ZfBQcNI+QLnWp0iKMCay
	LolKIwr3JQAU8qZRsS4cDUU0aqQ3uFrQKGxZ2wE5MVTp4BJVX5DNjqAYCN/6lrzUR10X
	ToI3/RZMiZNvmzSTUUIsah4U98rZce3cbu7XvugSEZ89/auiunqA6beoC2xlZxGswEMj
	bsfKzifaVqiTzsbF2ufnWrd00ZAvO+73r5IWoH5ARwpSWQjQiKC5W062QKWWgvCo0UAZ
	hCLaPzKhYHH6lEkdwsrBlTxXy7lVYK2uc81qaNlI+KhCS4lywK9Pt7w43XfsXPoZsYU/
	Ci/Q==
X-Gm-Message-State: APjAAAVlRi95CcxA5paZxD2sdt24moFnuzjTVEcHCeO7cDm6AxS7RBXW
	QMED/9eyMMOQNoR2bccnyQtKyfHDa0Q+bpogHlgECc5d
X-Google-Smtp-Source: APXvYqzzCnlsNMCyM4JcBsATP9kSCoEjX3hRjvwIRJUA8BaVg9jhX8JKVD/FX/20qMGuE9BPycBYGwyU/amhPZ8n0yo=
X-Received: by 2002:a2e:9214:: with SMTP id k20mr4995433ljg.232.1567081674503; 
	Thu, 29 Aug 2019 05:27:54 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1565796002.git.bruce.ashfield@gmail.com>
	<3a3fd8a7128901ab5fff8de55b789ecd3b633cc6.1565796002.git.bruce.ashfield@gmail.com>
	<b132395fc39af7592af4a4d1c5d8bc25ccf7a31a.camel@intel.com>
In-Reply-To: <b132395fc39af7592af4a4d1c5d8bc25ccf7a31a.camel@intel.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 29 Aug 2019 08:27:43 -0400
Message-ID: <CADkTA4PdkcioYX4Va7ohMapxBPpAr5nirUM+mg3Uno6JroW3Yg@mail.gmail.com>
To: "Mittal, Anuj" <anuj.mittal@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/5] kernel-devsrc: tweak for v5.3+
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
X-List-Received-Date: Thu, 29 Aug 2019 12:27:54 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 29, 2019 at 5:17 AM Mittal, Anuj <anuj.mittal@intel.com> wrote:
>
> On Wed, 2019-08-14 at 11:31 -0400, bruce.ashfield@gmail.com wrote:
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> > The 5.3 kernel has two changes that require tweaks to the minimal
> > kernel-devsrc package.
> >
> > - 4ce97317f [x86/purgatory: Do not use __builtin_memcpy and
> > __builtin_memset]
> >
> >   This change removes the need for arch/x86/purgatory/string.c and
> >   instead reuses a copy in arch/x86/boot/compressed/, so we can't
> > copy
> >   the file anymore. To support older kernels, we make the copy
> > survive
> >   the non-existence of the file.
> >
>
> This change was merged in 4.19 stable kernel as well. Can this be
> merged in our stable branches as well please?

It already is (just not pushed), I just wasn't doing -stable updates
along with 5.2 intro .. there's only so many things I can debug and
regression test at one time. Hopefully I'll get through the 5.2 work
soon and finish the rest of my queue.

Cheers,

Bruce

>
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=linux-4.19.y&id=e0d262a57fc741a9b362e458c714e37a77ddb62d
>
> Thanks,
>
> Anuj



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

