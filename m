Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi0-f46.google.com (mail-oi0-f46.google.com
	[209.85.218.46])
	by mail.openembedded.org (Postfix) with ESMTP id 7C9E2791D2
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Sep 2018 09:54:37 +0000 (UTC)
Received: by mail-oi0-f46.google.com with SMTP id c190-v6so32627029oig.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Sep 2018 02:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=74p1ECZMsC/A86XldolGyOYJqn3pf2InbKXbXWaw7AE=;
	b=k2AfimxlXc1oM6YxzyBE00NaPhHgGLIKD3b3jGIaLVO0bv4rHLSjU88Rq2ibr834io
	sQB/9+als8cXC4EifmPE47P+nCd0d54/YHmp2CDxZkS+EVKRqH6YoCeYtU3aXse6k7E8
	dgY8Zg7lJyjc+I5XH8wwicjEtco3QOzul6SszfN9wHlrIC7w3iUbrmsP3YmzTnXmTEj1
	r6QOzvDjfTZshZ36ZUn/7BLEp6XLFszVxUYtATj02vjvB7HPg+4YNyehhXp5YjZMj1pv
	St70o+Sw8QEIUqQ04W0Hvm9VDh5Jr2/EvECZM/+N+fy7BAdJviVIHhlGnP0Wq/p5qfAL
	Cr+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=74p1ECZMsC/A86XldolGyOYJqn3pf2InbKXbXWaw7AE=;
	b=RA/Lec9L1Lz+yoF7P2ZmwXfmOJWIPaVrdruUrLWLh4S93QodateGcEljN5n3LgM6Z0
	4kgQbFSP+K0NJH66djxR3EL11wflCq7CvI/CNVP5/QfEGfebcrvHc3ZsBsn/QFTJxOYs
	b/YyMSsbaskld5FHrWWB98TNzUdSZLUhGi62ZpZoon0GZmNBvWvFLOf3Zqu6sMwozcoh
	EkwTV0ryFkPGx6DQtdnPv1NP6Uv7Iz/Si44NKO+fRKDzl6NbNsBj03bgiW9ZPAbhgcab
	5V3HyyNiLoBvNJka185sP3BqcNrJYBSIclEg33C/360CPDyuITz4dBDUCYZ0Ex/L78ry
	8smw==
X-Gm-Message-State: APzg51D5g5kW/ARcdZbQTg1FnbQBs7spPmyGf2/Ullr7QFuLVBaaZCEC
	CTSrnm+cT2b4yve+wiEYVYLJvGGy1u8on2N1LR4=
X-Google-Smtp-Source: ANB0VdZRgxmI+XVO0fJwjDcIHUrPtkjzZgWJf//fC8A0TCXVw06WQfaxn3TW5wizoyhJZ7DTRmgjza0CpODhjdSoxmc=
X-Received: by 2002:aca:d015:: with SMTP id
	h21-v6mr20050946oig.142.1535968478289; 
	Mon, 03 Sep 2018 02:54:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:1650:0:0:0:0:0 with HTTP;
	Mon, 3 Sep 2018 02:54:37 -0700 (PDT)
In-Reply-To: <1535967326-32322-1-git-send-email-hongxu.jia@windriver.com>
References: <1535967326-32322-1-git-send-email-hongxu.jia@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 3 Sep 2018 11:54:37 +0200
Message-ID: <CANNYZj-4XNrwM4xEnnPrdgdobecJa3e+5RQYzoRWYYum=WRyoQ@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] webkitgtk: add opengl to REQUIRED_DISTRO_FEATURES
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
X-List-Received-Date: Mon, 03 Sep 2018 09:54:37 -0000
Content-Type: text/plain; charset="UTF-8"

2018-09-03 11:35 GMT+02:00 Hongxu Jia <hongxu.jia@windriver.com>:
> They can't be built without opengl in DISTRO_FEATURES.
> [snip]
> |webkitgtk-2.20.3/Source/WebCore/platform/graphics/OpenGLShims.h:23:10:
> fatal error: GL/gl.h: No such file or directory
> [snip]

Apologies, but NAK.

Webkit recipe already has the necessary configuration to handle this:

PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11',
'x11', 'wayland' ,d)} \
                   ${@bb.utils.contains('DISTRO_FEATURES', 'opengl',
'webgl opengl', '' ,d)} \

PACKAGECONFIG[webgl] = "-DENABLE_WEBGL=ON,-DENABLE_WEBGL=OFF,virtual/libgl"
PACKAGECONFIG[opengl] = "-DENABLE_OPENGL=ON,-DENABLE_OPENGL=OFF,virtual/libgl"


If disabling opengl does not work, then you should look closer into
why, instead of just requiring opengl to be present always.

Alex

