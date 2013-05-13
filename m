Received: from mail-pd0-f175.google.com ([209.85.192.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UbyIu-0000lR-Op
	for openembedded-core@lists.openembedded.org;
	Mon, 13 May 2013 21:21:13 +0200
Received: by mail-pd0-f175.google.com with SMTP id y14so4610707pdi.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2013 12:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:message-id:references:to:x-mailer;
	bh=FEc8YLY2PRSdpDg7w2MofalrPOmoU41kE8Co2DFEiJc=;
	b=0rbDeXjn6462gA+Y7pugN0yNVkFNJWrVKZJMEmKBdqR6u6f25mALbsPKMPpez/OMuj
	SLX03+i5CdoUVY4zC5iVoqSGGe+RspurqhrJXcMd9AP1VEPgGB05e6V0EiULoLDd0ssb
	RkAabVWsh7oKYjTx9WyX8U8WZCu8/TpUmgti7EviGt/aB/NJ3el2/RAd62cUW6TEntYS
	9AHeoXybxtB18M3QhucdcxIHXC6oebhe7lUBWptGgSuSCwhIru9tONkgyJ87NFZXFYXy
	gipZBAeWnu6e54VUFdw9CSKA+ZCNOqv6IDGAhx+y0HKblyyNpyLH29RylPOxRakt8zGs
	1vLg==
X-Received: by 10.68.255.130 with SMTP id aq2mr29849905pbd.164.1368471769999; 
	Mon, 13 May 2013 12:02:49 -0700 (PDT)
Received: from vjalali-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36]) by mx.google.com with ESMTPSA id
	zy5sm14990476pbb.43.2013.05.13.12.02.48 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 13 May 2013 12:02:49 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAHUNapT_QZr6OwgbyahtxQ16DuRZSgbQrTYg63k-qark8H-_Rw@mail.gmail.com>
Date: Mon, 13 May 2013 12:02:49 -0700
Message-Id: <37DAA5BB-07D8-4B84-8304-C870036694FC@gmail.com>
References: <cover.1368423406.git.raj.khem@gmail.com>
	<CAHUNapTS=bCegKdFntAnaSja5rZ08c-J9aAzbQiuSTJLk6w3Bw@mail.gmail.com>
	<203C5055-E0F5-42E6-A607-DE8F2EE36D5C@gmail.com>
	<CAHUNapT_QZr6OwgbyahtxQ16DuRZSgbQrTYg63k-qark8H-_Rw@mail.gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
X-Mailer: Apple Mail (2.1503)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] Add qemumips64 machine support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 13 May 2013 19:21:20 -0000
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_2638712A-586B-49DC-9313-CD56A91CC354"

--Apple-Mail=_2638712A-586B-49DC-9313-CD56A91CC354
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=iso-8859-1


On May 13, 2013, at 11:53 AM, Trevor Woerner <twoerner@gmail.com> wrote:

> Process swapper (pid: 1, threadinfo=3D9800000007c80000, =
task=3D9800000007c38000, tls=3D0000000000000000)
> Stack : 9800000007c83ce0 9800000007c83ce0 000000000000008b =
ffffffff809b0000
>         9800000007c83d00 0000000000000006 ffffffff80a778a0 =
ffffffff80936930
>         9800000007c83d20 ffffffff80968528 ffffffff80930000 =
0000000000000000
>         ffffffffffffffff 0000000000000006 ffffffff80a70000 =
ffffffff80a70000
>         9800000007c83d60 ffffffff809683ec 9800000007c83d70 =
0000000000000006
>         ffffffff809b0000 ffffffff809683bc 9800000007c83d90 =
ffffffff80100530
>         ffffffff809b0000 0000000000000006 0000000000000030 =
ffffffff809b0000
>         ffffffff809b1578 ffffffff8097d960 9800000007c83dd0 =
ffffffff80948c98
>         0000000000000000 0000000000000000 0000000000000000 =
0000000000000000
>         0000000000000000 0000000000000000 0000000000000000 =
0000000000000000
>         ...
> Call Trace:
> [<ffffffff80635910>] reset_counters+0x60/0x90
> [<ffffffff80968790>] mipsxx_init+0x1d4/0x2d8
> [<ffffffff80968528>] oprofile_arch_init+0x84/0x118
> [<ffffffff809683ec>] oprofile_init+0x30/0xb8
> [<ffffffff80100530>] do_one_initcall+0x120/0x1a0
> [<ffffffff80948c98>] kernel_init+0x194/0x258
> [<ffffffff80103ffc>] kernel_thread_helper+0x24/0x30
>=20
>=20


