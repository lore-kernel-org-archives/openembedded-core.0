Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f48.google.com (mail-qg0-f48.google.com
	[209.85.192.48])
	by mail.openembedded.org (Postfix) with ESMTP id A3C1F73991
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Mar 2015 20:02:42 +0000 (UTC)
Received: by qgdz60 with SMTP id z60so31447379qgd.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Mar 2015 13:02:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=TULsL0t111x8AcQe5HBoPm/WgjsogFF2uQVtrLXFhOc=;
	b=jysdf0EoYuvK4L1+gksqu/T49bVeh5ccSwjpVXO5JB8kUDuYdPeBPCHmgHULKgQJ75
	QOTsJZ4Z61GpqtvB3pDU1FooOYnvt5bR+3FahmXKkDrzIiznK3+iZ71z93n1TNB1T9+m
	Tb/FnxV2PL3LKZnfk/UJhr+GXzcqnvA3fnUOIaCiT7HbRwN1QX99Ct5mOLDwxcu/Uz59
	FqBiNAi+xZP5FXsx3tQpk/sDDWpzdU4LKCajMBjDhdN/Z20ULG72czFqOd4hT5OMFs2s
	sGXOtTuCNNbOynqIOszClR1WvDQxzKdvGA+NiGyN15iOEejGg62qY2xu6x6B5KC6sGsN
	/Zpw==
X-Gm-Message-State: ALoCoQnlFrU7hm2kECcMqXbWBQ1rpnyuD9V3hJ5pOc4fruVraXNBK+kWUKRZ/UlRhzv2OGOjrJOS
X-Received: by 10.55.55.15 with SMTP id e15mr58247543qka.21.1425931364027;
	Mon, 09 Mar 2015 13:02:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.203 with HTTP; Mon, 9 Mar 2015 13:02:23 -0700 (PDT)
In-Reply-To: <54FDE3DB.6080803@topic.nl>
References: <54F9E933.9070508@topic.nl>
	<CAJTo0LaCP4mqxdKEnd-mB3sTGCC8PhbkYQgz-kdc9NoLceGMyQ@mail.gmail.com>
	<CAJTo0LamzLa+FE0oEejxfW838HWpURUZquyG=f9KoToEY8Gkuw@mail.gmail.com>
	<54FDE3DB.6080803@topic.nl>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 9 Mar 2015 20:02:23 +0000
Message-ID: <CAJTo0LYTABVigsJ4+0_FNgOYdjhgcrGG=hhuK5p1qGdgRi61Sw@mail.gmail.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: gst-ffmpeg is broken since the libav-9 introduction
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
X-List-Received-Date: Mon, 09 Mar 2015 20:02:43 -0000
Content-Type: multipart/alternative; boundary=001a1146f1ca6d82fe0510e08435

--001a1146f1ca6d82fe0510e08435
Content-Type: text/plain; charset=UTF-8

On 9 March 2015 at 18:18, Mike Looijmans <mike.looijmans@topic.nl> wrote:

> It works, and we're stuck with vendors providing no support for 1.x, and
> we've been trying to get the 1.x version integrated but that's a rather big
> task and the total lack of decent "how to migrate from 0.1 to 1.x" guides
> isn't doing much to speed that up either.
>

That's just depressing.  0.10 has been unmaintained for *ages* and I'd have
hoped that BSP providers would have upped their game somewhat.

Ross

--001a1146f1ca6d82fe0510e08435
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 9 March 2015 at 18:18, Mike Looijmans <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:mike.looijmans@topic.nl" target=3D"_blank">mike.looijmans@topic.nl</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div style=3D"overflo=
w:hidden">It works, and we&#39;re stuck with vendors providing no support f=
or 1.x, and we&#39;ve been trying to get the 1.x version integrated but tha=
t&#39;s a rather big task and the total lack of decent &quot;how to migrate=
 from 0.1 to 1.x&quot; guides isn&#39;t doing much to speed that up either.=
<br></div></blockquote></div><br>That&#39;s just depressing. =C2=A00.10 has=
 been unmaintained for *ages* and I&#39;d have hoped that BSP providers wou=
ld have upped their game somewhat.</div><div class=3D"gmail_extra"><br></di=
v><div class=3D"gmail_extra">Ross</div></div>

--001a1146f1ca6d82fe0510e08435--
