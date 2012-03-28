Received: from mail-vb0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dromede@gmail.com>) id 1SCqcT-00029z-5K
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Mar 2012 13:00:49 +0200
Received: by vbbfr13 with SMTP id fr13so659599vbb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Mar 2012 03:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=U4bDgWF6vCGiD0B89jq4AogvPpoGGhN3NfmrSytxuCQ=;
	b=j1cKrjR5ssv1C21Ozwk72gh98CGgBjLTH2J6Q/NaSjyI1oyQDpk5EHPDlChhbVjgFN
	Y7qz/tAjS6w9JBLBZVaHyX444rMC21rPzapEgY5FrhGrH+oM87tJrG0TxQn2XjCLGn8/
	OvrEkNbuPz6r6pXoxx+BGuPsHCRaVAKaoBy9uhtwDm/j35/SU3a2BMBD8laecxjVPxc2
	sfvr0lECVFeNI31mDgv3JLeYOoiIaOT3y+cR4QSqzTwzOueIIVlOH1fnQpZob+yqRose
	7iOj3nYenljOGtuiaQXpRG+pGyHLXkCA+IPQkcp7E3XqdokS5nSzbgDvRdPDaY5D3eKB
	F5wg==
MIME-Version: 1.0
Received: by 10.52.68.228 with SMTP id z4mr3553584vdt.1.1332931906656; Wed, 28
	Mar 2012 03:51:46 -0700 (PDT)
Received: by 10.52.19.193 with HTTP; Wed, 28 Mar 2012 03:51:46 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.02.1203280532530.22292@oneiric>
References: <alpine.DEB.2.02.1203270815010.3125@oneiric>
	<1704770.YM0OKmOcSp@helios> <20120328024204.GE17470@denix.org>
	<C26382903E56411CA8FD5CF05308DA30@gmail.com>
	<alpine.DEB.2.02.1203280532530.22292@oneiric>
Date: Wed, 28 Mar 2012 12:51:46 +0200
Message-ID: <CAHod+GfV+mzvHF=SGtKWTL7GP87-pMeTbtf183m=jU_5PM=YYw@mail.gmail.com>
From: =?UTF-8?B?TWFya28gS2F0acSH?= <dromede@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: adding a single package to an image -- what's the proper way?
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
X-List-Received-Date: Wed, 28 Mar 2012 11:00:49 -0000
Content-Type: multipart/alternative; boundary=20cf3079bbc0ce582904bc4b64f6

--20cf3079bbc0ce582904bc4b64f6
Content-Type: text/plain; charset=ISO-8859-1

I always use "bitbake -c clean -c cleansstate package" for that purpose.

On Wed, Mar 28, 2012 at 11:35 AM, Robert P. J. Day <rpjday@crashcourse.ca>wrote:

> On Tue, 27 Mar 2012, Christopher Larson wrote:
>
> > I IMAGE_INSTALL_append or IMAGE_INSTALL_append_pn-core-image-minimal
> > or whatever when I need to quickly add a package temporarily,
> > myself.
>
>   once i add this package and build a new image to verify it was
> added, i want to revert and rebuild the original QEMU image again.  so
> after removing that line from local.conf, what's the bitbake clean
> incantation to remove all traces of sysfsutils from my build
> directory, so that i can rebuild the image with a simple
>
>  $ bitbake core-image-minimal
>
> thanks.
>
> rday
>
> --
>
> ========================================================================
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                        http://crashcourse.ca
>
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> ========================================================================
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

--20cf3079bbc0ce582904bc4b64f6
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

I always use &quot;bitbake -c clean -c cleansstate package&quot; for that p=
urpose.<br><br><div class=3D"gmail_quote">On Wed, Mar 28, 2012 at 11:35 AM,=
 Robert P. J. Day <span dir=3D"ltr">&lt;<a href=3D"mailto:rpjday@crashcours=
e.ca">rpjday@crashcourse.ca</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On Tue, 27 Mar 2012, Chris=
topher Larson wrote:<br>
<br>
</div><div class=3D"im">&gt; I IMAGE_INSTALL_append or IMAGE_INSTALL_append=
_pn-core-image-minimal<br>
&gt; or whatever when I need to quickly add a package temporarily,<br>
&gt; myself.<br>
<br>
</div> =A0once i add this package and build a new image to verify it was<br=
>
added, i want to revert and rebuild the original QEMU image again. =A0so<br=
>
after removing that line from local.conf, what&#39;s the bitbake clean<br>
incantation to remove all traces of sysfsutils from my build<br>
directory, so that i can rebuild the image with a simple<br>
<br>
 =A0$ bitbake core-image-minimal<br>
<br>
thanks.<br>
<div class=3D"im HOEnZb"><br>
rday<br>
<br>
--<br>
<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
Robert P. J. Day =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 Ottawa, Ontario, CANADA<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0<a href=3D"http://crashcour=
se.ca" target=3D"_blank">http://crashcourse.ca</a><br>
<br>
Twitter: =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 <a href=3D"http://twitter.com/rpjday" target=3D"_blank">http://=
twitter.com/rpjday</a><br>
LinkedIn: =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 <a hr=
ef=3D"http://ca.linkedin.com/in/rpjday" target=3D"_blank">http://ca.linkedi=
n.com/in/rpjday</a><br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
<br>
</div><div class=3D"HOEnZb"><div class=3D"h5">_____________________________=
__________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>
</div></div></blockquote></div><br>

--20cf3079bbc0ce582904bc4b64f6--
