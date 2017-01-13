Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 1DE9A71D9E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2017 14:29:51 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id n13so6386391qtc.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2017 06:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=u4+sPUg4GEAO4NrMzamRuf4UQzl+qIzGbzwm+PPc2VA=;
	b=CiSOy3tzGfWyr5yr8YcqNUmGOynYz/cQFsVdmo5GysYoXPzDo4EmNZJgKnVVuRumYv
	1A9mRZ6Ry3Ip7Ot8ysGapJAK6rdwVSAwqNC63ALa3HfSYAvkS054EPnjkxTaE5WGItR7
	qdggIpP2vmIe2WvchlwN6H0fwf27pCyciEgPnwc6pGmgxXqwzhIdrTWXCX9ecO/T9rJc
	YAQKZ4BV4lq/wd0FnPOzbZjIWZML4ywRVkK4JrEhrRkUMYo+AVOjGoXPpnp0eTAtXysN
	uGpErxAfq3y7Z5+lqLu9YlcC63CubnYPWTeaHgvgwmXfYvcj4yJDza992LFR/729vUx5
	9fBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=u4+sPUg4GEAO4NrMzamRuf4UQzl+qIzGbzwm+PPc2VA=;
	b=O44zUd7AcAYxUAk34FEho9PC66Jauo26UBTx2MGRQ4M3cuXv1bxW+yt9v0Lx8E0wUw
	AlAr4U6OSak0Iu8ybD0T6Fw1Z+kmvZaTqTyKGHrq4t+PB99aIjHFpd6Y37etVUVHGZdO
	SNch6zpnqR8+k4QF7frydoi4G/BGXjKI+2rSaLtU3dAHaZlPu2tl/jTP5vs9MGObbyd3
	ZifbdtpJepP/RXIkDbDeBkGWAUt2MDvz0awpp2VuRjStFTdckkzOet8+QiYiGb0wDNO6
	aFIldwKE6GZ/tM4FO6I9mV5ogIwieWYoz83H25sMa1x8E67sJvKQKpopFqYzhm+2rWng
	W+aA==
X-Gm-Message-State: AIkVDXKLLFOrcVnx1/smMVQK6kdx3iClPw5DzIAwWZ2QYy8apHkBdaMrgjVEMa8m+Xfw8uhGMnEl7Ngkt4s4vQ==
X-Received: by 10.237.38.65 with SMTP id z59mr12170097qtc.5.1484317791942;
	Fri, 13 Jan 2017 06:29:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.135.153 with HTTP; Fri, 13 Jan 2017 06:29:51 -0800 (PST)
In-Reply-To: <CAJTo0LZcdu=N99Brb5zocN9w2cROjDU6dgT-1HwXvkJKpxe6cw@mail.gmail.com>
References: <cover.1484312322.git.ross.burton@intel.com>
	<CADkTA4NpPn78=SB+b2zO=Vd8z2SG+BtBLQi1ciKjXyEruoQ1rQ@mail.gmail.com>
	<CAHiDW_Fs4B1B2qzqsJqVdVuEZa40boKH8zGnON04W7L8=bfgSA@mail.gmail.com>
	<CADkTA4O0vhL8k+nvvwMsyBGt-YToan0KiSpMtSYOh+Qkwms6SQ@mail.gmail.com>
	<CAJTo0LZcdu=N99Brb5zocN9w2cROjDU6dgT-1HwXvkJKpxe6cw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 13 Jan 2017 09:29:51 -0500
Message-ID: <CADkTA4NHXZK++UGx+1q5+exqpiC73WJ4WxyT-6GhTEitiPsyPg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/80] Consolidated pull
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
X-List-Received-Date: Fri, 13 Jan 2017 14:29:52 -0000
Content-Type: multipart/alternative; boundary=94eb2c122e58b918e10545faaaa7

--94eb2c122e58b918e10545faaaa7
Content-Type: text/plain; charset=UTF-8

On Fri, Jan 13, 2017 at 9:25 AM, Burton, Ross <ross.burton@intel.com> wrote:

