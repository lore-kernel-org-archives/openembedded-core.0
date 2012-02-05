Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1Ru9fv-0001is-Ml
	for openembedded-core@lists.openembedded.org;
	Sun, 05 Feb 2012 22:31:07 +0100
Received: by wgbdr13 with SMTP id dr13so5002158wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Feb 2012 13:23:07 -0800 (PST)
Received: by 10.180.92.71 with SMTP id ck7mr30434314wib.3.1328476986168; Sun,
	05 Feb 2012 13:23:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.227.100.82 with HTTP; Sun, 5 Feb 2012 13:22:46 -0800 (PST)
X-Originating-IP: [79.117.107.69]
In-Reply-To: <20120205175041.GA29994@deadlock.dhs.org>
References: <1328282644-4459-1-git-send-email-andrei@gherzan.ro>
	<4F2C860C.3020006@linux.intel.com>
	<CAK18fxGND2uPFFmYaGV1o6zeQJUQXg9pFBUUrqb-z4-1gfTcgA@mail.gmail.com>
	<20120205175041.GA29994@deadlock.dhs.org>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Sun, 5 Feb 2012 23:22:46 +0200
Message-ID: <CAK18fxGC=f6Uxc0pTxVEHXnBp-701iJFkWLZJeicKq2M_b-cUQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] js: Update to v1.8.5
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
X-List-Received-Date: Sun, 05 Feb 2012 21:31:07 -0000
Content-Type: multipart/alternative; boundary=f46d043c8070da551104b83e2655

--f46d043c8070da551104b83e2655
Content-Type: text/plain; charset=ISO-8859-1

On Sun, Feb 5, 2012 at 19:50, Sergey 'Jin' Bostandzhyan <jin@mediatomb.cc>wrote:

> Hi,
>
> On Sun, Feb 05, 2012 at 06:41:54PM +0200, Andrei Gherzan wrote:
> > About DEPENDS, I couldn't find any dependencies. In order to check this
> i baked
> > js in a new build without having anything in DEPENDS and the package
> succeeded
>
> just as a hint: if you compile js with the threadsafe option you might need
> nspr too. It ships some sort of nspr with it, but I could never get it to
> compile, in the end I rolled my own nspr package and told JS configure to
> use
> it.
>
> I know, i know, I'm guilty of not submitting a patch :( Still too swamped
> to
> dig through all my changes and prepare patches...
>
> Here is the nspr stuff if you think that you need it:
>
> https://gitorious.digitalstrom.org/dss-oe/dss-oe/trees/master/dS/meta-dss11-devel/recipes-support/nspr
>
> Kind regards,
> Jin
>
>
Based on Jin's ideas i modified js and integrated nsfr as well:
JS: http://git.gherzan.ro/yocto-dev/changeset/a55b97f5e67f
NSPR: http://git.gherzan.ro/yocto-dev/changeset/40d96147ebc3

@g

--f46d043c8070da551104b83e2655
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><div class=3D"gmail_quote">On Sun, Feb 5, 2012 at 19:50, Sergey &#39;Ji=
n&#39; Bostandzhyan <span dir=3D"ltr">&lt;jin@mediatomb.cc&gt;</span> wrote=
:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">

Hi,<br>
<br>
On Sun, Feb 05, 2012 at 06:41:54PM +0200, Andrei Gherzan wrote:<br>
&gt; About DEPENDS, I couldn&#39;t find any dependencies. In order to check=
 this i baked<br>
&gt; js in a new build without having anything in DEPENDS and the package s=
ucceeded<br>
<br>
just as a hint: if you compile js with the threadsafe option you might need=
<br>
nspr too. It ships some sort of nspr with it, but I could never get it to<b=
r>
compile, in the end I rolled my own nspr package and told JS configure to u=
se<br>
it.<br>
<br>
I know, i know, I&#39;m guilty of not submitting a patch :( Still too swamp=
ed to<br>
dig through all my changes and prepare patches...<br>
<br>
Here is the nspr stuff if you think that you need it:<br>
<a href=3D"https://gitorious.digitalstrom.org/dss-oe/dss-oe/trees/master/dS=
/meta-dss11-devel/recipes-support/nspr" target=3D"_blank">https://gitorious=
.digitalstrom.org/dss-oe/dss-oe/trees/master/dS/meta-dss11-devel/recipes-su=
pport/nspr</a><br>


<br>
Kind regards,<br>
Jin<br>

<br></blockquote><div><br></div><div>Based on Jin&#39;s ideas i modified js=
 and integrated nsfr as well:</div><div>JS:=A0<a href=3D"http://git.gherzan=
.ro/yocto-dev/changeset/a55b97f5e67f">http://git.gherzan.ro/yocto-dev/chang=
eset/a55b97f5e67f</a></div>

<div>NSPR:=A0<a href=3D"http://git.gherzan.ro/yocto-dev/changeset/40d96147e=
bc3">http://git.gherzan.ro/yocto-dev/changeset/40d96147ebc3</a>=A0</div><di=
v><br></div><div>@g</div></div>

--f46d043c8070da551104b83e2655--
