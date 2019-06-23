Return-Path: <ticotimo@gmail.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id BABA07CF7D
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Jun 2019 16:44:17 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id u13so472600iop.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Jun 2019 09:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=zZrSJTNQvK7UDbDDfc6CZflSeXreNPcMGRotUWaqQeQ=;
	b=f2D6mbza/VDrgn6xXSOGzlYPgHUA5aZhJA7Nw5VZV+XaX37BQZsCnvU1o2xZuncJ4P
	cyD9jicbfSSrg9mLwiPbbekFVZSaXST74hYTcAaWs2bQayXT1KDlOoODPvGcsoN4Pa1R
	G1O/2r/limHhi5k6yRJ2kAyF9wyBiCjt+MjpiboGGr6DyKgqNHbKaDthpTgWURK93tQl
	/Fyvlb2qRXHgsasUdi3tVRuFDWTgtHvdKF9IsYxBSDzyBTFcGnAhkA+fszXnD2k9JG4s
	0AuZfdo4/1XAGdmeT6mZct2uw6KdMaqGe0Q8pDpS2LzXMhORtY4TwKgzFS79B+zezNgP
	K5rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=zZrSJTNQvK7UDbDDfc6CZflSeXreNPcMGRotUWaqQeQ=;
	b=UjjW/zrF8NhVVjOtsXcHb1XChON2tG9Ws2WSH7GoBvqycWinTm/cSXAlQuJKbXQkjR
	2suB023M4BO5xY8mX54YEs08DZibj8PehkbpBlGFWZylEwJE+dPFQw3uXyCOm1pt1MJZ
	QPCnkyoXLpSkBqDJVqMSMzgxgIx+/OGockHiFiKqtxR7CM8KBPYjUrkSv+ImtevKt2VG
	4srqU7/3cQdSW4iIuvRssM6g7s14ucvpWW+I2zS5thaY3+Q3BHoQ9AQTOnaT75gW07ZI
	nBc3XC5x5MUO3YijJE8XZP7xvbq6In+1NVb32ny2dSSkqz4ah5M34YLqnLD8m2jAvj0Y
	/aCg==
X-Gm-Message-State: APjAAAVRUCjhSP0x1t4r5Dcs++lgKANHfsv3JYrbjzfiP0RSJWa00buy
	U6Bjs9lAbKzGCc6l6Wedfg+HfTpZCNgMQjO+hS4=
X-Google-Smtp-Source: APXvYqw37uxWTDc65PHmb2LzNBEXjRekGp4KvvIo/1eXcAycm+ufIkfCO9oEeRUWpdRWvYx3ciibgk5PppgTqdBpwu4=
X-Received: by 2002:a5e:9241:: with SMTP id z1mr11978965iop.39.1561308258665; 
	Sun, 23 Jun 2019 09:44:18 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1559950879.git.timothy.t.orling@linux.intel.com>
	<0f5adba2f96da9396faa1e70f9eed84118cf735e.1559950879.git.timothy.t.orling@linux.intel.com>
	<CAMKF1sq5aOZ+6CSP+G88+JCYd4zMb6ZSe5MP5KWSSofPRbe4Ow@mail.gmail.com>
	<CANx9H-DLg1_vSEi1bBSSLCmycdyEa2MiJjZ9d=Owsc5bsR-GBA@mail.gmail.com>
	<CAMKF1sr+Ffk0nCd3aVhGfsdRreFX7cpqEAqH8606LMqg=-ijww@mail.gmail.com>
	<20190622085840.GB9472@localhost>
	<CAMKF1sq7AwbG_pM3sivhvQjaJ_mwR6R-GDEv5J23rpEYjsMT2Q@mail.gmail.com>
In-Reply-To: <CAMKF1sq7AwbG_pM3sivhvQjaJ_mwR6R-GDEv5J23rpEYjsMT2Q@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Sun, 23 Jun 2019 09:44:07 -0700
Message-ID: <CANx9H-C63ech2pPxYwirWJRE4-p9uQTA0zcBAzepYK0L4mth0Q@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, Adrian Bunk <bunk@stusta.de>
Subject: Re: [PATCH 2/4] scons.bbclass: use python3-scons
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
X-List-Received-Date: Sun, 23 Jun 2019 16:44:17 -0000
Content-Type: multipart/alternative; boundary="000000000000248b0c058c00683e"

--000000000000248b0c058c00683e
Content-Type: text/plain; charset="UTF-8"

