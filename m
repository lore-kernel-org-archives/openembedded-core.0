Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
	[209.85.167.194])
	by mail.openembedded.org (Postfix) with ESMTP id 8C62F6D52E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Jan 2019 14:53:41 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id m6so6468676oig.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Jan 2019 06:53:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=FbXc3zR/kSZjfMxIOw+AYzJ7QdVrAZ4l29xc4ZAfNF0=;
	b=UfNG2Oa/n9NY4/hHxuwVGrusTiPCprKCdhKiIT85vSITUdNM+Zkw0NHR1t8D04KQo3
	kJPMy9azj/oXjYigFuoRNu9FoD/caNzFfA37ZGDVcTw11l7QuiP82Zobqs228r2zjmpe
	a1nJffpyRQEZKg24KEHr7EHrAt5tyJ2kMqU2vwiR+xh9BW6nY7cusJLoQCnVtzEpRrO/
	IRfJrCjlHYbWFtyfbTHWNonFPf/B8dUbgOe9o06kEnxVGy+5mA7OAkMu9r5z/+MEZimx
	dpQ8L39jtwCzwNtQESKEOvi6qLhNePcbw58qHoSNj1ouMqnI+BLwqlWEFsctCeDV2sRf
	fK5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=FbXc3zR/kSZjfMxIOw+AYzJ7QdVrAZ4l29xc4ZAfNF0=;
	b=bBD9fA2I695bg2wJSWxlST1o4rE/WeRI8xQHKfhlVuvRoL75q0OwQxuqOVA/6C6i44
	np97/SDzF/5fbijsrS5tLf8zCkvpr0LyXWtzYEBUvW0rHIivjjLmsta39yANA9hOBKpr
	qQKYx/Ju1JW0zj/OP9B92vmkkvt2kO8rZTRCnCtoVCkCuF3me7WeWecb6ojXGyve9okj
	NksCMudApqA2GhvPf4Cb8jnKSXv5a2fPPoAiEasw0qcKZ2KUm6Y9mhN/pwxYvHcj8T0E
	/0zboWOTEOysigSrL3bYT0hSO3rFLHYZSz9lm1IwDdUCdrwiRvE2mRvO0o4BLJyjxyOW
	LPYg==
X-Gm-Message-State: AJcUukeCvMpyQ+1lpZ8NA67HflN3ebKng0ZFZ6M6SoQy/Q5I1FCNcvIR
	3BSkZ+76sb3q5QUHpVhJJUZfxetm432qCXukO43FRQ==
X-Google-Smtp-Source: ALg8bN5e5A/VXfrQTBOWmFKpCSomMqpEn2oTl8rGz6ceGxARb0V40LHRRySRmvMjgUEVl7dzbI6zbaF+nzJ/5ELRU2Q=
X-Received: by 2002:aca:d78b:: with SMTP id o133mr3881863oig.232.1547045622406;
	Wed, 09 Jan 2019 06:53:42 -0800 (PST)
MIME-Version: 1.0
References: <cover.1546961583.git.alex.kanavin@gmail.com>
	<CAMKF1spfq3brB-L+YCWY7joFC41KshZZwLzQcha3wEO3otBiQw@mail.gmail.com>
	<CANNYZj_gZFZpJaLkSSeabMDkFAw2oO+vM80H_q6o9cBsKaeycg@mail.gmail.com>
	<CAMKF1sp8BCRZfmBbamqobM-CoqKMG5CoWevqTAM1c83GJb+gWA@mail.gmail.com>
	<CAMKF1srNzA0UVK+UpKtkNBi2V3S2oAWSC3WZEnJsp8sVNhtmjQ@mail.gmail.com>
In-Reply-To: <CAMKF1srNzA0UVK+UpKtkNBi2V3S2oAWSC3WZEnJsp8sVNhtmjQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 9 Jan 2019 15:53:30 +0100
Message-ID: <CANNYZj88ZpiQ-UaHUpMCuptU0xLd=vDd6-mOR4c_WUhGGF5Arw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] Reimplement perl recipe using perl-cross and update perl to 5.28.1
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
X-List-Received-Date: Wed, 09 Jan 2019 14:53:41 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, 9 Jan 2019 at 11:02, Khem Raj <raj.khem@gmail.com> wrote:
> Here is run for qemumips/musl
>
> http://errors.yoctoproject.org/Errors/Build/74739/
>
> The perl related fails are
> postgresql
> openipmi
> adduser

Thanks, for adduser I already have a fix.

I couldn't reproduce the other two, but seems like they happen because
both recipes are built against native perl headers (which can, and do
differ from target headers). I made patches for both.

Alex

