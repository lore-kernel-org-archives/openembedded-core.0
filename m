Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id 6C94F7E273
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 18:00:44 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id m7so14678898ioa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 11:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=7iRCSxkbe4lx2aMALWcK/Kg9+K2qSRjOY20K+Uhv4TM=;
	b=REVX2c3IPG+24vWYp4HrkuASK60/UFeCwLDDSH95U1KZfDeWPznf3o3X40FM9ZcvWJ
	D+9nMTHk/shkUFYIcXXIf2YLe7FAVJBXnVMBlVkwsVf6lZ4jHl9rNHFV2ZCAo2OaOn9w
	zLUXsEgWWAkKksp21xtyj/r0HjRAI4JOVV2ATL4Ji9b3pdd/TfXUJ3SDyEoycPT47Spw
	TGx3ZGjT/023RAcVRGkJXvJdDfc4MAeSsZubgS354X1XIjq6vqnmjlPtCx9eR2ADSpKt
	DsMtsNm82zjionJnep8KZtAy3EQbFeIg0GqVNxWqdE9VFtSagzWgZJyWCM3meeEqObKr
	cxtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=7iRCSxkbe4lx2aMALWcK/Kg9+K2qSRjOY20K+Uhv4TM=;
	b=OnCNnVmc7u0SnUryH5aXoIU3szVMFH2nm1rpyA5CUxyebdXibNqvP3+LFOdLnuf5S/
	NAbt3uhGItJepqJRY5/ynA3/7a9/ry5BbHIJRydqhmtmAG+r0XCWbMXrC9cCSnrm3i16
	v4L5eMlcomzSneaBUd3TMXnhgtMF13z9aJzvAz1f6jOb7PcIvsqnAsMI5rxh2NpUFT85
	3xaU/HgFzBa1JBNJ9CIDqLlyK7RIS8u/+vRcawHn9i3l4Xn77ALpoL8gDVHWEnWXB9L6
	GQLm9R5wSKza5zXmM2MEZPllND4GIIzzOGMDvCqU2+EVDWPFXoqopZN+IGGJ10ptFTWt
	05/w==
X-Gm-Message-State: APjAAAWTzq5D/+kO4csDi2or+1oY1/JpxsRwxxA9CMj+uCz+oUDa+dsa
	BclyCQlHiRoWn6XscWrV/xztupYSS8ZkXC5+YNA=
X-Google-Smtp-Source: APXvYqwFJ/JXCR7vHdcm1Pvp5tTuRfFQXmZGVQKT1OJLdRwuaiP1KlMD0SCRINS8BaL9uhRuOKDAhFBF5qKFHc7NFdU=
X-Received: by 2002:a5d:9a11:: with SMTP id s17mr20867776iol.267.1558461645459;
	Tue, 21 May 2019 11:00:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190521090032.14859-1-schnitzeltony@gmail.com>
	<20190521090032.14859-2-schnitzeltony@gmail.com>
	<03af571c3019042cff91f2703b15edb139661144.camel@linuxfoundation.org>
In-Reply-To: <03af571c3019042cff91f2703b15edb139661144.camel@linuxfoundation.org>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Tue, 21 May 2019 20:00:34 +0200
Message-ID: <CALbNGRQjahbkMzBmqFG4QQE4moF-qTFJrDDMzBVUnXBCTwGFMA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] python-six: put python2/3 variant together
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
X-List-Received-Date: Tue, 21 May 2019 18:00:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 21, 2019 at 6:41 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2019-05-21 at 11:00 +0200, Andreas M=C3=BCller wrote:
> > Upcoming 60.2.3 mozjs (meta-oe) requires python(2)-six-native for its
> > configuration. Currently python(2)-six lives in meta-python and it
> > could be
> > moved to mozjs's home meta-oe but that would be just further clutter.
> >
> > Once applied here patch to meta-python will be send.
> >
> > Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> > ---
> >  meta/recipes-devtools/python/python-six_1.12.0.bb | 2 ++
> >  1 file changed, 2 insertions(+)
> >  create mode 100644 meta/recipes-devtools/python/python-six_1.12.0.bb
> >
> > diff --git a/meta/recipes-devtools/python/python-six_1.12.0.bb
> > b/meta/recipes-devtools/python/python-six_1.12.0.bb
> > new file mode 100644
> > index 0000000000..9075745d74
> > --- /dev/null
> > +++ b/meta/recipes-devtools/python/python-six_1.12.0.bb
> > @@ -0,0 +1,2 @@
> > +inherit pypi setuptools
> > +require python-six.inc
>
> Can it not use python3? Python2 is rapidly running out of time at this
> point and I'd not expect new dependencies on python2 to be appearing...
>
> Cheers,
>
No sorry mozjs uses old crap in their configurations scripts nobody
else does (python which) and ask for python2 explicitly.

Andreas

