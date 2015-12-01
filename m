Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 2509B6011F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Dec 2015 15:36:25 +0000 (UTC)
Received: by iofh3 with SMTP id h3so13048598iof.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Dec 2015 07:36:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=+KK2ZyWgkg7MaOpSa9EhYQBfF5S78uD6uBRjHWhdPXs=;
	b=f05ASAPbf+wdEss2pKZa9TTwnKG4+MBX9w01Do19LZmF778rIIjD0urnWKcxd1V2PG
	HCuOEyT61ee3DOiCbNcE6CNUqFOKBwKFi2SKRvHEbE14GTqBfa4TW54N9LkXm6kWBuke
	jOZVgMs5ovBsFRGmBdqP3yh/KxwAZ3+6zzVS4DThklkVK8CD/OdG0hGzs6vwxWBNQnyB
	h1FDWogDNtPbIQ8QXs7z2/0hcpwZrhCmL3KKIRPzAAIw7MTgZc4kWRaLFqdY4jjmBq3K
	516BJMYlOLnkp/uwBQlWP2CFeA20VOkoJpy+R0KLuq/vlAVGRkgY925mwV74uikx4OcM
	G+TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=+KK2ZyWgkg7MaOpSa9EhYQBfF5S78uD6uBRjHWhdPXs=;
	b=cnM9oRebj0pjBbpHKpCV5Idr2QYYyblNAUUSQayWCB91zzt9Q7zzpeXKCHyjem86tH
	8SUlA0tA5wgAAuYgOTVHSv+Eg6NmH0EthHMPVtrmaSZmAoE7UZWNspEPa7O6nrfM6jKZ
	CZ7zreNO446x3bzordqftkGcNmcMlA1fWhi7QbV4O8m80R05C6KhvCxgoawX67BKx0sx
	etABROn8SSf6fz3TFR1SfTHDUmLZzZwfj3jf26C09ChudsdlyfV9hYm4s63mLnV+2KTf
	UCaOLyFXz3oa+8C0VwJXkWrnMAVEP7Fju5HIbQCU1O91Wue5kxfOtihaa2Mawgv7CUkI
	gupg==
X-Gm-Message-State: ALoCoQkAtIVxExaXTx5Laa0Sjacf7AXvfRWD133vXTeejQFxJdTzR6gLNZC7fJhozX3O5Zu+ytil
X-Received: by 10.107.135.30 with SMTP id j30mr58271512iod.148.1448984185973; 
	Tue, 01 Dec 2015 07:36:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Tue, 1 Dec 2015 07:36:06 -0800 (PST)
In-Reply-To: <1448875684-24516-1-git-send-email-maxin.john@intel.com>
References: <1448875684-24516-1-git-send-email-maxin.john@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 1 Dec 2015 15:36:06 +0000
Message-ID: <CAJTo0LZO=xhvP5RS0hLn67aq2TVBBaQRG61K6+rzbxrV2LDyaQ@mail.gmail.com>
To: "Maxin B. John" <maxin.john@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libjpeg: Replace libjpeg with libjpeg-turbo
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
X-List-Received-Date: Tue, 01 Dec 2015 15:36:27 -0000
Content-Type: multipart/alternative; boundary=001a113ec64ab0ff8c0525d7ebee

--001a113ec64ab0ff8c0525d7ebee
Content-Type: text/plain; charset=UTF-8

On 30 November 2015 at 09:28, Maxin B. John <maxin.john@intel.com> wrote:
> +PACKAGES =+ "jpeg-tools libturbojpeg"
> +FILES_libturbojpeg = "${libdir}/libturbojpeg.so"
> +INSANE_SKIP_libturbojpeg = "dev-so"

I don't understand why there's a libturbojpeg package solely for a
development symlink that should be in $PN-dev.

Also, Martin pointed out that meta-oe's master-next has a 1.4.2 recipe, can
you use that?

Ross

--001a113ec64ab0ff8c0525d7ebee
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 30 November 2015 at 09:28, Maxin B. John &lt;<a href=3D=
"mailto:maxin.john@intel.com">maxin.john@intel.com</a>&gt; wrote:<br>&gt; +=
PACKAGES =3D+ &quot;jpeg-tools libturbojpeg&quot;<br>&gt; +FILES_libturbojp=
eg =3D &quot;${libdir}/libturbojpeg.so&quot;<br>&gt; +INSANE_SKIP_libturboj=
peg =3D &quot;dev-so&quot;<div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">I don&#39;t understand why there&#39;s a libturbojpeg pack=
age solely for a development symlink that should be in $PN-dev.</div><div c=
lass=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Also, Martin poin=
ted out that meta-oe&#39;s master-next has a 1.4.2 recipe, can you use that=
?</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross=
</div></div>

--001a113ec64ab0ff8c0525d7ebee--
