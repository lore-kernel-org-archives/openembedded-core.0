Return-Path: <jpewhacker@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8D7D16D522
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2018 17:31:33 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id u4so15796851wrp.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2018 09:31:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=83H8d7yhcdMJS3wAC6aDn5P7kGMzVAIMmjDDtSLNTAM=;
	b=Kr1N1seciym+B4IVhr4WqyQ6t3m8ifObH8B+Xkeq6/o+nas2zGHwF4HlNDom+peDUi
	/ei/oG2SmO3LRk9uuKl2AZ98TXFVbirihufJSYlH/lKxi6M0NJbRFCKFLQeGvv6BGYek
	8mItoJujqD7+czGEg1LNsTDz45wzb4/e4N4DTi+47ZjlWqn4vIgUMv0BFNf139rG0EK2
	IlPoDc4f2kegzGvysk1A0r/CshDkKAfWbThBKAgkJH/QgbaeiM7Upe5pWU83X6tvI5Kv
	gIZPY6fRRndIOVJ55fDbiKOo30+6v9cz9ZZxQcdBqEO7MfNhtQBZRWRfF4lNPnbTAhrP
	T3Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=83H8d7yhcdMJS3wAC6aDn5P7kGMzVAIMmjDDtSLNTAM=;
	b=Grobnt6UUrm/vOaejqRykt6BiNMw5QGQapQsLYUdO7Z92+Dweap2AL9H2TM5WYsUh0
	i68tDuwjNmOxr7bQ1GoJTXMepC5OzjwdXFCCp2doyulaoNX2XhM8lFSI/8s6KoWicluH
	3grNfPVCd8UXWUUpMagyTZ24g70R3zGzWd85QRTSbuBi/7ybJuq50PX4Zh97M89NTnlv
	8+e3dg2B4MNtn1PuNcT9XmqmSTerSoLLP9S3pVWbdU5MjQgP6EYKZ56D1YXvStQdg5FD
	02FLnHPRtuIibiijSvME19CUDZMfFwUgz6pbK7oA0MZA9bB0l0B9OgBu8OHup+ioGtft
	CHhw==
X-Gm-Message-State: AA+aEWZ1fhGMY/yH4VcLJz7mwivEMz47HAv1aGDZBooU0KtFa4GQ+saP
	QGSIg7cs+1B6B+NdsSgC83fMzt2MiaiwLC2I8XasXQ==
X-Google-Smtp-Source: AFSGD/X/9ipEX91Idn5B3sFB1FSu3g9Uoo0zUUawYK19C89ahkuKjBxKHGA9bGU3WDKE4i1lbizFnlvGSeediRjl22U=
X-Received: by 2002:adf:8544:: with SMTP id 62mr16379750wrh.1.1545154294052;
	Tue, 18 Dec 2018 09:31:34 -0800 (PST)
MIME-Version: 1.0
References: <20181102024513.6977-1-JPEWhacker@gmail.com>
	<f7a0fee3dc06e3b02c14c3b14e7d69c7487a5bf8.camel@gmail.com>
In-Reply-To: <f7a0fee3dc06e3b02c14c3b14e7d69c7487a5bf8.camel@gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Tue, 18 Dec 2018 11:31:22 -0600
Message-ID: <CAJdd5Ga2jWYQzKO_mPYCgatCtJyBFMGqsdxmFjnMFT3p288XLw@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] pkgconfig: export variables
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
X-List-Received-Date: Tue, 18 Dec 2018 17:31:34 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 6, 2018 at 1:34 PM Joshua Watt <jpewhacker@gmail.com> wrote:
>
> Armin,
>
> Would you mind backporting this to thud?

Ping on the backport.

>
> Thanks.
>
> On Thu, 2018-11-01 at 21:45 -0500, Joshua Watt wrote:
> > Export the PKG_CONFIG_PATH and PKG_CONFIG_LIBDIR variables in case
> > the
> > parent shell hasn't done so.
> > ---
> >  .../recipes-devtools/pkgconfig/pkgconfig/pkg-config-native.in | 4
> > ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig/pkg-config-
> > native.in b/meta/recipes-devtools/pkgconfig/pkgconfig/pkg-config-
> > native.in
> > index 5e44bb435c3..a9324de4cf3 100644
> > --- a/meta/recipes-devtools/pkgconfig/pkgconfig/pkg-config-native.in
> > +++ b/meta/recipes-devtools/pkgconfig/pkgconfig/pkg-config-native.in
> > @@ -1,7 +1,7 @@
> >  #! /bin/sh
> >
> > -PKG_CONFIG_PATH="@PATH_NATIVE@"
> > -PKG_CONFIG_LIBDIR="@LIBDIR_NATIVE@"
> > +export PKG_CONFIG_PATH="@PATH_NATIVE@"
> > +export PKG_CONFIG_LIBDIR="@LIBDIR_NATIVE@"
> >  unset PKG_CONFIG_SYSROOT_DIR
> >
> >  pkg-config "$@"
> --
> Joshua Watt <JPEWhacker@gmail.com>
>

