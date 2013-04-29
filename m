Received: from mail-vc0-f171.google.com ([209.85.220.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>)
	id 1UWvVF-0005nh-Qy; Mon, 29 Apr 2013 23:21:04 +0200
Received: by mail-vc0-f171.google.com with SMTP id ha12so3216874vcb.16
	for <multiple recipients>; Mon, 29 Apr 2013 14:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:date:message-id:subject:from:to
	:content-type; bh=Gq3jzDHtI7DJjLE9tD3HOtJENiLQ6Ic5CrFwKTUK+pg=;
	b=WRXLh6R4UfSvLhd0snEDb82iMUKPMpUBO8aP3yb0lh4wLwEjuKDiJ91kBAylpsxPpz
	CfUMSOvrHNJy6yn7dkwFqTrhTHZ8e6U6flzZWCOlKREgKZ5TKmclyxRT0Yh//YiBj2LZ
	/mikasKT95GTMsGWn36ouaZoFcw6D9B6vjPxOgp/XsrYjCSxyY6XNCWlvqZDvPrjgWy4
	VgNgGGRP7FLq+oXc4z0kdzW4EvRbAhpy7WurUj3EUHqUFqXKc+VSFsVXEUG3HNQSXKNo
	e6BMPTbxc/GjNl7EY/hy/WvmB2y5qcUfT3FXgwxPI929AaBy3FDhraESosb7UwzqTftm
	TgRQ==
MIME-Version: 1.0
X-Received: by 10.52.88.2 with SMTP id bc2mr13537888vdb.27.1367269383684; Mon,
	29 Apr 2013 14:03:03 -0700 (PDT)
Received: by 10.52.183.36 with HTTP; Mon, 29 Apr 2013 14:03:03 -0700 (PDT)
Date: Mon, 29 Apr 2013 23:03:03 +0200
Message-ID: <CALbNGRRndfF8dvQhtnSgzcE-72KGOP4tb5BQx_Z-205Dr2prGw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org, 
	openembedded-core@lists.openembedded.org
Subject: udev-extraconf conflicts
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 29 Apr 2013 21:22:25 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

is it really necessary to add udev-extraconf to systemd RRECOMMENDs?
For me automount.rules turn gvfs/gio (auto)mount to unusable state.
I bet there are others (see autonet.rules) failing for hidden 'helpers'

Andreas


