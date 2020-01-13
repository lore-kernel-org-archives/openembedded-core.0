Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 22A577FCEF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2020 14:10:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47xFq64fFdz3w;
	Mon, 13 Jan 2020 15:10:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1578924627;
	bh=2RatBxM1gZbzPqlcvVfHfoZ4++WUWUsBHjkFH1VmcAY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=inVcr5cWACKo2ehUcFC1QFJLW5ukaZ+lR7SDWv/xellWVsZc25ZvKDbmLS2eUT3JF
	pYWWkbeoTdrcMKBnDIw0+8rK25oTPNmrYlt8AoJu+s0QDkBJu/5K/pmiA3J+F4q2jW
	uptJNVc+gRfVYzOlF1PYBRWd9z4gkFjPUMYaSXBMKkihq7HRilJ5d+SPik+llplqtV
	0AGmu75ID/C1h5NToY08M07O9zOv6PgzwIAO1B7AroePJYqtdNoZHEhlpRRj4q73n9
	vAnotEZ1d2Qy6WhY5JNO0IhvVHsZI9ajoFCfsKMB/Jm7tk0reB9ilZZTErqyZqiTk7
	wccoKuHDZWSarTZiiBIrVAW/q6v2JgBFaECc0zG81ur9+YOm5nXAd6rBITKNdlQiiZ
	8VwD34jSwkOyRtod8T/qT0Sx00TsNjRlVo8lBnOEMxpWgvIEvYu/ZWHWQZ24/6PGNj
	7RYXKJyGbiOGkA1lzQuQ8UPzlI09LR2KqPMr6oxbALRqoSmlXOUapwbD0dw7l4oHkS
	dAHi4yvKo+JzH+jQ9QnqXmIlL3GpjIUGFj7SSGw4kEmQuYosGRS9FH3l1OkHRxCG4W
	orfb3dlpgTHh8Nv8vzBRymT+vxtV/u3OBWRKaTgSU1xkDgqoq9AsjQOw2RxM4XYpTr
	9f5pVlY7TUJvGGIhL1XZCd7o=
Date: Mon, 13 Jan 2020 16:10:24 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20200113141024.GA21890@localhost>
References: <20200112135954.23868-1-crg7475@mailbox.org>
	<20200112135954.23868-4-crg7475@mailbox.org>
	<CAMKF1sr_1aR_JZdxfxwO1TzE81E6W9YU_d_08+=DBX=KcniYHA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sr_1aR_JZdxfxwO1TzE81E6W9YU_d_08+=DBX=KcniYHA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 04/12] gstreamer1.0-plugins-good: Transition to meson based builds
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
X-List-Received-Date: Mon, 13 Jan 2020 14:10:29 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Sun, Jan 12, 2020 at 04:52:24PM -0800, Khem Raj wrote:
> On Sun, Jan 12, 2020 at 6:33 AM Carlos Rafael Giani <crg7475@mailbox.org> wrote:
>...
> >  # qt5 support is disabled, because it is not present in OE core, and requires more work than
> >  # just adding a packageconfig (it requires access to moc, uic, rcc, and qmake paths).
>...
> > -    --disable-qt \
> 
> Dont disable it explicitly, meta-qt5 will has a packageconfig for it.
>...

You are commenting on the previous removed code,
qt5 support unconditionally disabled is invariant here.

cu
Adrian

