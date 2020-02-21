Return-Path: <alex.kiernan@gmail.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0881360AFD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2020 14:57:43 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id 13so2098806iou.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2020 06:57:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=FAYjHwpiFUOI2u37KjYheCftR0LGtWFVawH2bOh6Jv0=;
	b=sRgRWp1K58NINKyLk+iXmYBI5E/SVytN0a3g6+BliZkytJNPNWkQlEipeq/fvmcipA
	7+1C5ftzQHNFRHGqwGMVvJ6GksO4OfP1qkXbZFarh+MHBqjReh/KTKpblxLOE7nj5WAN
	7PS6zgRKupgsG71bX85v6IV47LH+P2gvIfTVlHIaelCwsVDLphQ7zbcH4c97WcY2k2/m
	yXraqxP7482Iyz0yTzF5ZJE8sUN1j2jw5fre9CHj1jjgtQsemrr7So+LfFw13s7o0dHq
	cthTQpLXKlxP7WngIceyvwZPrKVXHgWXhMfs6TNi1POLYjcIhq395vOSWExjyyKL2ZLJ
	8eDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=FAYjHwpiFUOI2u37KjYheCftR0LGtWFVawH2bOh6Jv0=;
	b=DDHv/+iHK7Xss+uTZXvPb9iWAqpDNOQ3Gc9UEW4WFDXQF6hklDZjaP3TBiynE+Nsrj
	1j/kKlYT3Ygq+qKDvt9R1IuDgSEo/AajYz6BpTpC/PlnF6RTY5bQ4939mnfPBYVIW7ag
	+hHlVromEj6/WpYbGa6lHew5qd+cJOl5zrjWcgI+crL3heMO4hOPxNPRMz+avB64df6Q
	WRVUkpCKX6A7dPnBtw6mDwKpZH+6SciVUhCh1CWxsQ5wYcue/IY9N/7b61xDDgbH1hd6
	SDg2/xcMcOXETQjns985Mal2Z0VSKeip4/J0QLxaD8rrc0Zq6Trlod97jL5dplNtRnEe
	Uo2Q==
X-Gm-Message-State: APjAAAU00sBEAz6xp58xudJ0BnaSdJB9YplgzlokylHii706ZSvewjVs
	yRGQ+Tl1ufN3eQfh1hUlP5tcLCYte5aPEH3KisM=
X-Google-Smtp-Source: APXvYqxWcS5qt/CSwagTe+BIA1fycg0Rg0FloESTSpNQ9iUpIu72NE6qTP0UwgHoTlF1Cbq7v2mByonofg185XXF18k=
X-Received: by 2002:a6b:3845:: with SMTP id f66mr33654183ioa.102.1582297064880;
	Fri, 21 Feb 2020 06:57:44 -0800 (PST)
MIME-Version: 1.0
References: <1582255767-74523-1-git-send-email-anuj.mittal@intel.com>
	<80d58477f0a13b2218d351c61f9ca7d54491b8ac.camel@linuxfoundation.org>
In-Reply-To: <80d58477f0a13b2218d351c61f9ca7d54491b8ac.camel@linuxfoundation.org>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Fri, 21 Feb 2020 14:57:33 +0000
Message-ID: <CAO5Uq5TgKyVMx205U65bUg=UU9q8uf=7TVtJAcpyOB1cg9f9cQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [zeus][PATCH] openssh: backport patch to fix "cert not yet valid" test
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
X-List-Received-Date: Fri, 21 Feb 2020 14:57:44 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 21, 2020 at 11:28 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2020-02-21 at 11:29 +0800, Anuj Mittal wrote:
> > Fixes [YOCTO #13796]
> >
> > Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
>
> Is this issue already addressed in master (maybe through upgrade)?
>

We already had that patch in master which I dropped that patch as part
of the move to 8.2p1 (was
0001-Manually-applied-upstream-fix-for-openssh-test.patch)

-- 
Alex Kiernan

