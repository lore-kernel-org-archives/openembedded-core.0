Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 373D56FF69
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2016 12:36:43 +0000 (UTC)
Received: by mail-io0-f174.google.com with SMTP id j37so22772707ioo.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2016 05:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=2LPJTlCIQpgNgQGOjXb1XBR9H5POYGlbfGJMF38X1YY=;
	b=fy9LhOvmcwpoAnk6oXU1iw4id+ChliTeJ/rSzMoH5dI6CVTiS0aO0COUonTIsm3J7m
	zK+N51LgiiY3C2xaCf1suJC6t3nyBbHXSLm9OodWmCGRMWZJ5b8GQoKtjgNT5cbfBe3A
	p550T1e/xIwifsDo/B1fMKnhe4zPHyUJtcHCKYCmtQqqS92krbsfo7DY8E+riuPRehmS
	OxGxO7qD2M112QH4BX1L6zXej5aoR5hpbEN6KjHTZh2dh/kwuCBuqMnaaPSEoWbuGZg9
	4s+QXAOTW4xn8hcaxRtEOLhzWr0JPnni252ZEejxGATcsE4xt6ZtBi03Zce2j0jWwLF8
	1k7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=2LPJTlCIQpgNgQGOjXb1XBR9H5POYGlbfGJMF38X1YY=;
	b=bebAEYAWuZhDJWGelk6OPJj5rt/KJWLdpUoeqD8AvJEfVkdILoeS9N5TL5MRhQqJes
	9inNzjV52Bs5POFk9Y01Vb6sUUwyIGrcnYRNP0RlyiWqj856+9eWWYVibBLl42qo/p5m
	g99re3eG1SZ0WSU4OJKlka8C4Rq7M19lWZ5zW8BIO4HLws8vV5INMiECNTD+I1awdM3k
	MMTvicQMT3Vvzs65WsQdtcnj/f8mrfXyJcO9xQLQDYKf+JgO4To23UTD/2bK161aZM+a
	4D+yd9OGyHEFokzQafu7Qf+yZBXpBppjW7wzGXJe8LoYlmg0Hqzx9GgAlaWk/Kj0dXZB
	iiwg==
X-Gm-Message-State: AA6/9RlYcd6wRaTGvHXjMxvSo4HyUgdZ1jKlm+QexgOGivOZisgaoPMWb+FZ7wsfi26tmGMSlnrNPWsVJ7NNmj6X
X-Received: by 10.107.17.32 with SMTP id z32mr5531298ioi.1.1476189405501; Tue,
	11 Oct 2016 05:36:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.155.66 with HTTP; Tue, 11 Oct 2016 05:36:25 -0700 (PDT)
In-Reply-To: <9eb3fd87-b56b-ce59-7c85-f0d4fa4d3500@mlbassoc.com>
References: <1476188384-16064-1-git-send-email-ross.burton@intel.com>
	<1476188384-16064-2-git-send-email-ross.burton@intel.com>
	<9eb3fd87-b56b-ce59-7c85-f0d4fa4d3500@mlbassoc.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 11 Oct 2016 13:36:25 +0100
Message-ID: <CAJTo0LbYVgB53POjPZYWLSxXREWea3bnUUBK83vFv-MvTRG9_Q@mail.gmail.com>
To: Gary Thomas <gary@mlbassoc.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] insane: display names instead of ELF machine numbers
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
X-List-Received-Date: Tue, 11 Oct 2016 12:36:46 -0000
Content-Type: multipart/alternative; boundary=001a113f267622edd7053e962134

--001a113f267622edd7053e962134
Content-Type: text/plain; charset=UTF-8

On 11 October 2016 at 13:26, Gary Thomas <gary@mlbassoc.com> wrote:

> Did you mean to swap the items?  The old version used
>   machine, elf.machine()
> and this version uses
>   elf.machine(), machine
>

Yes, because the string format changed to be clearer too:

