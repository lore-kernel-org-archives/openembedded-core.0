Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7BE0078674
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jan 2018 18:21:34 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id o13so10713398pgs.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jan 2018 10:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ATc3DjJcUmu09VoXcguWinb5kXMi4DefLkDfNw7VT6c=;
	b=CmwTpVQT/vkjrc9lXlKJH5SB2BDvHRnkXhafNlhzu1+0hQFBr4F+dTaJ8pZBuCPdOC
	VMpGkQCX6EBzch1vQKcUiV3/YSgfwZYE7vg8o8KXAUkGTM6p6WvpGcImW6awZmxpbHPH
	x6jrk0SZKoF7u9v0F88inf0Bvh1F0u5mi88PU2tHn437FlMoze+v9XDY2ZxL/hzutMdR
	ow02jMfHaUYjiGQOyJEKhiRVTV9ZEVM29q2Bazt9x0rp9mWip9Zy4PVoyt3/5aZU7Y5m
	qZKWK5TanlJpu7HPrZd0Lk8zFrqJFmEzUGZgAd3hd7gxe2cniUO6/OBWeSh6muurAZVK
	krEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ATc3DjJcUmu09VoXcguWinb5kXMi4DefLkDfNw7VT6c=;
	b=GqZuRAbLFBcGBqJA67zjah98hHP41pSMAspyo4fzFYQlTHdxAUnTopsJLixkaTth/C
	UELlAC1K/+gFx2XA5myhuY4zJulwgW39neLhbr4bYiSvJPyLjJ0K4T5lXyVop8TIlB6B
	/B2l6YUKTFZPKWbiRdl6W76YOk9pfhVPL5gwyK+fTWGE53yA7Qzao7xmuOJuCaXDrYQV
	h6VRfhV1wla7B+5EIxJIIB+SVOO0lAKESA6Nq7T9F/Sd7eHoVgGAJSbYm32mUfoX4szK
	3O5JIRxwJOyUnts8v1n02tG/UTE0KTaQoz3ATE0Z4BwcvHE8A9gVBvTDMicIBjtmgGVw
	tPIw==
X-Gm-Message-State: AKwxytcqr/Wlu7fwz9L75D2TT4y5iQPzaKmOgyv9kibcqZYYcTmlHx20
	t5VFjCe3jWrtpTR+ydBh3GZRvIy4WKELDs2Jk1g=
X-Google-Smtp-Source: AH8x22783+uT4LJxS5nTFxsTn828D7fF5IjsvF8PrGOJMUXLdyy8FAeK3wz29QAUYBjRIETPbcvUhG4YzgP49NTW18o=
X-Received: by 2002:a17:902:27e6:: with SMTP id
	i35-v6mr26884528plg.441.1517422896256; 
	Wed, 31 Jan 2018 10:21:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.161.170 with HTTP; Wed, 31 Jan 2018 10:21:05 -0800 (PST)
In-Reply-To: <1517420847-7592-1-git-send-email-trini@konsulko.com>
References: <1517420847-7592-1-git-send-email-trini@konsulko.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 31 Jan 2018 10:21:05 -0800
Message-ID: <CAMKF1sp=WBbimFmZDiowoEgiBhhWHjZyafVfDUBX0HzCwmZhAg@mail.gmail.com>
To: Tom Rini <trini@konsulko.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2] security_flags.inc: Use SECURITY_X_LDFLAGS for all xf86 modules
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
X-List-Received-Date: Wed, 31 Jan 2018 18:21:35 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 31, 2018 at 9:47 AM, Tom Rini <trini@konsulko.com> wrote:
> We need to ensure that all xorg modules are linked with
> SECURITY_X_LDFLAGS to ensure that they will be able to resolve their run
> time dependencies.  Update the current list of recipes and add a comment
> for future reference.
>

LGTM

> Cc: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Tom Rini <trini@konsulko.com>
> ---
>  meta/conf/distro/include/security_flags.inc | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
> index 7ea1049edff8..4fa29b5e67bf 100644
> --- a/meta/conf/distro/include/security_flags.inc
> +++ b/meta/conf/distro/include/security_flags.inc
> @@ -59,6 +59,14 @@ TARGET_LDFLAGS_append_class-target = " ${SECURITY_LDFLAGS}"
>  SECURITY_LDFLAGS_remove_pn-gcc-runtime = "-fstack-protector-strong"
>  SECURITY_LDFLAGS_remove_pn-glibc = "-fstack-protector-strong"
>  SECURITY_LDFLAGS_remove_pn-glibc-initial = "-fstack-protector-strong"
> +# All xorg module drivers need to be linked this way
> +SECURITY_LDFLAGS_pn-xf86-input-evdev = "${SECURITY_X_LDFLAGS}"
> +SECURITY_LDFLAGS_pn-xf86-input-keyboard = "${SECURITY_X_LDFLAGS}"
> +SECURITY_LDFLAGS_pn-xf86-input-libinput = "${SECURITY_X_LDFLAGS}"
> +SECURITY_LDFLAGS_pn-xf86-input-mouse = "${SECURITY_X_LDFLAGS}"
> +SECURITY_LDFLAGS_pn-xf86-input-synaptics = "${SECURITY_X_LDFLAGS}"
> +SECURITY_LDFLAGS_pn-xf86-input-vmmouse = "${SECURITY_X_LDFLAGS}"
> +SECURITY_LDFLAGS_pn-xf86-video-cirrus = "${SECURITY_X_LDFLAGS}"
>  SECURITY_LDFLAGS_pn-xf86-video-fbdev = "${SECURITY_X_LDFLAGS}"
>  SECURITY_LDFLAGS_pn-xf86-video-intel = "${SECURITY_X_LDFLAGS}"
>  SECURITY_LDFLAGS_pn-xf86-video-omapfb = "${SECURITY_X_LDFLAGS}"
> --
> 2.7.4
>

