Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SFeHV-0006Eh-Cb
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Apr 2012 06:26:45 +0200
Received: by lagw12 with SMTP id w12so1172202lag.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Apr 2012 21:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=IyVJDRP1u+2euonoA9Zcp0bkgBSl8jsacNnt+xD7MII=;
	b=DEArvldnbKqPKsGp6UE2yd1a/3uJQppQysYa9SOyZ29bRvYtw12/iahhi+P0wyT3Jc
	1jEjZ4dAQCUVXGrGpzaM01aUQhhH+z8fChK2GeEftf/85uwGiQMVGFf+oKWn/eg4E1LX
	HtaTkl1XyoiyEaq0lCH2nmMMvqQiM+JHGtSkdRhumZPpxGxYPW7SFUi/3soTBbpgFkXQ
	5tyAqE3w0w8Iziz5Cqd/OqNzxaXURDICWj01mh57VoySC1waq4Bxa6NtfO0+qpW8O3OM
	kC1TrbEydKUiuXj7juTEUPLWMHiQ4gD2tsouG4GlUupuf+jEcP9XQUpMmE9T60qKLYfd
	db7w==
Received: by 10.152.115.38 with SMTP id jl6mr1234771lab.24.1333599453930; Wed,
	04 Apr 2012 21:17:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.3.161 with HTTP; Wed, 4 Apr 2012 21:17:03 -0700 (PDT)
In-Reply-To: <4F7CC6E6.6020006@opendreambox.org>
References: <cover.1333481624.git.mark.hatle@windriver.com>
	<c1765e7544603baa60bec27185a947aeee404bee.1333481624.git.mark.hatle@windriver.com>
	<4F7CC6E6.6020006@opendreambox.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 4 Apr 2012 21:17:03 -0700
Message-ID: <CAMKF1soi+==bbEKMD+FLdk+8BvWNK3Nj24EJVhoyT5e=_5MvDw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/7] conf/machine/include: Cleanup MIPS tunings to match README
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
X-List-Received-Date: Thu, 05 Apr 2012 04:26:45 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Apr 4, 2012 at 3:10 PM, Andreas Oberritter <obi@opendreambox.org> wrote:
>
> What was mipsel-oe-linux before now became mips32el-oe-linux, i.e.
> tmp/work/mipsel-oe-linux now is tmp/work/mips32el-oe-linux. I'm not sure
> what else broke.
>
> Was this intentional?

I dont think so. mips-*-* in general indicates 32bit BE mips and
mipsel-*-* indicates
32bit LE mips so devicing mips32 and mips32el may be more explicit but
is not widely
used norm


