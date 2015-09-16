Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f176.google.com (mail-ig0-f176.google.com
	[209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id 6CCF876DF8;
	Wed, 16 Sep 2015 21:19:18 +0000 (UTC)
Received: by igbkq10 with SMTP id kq10so43135706igb.0;
	Wed, 16 Sep 2015 14:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=wjupv6rly1My0gBZK6mt8hKi85RlH/ykbYLRtTAwCv0=;
	b=VWaHWbnEFSV/bjwENMd3tKQ7dElB6hI9/aJDSgF7J2Aoju95HMzZKtpegJ2rIoFRF8
	wbXpjfIcmdzkZ9EzNCqIZEH23siuOjdxSs2tB6j1RpV+QbJ0ZD8fqnKK/7zPvqa2J4I8
	IkgpEvv9lPXOc0o4AHBAD7X3x3j79c35aYgQcRc3byeAWVECQyRDLPIwNwUlzTPON8Aa
	VLUXTqWjKEXRv072H3P9g6H+J2ubIUQ4n2ONRZ1cq9DdSJxG/8/QXVRiOji/KKpTZso+
	nahEDo0ovpTn/NfTUdhPV0T0YQLgM97beIA3w+XXiY+tP44HeIRlMdURGCKDy2n/wlTk
	9tjQ==
X-Received: by 10.50.85.20 with SMTP id d20mr445861igz.77.1442438359368; Wed,
	16 Sep 2015 14:19:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.142.130 with HTTP; Wed, 16 Sep 2015 14:18:50 -0700 (PDT)
In-Reply-To: <CALbNGRR=LAdpubkJGdfx=mx5FGiVW=YDTObwRN8JLAnSfiPc=g@mail.gmail.com>
References: <cover.1441929533.git.raj.khem@gmail.com>
	<e4c70967dd05d254bd59bd4f8a49836c3d499bfb.1441929533.git.raj.khem@gmail.com>
	<80e3806f09d6c399ccd4ccdf5f83997386ec85bc.1441929533.git.raj.khem@gmail.com>
	<CALbNGRR=LAdpubkJGdfx=mx5FGiVW=YDTObwRN8JLAnSfiPc=g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 16 Sep 2015 14:18:50 -0700
Message-ID: <CAMKF1so4a85NDgwLOL1RYHyXQTQcAdHJ9FM7yhaJbrnpTzdx0g@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2 2/3] systemd: Upgrade 219 -> 225
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
X-List-Received-Date: Wed, 16 Sep 2015 21:19:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2015 at 2:17 PM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> Is anybody preparing patches for gudev (many packets in meta-oe require i=
t)?
>
> If not I can do so. Is the home for libgudev oe-core or better meta-oe?

meta-oe is better for now. I am not working on it.

