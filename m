Return-Path: <jupiter.hce@gmail.com>
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com
	[209.85.166.177])
	by mail.openembedded.org (Postfix) with ESMTP id 44B006064B
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Feb 2020 12:11:28 +0000 (UTC)
Received: by mail-il1-f177.google.com with SMTP id t17so3901639ilm.13
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Feb 2020 04:11:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=5aHbHYqNG5JIvkc2gceulLrS6ucvhrco8+DdKXMlYU4=;
	b=B9B1Gc3Ql4CBMsoAUny2LqcW7GMvYhbFqNnWSVsJIVAk0fHXXSUXrLKnGT0xa9XEFK
	xMLRyHABWJ7pgTsCAX+b9gfanoJ6RhWyThdRany2+nDQeQzf9RqJICavCXdgSBDP5f3a
	yPnK8ObEaD+gaQoUtJopwruwszkrJW8WLdKICGvLJVl3qDbqyiYwZKSnGX/b/2NAkJ2K
	YU67dE1qH1oN8F+oLQ/y4xOQi3clpI8LQwTwZHuUtW9kiBWapKxjVmmHVDH5jPlSCoRL
	7OOcU/H6xCvAKo/TE8oUSgKEeEdo+Qe+CIs/27HbFJWxZ9bm9VxjdOYlXCBl1upZu07F
	JwZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=5aHbHYqNG5JIvkc2gceulLrS6ucvhrco8+DdKXMlYU4=;
	b=RPMkemCvPOyyhrIeXAz9KriBDik36ueWK2IPmgfQWMUlb4rIbYmyzlD4aUhFpMHiLf
	kok1t2KupSmv0+wQwQ2WaGk1BONUhTtVtLVaE2EZbL4FgvHaFbq6PYE7INsdPNFVeePS
	MIixSYK9x9xTOocGZallbQXqAR6Qo/SpCjatphpvyCKSxLJlqsDU2VtpI/DBCLCaIp2H
	w6aVeET2MTvntO3r+Fl6p7z2KWgUha9qa1tKZYLKnLS1SAIm7ija1W71kugCIBxHEh2y
	bRvSJ4mlT0oj0WCMuxBxQPg7lMy9dMOJ4SUCFh/EJFFctgPqiHAKtEdI8rEK6DB/+a1i
	ssLg==
X-Gm-Message-State: APjAAAXvOfvOjpta2J+cTIGStze6t+QWZ5/1lf12UC+Tdi1aNZJIhmBF
	HC5pfnawkvhR9H+AGMjxC599QVdhHgagR0tMalP9Vw==
X-Google-Smtp-Source: APXvYqy9+ri+ort8iUOcJf3BgxA2PzWSlg3viICmiuwFwAUJ+NPRKMO3mYk71GKaN3okka6xNxd4UGWk5RYCZ4mlgTg=
X-Received: by 2002:a92:216:: with SMTP id 22mr42581404ilc.53.1582373489265;
	Sat, 22 Feb 2020 04:11:29 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ad5:5d0d:0:0:0:0:0 with HTTP; Sat, 22 Feb 2020 04:11:28
	-0800 (PST)
From: JH <jupiter.hce@gmail.com>
Date: Sat, 22 Feb 2020 23:11:28 +1100
Message-ID: <CAA=hcWRdUPJ3W5VsQVpckNk8WmVGAh7vVUzMOHVm1mPiLX+y4w@mail.gmail.com>
To: Yocto discussion list <yocto@yoctoproject.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Yocto systemd service have different enviornment than the root
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
X-List-Received-Date: Sat, 22 Feb 2020 12:11:28 -0000
Content-Type: text/plain; charset="UTF-8"

Hi,

Where is the systemd service environment set from?

Here is the systemd service env:

SHLVL=1
JOURNAL_STREAM=8:30355
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
INVOCATION_ID=fbd7ba8782544a828902301423a98196
LANG=C
PWD=/

How can I set up systemd service to use the root environment set up by
/etc/profile? It is not neccesary to set up in my.service file, it can
set up in a shell script my.sh called by service file:

ExecStart=/usr/bin/my.sh


Here is the root environment I login to it, set up in /etc/profile:

# env
USER=root
SYSTEMD_PAGER=cat
SHLVL=1
LD_LIBRARY_PATH=/data/lib
HOME=/home/root
OLDPWD=/data
HUSHLOGIN=FALSE
PS1=\u@\h:\w\$
LOGNAME=root
TERM=xterm
PATH=/usr/local/bin:/usr/bin:/bin:/data/bin:/data/sbin:/usr/local/sbin:/usr/sbin:/sbin
LANG=C
HZ=100
SHELL=/bin/sh
PWD=/data/log
EDITOR=vi

Thank  you.

- jh

