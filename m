Return-Path: <kergoth@gmail.com>
Received: from mail-lb0-f169.google.com (mail-lb0-f169.google.com
	[209.85.217.169])
	by mail.openembedded.org (Postfix) with ESMTP id A201E605BD;
	Mon, 28 Apr 2014 17:19:18 +0000 (UTC)
Received: by mail-lb0-f169.google.com with SMTP id n15so5215612lbi.14
	for <multiple recipients>; Mon, 28 Apr 2014 10:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=U7QShwq1vh62fJjRUq0XsJmpckMjrHKNoLgPRtZuuIc=;
	b=E4QyPApFEeDXjTcTpiOrWBsv1uEJ+OimbZ2Ofbx8qmZ9bN3fDAfUm5vgp8gDdsqmoM
	LkZXxM/NgtLqAXwIJiaKt3slP+Ot9LRXlaPnS8lCLLIbwHTSP05Ja4+fx1tk64iYKd9e
	UP54eRmPT/T+X4iB2aDiicxJDNUtKV/OQJzUTiUxrWt7LClCzyfcNZPa76Pxv90tJPFH
	pEUJW10oKir6fFhps/WMgsTQs71WipYtWLi1f9CneAnaXjeJx54YsPe219hyutfpPS2R
	Pd1s0QIhhrGcu31RlTCtKflAlim2Zst8cOEIjAy0plURWJzIFNmca26bIF8VV11YotJt
	pqFw==
X-Received: by 10.112.160.168 with SMTP id xl8mr19127907lbb.3.1398705559664;
	Mon, 28 Apr 2014 10:19:19 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.35.194 with HTTP; Mon, 28 Apr 2014 10:18:59 -0700 (PDT)
In-Reply-To: <CAMKF1sqbwwTQoVEBgaTAtRhLVFkrUTfzF63H09aEayAvNgZG9A@mail.gmail.com>
References: <CAMKF1soKZqqmQUVCQnUqS1GV1FO5KictTO+=up=d7Jw3+QhXMw@mail.gmail.com>
	<CAJTo0LYF0VNwy7=rhmr7U_=tXwJtPOax3AKttn66q3qD_QXd2w@mail.gmail.com>
	<CANyK_8deVKbC6xOUQHubvphfwQCQefHGWCt7Mp1QM4DUVXja5g@mail.gmail.com>
	<CAMKF1sqPB+QCvPHHcxsU+ExBmNWg9jPXajkAR_FdKpJ76-x9dg@mail.gmail.com>
	<CANyK_8er+2sjvU1csLOEpZ06qCL4h+bP2ecUYYGzyiEw0kXzQw@mail.gmail.com>
	<CAMKF1spno7Np8FXr3JXw3_W72+vRkchzZ8J5X+3e4RCFY+6nLg@mail.gmail.com>
	<CANyK_8f_V247P1UWaeG-7YwBq4MrHQ=+69NOgW8LUZ4_Xgx2qA@mail.gmail.com>
	<CAP9ODKp-+31rJmK6uY1QA6nvG4hDuNT79JVeeivY5XeOCu2etw@mail.gmail.com>
	<CAMKF1sqOCs_OYkZU2ng9FmViPyJx1AjdViSquZWzbgFT=XZdoA@mail.gmail.com>
	<CANyK_8fC4kkDgqovwuTx5kN0Y2hcyDT7HStii4hxz_CN3D=atA@mail.gmail.com>
	<CAMKF1sorF5M0oxq9gaZEDeV5Td2pydEE0zZjqJdM8n0hyGbuyQ@mail.gmail.com>
	<CANyK_8caB3XLyY5QvDdDGF5i8kQbN7GV+zBz1x7OzxkzV7P6mg@mail.gmail.com>
	<CAMKF1sqbwwTQoVEBgaTAtRhLVFkrUTfzF63H09aEayAvNgZG9A@mail.gmail.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Mon, 28 Apr 2014 10:18:59 -0700
X-Google-Sender-Auth: JYKr3lmkZV2VyB67jATaRS6ht9Q
Message-ID: <CABcZANkp-tYc16etu7HGkqXeNNsno70RiXMnMRyg8voq5tCtCg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	OE-devel <openembedded-devel@lists.openembedded.org>,
	Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] initial support for musl libc with OE/Yocto Project
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
X-List-Received-Date: Mon, 28 Apr 2014 17:19:23 -0000
Content-Type: multipart/alternative; boundary=001a11c3888c077ff004f81d8435

--001a11c3888c077ff004f81d8435
Content-Type: text/plain; charset=UTF-8

On Mon, Apr 28, 2014 at 10:17 AM, Khem Raj <raj.khem@gmail.com> wrote:

> Now I have core-image-minimal building and booting for all of the
> supported QEMU targets in OE-Core with musl/gcc-4.9. The updates are
> all available on contrib tree branch kraj/musl, try it out for your
> machine/distro if you are interested in musl
>
> http://git.openembedded.org/openembedded-core-contrib/log/?h=kraj/musl
>

Congrats on the progress :)
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a11c3888c077ff004f81d8435
Content-Type: text/html; charset=UTF-8

<div dir="ltr"><div class="gmail_extra"><br><div class="gmail_quote">On Mon, Apr 28, 2014 at 10:17 AM, Khem Raj <span dir="ltr">&lt;<a href="mailto:raj.khem@gmail.com" target="_blank">raj.khem@gmail.com</a>&gt;</span> wrote:<br>

<blockquote class="gmail_quote" style="margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=":1qz" class="a3s" style="overflow:hidden">Now I have core-image-minimal building and booting for all of the<br>


supported QEMU targets in OE-Core with musl/gcc-4.9. The updates are<br>
all available on contrib tree branch kraj/musl, try it out for your<br>
machine/distro if you are interested in musl<br>
<br>
<a href="http://git.openembedded.org/openembedded-core-contrib/log/?h=kraj/musl" target="_blank">http://git.openembedded.org/openembedded-core-contrib/log/?h=kraj/musl</a></div></blockquote></div><br>Congrats on the progress :)<br>

-- <br>Christopher Larson<br>clarson at kergoth dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engineer, Mentor Graphics
</div></div>

--001a11c3888c077ff004f81d8435--
