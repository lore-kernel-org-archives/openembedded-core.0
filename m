Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1RIFxs-0005Mh-NH
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Oct 2011 10:33:00 +0200
Received: by vcbf1 with SMTP id f1so4957060vcb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Oct 2011 01:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=PsX92s5Amyp5wg0Caw+XgjC91T/7cW46EbezADsdVKA=;
	b=YT9+yIerndjJ+SK1rSLhHFiIXRdR59BJzgVx2ReOoOlJyX2tc79gHVECTWH7V2mcuK
	JVKxiFuelzyGGjmARKZxJN7VsUtfIrkJ6w/2HTxxX+yHjWXwskuLs5VIp+pxeBO4yRWd
	ilcmyicDCdFv9qcJ4KMlJoBDWRo74lGKFPeWw=
MIME-Version: 1.0
Received: by 10.52.115.102 with SMTP id jn6mr2608510vdb.115.1319444822187;
	Mon, 24 Oct 2011 01:27:02 -0700 (PDT)
Received: by 10.52.107.40 with HTTP; Mon, 24 Oct 2011 01:27:02 -0700 (PDT)
In-Reply-To: <F930E711-421C-439B-AAA8-EEBA0371ED86@dominion.thruhere.net>
References: <F930E711-421C-439B-AAA8-EEBA0371ED86@dominion.thruhere.net>
Date: Mon, 24 Oct 2011 10:27:02 +0200
Message-ID: <CACW_hTYqjsZzB2WRJ=EED4KGwqcGb2UVtKpKjZGNf-urO35G-w@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: serial-console: IMAGE_FEATURE, MACHINE_FEATURE or DISTRO_FEATURE?
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
X-List-Received-Date: Mon, 24 Oct 2011 08:33:00 -0000
Content-Type: multipart/alternative; boundary=bcaec548a987ed5cb104b0072f65

--bcaec548a987ed5cb104b0072f65
Content-Type: text/plain; charset=ISO-8859-1

2011/10/24 Koen Kooi <koen@dominion.thruhere.net>

> Hi,
>
> Otavio is cleaning up systemd in meta-oe to work with his initramfs setup
> and we stumbled onto a challenge that we'd like some more feedback on.
>
> The old sysvinit recipes always hardcode a serial getty into inittab,
> systemd installs a getty@<port>.service file instead. Otavio doesn't need
> (or want) a getty on serial in his setup, but I need (and want) it on all my
> setups. So we agreed that it needs to be a feature :)
>
> I nitially suggested MACHINE_FEATURE, which Otavio implemented here:
> http://patchwork.openembedded.org/patch/13713/ , but I'm having second
> thoughs about it and am leaning toward an IMAGE_FEATURE instead. Since this
> involves *_FEATURE and we want systemd to move into oe-core eventually I'm
> moving the discussion from OE-devel to OE-core. Not much discussion has been
> going on, so I hope we'll get some more feedback here. I'll try to
> buttonhole some more OE developers at ELC and report back as well.
>  <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>



Technically it is probably both.
I've seen embedded systems without a console. That seems to indicate a
machine feature.
Then again even if you have a console you might not want to enable it (e.g.
in order not to give the customer root access or even info wrt printk etc).
That seems to indicate a machine feature.
Probably the answer is inbetween: A machine feature HAS_CONSOLE or something
like that and an image feature CONSOLE_ENABLED.

My 2 cents.

Frans

--bcaec548a987ed5cb104b0072f65
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote">2011/10/24 Koen Kooi <span dir=3D"ltr">&=
lt;<a href=3D"mailto:koen@dominion.thruhere.net">koen@dominion.thruhere.net=
</a>&gt;</span><br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex;">
Hi,<br>
<br>
Otavio is cleaning up systemd in meta-oe to work with his initramfs setup a=
nd we stumbled onto a challenge that we&#39;d like some more feedback on.<b=
r>
<br>
The old sysvinit recipes always hardcode a serial getty into inittab, syste=
md installs a getty@&lt;port&gt;.service file instead. Otavio doesn&#39;t n=
eed (or want) a getty on serial in his setup, but I need (and want) it on a=
ll my setups. So we agreed that it needs to be a feature :)<br>

<br>
I nitially suggested MACHINE_FEATURE, which Otavio implemented here: <a hre=
f=3D"http://patchwork.openembedded.org/patch/13713/" target=3D"_blank">http=
://patchwork.openembedded.org/patch/13713/</a> , but I&#39;m having second =
thoughs about it and am leaning toward an IMAGE_FEATURE instead. Since this=
 involves *_FEATURE and we want systemd to move into oe-core eventually I&#=
39;m moving the discussion from OE-devel to OE-core. Not much discussion ha=
s been going on, so I hope we&#39;ll get some more feedback here. I&#39;ll =
try to buttonhole some more OE developers at ELC and report back as well.<b=
r>

<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank"></a></blockquote><div>=A0</div><br></div>Technical=
ly it is probably both. <br>I&#39;ve seen embedded systems without a consol=
e. That seems to indicate a machine feature.<br>
Then again even if you have a console you might not want to enable it (e.g.=
 in order not to give the customer root access or even info wrt printk etc)=
. That seems to indicate a machine feature.<br>Probably the answer is inbet=
ween: A machine feature HAS_CONSOLE or something like that and an image fea=
ture CONSOLE_ENABLED.<br>
<br>My 2 cents.<br><br>Frans<br>

--bcaec548a987ed5cb104b0072f65--
