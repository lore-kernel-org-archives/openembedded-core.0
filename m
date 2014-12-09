Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f52.google.com (mail-yh0-f52.google.com
	[209.85.213.52])
	by mail.openembedded.org (Postfix) with ESMTP id 277C17252F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Dec 2014 12:55:10 +0000 (UTC)
Received: by mail-yh0-f52.google.com with SMTP id z6so203246yhz.39
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Dec 2014 04:55:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=z6dr1CRGgc+8XdUcH1a8cHLZw7j5jqqXjZq9GfN2c/I=;
	b=ZnP+tykTyjm+c/LIv/nDYjjnug9cHqUxbMR0wxKKY/kb0TYiBd2zd4R2VJYvNsfF5Q
	ZhnsNHxJoPITD2CixPk5RQHw1Ww4IcnEwzOCO10nM/tNJy4Gnv6eFFgD28PqIsbvv1ZV
	rVAyCntUYqsUOENwD0qjndEm+tSCnzKFlDr7u/ciL5SNOuiurjETzpIj1vGyWz9xL12l
	nXCgvckqN+YQcKx2TbWqVPwOMRqrTmFcBuLr3JvVempalaUHNlg+uyU93m9bRkuEh7qh
	KjVycxllUygplVQcSkp3vVMi2D/JO631yfsid0n4m4H/hkssi5xQ6LQ3ZJf8rx3AWj9+
	hDpg==
MIME-Version: 1.0
X-Received: by 10.236.109.166 with SMTP id s26mr2447637yhg.67.1418129711589;
	Tue, 09 Dec 2014 04:55:11 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.171.132 with HTTP; Tue, 9 Dec 2014 04:55:11 -0800 (PST)
In-Reply-To: <6a97dbf65a4e47199083ee52b86bff27@BN1AFFO11FD036.protection.gbl>
References: <6a97dbf65a4e47199083ee52b86bff27@BN1AFFO11FD036.protection.gbl>
Date: Tue, 9 Dec 2014 10:55:11 -0200
X-Google-Sender-Auth: Di0Au8Cw1KUFWKBUvdO6V3YYSBI
Message-ID: <CAP9ODKp66_Be-w8W8YW++Xay4uvQU1M3GFt+5XicUa3eWTamPw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Nathan Rossi <nathan.rossi@xilinx.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] Improve devtmpfs and cpio support
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
X-List-Received-Date: Tue, 09 Dec 2014 12:55:18 -0000
Content-Type: text/plain; charset=UTF-8

Hello Nathan,

On Tue, Dec 9, 2014 at 3:50 AM, Nathan Rossi <nathan.rossi@xilinx.com> wrote:
> The following patches improve cpio support as well as improving the
> handling of devtmpfs and consolidating the setup of /dev mounts.
>
> Currently udev and mdev handle mounting /dev seperately in their own
> init scripts, as well as handling of /dev/pts and /dev/shm. Both however
> implement a similar method of mounting and creating directories.
> Additionally there is overlap between the udev/mdev init scripts and the
> devpts script. This patch attempts to clean up the mounting and setup
> so that it is done at a seperate level to the dev manager itself. So
> that machines/bsps can override the fstab and have custom /dev mount
> setups. This setup also allows for a system which does not use a dev
> manager and relies on devtmpfs for /dev nodes, which is useful for very
> constrained setups.
>
> Additionally this patch set resolves the need for the devpts init
> scripts, and on top of that prepares the /dev/pts interface early enough
> for other rc scripts like bootlogd so that there is no need for the
> CONFIG_LEGACY_PTYS to be enabled in the kernel.

Wonderful; this is a good improvement and I fully agree with the
changes here included.

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

As a matter of completeness, please take a look on the
initramfs-framework which might be helpful for your cpio based images
as well.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

