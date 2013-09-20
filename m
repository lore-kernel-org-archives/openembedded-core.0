Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f47.google.com (mail-vb0-f47.google.com
	[209.85.212.47])
	by mail.openembedded.org (Postfix) with ESMTP id 3D0E560130
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Sep 2013 08:37:56 +0000 (UTC)
Received: by mail-vb0-f47.google.com with SMTP id h10so63606vbh.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Sep 2013 01:37:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=22tTrNUttNHn83T6xbfoIJ7VQ5hXpE9EG3cvL1TWbEc=;
	b=EndMHl/ww48Sfwfn+Fz7OzsIoFdhHVyleJl/PCEX2SNOV05awRDLtpKLNH+iv569IS
	gxLyq+nW8td9nWy/v0hWfSE4EQwyEgL8m6M48OSE3HfBJ/9GwBZzvIQQ++duUqFRWYQe
	7vhBS0FgfVoKsWgbTZ7gyNPRnZsskXNWGImG6zlyJFEmxOmpmlgf63AZ5wsANqFFUijp
	wJFJ7YJ5ZACqR+RqarhlPijGcwDT0Xi6qpOBt6ZZnBVbyKDi4Epswj3yxmGmiujlyEl3
	wD/ZrmODU39ZTFmEzwDEo2bsVCzJtd7CvMCVonvkDlw8woL8EtqoCP7hIunQmRGUdPgb
	GV9w==
X-Gm-Message-State: ALoCoQlhpXQxx9Nr9u8OXiYMb/AbhV/dGOeEWgpP29iHORmgNyWTRqGrgIq4EucLE9D2vf5BjejA
X-Received: by 10.220.1.203 with SMTP id 11mr5286382vcg.15.1379666277504; Fri,
	20 Sep 2013 01:37:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Fri, 20 Sep 2013 01:37:37 -0700 (PDT)
In-Reply-To: <00d201ceb5cd$1440b070$3cc21150$@cn.fujitsu.com>
References: <00d201ceb5cd$1440b070$3cc21150$@cn.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 20 Sep 2013 09:37:37 +0100
Message-ID: <CAJTo0LY_doa073K_9m2Ry24nKT54MoWsBQ9p_45c2WGL+EiDJA@mail.gmail.com>
To: leimaohui <leimaohui@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1]udev_182: creat a symbolic file /sbin/udevadm to fix haldaemon starts error.
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
X-List-Received-Date: Fri, 20 Sep 2013 08:37:57 -0000
Content-Type: text/plain; charset=UTF-8

On 20 September 2013 07:46, leimaohui <leimaohui@cn.fujitsu.com> wrote:
> The haldaemon requires /sbin/udevadm to start.
> So creat a symbolic file  /sbin/udevadm that links to /usr/bin/udevadm.

Why not fix haldaemon to use the right path?

Ross

