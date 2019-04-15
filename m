Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id F250D7D9AD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2019 10:58:49 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id c1so20042747wml.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2019 03:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=84aY0p4kQ0fr11qnDaYz5Dt5Tv7ScecNRJshRcXwyNg=;
	b=YrcjM6qF4Ifvs1q9z+NbPtzEefA3Xi+ccVH7QIU3JCrsozO4DZUKMXK9da/v1CCwZx
	3/tavrB0tIo96JHMUZXjKzhbGRoRo5Cm8gg3RssR5jiJmx6BfFnOzjlfEhPYThjCdA3o
	xPHFzpFtWo9RMo8kGE8tDXfqYxc19qXuNBWo4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=84aY0p4kQ0fr11qnDaYz5Dt5Tv7ScecNRJshRcXwyNg=;
	b=VmIo2iBGE+e3Njdl6EuNa7oyqwoPUFx4RpuJTMJnrfTgHcCh3+6EkfK0uZT+spabGS
	zW4HwZwG9rD/cFf92D24L5+Mlm40QVE0nK0cis0VR3UU5KLQnvkx3HyG9ur9U5JlbbC9
	oFyYrY1YHUye5XzeHRN9Fzkn+kfzmvET9Ba0mmAhVdqOqc0u37bFO0fa1jJI5NIqkFUB
	EyVpwuP7WJ20oIbsjU6aDJSIUbtJkVBeTpuVTq53oJZOzjNaKV2XnXyusbdpKy+MH5hW
	/Yjk2Zx5fI9Q0jYWAUZxFu0zV6UmadGXhEzvcXToLZl/zX6whod5pwNwRAdLEtLSfYr0
	tmmw==
X-Gm-Message-State: APjAAAUDvdStK+kJb5rAqEsgr5EQAUtp1GTI8VFIULu8o85z1uA83qiu
	FIsyQn0Ov9NZWgK+84nzPjEL0A==
X-Google-Smtp-Source: APXvYqys63eXzpSYb+ogo3A4rGDBGwsFHtQVob4KMj1Y+n1BcOlHjsfKrOpfbtBmNf7rpEnZUi+3vQ==
X-Received: by 2002:a1c:2109:: with SMTP id h9mr22698127wmh.68.1555325930745; 
	Mon, 15 Apr 2019 03:58:50 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	13sm18912862wmf.23.2019.04.15.03.58.49
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 15 Apr 2019 03:58:50 -0700 (PDT)
Message-ID: <7da83221d236ec371dc8236520da6a8dab02ad4b.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Yi Zhao <yi.zhao@windriver.com>, openembedded-core@lists.openembedded.org
Date: Mon, 15 Apr 2019 11:58:48 +0100
In-Reply-To: <c7744acd-1290-c641-860a-569a6b43e8cc@windriver.com>
References: <1555317167-20284-1-git-send-email-yi.zhao@windriver.com>
	<97ab05f9b4560c85e7386210318fe98b1d5121af.camel@linuxfoundation.org>
	<c7744acd-1290-c641-860a-569a6b43e8cc@windriver.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH] libyaml: update SRC_URI[md5sum] and SRC_URI[sha256sum]
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
X-List-Received-Date: Mon, 15 Apr 2019 10:58:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2019-04-15 at 16:42 +0800, Yi Zhao wrote:
> 在 2019/4/15 下午4:35, Richard Purdie 写道:
> > On Mon, 2019-04-15 at 16:32 +0800, Yi Zhao wrote:
> > > Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> > > ---
> > >   meta/recipes-support/libyaml/libyaml_0.2.2.bb | 6 ++++--
> > >   1 file changed, 4 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/meta/recipes-support/libyaml/libyaml_0.2.2.bb
> > > b/meta/recipes-support/libyaml/libyaml_0.2.2.bb
> > > index d2b39f3..fbd1992 100644
> > > --- a/meta/recipes-support/libyaml/libyaml_0.2.2.bb
> > > +++ b/meta/recipes-support/libyaml/libyaml_0.2.2.bb
> > > @@ -8,8 +8,10 @@ LICENSE = "MIT"
> > >   LIC_FILES_CHKSUM =
> > > "file://LICENSE;md5=a76b4c69bfcf82313bbdc0393b04438a"
> > >   
> > >   SRC_URI = "http://pyyaml.org/download/libyaml/yaml-${PV}.tar.gz
> > > "
> > > -SRC_URI[md5sum] = "2ad4119a57f94739cc39a1b482c81264"
> > > -SRC_URI[sha256sum] =
> > > "46bca77dc8be954686cff21888d6ce10ca4016b360ae1f56962e6882a17aa1fe
> > > "
> > > +SRC_URI[md5sum] = "54bf11ccb8bc488b5b3bec931f5b70dc"
> > > +SRC_URI[sha256sum] =
> > > "4a9100ab61047fd9bd395bcef3ce5403365cafd55c1e0d0299cde14958e47be9
> > > "
> > > +
> > > +S = "${WORKDIR}/yaml-${PV}"
> > Why?
> > 
> > Did upstream change the tarball?
> 
> I think so. But there is no any changelog or  checksum file in
> download 
> page: https://pyyaml.org/download/libyaml/

Looks like the same files with libyaml -> yaml in the tarball. No idea
why, I wish upstreams wouldn't do this :(

Cheers,

Richard



