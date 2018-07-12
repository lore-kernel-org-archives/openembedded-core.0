Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f47.google.com (mail-oi0-f47.google.com
	[209.85.218.47])
	by mail.openembedded.org (Postfix) with ESMTP id 4360876060
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2018 16:40:36 +0000 (UTC)
Received: by mail-oi0-f47.google.com with SMTP id w126-v6so56961288oie.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2018 09:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/gHXwGUo5JHOiMWaAYGKFnzUDqLSydwX56toDssHaEM=;
	b=I7OqmmwpxDhc9Wx3YswEnZTapB8H1Ef/VwVbHiH3+BL5zxKbhl8OfwqJFcKbbyFFvP
	XjsWroAyxudVpIi+5IYverfVrQJ8Lgl8GsZQG7NqDGIIBoT4AA8rXPhlw/K8+Jj3sjaK
	++tw/ITSLS68iLmCJJfdxLIg/+04Cus/Xx/A7LSMLZkYKIKya0Y9rBoKiVkFzjmdO/fw
	qKfh0gE0Rj8DtkkeXWUj97JGI92gPr9DnfH38vVR8q61KAIdLuACq5jlpo7AgvHpt2I/
	E+AsogM2jOpPQ4w1n/t6q+mAzX7lvpZOTsORkLJ2KOBUWd7Mq0ok08ch1ed4s53seE1z
	7RDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/gHXwGUo5JHOiMWaAYGKFnzUDqLSydwX56toDssHaEM=;
	b=pGqbZhqv/b+BacEDTOySKULXv54jZbqPcggPHBukgS6D2oAUhdgb3p/J4VP/Z5QOxP
	7TXooR+UX0Y7WQxOQgCzOpdJoN9nuGVIjX7/CeXKEFep0z+MtJU4zrD7qJLeMzSPvSzO
	OKCEj8UVnF4y06idNP0SlE5KfsMwtjOweD6FRzzCd/7DTWfHN/xSPlq3XZutOwFchllM
	paZvXgdI+eyaM6y/dq7KvATOJ33PGGpiAXSv/NOe76s/ZKaaHa3VgZADN9P2iziHFPz+
	kDCvgG00FfnLkr68CArCS9jO2PSnkDymDDlbVfytkFZ5drgZJdx6PhjxjA+L3t7Gh390
	qERw==
X-Gm-Message-State: AOUpUlGpVToCMMzo5op9lbPIOZIDIVRWciNC3u2sPCAFDVd7eDJTlOz5
	vt+/uB/b/wEzA966SbqHGvNh8tvQv5lWVOJPicVd6Q==
X-Google-Smtp-Source: AAOMgpeCF7thti19LlZ/714p8HPeCrM99tqfV9WIG5OYewO1UxbZ8BliiJxpQi1nWT8O6nSawH+cne6YdoswrFUUPQw=
X-Received: by 2002:aca:2808:: with SMTP id 8-v6mr3235953oix.235.1531413637395;
	Thu, 12 Jul 2018 09:40:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:6845:0:0:0:0:0 with HTTP; Thu, 12 Jul 2018 09:40:16
	-0700 (PDT)
In-Reply-To: <CACoJdSaG3UefHMXmfOhe0f7-2rHyfr8B7k4-BZ2iG5uKY_5UBA@mail.gmail.com>
References: <CACoJdSaG3UefHMXmfOhe0f7-2rHyfr8B7k4-BZ2iG5uKY_5UBA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 12 Jul 2018 17:40:16 +0100
Message-ID: <CAJTo0LaNOgufq6L95XEGD2ChN5c-fbBLLY4UkUDd09=5g8vE-g@mail.gmail.com>
To: vlad zouth <vladzouth@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Building postgresql_9.4.5: Some Packages are missing in my rootfs
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
X-List-Received-Date: Thu, 12 Jul 2018 16:40:36 -0000
Content-Type: text/plain; charset="UTF-8"

On 12 July 2018 at 17:36, vlad zouth <vladzouth@gmail.com> wrote:
> Hi,
> I am facing an issue about adding postgresql. Here is the recipe files:
>
> http://cgit.openembedded.org/meta-openembedded/tree/meta-oe/recipes-support/postgresql/postgresql_9.4.5.bb?h=krogoth
> http://cgit.openembedded.org/meta-openembedded/tree/meta-oe/recipes-support/postgresql/postgresql.inc?h=krogoth
>
> In fact, when i build an image, all the packages included into this recipes
> are present in the postgresql image directory but, for example all the
> program added by the variable FILES_${PN}-client are not in my rootfs.
> For more precision, i use fsl-community-bsp project and krogoth distro to
> build an image for the tx6s-8035 karo board.

If you want postgresql-client to be in your image, then you'll need to
add postgresql-client to your image (IMAGE_INSTALL, etc).

Ross

