Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
	[209.85.167.193])
	by mail.openembedded.org (Postfix) with ESMTP id C74817C4C3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Feb 2019 13:38:04 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id e7so5239814oia.8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Feb 2019 05:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=yJFEnffMx9ZT7l+sF/1zCEDlJgC5yDh+OV9HBq5q4RY=;
	b=hH/2Ekf1WbRjF3x53gGwWoqquYyDPWVqwjv+aqOdWGywrhlMF5QVCNrfz30wujwN5r
	PAQpSOc5mmpqnriNJG8XREOeBMaQNDsl1QY/MKzOwJUXFkghf3p1AxF/j8uNaoUVw0qz
	MgUPIOs8/wHLCRcHr00DnbziZbPvljEf+UwD8ERaSj0Vt5Uk9TJC78nf/tuyr54NVhBQ
	vJpBHXmjtrnAglHf6RLojM/Gkd9IGde13ffFYfX5N4F6cPYuaU4H/JSbWXCqyG06PsS8
	Aqosf355694BAp8OdoZ/C+fx3jofv1QiULVZTIIAdFGQxn4mNWpMM1WVkCLJMmivKiwR
	kRvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=yJFEnffMx9ZT7l+sF/1zCEDlJgC5yDh+OV9HBq5q4RY=;
	b=NoOdpS5z6f9eIkqfKrDZcd+PPMhBsuH73UMnVfbUSUM1+Ggh9KAJRiR8G7doQtCnj0
	IgNJmBLNVfWnFTDAXMTidiq91EH9lc4SGA8y7Qyfjkm48S0TZAGAjlMqRH0Sny0NZ5WL
	8Wb6/Zp/bwVt7DbYp9MsWnuhS4frLNjsXopx83W6eoXddU83yOumk5XQiNtlKvWKCWEM
	uZLZJdGDgpTDMOtQ50NrMJskDCBkSBrWG/mMVbyDSQW3m18GllWeiQjn7z+nr2i5npOS
	dFZGR4wOJ7BUktJ8zHMBEgo9W3bTI1cjdm53mR83kziUwtBzjihuuDHsUGCcTsGabWcV
	0yYA==
X-Gm-Message-State: AHQUAuaxXKeaxOBJg+R73t3L7Aj0zzr+SkRRmVmpKGRRDkkFyIX3C27W
	A9d9acTf4oUre1UcijqOnnUs7wicpyhsPlizttY=
X-Google-Smtp-Source: AHgI3IaTCx/9GwUVnvb8zo0tt3rIJO6Mjxgtu0eT6+5UYPYn947UmLsDvI44hTB7i+E7dc7iYSO6baxrjy3ULEZPqfM=
X-Received: by 2002:aca:c3cb:: with SMTP id t194mr7921698oif.70.1551015485814; 
	Sun, 24 Feb 2019 05:38:05 -0800 (PST)
MIME-Version: 1.0
References: <cover.1550845989.git.alex.kanavin@gmail.com>
	<bd7acae5310c012ee39c5142fa0059c88fcc4b57.1550845989.git.alex.kanavin@gmail.com>
	<CAMKF1sqHzK6Q8-GNLV6Yc5_QuWjKaUMWO==twypXYmRtmvGpKg@mail.gmail.com>
	<CANNYZj8pxkyaYwp+Ob2ZzH=G2iA=F_E1PzOz-L4-q5LdC-C06g@mail.gmail.com>
	<20190223223043.GB24699@localhost>
In-Reply-To: <20190223223043.GB24699@localhost>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 24 Feb 2019 14:37:53 +0100
Message-ID: <CANNYZj8kkBi-D-sk2bw9FP2Nk_knoKzacc8F2rkhqciK9WGyvg@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/12] virglrenderer: add a recipe
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
X-List-Received-Date: Sun, 24 Feb 2019 13:38:05 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, 23 Feb 2019 at 23:30, Adrian Bunk <bunk@stusta.de> wrote:
> > Probably this is the very first time virgl is built for mips :-)
> >...
>
> Builds fine in Debian:
> https://buildd.debian.org/status/package.php?p=virglrenderer

They don't apply special patches either:
https://sources.debian.org/patches/virglrenderer/

Anyway, building it for mips is an academic exercise. There is no use case.

Alex

