Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id 66CA973710
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 22:52:38 +0000 (UTC)
Received: by qkhu186 with SMTP id u186so216834159qkh.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 15:52:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=1e5xXpiENgqwWnI1c6n5ggnsmzhOuLqaWcWbTlygVPo=;
	b=V88xG2X9WfjliaBhrbCFQ6x09emPxTmnXcQSOblJKbOspo9cQHjwsXdUcayJ3G0kRd
	B9Vyr7Ri0GhXI6AC/Qv70L4emOOYRsbD8GLEFCHs3tc0fU8UWpG+t/N5ubV/3u26c90K
	5zJXLtl1IqkIMyEz/ZMVEZANjdww+THwFG4O33H+osRbY/cAh6Gw01m0HV5u0/S5RKEZ
	rOUikHcMlnLwO42RlDaNhjAttSA1uI4nRTNtulwyaRZ6iTOiK0WlPmdy2/pFW2CiMgjq
	xGsk+TC8nEQ63DH+Qq7U7ueXhyMfj4BafLjwo9QYn8Sa3jykYwMbOXBqQq47j5ZphSmU
	7PWg==
X-Gm-Message-State: ALoCoQlyrDSoK9WStSePrdhUEbeIRFIiyv8jmnyhiK4PMbzfeaQFyjSCWYIx2ab/iGEC9HklzD62
X-Received: by 10.140.88.5 with SMTP id s5mr36237284qgd.59.1436568759212; Fri,
	10 Jul 2015 15:52:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Fri, 10 Jul 2015 15:52:19 -0700 (PDT)
In-Reply-To: <A7F547A4-FD07-4674-8DAB-A09FA32921E3@gmail.com>
References: <A7F547A4-FD07-4674-8DAB-A09FA32921E3@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 10 Jul 2015 23:52:19 +0100
Message-ID: <CAJTo0LbJf+oDxvzQZztW9-Biz0zdLUXiWg3ks7KhVhXxGw5tZA@mail.gmail.com>
To: Jens Rehsack <rehsack@gmail.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Perl recipe fixes and some updates
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
X-List-Received-Date: Fri, 10 Jul 2015 22:52:41 -0000
Content-Type: multipart/alternative; boundary=001a11c1187496ab16051a8d3a92

--001a11c1187496ab16051a8d3a92
Content-Type: text/plain; charset=UTF-8

Hi Jens,

On 9 July 2015 at 17:22, Jens Rehsack <rehsack@gmail.com> wrote:

> With my client's update to fido I grabbed the tuit and did some patches:
> https://github.com/rehsack/poky/commits/fido
>

Can you rebase those onto master and send them to the list as attached
patches (i.e. git send-email)?

Cheers,
Ross

--001a11c1187496ab16051a8d3a92
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Hi Jens,</div><div class=3D"gma=
il_extra"><br><div class=3D"gmail_quote">On 9 July 2015 at 17:22, Jens Rehs=
ack <span dir=3D"ltr">&lt;<a href=3D"mailto:rehsack@gmail.com" target=3D"_b=
lank">rehsack@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex"><div id=3D":r3" class=3D"a3s" style=3D"overflow:hidden">With my client=
&#39;s update to fido I grabbed the tuit and did some patches: <a href=3D"h=
ttps://github.com/rehsack/poky/commits/fido" rel=3D"noreferrer" target=3D"_=
blank">https://github.com/rehsack/poky/commits/fido</a></div></blockquote><=
/div><br>Can you rebase those onto master and send them to the list as atta=
ched patches (i.e. git send-email)?</div><div class=3D"gmail_extra"><br></d=
iv><div class=3D"gmail_extra">Cheers,</div><div class=3D"gmail_extra">Ross<=
/div></div>

--001a11c1187496ab16051a8d3a92--
