Return-Path: <schnitzeltony@gmail.com>
Received: from mail-il1-f193.google.com (mail-il1-f193.google.com
	[209.85.166.193])
	by mail.openembedded.org (Postfix) with ESMTP id 579D97FFB2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Jan 2020 10:26:28 +0000 (UTC)
Received: by mail-il1-f193.google.com with SMTP id g12so3922055ild.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Jan 2020 02:26:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=m8G5HlXVJjUp0XmWode/Z7jqVpwv/EinUhRwasPQaYI=;
	b=APc3sBUSK8AO6mdQujqq8ZRTZZaF9UAJzCMTIq3YhYCr36L8pp8NntKJiVKaTI3rsX
	V+YlkMJGQ5u1046GoIPmj16UEHNc3sSQORu70k0QHd/j20pJ2PYgJY0iMA4S9XAFspj/
	Wyi/h38BBxq5SSbdXdXRtTB8aou/U1NGuBidOr3CE29aPOnGPRciazN4H5VSc7i53Bp+
	GWP8rOfs98z++xbjvbFVAiXfB/kjIMtzmikKhQmi9UUxcS0khVFsOyZXxRw717Ew1iHt
	fZZ7WZOz1fUR2s5Ilk9fof8npuitiPoUPwxYqNXF2S27ezOwJiyBN6Je9d6iZnyaLNPD
	tVrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=m8G5HlXVJjUp0XmWode/Z7jqVpwv/EinUhRwasPQaYI=;
	b=WsQ2CcDwdUyHMRymZXrjegupqd0xw2fkGXdzFfL6b+tzjdDK1/UcrcogKGPlUipmvL
	BTiBhN886mmHHxQAltwLPJWrPUZvvlJZLv2B3t/wtK1AHAlEWFOVHTMXW07SewYOZptB
	x3LzlHZy2ogE+kA7hRyq5XZJn8p7M7bZyXf0eTZ4WURDUooBeiGGVmcJlw/gS1ytfO7E
	0KiAAcR79jWgPKGnQQR17H7Re8IGDhQsRcZJ9EDqZB4PBfj3zKmTqiWUi6y9/txb/BkN
	Jj9KeWKNhKeyY4RuGSgjQHtpAmP/NofaWnnd/IsEeu/D+F8PVHlpp6zsLWZxdqhcBfH6
	Jmdw==
X-Gm-Message-State: APjAAAV16k2ZP8zFa+7dsqZD+ZUSq6pS38Km812C3duEal3yUKEAUFvq
	+r2fz9VgjREaw7H7sGSdTeGe+Dk5J+eeab6+iZIdYgkZ
X-Google-Smtp-Source: APXvYqxfWbwy7aCAsOO4mdIh5OgFBN0v2jfYyNWbWcdRYglUtjdf/i8cF+BJaIojt5JRnVgmxGa9j9yFRar/CCVwdnI=
X-Received: by 2002:a92:3b98:: with SMTP id n24mr7080846ilh.108.1578738389418; 
	Sat, 11 Jan 2020 02:26:29 -0800 (PST)
MIME-Version: 1.0
References: <20200109202623.28936-1-schnitzeltony@gmail.com>
In-Reply-To: <20200109202623.28936-1-schnitzeltony@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Sat, 11 Jan 2020 11:26:18 +0100
Message-ID: <CALbNGRRYT9uGfArB5fdeLy6nEok3c208tYh3HgrXcEKgtFZi4Q@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/11] Make MIME work on desktops
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
X-List-Received-Date: Sat, 11 Jan 2020 10:26:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 9, 2020 at 9:26 PM Andreas M=C3=BCller <schnitzeltony@gmail.com=
> wrote:
>
> On fresh images file-browsers do not know how to open files and usually o=
pen a
> dialog with ALL applications available on the machine. This is not what u=
sers
> are used to when working with linux: For just one application installed p=
er
> Mime-Type, the application is opened automatically.
>
> To get a working MIME on desktop it needs two 'databases' on target:
>
> 1. Mime-Types: This is handled by mime.bbclass and creates database in
>    /usr/share/mime/mime.cache.
> 2. Mime associations: A simple text-list of pairs Mime-Type <-> applicati=
on
>    in /usr/share/applications/mimeinfo.cache
>
> This patch series updates/implements/enhances both parts to get images wo=
rk as
> expected.
>
> @Khem: This series creates many QA warnings for layers in meta-openembedd=
ed and
> a patch series fixing many was prepared [1]. Once this series get's appli=
ed (or
> you ask for it) I can send them out.
>
> [1] https://github.com/schnitzeltony/meta-openembedded/tree/work-2020-01
>
> Andreas M=C3=BCller (11):
>   itstool: add from meta-oe
>   itstool: extend to nativesdk
>   shared-mime-info: upgrade 1.10 -> 1.15
>   bitbake.conf: add variables 'mimedir' and 'desktopdir'
>   mime.bbclass: rework
>   insane.bbclass: introduce a warning for mime missing in inherit
>   shared-mime-info: add mime to inherit
>   gcr: add mime to inherit
>   mime-xdg.bbclass: initial add
>   insane.bbclass: Spawn warning for missing mime-xdg in inherit
>   gcr: add mime-xdg to inherit
>
>  meta/classes/insane.bbclass                   | 30 +++++++++
>  meta/classes/mime-xdg.bbclass                 | 62 +++++++++++++++++++
>  meta/classes/mime.bbclass                     | 60 +++++++++---------
>  meta/conf/bitbake.conf                        |  4 +-
>  meta/recipes-gnome/gcr/gcr_3.34.0.bb          |  2 +-
>  ...-build-time-hardcoded-python-binary-.patch | 35 +++++++++++
>  ...ld-time-hardcoded-python-binary-path.patch | 29 +++++++++
>  meta/recipes-support/itstool/itstool_2.0.6.bb | 21 +++++++
>  .../shared-mime-info/install-data-hook.patch  | 25 --------
>  .../shared-mime-info/parallelmake.patch       | 33 ----------
>  .../shared-mime-info/shared-mime-info_1.10.bb |  7 ---
>  ...mime-info.inc =3D> shared-mime-info_1.15.bb} |  8 ++-
>  .../update_desktop_database                   |  8 +++
>  .../postinst-intercepts/update_mime_database  |  9 +++
>  14 files changed, 234 insertions(+), 99 deletions(-)
>  create mode 100644 meta/classes/mime-xdg.bbclass
>  create mode 100644 meta/recipes-support/itstool/itstool/0001-Native-Don-=
t-use-build-time-hardcoded-python-binary-.patch
>  create mode 100644 meta/recipes-support/itstool/itstool/0002-Don-t-use-b=
uild-time-hardcoded-python-binary-path.patch
>  create mode 100644 meta/recipes-support/itstool/itstool_2.0.6.bb
>  delete mode 100644 meta/recipes-support/shared-mime-info/shared-mime-inf=
o/install-data-hook.patch
>  delete mode 100644 meta/recipes-support/shared-mime-info/shared-mime-inf=
o/parallelmake.patch
>  delete mode 100644 meta/recipes-support/shared-mime-info/shared-mime-inf=
o_1.10.bb
>  rename meta/recipes-support/shared-mime-info/{shared-mime-info.inc =3D> =
shared-mime-info_1.15.bb} (69%)
>  create mode 100644 scripts/postinst-intercepts/update_desktop_database
>  create mode 100644 scripts/postinst-intercepts/update_mime_database
>
> --
> 2.21.0
>
Thanks everybody for review./comments I will prepare a V2 and run full
tests here. That may take a few days...

Andreas