On Sat, Jun 22, 2019 at 5:03 PM Khem Raj <raj.khem@gmail.com> wrote:

>
>
> On Sat, Jun 22, 2019 at 1:58 AM Adrian Bunk <bunk@stusta.de> wrote:
>
>> On Thu, Jun 20, 2019 at 09:27:15PM -0600, Khem Raj wrote:
>> > On Thu, Jun 20, 2019 at 6:18 PM Tim Orling <ticotimo@gmail.com> wrote:
>> >...
>> > > Latest mongo release appears to be 4.3.0 and appears to support
>> python3:
>> > >
>> > >
>> > >
>> https://github.com/mongodb/mongo/blob/89e7419a897b2270931c9c029abf6de555d83e0f/SConstruct
>> > >
>> > > Is this an aceptable upgrade? I am not savvy on which versions are
>> > > desirable.
>> >
>> > Yes for master this upgrade is fine
>>
>> Are you approving the changed licence for OE,
>> or were you not aware that this was the question?
>>
>
> What has changed between 4.0.6 and 4.3.0 w.r.t. licensing ?
>

The Server Side License is already in 4.0.6
https://github.com/mongodb/mongo/blob/caa42a1f75a56c7643d0b68d3880444375ec42e3/LICENSE-Community.txt

4.2.0+ use python 3 in SConstruct


>
>> cu
>> Adrian
>>
>> --
>>
>>        "Is there not promise of rain?" Ling Tan asked suddenly out
>>         of the darkness. There had been need of rain for many days.
>>        "Only a promise," Lao Er said.
>>                                        Pearl S. Buck - Dragon Seed
>>
>>

--000000000000248b0c058c00683e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sat, Jun 22, 2019 at 5:03 PM Khem Raj &lt;<a href=3D"mai=
lto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex"><div><br></div><div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Sat, Jun 22, 2019 at 1:58 AM Adrian=
 Bunk &lt;<a href=3D"mailto:bunk@stusta.de" target=3D"_blank">bunk@stusta.d=
e</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Thu, Jun 20, 20=
19 at 09:27:15PM -0600, Khem Raj wrote:<br>
&gt; On Thu, Jun 20, 2019 at 6:18 PM Tim Orling &lt;<a href=3D"mailto:ticot=
imo@gmail.com" target=3D"_blank">ticotimo@gmail.com</a>&gt; wrote:<br>
&gt;...<br>
&gt; &gt; Latest mongo release appears to be 4.3.0 and appears to support p=
ython3:<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; <a href=3D"https://github.com/mongodb/mongo/blob/89e7419a897b2270=
931c9c029abf6de555d83e0f/SConstruct" rel=3D"noreferrer" target=3D"_blank">h=
ttps://github.com/mongodb/mongo/blob/89e7419a897b2270931c9c029abf6de555d83e=
0f/SConstruct</a><br>
&gt; &gt;<br>
&gt; &gt; Is this an aceptable upgrade? I am not savvy on which versions ar=
e<br>
&gt; &gt; desirable.<br>
&gt;<br>
&gt; Yes for master this upgrade is fine<br>
<br>
Are you approving the changed licence for OE,<br>
or were you not aware that this was the question?<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">What has changed=
 between 4.0.6 and 4.3.0 w.r.t. licensing ?</div></div></div><div><div clas=
s=3D"gmail_quote"><div dir=3D"auto"></div></div></div></blockquote><div dir=
=3D"auto"><br></div><div dir=3D"auto">The Server Side License is already in=
 4.0.6</div><div dir=3D"auto"><div><a href=3D"https://github.com/mongodb/mo=
ngo/blob/caa42a1f75a56c7643d0b68d3880444375ec42e3/LICENSE-Community.txt">ht=
tps://github.com/mongodb/mongo/blob/caa42a1f75a56c7643d0b68d3880444375ec42e=
3/LICENSE-Community.txt</a></div><br></div><div dir=3D"auto">4.2.0+ use pyt=
hon 3 in SConstruct</div><div dir=3D"auto"><br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex"><div><div class=3D"gmail_quote"><div dir=3D"auto"><br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex"><br>
cu<br>
Adrian<br>
<br>
-- <br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Is there not promise of rain?&quot; Ling T=
an asked suddenly out<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 of the darkness. There had been need of rain fo=
r many days.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Only a promise,&quot; Lao Er said.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Pearl S. =
Buck - Dragon Seed<br>
<br>
</blockquote></div></div>
</blockquote></div></div>

--000000000000248b0c058c00683e--
