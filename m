Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f47.google.com (mail-qg0-f47.google.com
	[209.85.192.47])
	by mail.openembedded.org (Postfix) with ESMTP id D7C8562252
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Nov 2014 16:08:40 +0000 (UTC)
Received: by mail-qg0-f47.google.com with SMTP id j107so9012410qga.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Nov 2014 08:08:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=q3D87FQHNHtP/BvFuxL298XHfX5E7/eP+/r7bGu29PY=;
	b=iook9ufMUqPNwBacCWtrkx3zMwrmQ4H9XbDNu+zRO20C1C1fkmMcTGINOu/b8GK20G
	N4pwEcsi08QBhHZWoZBlN+4iebzWATd3/M66XmUR1tEu2sNxb4oxsfBwTqZaBzm9TXNz
	dppBu4pTf8LrOSRhgJJJNm0UhAA9/g1sM4j0eF91H8jv2UL72ZW1MIF4JKXighUmQdGF
	Z+v465hUuU+D5SvP4ylzHlpyaUShoNEckOpuKmAO7HCR9MFKNlf6GCTzdp3D8VAsrHTi
	Oka6PqwIjO3quW7/AvyupHl92Nc0og/zg2F6+x20rhQ2qNtHZGNjj7bkIIp7Da83+ICb
	nXRQ==
X-Gm-Message-State: ALoCoQnMEKg2LlD6CS4IR/J6Ttj4n75Dah4mcA3irP9TTs9IOlS627cfTOcsfg3+oclRWyfTCvCM
X-Received: by 10.224.138.2 with SMTP id y2mr58640094qat.52.1415808520464;
	Wed, 12 Nov 2014 08:08:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.98.213 with HTTP; Wed, 12 Nov 2014 08:08:20 -0800 (PST)
In-Reply-To: <1415755840-4750-1-git-send-email-dev@codyps.com>
References: <1415755840-4750-1-git-send-email-dev@codyps.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 12 Nov 2014 16:08:20 +0000
Message-ID: <CAJTo0LaP0B2G7zFYqpaqyQOHVfoX2FWGxzSRLuG4zmuDZWjtTg@mail.gmail.com>
To: Cody P Schafer <dev@codyps.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cmake: supply CMAKE_AR in toolchain file
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
X-List-Received-Date: Wed, 12 Nov 2014 16:08:45 -0000
Content-Type: multipart/alternative; boundary=047d7b6709c3eec0110507ab9b4d

--047d7b6709c3eec0110507ab9b4d
Content-Type: text/plain; charset=UTF-8

On 12 November 2014 01:30, Cody P Schafer <dev@codyps.com> wrote:

> +set( CMAKE_AR ${OECMAKE_AR} CACHE FILEPATH "Archiver" )
>

Curious - why does this line have CACHE FILEPATH "Archiver" when e.g.
CMAKE_C_COMPILER doesn't?  Should one or other other be fixed?

Ross

--047d7b6709c3eec0110507ab9b4d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 12 November 2014 01:30, Cody P Schafer <span dir=3D"ltr">&lt;<a href=3D"=
mailto:dev@codyps.com" target=3D"_blank">dev@codyps.com</a>&gt;</span> wrot=
e:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex"><div id=3D":3lv" class=3D"a3s" style=
=3D"overflow:hidden">+set( CMAKE_AR ${OECMAKE_AR} CACHE FILEPATH &quot;Arch=
iver&quot; )<br></div></blockquote></div><br>Curious - why does this line h=
ave CACHE FILEPATH &quot;Archiver&quot; when e.g. CMAKE_C_COMPILER doesn&#3=
9;t?=C2=A0 Should one or other other be fixed?</div><div class=3D"gmail_ext=
ra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--047d7b6709c3eec0110507ab9b4d--