-        package_qa_add_message(messages, "arch", "Architecture did not
match (%d to %d) on %s" % \
-                 (machine, elf.machine(), package_qa_clean_path(path,d)))
+        package_qa_add_message(messages, "arch", "Architecture did not
match (%s, expected %s) on %s" % \
+                 (oe.qa.elf_machine_to_string(elf.machine()),
oe.qa.elf_machine_to_string(machine),

The old message would say "20 to 62", the new message is "x86-64, expected
PowerPC".

Ross

--001a113f267622edd7053e962134
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 11 October 2016 at 13:26, Gary Thomas <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:gary@mlbassoc.com" target=3D"_blank">gary@mlbassoc.com</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-st=
yle:solid;padding-left:1ex"><div id=3D"gmail-:6fh" class=3D"gmail-a3s gmail=
-aXjCH gmail-m157b3bb129b5ac0b">Did you mean to swap the items?=C2=A0 The o=
ld version used<br>
=C2=A0 machine, elf.machine()<br>
and this version uses<br>
=C2=A0 elf.machine(), machine</div></blockquote></div><br>Yes, because the =
string format changed to be clearer too:</div><div class=3D"gmail_extra"><b=
r></div><div class=3D"gmail_extra"><span style=3D"color:rgb(80,0,80);font-s=
ize:12.800000190734863px">-=C2=A0 =C2=A0 =C2=A0 =C2=A0 package_qa_add_messa=
ge(message</span><wbr style=3D"color:rgb(80,0,80);font-size:12.800000190734=
863px"><span style=3D"color:rgb(80,0,80);font-size:12.800000190734863px">s,=
 &quot;arch&quot;, &quot;Architecture did not match (%d to %d) on %s&quot; =
% \</span><br style=3D"color:rgb(80,0,80);font-size:12.800000190734863px"><=
span style=3D"color:rgb(80,0,80);font-size:12.800000190734863px">-=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(machine, elf.machin=
e(), package_qa_clean_path(path,d))</span><wbr style=3D"color:rgb(80,0,80);=
font-size:12.800000190734863px"><span style=3D"color:rgb(80,0,80);font-size=
:12.800000190734863px">)</span><br style=3D"color:rgb(80,0,80);font-size:12=
.800000190734863px"><span style=3D"color:rgb(80,0,80);font-size:12.80000019=
0734863px">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 package_qa_add_message(message</spa=
n><wbr style=3D"color:rgb(80,0,80);font-size:12.800000190734863px"><span st=
yle=3D"color:rgb(80,0,80);font-size:12.800000190734863px">s, &quot;arch&quo=
t;, &quot;Architecture did not match (%s, expected %s) on %s&quot; % \</spa=
n><br style=3D"color:rgb(80,0,80);font-size:12.800000190734863px"><span sty=
le=3D"color:rgb(80,0,80);font-size:12.800000190734863px">+=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(oe.qa.elf_machine_to_string(<=
/span><wbr style=3D"color:rgb(80,0,80);font-size:12.800000190734863px"><spa=
n style=3D"color:rgb(80,0,80);font-size:12.800000190734863px">elf.machine()=
), oe.qa.elf_machine_to_string(ma</span><wbr style=3D"color:rgb(80,0,80);fo=
nt-size:12.800000190734863px"><span style=3D"color:rgb(80,0,80);font-size:1=
2.800000190734863px">chine),=C2=A0</span><br></div><div class=3D"gmail_extr=
a"><span style=3D"color:rgb(80,0,80);font-size:12.800000190734863px"><br></=
span></div><div class=3D"gmail_extra"><span style=3D"color:rgb(80,0,80);fon=
t-size:12.800000190734863px">The old message would say &quot;20 to 62&quot;=
, the new message is &quot;x86-64, expected PowerPC&quot;.</span></div><div=
 class=3D"gmail_extra"><span style=3D"color:rgb(80,0,80);font-size:12.80000=
0190734863px"><br></span></div><div class=3D"gmail_extra"><span style=3D"co=
lor:rgb(80,0,80);font-size:12.800000190734863px">Ross</span></div><div clas=
s=3D"gmail_extra"><span style=3D"color:rgb(80,0,80);font-size:12.8000001907=
34863px"><br></span></div><div class=3D"gmail_extra"><br></div></div>

--001a113f267622edd7053e962134--
