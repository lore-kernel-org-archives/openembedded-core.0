Return-Path: <armccurdy@gmail.com>
Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com
	[209.85.217.66])
	by mail.openembedded.org (Postfix) with ESMTP id 3C378617E2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 20:57:05 +0000 (UTC)
Received: by mail-vs1-f66.google.com with SMTP id b79so367199vsd.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 12:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Xos23W90tV8Ami9v2Gy65UUZsTgMpsVP5Cp87nHi32o=;
	b=jLJWXVtEjdYfL7AHvAd5K65eioYvP73cm2Q5ZZXQFx2pQCjBlC4SRPT+h/RpfvL4at
	D0nlj6frRFDo/6alL1OA3etuoKatBq/9GfrBqzLH6IGkKuhRW/B1zZHnyuqvA2Mh8Dlm
	CLvpsTMNN/koyZsxv6weXOGZT5a/QKVOiJ00YfsyqzsSBJ5AttROaQTIle17IQ4+dbIU
	ae4ycgi1TpDX7uYd7nnKlAT5pXqUqkJ2rdExOWqqfR9RMKenxjneWhwjXw5VdFsAyOtR
	cuB8ksSoMyg/NayJmwKkifX71GQk+K+tQYPzQtePTiSX0MbTyWPgIG3ymoCvpsz0tTYo
	Memw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Xos23W90tV8Ami9v2Gy65UUZsTgMpsVP5Cp87nHi32o=;
	b=IZEjSN0iEG0ZakLWCqnmH+twC0gozX+mEp2X+yFGlyHB1hVVeSbtA2mVb4POPaHpMP
	uGxjARPsViwPGG5UvwmGlJYRkx2bqjycc0sxNIJ8liILbGXLDvHwFl6eRMNFgyvtxr8y
	2o1P0HWW2mY5nTmIEa4wYUQge1mY35LImR1mdugadxydal3zZ7UGSos89BreRGpJ2tLM
	RDXttqzFzvHSh8nRdInT0O22wwPgGSJqtARYEnzCKz8TlgqR7d1XaeqNznMC/N03Royt
	Jkv1ZFbBnHvG1u+EmtATU4Ny8Ncow+KGlYizTFjKKFHZ6F8UES5XAaZy42D9bf2H1Nw4
	f7bg==
X-Gm-Message-State: APjAAAWYJpeBYBLvMkgxKdfZ2YboVk8/eR1O6vpeA/Yss2T4Npb8VeUw
	BVZsYBeL9aqgWeA16kaDnvAO16aPk5a9tPuwIik=
X-Google-Smtp-Source: APXvYqyVGMn5/qxj3xVjeIIbr4pnRkeAKl6qXwMGfNWrP881gRIQkX/GXrcxkXYpAAGXCe99sGWY3GWcdUwA9vH/pbk=
X-Received: by 2002:a67:f51a:: with SMTP id u26mr966858vsn.11.1582664226206;
	Tue, 25 Feb 2020 12:57:06 -0800 (PST)
MIME-Version: 1.0
References: <20200221224537.4052134-1-raj.khem@gmail.com>
	<20200221224537.4052134-3-raj.khem@gmail.com>
	<CAJ86T=WpKBfD119m1G5jgW4Y1UA---WWSc0UkMfRzi8oEiwPTA@mail.gmail.com>
	<CANNYZj9XLm-OyAzMHCDauggbpUVBfnCLq1VXFZjw1eaWM0YyQg@mail.gmail.com>
	<CAJ86T=W1n2GoOa7wSdKzZ1rPOr1RkMgAH7b+CKZypXBi66HQag@mail.gmail.com>
	<CANNYZj94dRzpG+VcHEOwtgsYjm-wKj67eVmEvDNEUDL+j8gxAw@mail.gmail.com>
In-Reply-To: <CANNYZj94dRzpG+VcHEOwtgsYjm-wKj67eVmEvDNEUDL+j8gxAw@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 25 Feb 2020 12:56:53 -0800
Message-ID: <CAJ86T=WFwAXuH9Q8aK34pFcK_FV5ZCoyh3N8CPpojY3emkADvQ@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] ninja: upgrade 1.9.0 -> 1.10.0
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
X-List-Received-Date: Tue, 25 Feb 2020 20:57:06 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 25, 2020 at 12:25 PM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Tue, 25 Feb 2020 at 20:57, Andre McCurdy <armccurdy@gmail.com> wrote:
>>
>> Thanks. The maintainers sometimes forgetting to reset the author was
>> the part I was missing. Maybe the patch checker could be updated to
>> check for that?
>
> The patch checker already does this too :)

So how did this commit get through?

