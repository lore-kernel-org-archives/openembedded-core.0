Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com
	[209.85.167.177])
	by mail.openembedded.org (Postfix) with ESMTP id 2E5E97DE36
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2019 10:21:33 +0000 (UTC)
Received: by mail-oi1-f177.google.com with SMTP id t187so8369039oie.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2019 03:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=G6AZ4Xsa2T06ELPMX0bY8g6BHV4Pum+z5+tgCqu2YWw=;
	b=XkHzDKS+XxFzoiQY3MGAX0T/KZTg2z8LnvJ6pcAqhIvL+kEdP5QK/89m4IO0Y/yC8r
	4ZQ9EIBGOlkJzPpikaOMXDOhOgiUUID9vxJqBKxcGlS1r4m2BylajtgyTbFz6wC6OmoH
	7k/dfPT448ovksrCGH2Z9sR/1ChKIJxeGoOGGbDNpHOXzmGkdnXpJk8fPlH3119TDTLK
	ad0WDm1T9G/6sxSKMPb3fFy21VvhiG0kMmLp0+n8p+7SVrq9IejKQIJ9HaKnlVbruZKi
	V48Pc/i9qyJLh48e7c776SmgR1mqI+/dL03/ssuYIr8h0nSAGbPzimIHloATBTylm0wG
	QVbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=G6AZ4Xsa2T06ELPMX0bY8g6BHV4Pum+z5+tgCqu2YWw=;
	b=GCPm7ulns5iU0Xu1xFm1WyV5n+7g6swVA+4WUA9OBrfbUgaYFz6lixcrEsYM8Is/j+
	bj3bGXhcExsrw8qCf3OZ6uWJRfTBSv3UwrcavOgqpF6Ctt9NL4T0RWp+5hdlwJogEM3n
	zMwmB8sUyHFEog1LY+j2nva+TrnilK7sAnf9qfdPNVcC5l/afmhBG4ufl57naI0UJ+eg
	Ou4ESc5vVDKwv9NrDTb3yz8FeE3MuGPboCkZ0O8cWcGZYZv5BSYuCn/NfhtY31G2j+Bw
	iuXhMHEwBt8VZHdpKIkI2Swl5ZYgvMk47YYynKN4WVpSTbZ2Z39XWXDGEPRhZbZ3xnPK
	aAiw==
X-Gm-Message-State: APjAAAWPJIxpByCUQEJyu+hagCnRqmmaCWg67cDW7GVG552bO5sVXufW
	P6F7FZfUpoLBNZHJaj5FKw1Pi3Xt+alhNK1RKQXb9A==
X-Google-Smtp-Source: APXvYqzNdPX0yiVMOzsfZdqezZ7UaqCVO5AKEnQ6L0jCaut0WQEtiUgxOzJzEY4mi+ZraCfmsgHzHWVLZfO6EKv0gFk=
X-Received: by 2002:aca:dfc4:: with SMTP id w187mr2393031oig.70.1557829294185; 
	Tue, 14 May 2019 03:21:34 -0700 (PDT)
MIME-Version: 1.0
References: <3fbd04e5-296a-ad1c-6456-a33b7273dc66@pseudoterminal.org>
In-Reply-To: <3fbd04e5-296a-ad1c-6456-a33b7273dc66@pseudoterminal.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 14 May 2019 12:21:23 +0200
Message-ID: <CANNYZj_akDX1GqRvVfAqLQeei5fOxTet_RrVh2wc4=ySETXGtA@mail.gmail.com>
To: Carlos Rafael Giani <dv@pseudoterminal.org>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Switching GStreamer recipes from autotools to meson
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
X-List-Received-Date: Tue, 14 May 2019 10:21:33 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, 14 May 2019 at 10:19, Carlos Rafael Giani <dv@pseudoterminal.org> wrote:
> GStreamer recipe upgrades to 1.16.0 have been sent in as a pull request
> to meta-gstreamer1.0 . Once these are in, I'm considering to switch the
> recipes to meson. Are there any potential issues with that? For example,
> anything special about meson and GObject introspection I should know about?

Actually, yes. Unlike autotools, meson does not have a standard option
to enable/disable gobject-introspection, or gtk-doc.
So most of the time you need to inherit the class (as before), and set
GIR_MESON_OPTION to the name of the meson option that controls g-i,
and/or GTKDOC_MESON_OPTION to the name of the option that controls
gtk-doc.
There are plenty of example in oe-core for this.

Also, gstreamer recipes have a few patches that deal with
autotools-specific g-i support, I guess those can be dropped.

Alex

