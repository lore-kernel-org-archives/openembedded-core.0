Received: from mail-la0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1TfWfs-0007m0-Cj
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Dec 2012 15:07:16 +0100
Received: by mail-la0-f47.google.com with SMTP id u2so1995166lag.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Dec 2012 05:52:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=wBLY0szQZ2e1BH3C1Gfd2V2MygkAqsCJyNJKHwNhgBs=;
	b=MJlQklTmu2m1TNJCEGSvjgEFG7Bq2q3Dna8RqumRuTEbjDgURF+p9gyTBZQzDdblqG
	Hq9GpmNaiLofwOeThL2dmg5LbMpy7KZuyjE+AIvZ+6QnlcqCIl4oyGhvGbP22160266l
	Q20J9fQy8xvlJgpE0FnNQkChpQEfhAcChA93f7UjpQGc+v8y+JGtAOUPC2H602QogICx
	fa4QkiMDwIa3KF5Z/SB6rvjOw68N/Sc+0lkN5iKeGSbhrw2ZVRCqdyevME7PCpth1O04
	0EOf0RyNqSVPOl6FFNHUn13ldFX9czzGzUl5K2OALhd3f0fBnxJMRmqnlgCjn9VGAMB3
	3phQ==
MIME-Version: 1.0
Received: by 10.152.105.33 with SMTP id gj1mr9507302lab.49.1354542766352; Mon,
	03 Dec 2012 05:52:46 -0800 (PST)
Received: by 10.114.17.8 with HTTP; Mon, 3 Dec 2012 05:52:46 -0800 (PST)
In-Reply-To: <3752816.NQS16Yy7Ff@yiqingliang-pc>
References: <3752816.NQS16Yy7Ff@yiqingliang-pc>
Date: Mon, 3 Dec 2012 08:52:46 -0500
Message-ID: <CADkTA4Ma2+H12cF21C5w5Rh6ULKiwGPf+49ZLdsUEp9Zudxi5A@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: niqingliang2003@gmail.com
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: why remove yaffs2?
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
X-List-Received-Date: Mon, 03 Dec 2012 14:07:17 -0000
Content-Type: multipart/alternative; boundary=f46d040716e36be81304cff31082

--f46d040716e36be81304cff31082
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Dec 3, 2012 at 9:03 AM, <niqingliang2003@gmail.com> wrote:

> Hi, All:
>
> I have untouched oe for several months, and recently found that yaffs is
> dropped, and also in official kernel, why?
>

Can you clarify ? Which kernel ? Yaffs has never been a mainline
filesystem, but
I have it in the yocto released kernels.

http://git.yoctoproject.org/cgit/cgit.cgi/linux-yocto-3.4/commit/?h=standard/base&id=a8291fa6f723b0182d2b7033b5d59f412ba7cf72

Cheers,

Bruce



>
>
> Yi qingliang
> Nanjing Jilong
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--f46d040716e36be81304cff31082
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 3, 2012 at 9:03 AM,  <span dir=3D"ltr">&lt;<a href=3D"mailto:ni=
qingliang2003@gmail.com" target=3D"_blank">niqingliang2003@gmail.com</a>&gt=
;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"gmail_quote"><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;pad=
ding-left:1ex">
Hi, All:<br>
<br>
I have untouched oe for several months, and recently found that yaffs is<br=
>
dropped, and also in official kernel, why?<br></blockquote><div><br></div><=
div>Can you clarify ? Which kernel ? Yaffs has never been a mainline filesy=
stem, but</div><div>I have it in the yocto released kernels.</div><div>
<br></div><div><a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/linux-y=
octo-3.4/commit/?h=3Dstandard/base&amp;id=3Da8291fa6f723b0182d2b7033b5d59f4=
12ba7cf72">http://git.yoctoproject.org/cgit/cgit.cgi/linux-yocto-3.4/commit=
/?h=3Dstandard/base&amp;id=3Da8291fa6f723b0182d2b7033b5d59f412ba7cf72</a><b=
r>
</div><div><br></div><div>Cheers,</div><div><br></div><div>Bruce</div><div>=
<br></div><div>=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);b=
order-left-style:solid;padding-left:1ex">

<br>
<br>
Yi qingliang<br>
Nanjing Jilong<br>
<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>&quot;Thou s=
halt not follow the NULL pointer, for chaos and madness await thee at its e=
nd&quot;<br>
</div>

--f46d040716e36be81304cff31082--
