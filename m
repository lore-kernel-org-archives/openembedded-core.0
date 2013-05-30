Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f181.google.com (mail-ob0-f181.google.com
	[209.85.214.181])
	by mail.openembedded.org (Postfix) with ESMTP id 2B6486094D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 17:30:17 +0000 (UTC)
Received: by mail-ob0-f181.google.com with SMTP id 16so1127027obc.40
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 10:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=xptytXtPN7fdb8PZxYHGbN13/zt3ZpQ/oUdfvlvVMFQ=;
	b=EQdbkHQ8GMqLNfF+gYPoHkQ7iZ1XWSK9wIiavM9arQ8nhh9E5PNEY9OFTmnB3FYPqJ
	21wDByeATHUqsWju3DZGTUSALSJM1qBPKf6iUD4LgGDANS5aBWYuZR5rDRDIml0qbpvm
	gy9s1XHy0ub9fWjLcKT7+JPdiOGwxVzvnf3b5toUmK/D3/EcC0cmfIrRBrK+A9boZvRt
	Urjx8eyVWjVLox+q1B5XIEvkbPdlmWMetyFovRakj+9iHUfMLNk2jHemhbxIqyBe2us9
	Ty7gpstbV3p3cnbZ+egLIPTwTXwTiLuW8VBA1nJXRzdOc2dD7zMfIkWyqvAoamZyPiQt
	9c7Q==
MIME-Version: 1.0
X-Received: by 10.60.59.163 with SMTP id a3mr4612583oer.45.1369935017725; Thu,
	30 May 2013 10:30:17 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.108.167 with HTTP; Thu, 30 May 2013 10:30:17 -0700 (PDT)
In-Reply-To: <001701ce5cdb$de85b1a0$9b9114e0$@com>
References: <1369119875-4984-1-git-send-email-b40527@freescale.com>
	<CAJTo0LZA89rPdGy65ShyfxjS4jenHsinO5JPsTbWNi3sgOD=Eg@mail.gmail.com>
	<000701ce5b4e$3c7684e0$b5638ea0$@com>
	<CAP9ODKo8453_vw-9u+8308vsvy3zRoSk0ptoEzgo8gFpwp76SQ@mail.gmail.com>
	<000f01ce5b5b$c64e39d0$52eaad70$@com>
	<CAJTo0LbLEH+S4OpoKVQyeV2j2gV9pkzsS1L9vyoB=SPSCzL1VQ@mail.gmail.com>
	<001701ce5cdb$de85b1a0$9b9114e0$@com>
Date: Thu, 30 May 2013 14:30:17 -0300
X-Google-Sender-Auth: 1ghtK0bbv27djb_vJnMdir5OpC4
Message-ID: <CAP9ODKo83jbSYYK88QL_3gfKews6SZxLx5_CQh5W+8RKk5QRuw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Zongchun YU <b40527@freescale.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base-files:fix the command line wrap around issue
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
X-List-Received-Date: Thu, 30 May 2013 17:30:17 -0000
Content-Type: multipart/alternative; boundary=089e013d081818d72604ddf2da43

--089e013d081818d72604ddf2da43
Content-Type: text/plain; charset=ISO-8859-1

On Wed, May 29, 2013 at 11:17 PM, Zongchun YU <b40527@freescale.com> wrote:

> Yes.  At least for my target, CONFIG_RESIZE isn't enabled that I'd expect
> to be required for this to work.
>
> for my target, CONFIG_RESIZE have been enabled, if we use resize in
> profile, we may meet the invalid character issue as I mentioned earlier.
>

I think we need to find the cause of the invalid character; your proposed
patch is a workaround and not a fix for the real issue.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

--089e013d081818d72604ddf2da43
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Wed, May 29, 2013 at 11:17 PM, Zongchun YU <span dir=3D"ltr">&lt=
;<a href=3D"mailto:b40527@freescale.com" target=3D"_blank">b40527@freescale=
.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">Yes. =A0At least for my ta=
rget, CONFIG_RESIZE isn&#39;t enabled that I&#39;d expect to be required fo=
r this to work.<br>

<br>
</div>for my target, CONFIG_RESIZE have been enabled, if we use resize in p=
rofile, we may meet the invalid character issue as I mentioned earlier.<br>=
</blockquote><div><br></div><div style>I think we need to find the cause of=
 the invalid character; your proposed patch is a workaround and not a fix f=
or the real issue.=A0</div>
</div><div><br></div>-- <br>Otavio Salvador =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 O.S. Systems<br><a href=3D"http://www.ossystems.co=
m.br" target=3D"_blank">http://www.ossystems.com.br</a> =A0 =A0 =A0 =A0<a h=
ref=3D"http://projetos.ossystems.com.br" target=3D"_blank">http://projetos.=
ossystems.com.br</a><br>
Mobile: +55 (53) 9981-7854 =A0 =A0 =A0 =A0 =A0 =A0Mobile: +1 (347) 903-9750=
<br>
</div></div>

--089e013d081818d72604ddf2da43--