you must be using systemd. I am seeing same failure with systemd but =
only when my build host is archlinux


> Code: 4080c802  4080c803  4080c800 <4080c801> 03c0e82d  dfbe0008  =
03e00008  67bd0010  00000000=20
> ---[ end trace 340dd7de1cdea432 ]---
> Kernel panic - not syncing: Attempted to kill init! =
exitcode=3D0x0000000b


--Apple-Mail=_2638712A-586B-49DC-9313-CD56A91CC354
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=iso-8859-1

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Diso-8859-1"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space; =
"><br><div><div>On May 13, 2013, at 11:53 AM, Trevor Woerner &lt;<a =
href=3D"mailto:twoerner@gmail.com">twoerner@gmail.com</a>&gt; =
wrote:</div><br class=3D"Apple-interchange-newline"><blockquote =
type=3D"cite"><div style=3D"font-family: Helvetica; font-size: medium; =
font-style: normal; font-variant: normal; font-weight: normal; =
letter-spacing: normal; line-height: normal; orphans: 2; text-align: =
-webkit-auto; text-indent: 0px; text-transform: none; white-space: =
normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; ">Process swapper (pid: 1, =
threadinfo=3D9800000007c80000, task=3D9800000007c38000, =
tls=3D0000000000000000)</div><div style=3D"font-family: Helvetica; =
font-size: medium; font-style: normal; font-variant: normal; =
font-weight: normal; letter-spacing: normal; line-height: normal; =
orphans: 2; text-align: -webkit-auto; text-indent: 0px; text-transform: =
none; white-space: normal; widows: 2; word-spacing: 0px; =
-webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; ">Stack =
: 9800000007c83ce0 9800000007c83ce0 000000000000008b =
ffffffff809b0000</div><div style=3D"font-family: Helvetica; font-size: =
medium; font-style: normal; font-variant: normal; font-weight: normal; =
letter-spacing: normal; line-height: normal; orphans: 2; text-align: =
-webkit-auto; text-indent: 0px; text-transform: none; white-space: =
normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; ">&nbsp; &nbsp; &nbsp; &nbsp; =
9800000007c83d00 0000000000000006 ffffffff80a778a0 =
ffffffff80936930</div><div style=3D"font-family: Helvetica; font-size: =
medium; font-style: normal; font-variant: normal; font-weight: normal; =
letter-spacing: normal; line-height: normal; orphans: 2; text-align: =
-webkit-auto; text-indent: 0px; text-transform: none; white-space: =
normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; ">&nbsp; &nbsp; &nbsp; &nbsp; =
9800000007c83d20 ffffffff80968528 ffffffff80930000 =
0000000000000000</div><div style=3D"font-family: Helvetica; font-size: =
medium; font-style: normal; font-variant: normal; font-weight: normal; =
letter-spacing: normal; line-height: normal; orphans: 2; text-align: =
-webkit-auto; text-indent: 0px; text-transform: none; white-space: =
normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; ">&nbsp; &nbsp; &nbsp; &nbsp; =
ffffffffffffffff 0000000000000006 ffffffff80a70000 =
ffffffff80a70000</div><div style=3D"font-family: Helvetica; font-size: =
medium; font-style: normal; font-variant: normal; font-weight: normal; =
letter-spacing: normal; line-height: normal; orphans: 2; text-align: =
-webkit-auto; text-indent: 0px; text-transform: none; white-space: =
normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; ">&nbsp; &nbsp; &nbsp; &nbsp; =
9800000007c83d60 ffffffff809683ec 9800000007c83d70 =
0000000000000006</div><div style=3D"font-family: Helvetica; font-size: =
medium; font-style: normal; font-variant: normal; font-weight: normal; =
letter-spacing: normal; line-height: normal; orphans: 2; text-align: =
-webkit-auto; text-indent: 0px; text-transform: none; white-space: =
normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; ">&nbsp; &nbsp; &nbsp; &nbsp; =
ffffffff809b0000 ffffffff809683bc 9800000007c83d90 =
ffffffff80100530</div><div style=3D"font-family: Helvetica; font-size: =
medium; font-style: normal; font-variant: normal; font-weight: normal; =
letter-spacing: normal; line-height: normal; orphans: 2; text-align: =
-webkit-auto; text-indent: 0px; text-transform: none; white-space: =
normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; ">&nbsp; &nbsp; &nbsp; &nbsp; =
ffffffff809b0000 0000000000000006 0000000000000030 =
ffffffff809b0000</div><div style=3D"font-family: Helvetica; font-size: =
medium; font-style: normal; font-variant: normal; font-weight: normal; =
letter-spacing: normal; line-height: normal; orphans: 2; text-align: =
-webkit-auto; text-indent: 0px; text-transform: none; white-space: =
normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; ">&nbsp; &nbsp; &nbsp; &nbsp; =
ffffffff809b1578 ffffffff8097d960 9800000007c83dd0 =
ffffffff80948c98</div><div style=3D"font-family: Helvetica; font-size: =
medium; font-style: normal; font-variant: normal; font-weight: normal; =
letter-spacing: normal; line-height: normal; orphans: 2; text-align: =
-webkit-auto; text-indent: 0px; text-transform: none; white-space: =
normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; ">&nbsp; &nbsp; &nbsp; &nbsp; =
0000000000000000 0000000000000000 0000000000000000 =
0000000000000000</div><div style=3D"font-family: Helvetica; font-size: =
medium; font-style: normal; font-variant: normal; font-weight: normal; =
letter-spacing: normal; line-height: normal; orphans: 2; text-align: =
-webkit-auto; text-indent: 0px; text-transform: none; white-space: =
normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; ">&nbsp; &nbsp; &nbsp; &nbsp; =
0000000000000000 0000000000000000 0000000000000000 =
0000000000000000</div><div style=3D"font-family: Helvetica; font-size: =
medium; font-style: normal; font-variant: normal; font-weight: normal; =
letter-spacing: normal; line-height: normal; orphans: 2; text-align: =
-webkit-auto; text-indent: 0px; text-transform: none; white-space: =
normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; ">&nbsp; &nbsp; &nbsp; &nbsp; =
...</div><div style=3D"font-family: Helvetica; font-size: medium; =
font-style: normal; font-variant: normal; font-weight: normal; =
letter-spacing: normal; line-height: normal; orphans: 2; text-align: =
-webkit-auto; text-indent: 0px; text-transform: none; white-space: =
normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; ">Call Trace:</div><div =
style=3D"font-family: Helvetica; font-size: medium; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; orphans: 2; text-align: -webkit-auto; text-indent: =
0px; text-transform: none; white-space: normal; widows: 2; word-spacing: =
0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; =
">[&lt;ffffffff80635910&gt;] reset_counters+0x60/0x90</div><div =
style=3D"font-family: Helvetica; font-size: medium; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; orphans: 2; text-align: -webkit-auto; text-indent: =
0px; text-transform: none; white-space: normal; widows: 2; word-spacing: =
0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; =
">[&lt;ffffffff80968790&gt;] mipsxx_init+0x1d4/0x2d8</div><div =
style=3D"font-family: Helvetica; font-size: medium; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; orphans: 2; text-align: -webkit-auto; text-indent: =
0px; text-transform: none; white-space: normal; widows: 2; word-spacing: =
0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; =
">[&lt;ffffffff80968528&gt;] oprofile_arch_init+0x84/0x118</div><div =
style=3D"font-family: Helvetica; font-size: medium; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; orphans: 2; text-align: -webkit-auto; text-indent: =
0px; text-transform: none; white-space: normal; widows: 2; word-spacing: =
0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; =
">[&lt;ffffffff809683ec&gt;] oprofile_init+0x30/0xb8</div><div =
style=3D"font-family: Helvetica; font-size: medium; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; orphans: 2; text-align: -webkit-auto; text-indent: =
0px; text-transform: none; white-space: normal; widows: 2; word-spacing: =
0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; =
">[&lt;ffffffff80100530&gt;] do_one_initcall+0x120/0x1a0</div><div =
style=3D"font-family: Helvetica; font-size: medium; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; orphans: 2; text-align: -webkit-auto; text-indent: =
0px; text-transform: none; white-space: normal; widows: 2; word-spacing: =
0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; =
">[&lt;ffffffff80948c98&gt;] kernel_init+0x194/0x258</div><div =
style=3D"font-family: Helvetica; font-size: medium; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; orphans: 2; text-align: -webkit-auto; text-indent: =
0px; text-transform: none; white-space: normal; widows: 2; word-spacing: =
0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; =
">[&lt;ffffffff80103ffc&gt;] kernel_thread_helper+0x24/0x30</div><div =
style=3D"font-family: Helvetica; font-size: medium; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; orphans: 2; text-align: -webkit-auto; text-indent: =
0px; text-transform: none; white-space: normal; widows: 2; word-spacing: =
0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; =
"><br></div><div style=3D"font-family: Helvetica; font-size: medium; =
font-style: normal; font-variant: normal; font-weight: normal; =
letter-spacing: normal; line-height: normal; orphans: 2; text-align: =
-webkit-auto; text-indent: 0px; text-transform: none; white-space: =
normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; =
"><br></div></blockquote><div><br></div><div><br></div><div>you must be =
using systemd. I am seeing same failure with systemd but only when my =
build host is archlinux</div><div><br></div><br><blockquote =
type=3D"cite"><div style=3D"font-family: Helvetica; font-size: medium; =
font-style: normal; font-variant: normal; font-weight: normal; =
letter-spacing: normal; line-height: normal; orphans: 2; text-align: =
-webkit-auto; text-indent: 0px; text-transform: none; white-space: =
normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; ">Code: 4080c802 &nbsp;4080c803 =
&nbsp;4080c800 &lt;4080c801&gt; 03c0e82d &nbsp;dfbe0008 &nbsp;03e00008 =
&nbsp;67bd0010 &nbsp;00000000&nbsp;</div><div style=3D"font-family: =
Helvetica; font-size: medium; font-style: normal; font-variant: normal; =
font-weight: normal; letter-spacing: normal; line-height: normal; =
orphans: 2; text-align: -webkit-auto; text-indent: 0px; text-transform: =
none; white-space: normal; widows: 2; word-spacing: 0px; =
-webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; ">---[ =
end trace 340dd7de1cdea432 ]---</div><div style=3D"font-family: =
Helvetica; font-size: medium; font-style: normal; font-variant: normal; =
font-weight: normal; letter-spacing: normal; line-height: normal; =
orphans: 2; text-align: -webkit-auto; text-indent: 0px; text-transform: =
none; white-space: normal; widows: 2; word-spacing: 0px; =
-webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; ">Kernel =
panic - not syncing: Attempted to kill init! =
exitcode=3D0x0000000b</div></blockquote></div><br></body></html>=

--Apple-Mail=_2638712A-586B-49DC-9313-CD56A91CC354--
