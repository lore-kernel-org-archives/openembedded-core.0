Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id A1F987665F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Feb 2016 12:33:48 +0000 (UTC)
Received: by mail-io0-f174.google.com with SMTP id 9so115657272iom.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Feb 2016 04:33:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=JuqC0tSF01jWqp43vy9+t0AlEjTGf+TtGXWOZvCOzDE=;
	b=N1568PSjnpiHZ90daI5yy+zdQjRM6MreZWG5cgfv8yiIcCYfh79t2WhEQFx0+5CKUZ
	viLRhYXy9+QTicwhkKXfoa3WYyerYs83bvatwQSLFJIOiW/ZSx2q1AEpOK3/kvYgI71d
	2RfJMijF/0otlTU8negMwfu5fvV7W947eRhHVFQIdNcfTY3UnxEpQDyRZCtNNRE7GJ12
	1TyvrZSVl8ffoWnhYj/2KjpkCTfwYv3g+BqpCdXT7aqkUuwOFOB7UA3tlo2futzJI3h7
	7Fj2QzpOiVhqXy+RoaI4B15OEe7FJoFwcE++BGNC6+HtF2b0Nu/SBCFniK671PH/IvNm
	TdUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=JuqC0tSF01jWqp43vy9+t0AlEjTGf+TtGXWOZvCOzDE=;
	b=NIGxzUvPm2eJDBimalALu6r04muLv8JLat5AqULEKBSVvVZnPCKcrv4tIDr3wuCh9j
	uHu46V0yNTsS/C0bnwKGYdxe/KGBeG2YnGvk4zCwF0d1JO0w8wp8yLdYcrYr/axUTKLO
	7yH1SyXMzvRx6WIaDoP5T3m98+D9HZB0E3tN5D2MCRVxg+6mA3ZxtRVIgZ+XMxio+QoD
	P8zzFKYJEzbHIJ7WgNFo9Gie70OZe1jsZISwAkyFhnFkuWCIZ9+BvV57Pgluyfp835bq
	Lg9MS4nU33kgSstO4SIKBTN1JJ/UkPTngp99KzmmIr0B1iHpo67WCZUQTqfLLNB9CyCy
	G+/w==
X-Gm-Message-State: AG10YOT1rJcoALuuBnHOuuotfaORD0jiAuA/S1AX59L9mthM8GUKoJxUWqFplUNmy4z+412ZylHUpUcnBBWBlj69
X-Received: by 10.107.3.220 with SMTP id e89mr7452015ioi.99.1456490029017;
	Fri, 26 Feb 2016 04:33:49 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Fri, 26 Feb 2016 04:33:29 -0800 (PST)
In-Reply-To: <CANwerB0bs=0b0r_mj+VJ+rgYz56jKUuSiUgs7kdK+tD9f=Ot8A@mail.gmail.com>
References: <1456483945-16340-1-git-send-email-net147@gmail.com>
	<20160226110428.GA2557@jama>
	<CANwerB0bs=0b0r_mj+VJ+rgYz56jKUuSiUgs7kdK+tD9f=Ot8A@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 26 Feb 2016 12:33:29 +0000
Message-ID: <CAJTo0LYS-u77Lg+Q4OWT9syYvQVP-631RQ+N9GRRoBKg+6r3Tw@mail.gmail.com>
To: Jonathan Liu <net147@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ffmpeg: fix build when DISTRO_FEATURES doesn't contain x11
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
X-List-Received-Date: Fri, 26 Feb 2016 12:33:49 -0000
Content-Type: multipart/alternative; boundary=001a113f0e7ccc8111052cab828b

--001a113f0e7ccc8111052cab828b
Content-Type: text/plain; charset=UTF-8

On 26 February 2016 at 11:17, Jonathan Liu <net147@gmail.com> wrote:

> It doesn't work in PACKAGECONFIG..... that is the first thing I tried.
>

I'd call that a bug, and should be simple to resolve (pass expand=True when
fetching getVarFlags in the PACKAGECONFIG handling code).

Ross

--001a113f0e7ccc8111052cab828b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 26 February 2016 at 11:17, Jonathan Liu <span dir=3D"ltr">&lt;<a href=3D=
"mailto:net147@gmail.com" target=3D"_blank">net147@gmail.com</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex"><div id=3D":ent" class=3D"a3s" st=
yle=3D"overflow:hidden">It doesn&#39;t work in PACKAGECONFIG..... that is t=
he first thing I tried.<br></div></blockquote></div><br>I&#39;d call that a=
 bug, and should be simple to resolve (pass expand=3DTrue when fetching get=
VarFlags in the PACKAGECONFIG handling code).</div><div class=3D"gmail_extr=
a"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113f0e7ccc8111052cab828b--
