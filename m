Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f196.google.com (mail-it1-f196.google.com
	[209.85.166.196])
	by mail.openembedded.org (Postfix) with ESMTP id 275FB7CDEB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Mar 2019 09:10:34 +0000 (UTC)
Received: by mail-it1-f196.google.com with SMTP id z131so14095536itf.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Mar 2019 01:10:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=m8VP0D2Qo5eGuFHb+PKVNCxhTP13L4cioY+adM6xu1A=;
	b=eVVn6akj+Q/tW2bXdf5bLD5VnR6RJFsa4+StnW4uBbxvAZibNCb6byzf1B025js0Gq
	U09heJrZ1bSOWt4pYR42fDdX+qhay7xPF3ZYuiAzeq58KNUNI7VmmhmRQ0PqeUhH5WIE
	XFt5TF+0J07m/TozSWkt4dZ5CI3GX4jDQRxQ/jzhOMxx8OFHMYTfkAK2psu2GEQs9j+B
	mNrkRhv65FhdgchoYIBfD0NQ97pf6+U5dQy2liveGjdQtQQklyrphbZwtqtcfb5b+fsU
	e2V1qVEW1XatnERwLDLRkUPArELQyQ7st9VJ4D1aViJTkQ1oFEHXolT3OdWaMNB4JLaD
	B8dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=m8VP0D2Qo5eGuFHb+PKVNCxhTP13L4cioY+adM6xu1A=;
	b=LxNTlgfw48/WtJUtRIQfaSpGn4dvHcggnTJ0Cx9OIUuzINWLZHBWAjuyRYGbX4uBpV
	a/5CSlVyPLNsHYPYwNjeKABowy8C4lRDQ1JFBzNWGiK5y3aMTPIDC+oxofXHQR1H8zJF
	PRAdcS8YBOjZuLv6RRBQxnQlmnM1s5idqXWDiyYYiljjoBC9nbZ8OEx1+Imk3Sx91r76
	LZBskdyVu2c5G5ggjLGhQzfW9UwpJVGncgPUP2Gw/UwGXbuSyZknsuRWrzS00CwFpZBT
	N/fbOSfxJGcS35wvGBHZeac/dw7lZjJ5ZiO07CdnElqEtNaisAxZQxDoo9OHODOJubnP
	CSyg==
X-Gm-Message-State: APjAAAW+nqHtTahfvH3taS3aiqj64tPnsOg43ma+YJjHG80rSkZkmsdO
	6Pu4fmchMFFNcjrpy3KelxwUUhbh3YgMki5GpXpqeg==
X-Google-Smtp-Source: APXvYqw4VZCkbqx8FCy3zPEoHOU2oH4JRfgi10ZG7issWZHG9BD4oZpJGvHXbC8joQejhNKxo5l3lHAKjX/TOu29P4w=
X-Received: by 2002:a24:2ec2:: with SMTP id i185mr4355024ita.62.1551949836177; 
	Thu, 07 Mar 2019 01:10:36 -0800 (PST)
MIME-Version: 1.0
References: <cover.1551925158.git.Qi.Chen@windriver.com>
	<171e7c793420f8530f7db95e4818c08fd23b44dc.1551925158.git.Qi.Chen@windriver.com>
In-Reply-To: <171e7c793420f8530f7db95e4818c08fd23b44dc.1551925158.git.Qi.Chen@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 7 Mar 2019 09:10:24 +0000
Message-ID: <CAJTo0LbenssbvsH6pWcO5GKKoW7KnyZF1m_2ogBP9T==9tkyeA@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] systemd: update efi PACKAGECONFIG to depend on coreutils-native
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
X-List-Received-Date: Thu, 07 Mar 2019 09:10:35 -0000
Content-Type: text/plain; charset="UTF-8"

That's quite a hammer, I prefer adding realpath to HOSTTOOLS.

(patch sent)

Ross

On Thu, 7 Mar 2019 at 02:10, Chen Qi <Qi.Chen@windriver.com> wrote:
>
> For now, if 'efi' is enabled, we get the following error:
>
>   | src/boot/efi/meson.build:63:24: ERROR:  Program or command 'realpath' not found or not executable
>
> So update the PACKAGECONFIG setting to depend on coreutils-native.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/recipes-core/systemd/systemd_241.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/systemd/systemd_241.bb b/meta/recipes-core/systemd/systemd_241.bb
> index 44a132a..7478fdd 100644
> --- a/meta/recipes-core/systemd/systemd_241.bb
> +++ b/meta/recipes-core/systemd/systemd_241.bb
> @@ -119,7 +119,7 @@ PACKAGECONFIG[bzip2] = "-Dbzip2=true,-Dbzip2=false,bzip2"
>  PACKAGECONFIG[coredump] = "-Dcoredump=true,-Dcoredump=false"
>  PACKAGECONFIG[cryptsetup] = "-Dlibcryptsetup=true,-Dlibcryptsetup=false,cryptsetup"
>  PACKAGECONFIG[dbus] = "-Ddbus=true,-Ddbus=false,dbus"
> -PACKAGECONFIG[efi] = "-Defi=true,-Defi=false"
> +PACKAGECONFIG[efi] = "-Defi=true,-Defi=false,coreutils-native"
>  PACKAGECONFIG[elfutils] = "-Delfutils=true,-Delfutils=false,elfutils"
>  PACKAGECONFIG[firstboot] = "-Dfirstboot=true,-Dfirstboot=false"
>  # Sign the journal for anti-tampering
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

