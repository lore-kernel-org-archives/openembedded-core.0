Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1RRmXg-0005ZW-BE
	for openembedded-core@lists.openembedded.org;
	Sat, 19 Nov 2011 16:09:20 +0100
Received: by vbbey12 with SMTP id ey12so1143769vbb.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Nov 2011 07:02:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Qc8xZvctgstxKPEMG/g+O3pUkyEarYvW4b5Ud+bsA70=;
	b=GxXim+Eq6WWg76OfMLOWf0WdbOlxfztYowm3srWADnitYCLe7dASS8sc+zoqtPWmmx
	cePrtHbFbzWqxOlpwSx0DejDiet0dtXCI5PstP1csT9xH1atjBzJe7IjuHnKs5u8Upe6
	lESX2DD5GI4zJEExKO27BzUDE/oQh5Bu7luQ0=
MIME-Version: 1.0
Received: by 10.52.97.35 with SMTP id dx3mr8256317vdb.2.1321714969438; Sat, 19
	Nov 2011 07:02:49 -0800 (PST)
Received: by 10.52.28.238 with HTTP; Sat, 19 Nov 2011 07:02:49 -0800 (PST)
In-Reply-To: <1423361.Uzi15gmuni@helios>
References: <1321625613-30146-1-git-send-email-koen@dominion.thruhere.net>
	<CACW_hTYXNDBFWtxOK86fz5P55Va700rQYWpO6thrUH9OQsA+8Q@mail.gmail.com>
	<1423361.Uzi15gmuni@helios>
Date: Sat, 19 Nov 2011 16:02:49 +0100
Message-ID: <CACW_hTbp2zMZZQw17_-Pd-wSt3qfs1rs-CF8fLTyGssePwLk=A@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] shared-mime-info: fix ordering of PACKAGES
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 19 Nov 2011 15:09:20 -0000
Content-Type: multipart/alternative; boundary=20cf307f31a83f688904b217bf7f

--20cf307f31a83f688904b217bf7f
Content-Type: text/plain; charset=ISO-8859-1

2011/11/18 Paul Eggleton <paul.eggleton@linux.intel.com>

> On Friday 18 November 2011 15:28:28 Frans Meulenbroeks wrote:
> > Is ordering of PACKAGES relevant? If so, please enlighten me why.
>
> It is. The packaging code reads this in order and the first package to
> match a
> file is the package that the file will go into; thus if you want to add a
> package that will include files that would normally be in one of the
> default
> packages you need to prepend to PACKAGES so that your new package gets the
> files first.
>
> Ah, ok. understood.
Not fully sure if the current behaviour is the most desirable one.
Is it still possible to put a file into two packages by explicitly adding
it to both?

Also it might be somewhat confusing that a line that adds say a dir to a
package does not necessarily get all fies in that dir in the package
Personally I think I prefer to have all added in that case, irrespective if
a previous package already took a file from it.
Alternately it could be seen as a QA issue if a file could have been added
to two packages (in which case a more strict pattern should have been used
somewhere)

Frans

--20cf307f31a83f688904b217bf7f
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote">2011/11/18 Paul Eggleton <span dir=3D"lt=
r">&lt;<a href=3D"mailto:paul.eggleton@linux.intel.com">paul.eggleton@linux=
.intel.com</a>&gt;</span><br><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex;">
<div class=3D"im">On Friday 18 November 2011 15:28:28 Frans Meulenbroeks wr=
ote:<br>
&gt; Is ordering of PACKAGES relevant? If so, please enlighten me why.<br>
<br>
</div>It is. The packaging code reads this in order and the first package t=
o match a<br>
file is the package that the file will go into; thus if you want to add a<b=
r>
package that will include files that would normally be in one of the defaul=
t<br>
packages you need to prepend to PACKAGES so that your new package gets the<=
br>
files first.<br>
<br></blockquote><div>Ah, ok. understood.<br>Not fully sure if the current =
behaviour is the most desirable one.<br>Is it still possible to put a file =
into two packages by explicitly adding it to both?<br><br>Also it might be =
somewhat confusing that a line that adds say a dir to a package does not ne=
cessarily get all fies in that dir in the package <br>
Personally I think I prefer to have all added in that case, irrespective if=
 a previous package already took a file from it.<br>Alternately it could be=
 seen as a QA issue if a file could have been added to two packages (in whi=
ch case a more strict pattern should have been used somewhere)<br>
<br>Frans<br></div></div>

--20cf307f31a83f688904b217bf7f--
