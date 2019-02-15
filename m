Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
	[209.85.210.65])
	by mail.openembedded.org (Postfix) with ESMTP id 096CD6D4C6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2019 12:15:56 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id g1so16085884otj.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2019 04:15:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=UKMfIwE5QfLIi+vDfcNk4f5tRj5VrmrQDz/DxROSxIw=;
	b=Yef3Hs7UMJ//PGtgAb1G+EPJcB/EREZhZLq8lRykJf0ThAVR5DSYgFNTJbWeOP7upW
	pKEs8+ZlquYinHvKBIbbk5kTcOLeeiz/muWa4Jaez1YBTjmjMMr/WbaegzEoSEXxTFRB
	vOBWT12314VlChdSdzoi/llO5DD67bdT0fmag1D2tb2W6DxnDjN0Jwt9JvPi9JraVNdM
	XMCzc0P5fYjvilL0OWoAYw9OV1rQvOA836rOD8zfpXvVz5PgCtiqnGBot0bomjJ0lZvK
	vpARTMLsj0ZQbbciiHy6skGMZ0uvdflRRYbjwcSxJHXFbYNbiP/ZH+1CVDO+m3i3/24+
	qFLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=UKMfIwE5QfLIi+vDfcNk4f5tRj5VrmrQDz/DxROSxIw=;
	b=Widmc7RI1rYyt94XMOCebS+TVPDMTXH5l4bQnzPPFNtkP8rA/5iVoTa/ftZ0Rv/lCx
	Li9NW16nJ54xYspGaOh5tZKkkE+Srmijcaf5m0XweVqnjJHNjzuqGuj2hOxD1MEetYAg
	AfQq4wvhbhvi2PioPAV5BZraa27jyn7O1HBQPpgpUdV2fBGvhU/WKxsAyPfq7ueHn4gF
	/u+M9u6MMo+WA5RCKTMku8yMUij0fX65rBHOvsrwc4SsRnywHcsG36lUNwBaz6YAUQdz
	weeUhZv8n1iLZWWw0+M9UU4Dwj+ZnK5Y09PLEU7ODCgdlE2dLKMKUla1Kn4KDMuIpqBd
	IjXQ==
X-Gm-Message-State: AHQUAuYfP5MnrOcrzLma5bMOqWaCBs4dcZXbC+GNfzdMx6jNXvVxaQAJ
	lFYLeQH2Hs3d+zpyJWt+lPBEUvGH4Bd5pyrrcfA=
X-Google-Smtp-Source: AHgI3IZfQEKribIWUF+I2Q4FifS/3/oIBURLfPG5HZ3ysHqm98QufL0mSnaLPkBL/800LoFKHIsf2S8W+pX3/k/jhBA=
X-Received: by 2002:a9d:66f:: with SMTP id 102mr5800654otn.293.1550232957999; 
	Fri, 15 Feb 2019 04:15:57 -0800 (PST)
MIME-Version: 1.0
References: <1550178589-15839-1-git-send-email-alex.kiernan@gmail.com>
	<CANNYZj-7Qe3-NwsBZKtmP9iyqsvQm5QP6gQzf9YU_-XYYs5_yQ@mail.gmail.com>
	<1581437706268e9141366523e891a9625a3a453c.camel@linuxfoundation.org>
In-Reply-To: <1581437706268e9141366523e891a9625a3a453c.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 15 Feb 2019 13:15:42 +0100
Message-ID: <CANNYZj_Sk3mj5yyQV93ATB_RKmE6Ax1GdxTKWayA+3yF=0Ow-Q@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bmap-tools: update from 3.4 to 3.5
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
X-List-Received-Date: Fri, 15 Feb 2019 12:15:57 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, 15 Feb 2019 at 12:27, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2019-02-14 at 22:17 +0100, Alexander Kanavin wrote:
> > On Thu, 14 Feb 2019 at 22:10, Alex Kiernan <alex.kiernan@gmail.com>
> > wrote:
> >
> > > +PV .= "+git${SRCPV}"
> >
> > This is unnecessary and adds clutter. Just the plain version number
> > is enough.
>
> If I read the original commit message correctly, it is necessary as the
> version is 3.5 plus a bugfix?

Seems so. Sorry for the noise.

Alex

