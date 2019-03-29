Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f174.google.com (mail-it1-f174.google.com
	[209.85.166.174])
	by mail.openembedded.org (Postfix) with ESMTP id 6EBCB6B512
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Mar 2019 17:01:32 +0000 (UTC)
Received: by mail-it1-f174.google.com with SMTP id y10so3033813itc.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Mar 2019 10:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=K78mFvmthVnBMtgjfeiVUUHPD01wK4AMdoHAdueDH1A=;
	b=Z4/R7uTqIKDLLGu8QEPK7McxdC4ozVcqbmQ3RJh0NgWOAN0LAPvPmJlbFTgIFYTChL
	CVFpvzpd65CKgE4ht/rBJKHqp3Wuo2AVe7H7fIcGAF0PBUdVKCZiIXRiQVRpWxhBZX5N
	r1letdw8MlSWmIMzUmME6thKgWfpeSlhqazM8Fx3ht6sDibF7W6nYCRvXHRHgISIUtF/
	XYaNZpaUTGcr48phR6+ws007exi92ShJjmrG22tLTWi048mRbqd3NUZgT/86e9RDfTZm
	CE2XdFhd2sOcwGzDl38YVxDa5sladHwKiyqZgL/7bZ9aiXdQaWZlzGLjZUc1tontR766
	C6Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=K78mFvmthVnBMtgjfeiVUUHPD01wK4AMdoHAdueDH1A=;
	b=m7yyvw+RrOL+UyE3JbiagE3HrEvtf+xwr7xooL16kdt+cDPG0TXiqSxlkdIs3HgqJw
	6GdRv0hUFsPdTXUT5kEv32a+ckTsefVcdvrjIY/ALQ+QG6CYWNdh9TBCYgkdq+hAlXuX
	7RvLiOkPIYAEcWAIdcfkePd5x9GoBlzV2vwtI4JobAGMuDpmTGkPVg/n3TC6BTwVrfbJ
	Ze5JDXoD6SA1Js0HbCNiVnB5iKKqYWMFzcD9t6LfDlOelV3tEDhDi6lgWNcIke4duH+G
	9Y1E1rWknuAfchHW7Sqk+UprlUsptMl4lcWa1UrmoyrlGELepG0vYu1e1nJ84z22Rs/G
	fp4A==
X-Gm-Message-State: APjAAAXdrZVG9KemIVy1Kx0QxOb0akT6/KSyuVblzUQyIxOV0DA5bfKs
	6RknQAW3HymZkVaMnFDacx33S7QiUbG+FEtp9qT6pA==
X-Google-Smtp-Source: APXvYqyd3RtXMb8BDQzeS9wS94FKhIbtQKUItLQMYKLTQUdXQSFzaYCCJJ29Mus6bnr/Ghcs7ynDQS7z+UuJ3f73maU=
X-Received: by 2002:a24:ad2:: with SMTP id 201mr5032995itw.26.1553878893538;
	Fri, 29 Mar 2019 10:01:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190326102919.7348-1-schnitzeltony@gmail.com>
	<CAJTo0La2G+3qUPzXOC6B0Mjwr70ygPuttHuNzfV85GRy3pZYpQ@mail.gmail.com>
	<CANNYZj8Ds1A5o-C7tQspQgWc=7rT1FaMD1ALpPMKmi51pMn5ag@mail.gmail.com>
	<CAJTo0Laq_H-C+-S5zNU+4c5urQ5Y2Hy4oSe63EoQZotnLkFsDw@mail.gmail.com>
	<CALbNGRTJYpi90K4VYtSfTq7kJj1Fukvu_iGGx=D-n6hDrNH7Pg@mail.gmail.com>
	<CAJTo0LYQHcaAg=ikVDWSQjBTgTOwTTRmtpKnNUvbuK0UjRuJWA@mail.gmail.com>
	<CALbNGRRu-VFXsZVLU9HeQx232-oDPxRVDKG4EjCvaXhLe87QSA@mail.gmail.com>
	<CAJTo0Lar4HWEaQVZFiUCcvBnnjcam8smPsnR0MrLWgHaSsXFCA@mail.gmail.com>
	<CALbNGRQU1CUfv=R3M1YJKHsdZn6Khsifnw46-9EjTifQoRapDw@mail.gmail.com>
In-Reply-To: <CALbNGRQU1CUfv=R3M1YJKHsdZn6Khsifnw46-9EjTifQoRapDw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 29 Mar 2019 17:01:22 +0000
Message-ID: <CAJTo0LbFHZrKrgrEh86oL=D4EQ-rH7ywft26wRMMNrMbZmttyw@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gtk+3: add librsvg to DEPENDS
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
X-List-Received-Date: Fri, 29 Mar 2019 17:01:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 29 Mar 2019 at 15:33, Andreas M=C3=BCller <schnitzeltony@gmail.com>=
 wrote:
> Hope adwaita-icon packs remain complete / have librsvg from elsewhere
> in my images.

The theme itself doesn't mean pulling in librsvg.  Whatever is using
the icons is responsible for that, so if you're using something GNOMEy
then that's gdk-pixbuf + librsvg.

Ross