>
> On 13 January 2017 at 14:19, Bruce Ashfield <bruce.ashfield@gmail.com>
> wrote:
>
>> I'm not much good with musl unfortunately, but honestly, I'm wondering
>> how long we
>> can keep this out with relatively few build issues. In tree, they'll get
>> more attention.
>>
>
> This is a greater problem - the kernel guys seem to think that glibc is
> the only C library worth thinking about.  Khem took the action to talk with
> musl and get their headers fixed - which I believe is just adding a new
> #define to them.
>

And gcc is the only compiler! ;)

FWIW I spent 6 hours over the holidays trying to fix a musl build error,
but I have no
idea how its defines work, so all I did figure out is what kernel commit
broke it  ... to
be fair, glibc is just as nuts and it the uapi headers break it, I'm just
as lost.


>
> I'll continue stacking on 4.9 changes until they get sorted out.  I'll
>> probably have some
>> cycles near the end of next week to get lost in c library #ifdef's, if
>> the issues are still
>> around.
>>
>
> I keep on pushing the kernel bits to mut2, so feel free to send an updated
> branch and I can merge that in too.
>

ok. So I'll repost the series over the weekend with more -stable, -rt and
tools tweaks. It will
overlap the old one .. if that causes a problem, let me know now, and I'll
try and make sure
it starts where the other left off instead.

Bruce


>
> Ross
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--94eb2c122e58b918e10545faaaa7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Fri, Jan 13, 2017 at 9:25 AM, Burton, Ross <span dir=3D"ltr">&lt;<a =
href=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.c=
om</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"=
><div class=3D"gmail_extra"><br><div class=3D"gmail_quote"><span class=3D""=
>On 13 January 2017 at 14:19, Bruce Ashfield <span dir=3D"ltr">&lt;<a href=
=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div>I&#39;m n=
ot much good with musl unfortunately, but honestly, I&#39;m wondering how l=
ong we<br></div><div>can keep this out with relatively few build issues. In=
 tree, they&#39;ll get more attention.</div></blockquote><div><br></div></s=
pan><div>This is a greater problem - the kernel guys seem to think that gli=
bc is the only C library worth thinking about.=C2=A0 Khem took the action t=
o talk with musl and get their headers fixed - which I believe is just addi=
ng a new #define to them.</div></div></div></div></blockquote><div><br></di=
v><div>And gcc is the only compiler! ;)<br><br></div><div>FWIW I spent 6 ho=
urs over the holidays trying to fix a musl build error, but I have no<br></=
div><div>idea how its defines work, so all I did figure out is what kernel =
commit broke it=C2=A0 ... to<br>be fair, glibc is just as nuts and it the u=
api headers break it, I&#39;m just as lost.<br></div><div>=C2=A0</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra"><div =
class=3D"gmail_quote"><span class=3D""><div><br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex"><div>I&#39;ll continue stacking on 4.9 changes until they get sor=
ted out.=C2=A0 I&#39;ll probably have some<br></div><div>cycles near the en=
d of next week to get lost in c library #ifdef&#39;s, if the issues are sti=
ll<br></div><div>around.</div></blockquote></span></div><br></div><div clas=
s=3D"gmail_extra">I keep on pushing the kernel bits to mut2, so feel free t=
o send an updated branch and I can merge that in too.</div></div></blockquo=
te><div><br></div><div>ok. So I&#39;ll repost the series over the weekend w=
ith more -stable, -rt and tools tweaks. It will<br></div><div>overlap the o=
ld one .. if that causes a problem, let me know now, and I&#39;ll try and m=
ake sure<br></div><div>it starts where the other left off instead.<br><br><=
/div><div>Bruce<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><d=
iv dir=3D"ltr"><span class=3D"HOEnZb"><font color=3D"#888888"><div class=3D=
"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></font></span>=
</div>
</blockquote></div><br><br clear=3D"all"><br>-- <br><div class=3D"gmail_sig=
nature" data-smartmail=3D"gmail_signature">&quot;Thou shalt not follow the =
NULL pointer, for chaos and madness await thee at its end&quot;</div>
</div></div>

--94eb2c122e58b918e10545faaaa7--
