Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f46.google.com (mail-qg0-f46.google.com
	[209.85.192.46])
	by mail.openembedded.org (Postfix) with ESMTP id A222860144
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Mar 2015 20:25:57 +0000 (UTC)
Received: by qgfh3 with SMTP id h3so1740798qgf.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Mar 2015 12:25:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=5We7j7nehTKEQhWPN2pSSMsSQKAMYhi61/JVOc2DFyo=;
	b=jUH+SBFuRz2+ow66vkDMqRZNDreiBGBB8YnWbHYNjYtL3tUZjfW7k485pAaRyOhZSD
	5b1xThTP+VYT3mfATOUMTrLWgb7IBrKCxQ9de+JUapTMzi22i9CrD4snYNlj/nv+KwRn
	/zUS/h0lyV94tzluo6N8lDk5jGAu+qHNMXQWgkh+msByvPJKxdtRsP8WqJpae/WPcGPF
	TPiAG4Ig3hqTiSSv6tUAyLHVCyebiaLaWcipZjDidmb/nsLxaR38noAK96VT9FLlxTOf
	9uAJhii2wuTuqESjYiAg/DqFRGKQt1dsar3R31b4ftXJ8Hl9kaUPAG6RDV08/sGQisI5
	CG5g==
X-Gm-Message-State: ALoCoQkEfDnO4uFb1C+dofB0BIfPegAnLxk0ftYBfSb5YkJE238k2wpjM/Cii/8g4pJK0QT5TR8X
X-Received: by 10.55.24.83 with SMTP id j80mr11027677qkh.58.1425500758048;
	Wed, 04 Mar 2015 12:25:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.102.203 with HTTP; Wed, 4 Mar 2015 12:25:37 -0800 (PST)
In-Reply-To: <1425481460-33631-1-git-send-email-tudor.florea@enea.com>
References: <1425481460-33631-1-git-send-email-tudor.florea@enea.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 4 Mar 2015 20:25:37 +0000
Message-ID: <CAJTo0LZ7MF4HtubsRn=dCJGJc+qRjViZ0XYeuGNsm-gC+hcoTA@mail.gmail.com>
To: Tudor Florea <tudor.florea@enea.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [dizzy] [PATCH 1/1] python: Add support for aarch64 for ctypes module
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
X-List-Received-Date: Wed, 04 Mar 2015 20:25:58 -0000
Content-Type: multipart/alternative; boundary=001a1142980c4f925c05107c428e

--001a1142980c4f925c05107c428e
Content-Type: text/plain; charset=UTF-8

On 4 March 2015 at 15:04, Tudor Florea <tudor.florea@enea.com> wrote:

> Python have its own version of libffi used for ctypes module.
> libffi 3.0.10 contained in original source of Python-2.7.3 does not have
> support for aarch64 architecture.
> This is patch is backport support for aarch64 from libffi 3.1
>

Can you confirm that this is already fixed in master by having Python 2.7.9?

Ross

--001a1142980c4f925c05107c428e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 4 March 2015 at 15:04, Tudor Florea <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:tudor.florea@enea.com" target=3D"_blank">tudor.florea@enea.com</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":qa" class=3D"a3=
s" style=3D"overflow:hidden">Python have its own version of libffi used for=
 ctypes module.<br>
libffi 3.0.10 contained in original source of Python-2.7.3 does not have<br=
>
support for aarch64 architecture.<br>
This is patch is backport support for aarch64 from libffi 3.1</div></blockq=
uote></div><br>Can you confirm that this is already fixed in master by havi=
ng Python 2.7.9?</div><div class=3D"gmail_extra"><br></div><div class=3D"gm=
ail_extra">Ross</div></div>

--001a1142980c4f925c05107c428e--
