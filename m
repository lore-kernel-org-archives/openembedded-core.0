Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1QV4PZ-0007pw-Ny
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Jun 2011 18:18:17 +0200
Received: by vws2 with SMTP id 2so2582653vws.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jun 2011 09:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:from
	:date:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=YVB4nAX85EhLCS4Yt2yt1Njky2ExiZQtRoKqggW7ZGM=;
	b=sCLXg1xitvNnIHEQ2+JtdpGUfpfuZetXLbPlHlODoN6rqLcgJwnQN9qY4w4FstUh6l
	gV1p6tpZNKB5uECWdRnUCjun6OoQLScBqQx5Eav3I6OIajJIpaWuOluZV10mYU8ky9Sf
	nANzOblicHgHxmrMi14UIgv2LmbkO27hxD4k0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	b=GHa3fOnzNVuDEkhnNZaqw1IXfgkMWqKO21kZxiKpICYcP8gapvow5NFQbKdvfKiXR7
	L3QUhV4xmbq3R2kqXY2+m+MTbtM221Qi+0HNZOt2y/R72wn4XvyOcKZFMQghSf0S76z/
	/LJ9SDduRva/hHggdwb0gL+6jZEY317w32qcw=
Received: by 10.52.181.166 with SMTP id dx6mr3200931vdc.35.1307722496126; Fri,
	10 Jun 2011 09:14:56 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.52.101.134 with HTTP; Fri, 10 Jun 2011 09:14:36 -0700 (PDT)
In-Reply-To: <25C444E8-9FBC-4674-B366-ADCE39FC666B@dominion.thruhere.net>
References: <25C444E8-9FBC-4674-B366-ADCE39FC666B@dominion.thruhere.net>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 10 Jun 2011 09:14:36 -0700
X-Google-Sender-Auth: -nNZKybn03ZbmVQkeBMSLBFq03A
Message-ID: <BANLkTimwD9NrSCFrf_W+KHMmvCGArU2Tjw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: meta-gnome update
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
X-List-Received-Date: Fri, 10 Jun 2011 16:18:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 10, 2011 at 7:06 AM, Koen Kooi <koen@dominion.thruhere.net> wro=
te:
> For people not keeping an eye on meta-gnome, it reached a milestone this =
week: a usefull looking[1] GNOME 2.32 desktop. With the current bits in oe-=
core, meta-oe and meta-gnome you can build an image with gdm, gnome-panel, =
gnome-session, nautilus metacity and gnome-disk-utility. It's still lacking=
 things like gnome-control-center, gnome-settings-daemon, totem, etc.
>
> If you're using meta-angstrom you can build systemd-gnome-image which wil=
ll give you the above.
>
> Give it all a try and send lots of patches to move over your favourite GN=
OME recipes :)

Congrats!
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


