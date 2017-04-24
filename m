Return-Path: <minipada@gmail.com>
Received: from mail-vk0-f43.google.com (mail-vk0-f43.google.com
	[209.85.213.43])
	by mail.openembedded.org (Postfix) with ESMTP id 040FC779F9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Apr 2017 14:29:20 +0000 (UTC)
Received: by mail-vk0-f43.google.com with SMTP id k4so37069269vki.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Apr 2017 07:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=BvcB5S8ruML1aDOA/xeoK0X7NMckFiI22qT2zJs0EWk=;
	b=pRgrlw644CQiYBn+75iSV6glBI2toNxdeVmh9cA1eKqwgOs95nPbJtOMc4VlcUcfj/
	KwpdQYkDmSM+S349Z+zjXGdxpiqE4ZkXUrUXKwwJAFC4FTWGUuKGF79+Wa39t1seQoJO
	sprDup3PVEd3uSibHm//gfRgC44F16lALO8UJZGKnKV4un6xMpsxFF/d61Hd/m3Qsfs6
	+NJuM/3lOFyQkafK4n0Zlm8k5hr3RLI5lxiXY8cxcYxvx0LPq3i42TFEIC7Gwca9hJt+
	X9JPaWF0W+jk7nTQLpwWSRLIO8w+seTOY9iAmrUBieZyn2Cih/kZGCpO134FOdZpTPnG
	oPPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=BvcB5S8ruML1aDOA/xeoK0X7NMckFiI22qT2zJs0EWk=;
	b=fDRQYgHLtrVVvKMZjnUFhooNE4JtgUHz8NK/kBPXKmunM8cYmKvQeFGL3igbDGUtXB
	npKYnKDe33I2I8TvIGIa457KIkF+GrenkgldhoQ0yL8J5HyivGDwZQ0HujY3qYB/H3VS
	fkhkX48V6cj7kaXvm8KP+xF/XwvVrhtANVbf+9NZVJzTnHaLXkKNnuptggQ8pIcePeJ6
	VGHyGImERPoYjwf2LNInDjE6ArAgXYuw7534IALY1Vt29X9XV0hbQbNvQn7GrtRfMU2U
	CifmYJ9JuVMpT6vAc3JDDe3pYg5SZhtPiz0ubym6ZIoYnZyqpliAhAp25ZyeXwwrVW+o
	ovGQ==
X-Gm-Message-State: AN3rC/77OABL8Byz2JrlPxlNiLemcTPTl1y+yyyIx+tUwkHEQsOhjaNC
	aaBo/tRdMFYILWaVbU6s0uZXbRqTmQ==
X-Received: by 10.31.195.5 with SMTP id t5mr2944301vkf.77.1493044161767; Mon,
	24 Apr 2017 07:29:21 -0700 (PDT)
MIME-Version: 1.0
References: <CALxi_JEEcpVbqSuaUbqd-GrNw7jdn2JU196tofw3jYHtowhMGw@mail.gmail.com>
	<CAJTo0LbK23V+To_EhP_jOT89a5Uz+TPSqaiCax-tGXz5HyZ2qg@mail.gmail.com>
In-Reply-To: <CAJTo0LbK23V+To_EhP_jOT89a5Uz+TPSqaiCax-tGXz5HyZ2qg@mail.gmail.com>
From: david bensoussan <minipada@gmail.com>
Date: Mon, 24 Apr 2017 14:29:11 +0000
Message-ID: <CALxi_JE_6qJVza0p825Ooe3YgZn89af3Cuxbpp0g=TydJtgOpA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Add LAPACK/ATLAS/BLAS library to OE-CORE
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
X-List-Received-Date: Mon, 24 Apr 2017 14:29:21 -0000
Content-Type: multipart/alternative; boundary=001a114e6ac4e570a4054dea6ea0

--001a114e6ac4e570a4054dea6ea0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

I'm going to make some tests if it's possible and if performance is good
doing so. If not, from what I understand, the PR will probably be refused?

Le lun. 24 avr. 2017 =C3=A0 16:18, Burton, Ross <ross.burton@intel.com> a =
=C3=A9crit :

