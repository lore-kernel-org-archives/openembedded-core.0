Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f45.google.com (mail-vb0-f45.google.com
	[209.85.212.45])
	by mail.openembedded.org (Postfix) with ESMTP id 2ED546A5DA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 10:14:25 +0000 (UTC)
Received: by mail-vb0-f45.google.com with SMTP id 12so6093726vbf.18
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 03:14:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=F6iNlPHFfS8957J03SB/CqXd0SuVXRewkXeNHbl98hM=;
	b=SmPY4DsXhsDBp3+55hAL2HKtyR+2/gFqEaPpUDMRiqG0JC0ayXurv9dxOsvvdDo60F
	qv1PaYTWAKZfOCRoeMjo6jN2d1TXH0tvRyuXUzAuXyQzLUynyVucDRj4//625UJTKSSj
	4xeDZtfB7mOSZBDSboW+v7RZGwNncH9JlooYgeN7JBtW1seBFLTleAEM+hl4us+ltpif
	N1HL/0JrEeLQ1/9y670tNWkmiwdN8DpzLmfGoRBGMl/0oqJymZlyP3gl/v9ZW+xU4rVo
	RzMYIqGfI+0+p9jSvU0w71Iv1Y7sjq24TlRxHMkBFeNSJX5/Up9Zr+OdsZtTqTe5zXgb
	A25g==
X-Received: by 10.220.248.137 with SMTP id mg9mr1055503vcb.38.1369822464652;
	Wed, 29 May 2013 03:14:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.98.7 with HTTP; Wed, 29 May 2013 03:14:03 -0700 (PDT)
In-Reply-To: <cover.1369576071.git.cazfi74@gmail.com>
References: <cover.1369576071.git.cazfi74@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 29 May 2013 11:14:03 +0100
Message-ID: <CAJTo0LYaM+1fB7h7cK0jQ3QcDio_79+y4eZ7_cpYxBTwiqoR4A@mail.gmail.com>
To: Marko Lindqvist <cazfi74@gmail.com>
X-Gm-Message-State: ALoCoQlsz95o5xnPX7d2AxO+ZjHmL2DZmpHoYh38e9K9QOpbTffDwbPn6RsjNigs2A5dRrgd3ZMR
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1] RFC: Add recipe of gtk3 version of vte alongside gtk2 one.
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
X-List-Received-Date: Wed, 29 May 2013 10:14:26 -0000
Content-Type: text/plain; charset=UTF-8

On 26 May 2013 15:03, Marko Lindqvist <cazfi74@gmail.com> wrote:
> Last gtk2-compatible version of vte is 0.28.2 currently present on OE core.
> Later versions depend on gtk3.

vte supports both gtk2 and gtk3.

> Since gtk3 exist in OE core, it would make
> sense to be able to build version of vte (and other similar packages)
> that does not depend on gtk2. Otherwise we end with systems that must
> contain both gtk2 (to be used by some programs) and gtk3 (to be used by
> other programs).
> This patch just adds new recipe for latest vte version, 0.34.5, alongside
> with 0.28.2 version.
> How should priorities be set? "1" for gtk2-version, so it gets selected despite gtk3-version being newer?

Because they are *not* drop-in replacements, how about naming the gtk3
vte vte3_3.34.5.bb?

Ross

