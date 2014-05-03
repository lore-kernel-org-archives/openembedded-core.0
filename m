Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f41.google.com (mail-yh0-f41.google.com
	[209.85.213.41])
	by mail.openembedded.org (Postfix) with ESMTP id 62B4460167
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 May 2014 13:11:13 +0000 (UTC)
Received: by mail-yh0-f41.google.com with SMTP id i57so5172718yha.14
	for <openembedded-core@lists.openembedded.org>;
	Sat, 03 May 2014 06:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=dbJlWEbJPzhh40p2bny36uLkqZtFJ9H4OZEB/zT7kTY=;
	b=nLlH7S5ZBQHXPxhhYSd4BmDrZVi9PpHcP9nS4wh9SpXIo25Hxp2bL9zBhWunLfg8Np
	F5f9owVWX/+W+RsZeBubUUoljtMID6B+GkeF+kkFwnOx/GGu2Mgm1y0zUnjGKRryZJ2v
	dfMlYDDGDy8yVndY5uzp4hGu72AWwN7IGjXC2bKDieZiiKL0uJMi/ljFFKuoPBvEXMpl
	4JkZXPz9ccodI79ihxhUGNo3xiXwHfqdmMqEvZXj3KnfYtENUo2tBB+HaInThv0dHrls
	AMZlMcrz7xMGYrbC79sHglcjx8wo4nCzHUPoPLPcCanak5+vAkTxh8tsqYFEb3pZx/nN
	1Ytw==
MIME-Version: 1.0
X-Received: by 10.236.230.41 with SMTP id i39mr31920591yhq.14.1399122674759;
	Sat, 03 May 2014 06:11:14 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.166.132 with HTTP; Sat, 3 May 2014 06:11:14 -0700 (PDT)
In-Reply-To: <CALmOhgm4=Gw=yE2SRc7YS5ZvH+oyrP=g3fSiDPyT50X5CZQxLQ@mail.gmail.com>
References: <535F3FFD.1080403@hostmobility.com>
	<535F4513.20407@hostmobility.com> <1398873268.16672.529.camel@ted>
	<CANyK_8c_-UdtF6ZqHLvQcs_JJ9PGjP+wP0dJGH_3imkn4n4h4w@mail.gmail.com>
	<CALmOhgm4=Gw=yE2SRc7YS5ZvH+oyrP=g3fSiDPyT50X5CZQxLQ@mail.gmail.com>
Date: Sat, 3 May 2014 10:11:14 -0300
X-Google-Sender-Auth: ndwh38P_qx0P0PC80ssDb1rxcnM
Message-ID: <CAP9ODKpYopNO9bJ_BCOxY8aYmrH=3sTAj=c29XhrupcDGJVc7Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Trevor Woerner <trevor.woerner@linaro.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: quilt-native fails on tar version 1.27.1
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
X-List-Received-Date: Sat, 03 May 2014 13:11:15 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, May 3, 2014 at 12:23 AM, Trevor Woerner
<trevor.woerner@linaro.org> wrote:
> On 30 April 2014 13:57, Paul Barker <paul@paulbarker.me.uk> wrote:
>> If you can't find
>> a good guide online on how to set this up, let me know and I'll write
>> up a blog post of how I did it.
>
> I'd be interested in reading this, if you wrote it up. Which container
> technology did you use?

LXC is nice for it. In Debian/Ubuntu there is also schroot which is
nice for developers as you can allow ordinary users to 'change' to a
chroot.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