>
> On 24 April 2017 at 14:36, david bensoussan <minipada@gmail.com> wrote:
>
>> What do you think of this? Should I go for it this way?
>>
>
> That's probably the only way of making it work in the short term, but I
> wouldn't recommend attempting to merge the recipes into oe-core as they'r=
e
> not general purpose enough.
>
> You'd be better off convincing them to allow cross-compilation: unless
> they've got a really weird setup just allowing the user to tell it what t=
he
> target architecture is and skipping the probing should work.
>
> Ross
>
--=20

*David bensoussan*
Roboticist / Embedded Software Engineer
------------------------------

*Synapticon* | Robotic Control Systems
Mobile: 004915779804515 / 0033659971070

--001a114e6ac4e570a4054dea6ea0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;m going to make some tests if it&#39;s possible and =
if performance is good doing so. If not, from what I understand, the PR wil=
l probably be refused?</div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
>Le=C2=A0lun. 24 avr. 2017 =C3=A0=C2=A016:18, Burton, Ross &lt;<a href=3D"m=
ailto:ross.burton@intel.com">ross.burton@intel.com</a>&gt; a =C3=A9crit=C2=
=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div class=3D=
"gmail_extra"><br><div class=3D"gmail_quote">On 24 April 2017 at 14:36, dav=
id bensoussan <span dir=3D"ltr">&lt;<a href=3D"mailto:minipada@gmail.com" t=
arget=3D"_blank">minipada@gmail.com</a>&gt;</span> wrote:<br><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex"><div>What do you think of this? Should I go for it this wa=
y?<br></div></blockquote></div><br></div></div><div dir=3D"ltr"><div class=
=3D"gmail_extra">That&#39;s probably the only way of making it work in the =
short term, but I wouldn&#39;t recommend attempting to merge the recipes in=
to oe-core as they&#39;re not general purpose enough.</div><div class=3D"gm=
ail_extra"><br></div><div class=3D"gmail_extra">You&#39;d be better off con=
vincing them to allow cross-compilation: unless they&#39;ve got a really we=
ird setup just allowing the user to tell it what the target architecture is=
 and skipping the probing should work.</div></div><div dir=3D"ltr"><div cla=
ss=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div></b=
lockquote></div><div dir=3D"ltr">-- <br></div><div data-smartmail=3D"gmail_=
signature"><div dir=3D"ltr"><p id=3D"inbox-inbox-inbox-inbox-inbox-person-n=
ame" style=3D"box-sizing:border-box;font-family:arial,helvetica,sans-serif;=
font-size:13.3333px;color:rgb(0,0,0);padding:0px;margin:1em 0px"><strong st=
yle=3D"box-sizing:border-box">David bensoussan</strong><br style=3D"box-siz=
ing:border-box">Roboticist / Embedded Software Engineer</p><hr style=3D"box=
-sizing:border-box;margin:0px;padding:0px;height:1px;background:rgb(229,27,=
65);border:none;color:rgb(17,17,17);font-family:arial,helvetica,sans-serif;=
font-size:13.3333px"><p id=3D"inbox-inbox-inbox-inbox-inbox-tag-line" style=
=3D"box-sizing:border-box;font-family:arial,helvetica,sans-serif;font-size:=
12pt;color:rgb(0,0,0);padding:0px;margin:1em 0px"><strong style=3D"box-sizi=
ng:border-box">Synapticon</strong><span class=3D"inbox-inbox-inbox-inbox-in=
box-Apple-converted-space">=C2=A0</span>| Robotic Control Systems</p><table=
 cellpadding=3D"0" cellspacing=3D"0" style=3D"box-sizing:border-box;font-fa=
mily:arial,helvetica,sans-serif;font-size:13.3333px;color:rgb(17,17,17);pad=
ding:0px"><tbody style=3D"box-sizing:border-box"><tr style=3D"box-sizing:bo=
rder-box"><td style=3D"box-sizing:border-box;color:rgb(0,0,0);padding:0px 1=
5px 3px 0px">Mobile:</td><td style=3D"box-sizing:border-box;color:rgb(0,0,0=
);padding:0px 15px 3px 0px">004915779804515 / 0033659971070<br></td></tr><t=
r style=3D"box-sizing:border-box"><td style=3D"box-sizing:border-box;color:=
rgb(0,0,0);padding:0px 15px 3px 0px"><br></td><td style=3D"box-sizing:borde=
r-box;color:rgb(0,0,0);padding:0px 15px 3px 0px"><br></td></tr></tbody></ta=
ble></div></div>

--001a114e6ac4e570a4054dea6ea0--
