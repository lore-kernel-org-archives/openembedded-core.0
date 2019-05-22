Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id A22837E318
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 05:38:58 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id x64so752891wmb.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 22:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=AFSPW8AXOBmHbT98tP6dK9tjJGqdp3izu+VV7rFbbag=;
	b=Gn2cxhmSQ985Wnu0re8NKv0AEjMaRDrlIN6V4lBoL3txT3GBkBWsNesEzddxF9Z7wz
	sbWQUP+bGZjLiCNK7UNtKODJhmUdjsLi/7d6S7GWmWsblL/vky0pBBHcUFprIvUbmYqE
	vXVPKNQ7S2JQp+qBTensB9u2kzZiXjFpbzGqk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=AFSPW8AXOBmHbT98tP6dK9tjJGqdp3izu+VV7rFbbag=;
	b=DzRmBUZUahcRbPQ6N0HFPp2cu+YmYtRHJ6RfwNLmIzgVhp4N2qzfa8hqm7fcx7QPEV
	iv65FCLfrhGUfAsRjH6jl/KdYb3MCikRE+h5shol8Vc3jOQfzXxaoaL3JwQ98ddAZ/l+
	ukCXmokskcKmXGVpMlVMPDVCI0tEkaZkzbtQTXs9/LqubHjdlN0VHsI6t27UsnsMa9bS
	BztUm6hcSJtyTNY90dxbqdVU50LXA9Xr4WbMbo6y9jjnYDWx69Z8qFh5+yLMlJAtLTE3
	15a+RnAMgn84rFmL1b2tJAlF2Ilgy5ITwPlur/01PtWrhj4347Ych53FRs8tKMDdHPJ0
	8k/A==
X-Gm-Message-State: APjAAAVPzEuoyD7DzkiQ59zy+3QEeCPr+WY7PF5c906ZkA7a5E1sNart
	ZTCQiy97zGFaugDz80OhieYWVQ==
X-Google-Smtp-Source: APXvYqxOI2M15k77egptnQd2TTSNV7ef8mSbaX4m966Cb83VuWTFDVSP9TvSyWwRE6OY+idRYyjw/g==
X-Received: by 2002:a1c:a804:: with SMTP id r4mr5801227wme.21.1558503539377;
	Tue, 21 May 2019 22:38:59 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id h6sm1487991wrm.47.2019.05.21.22.38.58
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 21 May 2019 22:38:58 -0700 (PDT)
Message-ID: <d5956d477c49d8cc5b2f62da24ef608f47dee275.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: akuster808 <akuster808@gmail.com>, Andreas =?ISO-8859-1?Q?M=FCller?=
	<schnitzeltony@gmail.com>, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 22 May 2019 06:38:57 +0100
In-Reply-To: <7abe103b-a8cd-e625-8175-57322800ce14@gmail.com>
References: <20190417133941.31087-1-schnitzeltony@gmail.com>
	<CALbNGRSJs_KncbefGSSPN_u_KYOrCnEsfSTeLJKLXeFQ7guEPQ@mail.gmail.com>
	<CALbNGRSC=NjtUg=JxzmaZbjEj8BhH1NGPTRTs=iU34ftM8s=JQ@mail.gmail.com>
	<CALbNGRTCng3BDqz-Phy2chgUQJYuwHmcymmL0z+ad+YGy+nd-A@mail.gmail.com>
	<CALbNGRSN609Q1RHAkFODAh-3mTtRENdMv52XWJEv9RnUiLsxmw@mail.gmail.com>
	<7abe103b-a8cd-e625-8175-57322800ce14@gmail.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH][thud] adwaita-icon-theme: do not delete symbolic svg but pack them in ${PN}-symbolic
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
X-List-Received-Date: Wed, 22 May 2019 05:38:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2019-05-21 at 21:47 -0700, akuster808 wrote:
> 
> On 5/21/19 2:42 AM, Andreas Müller wrote:
> > On Tue, May 14, 2019 at 9:47 AM Andreas Müller <
> > schnitzeltony@gmail.com> wrote:
> > > On Tue, May 7, 2019 at 12:51 PM Andreas Müller <
> > > schnitzeltony@gmail.com> wrote:
> > > > On Tue, Apr 30, 2019 at 8:20 AM Andreas Müller <
> > > > schnitzeltony@gmail.com> wrote:
> > > > > On Wed, Apr 17, 2019 at 3:39 PM Andreas Müller <
> > > > > schnitzeltony@gmail.com> wrote:
> > > > > > This fixes:
> > > > > > * gtk-icon-browser: for symbolic view almost all icons were
> > > > > > missing
> > > > > > * xfce's thunar: 'home' and 'up' icons were missing. Had a
> > > > > > long discussion with
> > > > > >   XFCE-people [1] and asked here [2].
> > > > > > 
> > > > > > How could I overlook the most obvious...
> > > > > > 
> > > > > > [1] https://bugzilla.xfce.org/show_bug.cgi?id=14443
> > > > > > [2] 
> > > > > > http://lists.openembedded.org/pipermail/openembedded-core/2018-November/275815.html
> > > > > > 
> > > > > > (From OE-Core rev:
> > > > > > 0911e7d2f5443210b594a198ada8465af7a2fc78)
> > > > > > 
> > > > > > Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
> > > > > > Signed-off-by: Richard Purdie <
> > > > > > richard.purdie@linuxfoundation.org>
> > > > > ping?
> > > > Something wrong with this bugfix?
> > > > 
> > > pingediping
> > Should write some auto-ping script..
> 
> correction.. its in thud proper. I didn't send a patch review nor pull
> request so I wasn't expecting it there.
> 
> https://git.openembedded.org/openembedded-core/commit/?h=thud&id=9c63433010aae6891149a7605a637bee879dc4ef

Sorry, somehow I was thinking I'd somehow missed a pull request and
that needed merging :/

Cheers,

Richard




