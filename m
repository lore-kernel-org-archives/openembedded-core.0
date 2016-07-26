Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 7F3E7606BF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2016 14:24:11 +0000 (UTC)
Received: by mail-io0-f170.google.com with SMTP id 38so22760123iol.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2016 07:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=bV7byrcGQhEWGntUkRsQBAV/tWXL9/Nm1InxUOZWi9E=;
	b=dg/SUIr8fDlK3VCi/PDvX2kUXtWqNgZNGH4yqCx8P7Wl6vWa2noGiGTV0dku6srQsg
	1Q7SDPFQBbxcYAEgRlFuJTuLsYlkdYNy0j//g0vLFBYvQKciCavGReu5/Sp93/w5Hr5N
	BcOKP56+HK/thIzwRMrslrJg1f6M8XykMM5Q/s2q03uLj3aRw4IhBkPxTqWG6WXejiwI
	WIXOo/yvX3jDY5/xilltft+vgB5k5FUKQ+/juOBp4eO3l2/xHgK+z3Oi20eEaUl0tc5y
	HURR6EzjGQdxMVB0T/hYc2cHv2uXoCsr4ZRLnk6Gdr1mNDpa35QGHS1yqjxb7XzqCxRg
	unnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=bV7byrcGQhEWGntUkRsQBAV/tWXL9/Nm1InxUOZWi9E=;
	b=BhAelD3oAxALUe7MB49ERl4Aja5zPjzQBMNOowtVO8+WNkqp7tUJV4GUcnlwG1rGAu
	A0BJURkmgxGSqLujBb9a8kZdb72SgAM9lvp+qnMncDRJ9AfGdqhJ36PZNKDTcrK4nDx1
	AXsaAkeeCRFlv3m66WWPDWX7Xjb8+rVQWsdnBnyN2xbZe5622GQZsWmj/H//WLWLDDDT
	NRcQjSaH5QFRMvMoiP9roy7gWyEnx7TbFvTxg6B5OTpEgZxHk6W/aQJ68AZ33l8t9oOD
	aLPgksq0vqR1J1KSv0FD1GtVEcd5pSEm3CSGEzW5F2hCe2mgki46bise4wkGnwG/oze9
	z57g==
X-Gm-Message-State: AEkoouuHdd4zoLrvl+eodH9v+xNL56SYlNpVHgJcFZXluHC0C2+h0zAsxIox1QnzljN4BZXw7b+5etBQZCSF49Ed
X-Received: by 10.107.135.142 with SMTP id r14mr29246965ioi.133.1469543052825; 
	Tue, 26 Jul 2016 07:24:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Tue, 26 Jul 2016 07:23:53 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.20.1607261016100.14495@localhost.localdomain>
References: <alpine.LFD.2.20.1607261001570.14189@localhost.localdomain>
	<CAJTo0LZZ_1V_68Pya9EUNT6imRVONTkrMzejFAGG9A8f3GYfTQ@mail.gmail.com>
	<alpine.LFD.2.20.1607261016100.14495@localhost.localdomain>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 26 Jul 2016 15:23:53 +0100
Message-ID: <CAJTo0La791M2fVxEXcYud+K7A0SvGwwWUb51xMm-J0+kQ4=GYg@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: why is "run-postinsts" considered a "development" recipe?
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
X-List-Received-Date: Tue, 26 Jul 2016 14:24:15 -0000
Content-Type: multipart/alternative; boundary=001a113eccbca5896005388aa74f

--001a113eccbca5896005388aa74f
Content-Type: text/plain; charset=UTF-8

On 26 July 2016 at 15:19, Robert P. J. Day <rpjday@crashcourse.ca> wrote:

>   i'm good with that, and one more (potentially idiotic) question
> about run-postinsts. i note in the OE recipe file that it inherits
> "update-rc.d", but i'm not sure why.
>
>   AIUI (and i could be totally off-base here), i thought systemd
> needed update-rc.d only for backward compatibility for sysvinit-style
> services, is that right?
>
>   so while run-postinsts is free to inherit update-rc.d, does that
> have any value if one is not using any sysvinit-driven services? or am
> i misunderstanding the fundamental functionality of update-rc.d?
>

It inherits update-rcd and systemd so that it runs on both systemd and
sysvinit systems.

Ross

--001a113eccbca5896005388aa74f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 26 July 2016 at 15:19, Robert P. J. Day <span dir=3D"ltr">&lt;<a href=3D=
"mailto:rpjday@crashcourse.ca" target=3D"_blank">rpjday@crashcourse.ca</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":38l" class=
=3D"a3s aXjCH m15627962c5aa2b6e">=C2=A0 i&#39;m good with that, and one mor=
e (potentially idiotic) question<br>
about run-postinsts. i note in the OE recipe file that it inherits<br>
&quot;update-rc.d&quot;, but i&#39;m not sure why.<br>
<br>
=C2=A0 AIUI (and i could be totally off-base here), i thought systemd<br>
needed update-rc.d only for backward compatibility for sysvinit-style<br>
services, is that right?<br>
<br>
=C2=A0 so while run-postinsts is free to inherit update-rc.d, does that<br>
have any value if one is not using any sysvinit-driven services? or am<br>
i misunderstanding the fundamental functionality of update-rc.d?</div></blo=
ckquote></div><br>It inherits update-rcd and systemd so that it runs on bot=
h systemd and sysvinit systems.</div><div class=3D"gmail_extra"><br></div><=
div class=3D"gmail_extra">Ross</div></div>

--001a113eccbca5896005388aa74f--
