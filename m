Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1QwJWu-0007B5-6x
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Aug 2011 21:54:28 +0200
Received: by qyk4 with SMTP id 4so3757070qyk.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2011 12:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=a929y0Tk5ocN+ShVD1+xCBnyVc3GbXfekyar6Z1i0Ug=;
	b=uOfUUqIn6Xs+peCdX39U26Z4G2LKnu1KrUqqnBvMF2uKHLj55dUQCjCnx4ohzRMeWG
	uyBFb+xY9SgjGbGnZCmZMn4vQ8Iw6NyAAY+/RkZMzzld91JNd/6ZxgQ8SdxTRzGhsLnQ
	EQetF2Kn1pJBPhEJtmH5vPtEWALGQPQpyWQ8s=
Received: by 10.52.184.10 with SMTP id eq10mr1367766vdc.96.1314215381195; Wed,
	24 Aug 2011 12:49:41 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.52.108.229 with HTTP; Wed, 24 Aug 2011 12:49:21 -0700 (PDT)
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 24 Aug 2011 12:49:21 -0700
X-Google-Sender-Auth: l6y1b1EK2SSp-iZkMUsnyEUS2Y0
Message-ID: <CABcZANn8NZYnA3dPzakgfMguaVV9EQ7isusAGMOQUQzHx_UV3w@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: [ANNOUNCE] Devshell Usage Change
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 24 Aug 2011 19:54:28 -0000
Content-Type: text/plain; charset=UTF-8

Saul reminded me that I never sent a proper email to let people know about the
usability change to devshell, so only those who reviewed the commits
know about it.

In the new implementation, a single OE_TERMINAL variable controls the behavior.

When using 'auto', or requesting an unsupported terminal, we attempt to spawn
them in priority order until we get one that's available on this system (and
in the case of the X terminals, has DISPLAY defined).  The 'none' value is
used when we're doing things like automated builds, and want to ensure that no
terminal is *ever* spawned, under any circumstances.

Current available terminals (in addition to 'noop' and 'auto'):

    gnome
    konsole
    xterm
    rxvt
    screen

Examples:

    OE_TERMINAL = "xterm"
    OE_TERMINAL = "noop"
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphi


