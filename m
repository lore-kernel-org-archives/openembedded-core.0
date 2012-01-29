Received: from mail-lpp01m020-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RrYnG-0007sH-3x
	for openembedded-core@lists.openembedded.org;
	Sun, 29 Jan 2012 18:43:58 +0100
Received: by lbol12 with SMTP id l12so209593lbo.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Jan 2012 09:36:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=2i4mg0HNHCG80Zir53vvsNUGDZPgfLllqLcdIIm4BM0=;
	b=CEHWWIJ0yw4vdZW30kHNSf+rPSYqMb7uQlwPH7377aFvux3DbJe+l8OhkM2Fnw5+sR
	TkTgzq00xIeR2eYUWoD3B3EeI3EKsQGQOZE3vNGiWCBC3LccJ1YoLsrF1r4oMYkwA/Ro
	2d43ox/B5sneEkUDgd7Wkr5xQd3NLLiCvVpC8=
Received: by 10.112.99.136 with SMTP id eq8mr3732071lbb.42.1327858566377; Sun,
	29 Jan 2012 09:36:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.5.201 with HTTP; Sun, 29 Jan 2012 09:35:36 -0800 (PST)
In-Reply-To: <4F25501F.9000606@emagii.com>
References: <4F25501F.9000606@emagii.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 29 Jan 2012 09:35:36 -0800
Message-ID: <CAMKF1so1dzbo3_YN-pJqn-axFAUazqkdKgFU+CUh3dSbWgYF2Q@mail.gmail.com>
To: ulf@emagii.com, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: bitbake -c clean <package> fails
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
X-List-Received-Date: Sun, 29 Jan 2012 17:43:58 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Jan 29, 2012 at 5:56 AM, Ulf Samuelsson
<openembedded-core@emagii.com> wrote:
>
> First I attempted to just remove the source tarball from the downloads
> directory.
> No download, but build completed.

if you want a fresh fetch.
you can just do bitbake -ccleanall module-init-tools
that will remove the sstate as well as the sources


