Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id A240F72A2D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Apr 2015 18:20:36 +0000 (UTC)
Received: by igbqf9 with SMTP id qf9so25992187igb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Apr 2015 11:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=izGDLTnZ5Wn5sGYFiyMBRbiiCBHVclAK/jiVILXOEu8=;
	b=MusQyYgXN84gwCrCWERYt2EGbMsivlFXRxNyi6ldevMrQdI2zY4Uh06Dr9b0LgnhM2
	wNE7I4Y629PchHdv/8CM1HFNPNBcoAx+oW929+maw8qwYlORmdAYMGRQNszXCF1xKgkU
	qlh+3yjU3K26byaQWo9Vv2VsZmnx0NU82ippYYH1waF7vVUAAphMdCIPUtaNZ7TL577n
	L+b066Dnp3B58YeJ8sA9wD3Cl4Csm82JHbIdZkMmrJaFM3mE6zLaseFYhgf7yG5nig7s
	C09IYOqwImgeX+MEbY1Ey9MEXMGaBgdVLefiQU1LiQ918p3TYMqi280CN8Y/tfKpBd2O
	h/VQ==
MIME-Version: 1.0
X-Received: by 10.107.130.165 with SMTP id m37mr22040049ioi.62.1428344437834; 
	Mon, 06 Apr 2015 11:20:37 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.107.23.6 with HTTP; Mon, 6 Apr 2015 11:20:37 -0700 (PDT)
In-Reply-To: <1428342215-7850-1-git-send-email-ed.bartosh@linux.intel.com>
References: <CAP9ODKprO_BWYjr4x0w2PXELXrZa6Y4C2=XgKMWXE+ppULZXTQ@mail.gmail.com>
	<1428342215-7850-1-git-send-email-ed.bartosh@linux.intel.com>
Date: Mon, 6 Apr 2015 15:20:37 -0300
X-Google-Sender-Auth: 3YqUFTphY_K4bJfRYXboAmmH9jM
Message-ID: <CAP9ODKoeisDBMUPy-f2gyrBHk_=+RLfb9aPN+KXQdPOE7MW0zA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [wic][PATCH] wic: use native parted
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
X-List-Received-Date: Mon, 06 Apr 2015 18:20:38 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Apr 6, 2015 at 2:43 PM, Ed Bartosh <ed.bartosh@linux.intel.com> wrote:
> Used exec_native_cmd instead of find_binary_path to run parted.
> Got rid of find_binary_path as it's not used anywhere else.
>
> There are several tools wic is trying to find not only in sysroot,
> but also in host root. Parted is a special as on some distros it's
> installed in /usr/sbin, which is not in the user's PATH. This makes
> wic to fail with error "External command 'parted' not found, exiting."
>
> [YOCTO #7122]
>
> Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>

Awesome!

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

Please open a doc update bug as well. This has Doc impact.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

