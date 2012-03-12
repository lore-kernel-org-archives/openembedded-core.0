Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dromede@gmail.com>) id 1S7E2s-0007ig-UP
	for openembedded-core@lists.openembedded.org;
	Mon, 12 Mar 2012 23:48:51 +0100
Received: by vcbfl13 with SMTP id fl13so5025662vcb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Mar 2012 15:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=uJ+5RW6EaUgkW0GKLmIgIgIj+CP87XwhTE4C/z7kS1E=;
	b=hXRrcuZ0tUtASzzeExn5QESbSy9T6GVB9ZjNKB0xY5/Bs4e7+BgtT4AOT4WicK1Rmc
	4EymStMBjiZK0sJ9Pp5WMuCc5/wHTKLsHBlNoilXIquE4hNlRJ6lasGc5mtpnmOGijED
	K7e85eToP56E7J6sdUIOTa8CfWleLMMfPjdbgorrRgRlupcM1JqAAh+hEMQXb3CPZiqC
	KYCGvn+zz3PVqfodA8XstDIboMZdT2VISeS9ZZ14jFYMlejOiT0AY3HrfLNDAUDIheXu
	Mog+06TbotnioT0b9+qeLpgbDRMB70bCFzb610PB1ozJBPEopJXp6HeMmsgMrB+ny6k8
	UQhw==
MIME-Version: 1.0
Received: by 10.52.68.139 with SMTP id w11mr15543655vdt.110.1331592006942;
	Mon, 12 Mar 2012 15:40:06 -0700 (PDT)
Received: by 10.52.112.39 with HTTP; Mon, 12 Mar 2012 15:40:06 -0700 (PDT)
In-Reply-To: <4F5E6A75.8050904@mlbassoc.com>
References: <4F5E6A75.8050904@mlbassoc.com>
Date: Mon, 12 Mar 2012 23:40:06 +0100
Message-ID: <CAHod+GeGDBWiBzF6LuDPfAXS5ouBg3bB_TS0AsytHaMHbAR-jw@mail.gmail.com>
From: =?UTF-8?B?TWFya28gS2F0acSH?= <dromede@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Icon problems with Sato theme
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
X-List-Received-Date: Mon, 12 Mar 2012 22:48:51 -0000
Content-Type: multipart/alternative; boundary=20cf307f37ee8f3f1c04bb136c64

--20cf307f37ee8f3f1c04bb136c64
Content-Type: text/plain; charset=ISO-8859-1

Similar things have happened to me. I tried to run oe-core built gtk 2.16
and pcmanfm on an ARM machine and pcmanfm would segfault if it didn't find
the icon it wanted. I vaguely remember similar things happening with other
gtk apps, Abiword 2.8.6 comes to mind...

This may be an issue with gdk-pixbuf, I am not sure.

On Mon, Mar 12, 2012 at 10:28 PM, Gary Thomas <gary@mlbassoc.com> wrote:

> Note: This problem was originally sent to the Poky list, but it's not
> Poky specific (I've verified it happens with other oe-core based setups)
>
> I'm trying to run the midori browser on my Poky based system.  I have
> an image which is based on core-image-sato.  I imported the midori
> recipe from OE and it builds fine.  When I run midori, it fails
> like this:
>  %midori
>  (midori:1629): Gtk-WARNING **: Error loading theme icon 'stock_new-tab'
> for stock: Icon 'stock_new-tab' not present in te
>  (midori:1629): Gtk-WARNING **: Error loading theme icon
> 'gnome-stock-trash' for stock: Icon 'gnome-stock-trash' not prese
>  (midori:1629): Gtk-WARNING **: Error loading theme icon 'gtk-undo-ltr'
> for stock: Icon 'gtk-undo-ltr' not present in thee
>  Segmentation fault
>
> I do have those icons - they come from the gnome-icon-theme package
> which I also installed.  I even tried duplicating them into the Sato
> icon tree and ran 'gtk-update-icon-cache -q /usr/share/icons/Sato'
> afterwards.  I now have these files:
>  root@logopak8347tbga:~# find /usr/share/icons -name "stock_new-tab*"
>  /usr/share/icons/Sato/16x16/**actions/stock_new-tab.png
>  /usr/share/icons/Sato/22x22/**actions/stock_new-tab.png
>  /usr/share/icons/gnome/24x24/**actions/stock_new-tab.png
>  /usr/share/icons/gnome/16x16/**actions/stock_new-tab.png
>  /usr/share/icons/gnome/22x22/**actions/stock_new-tab.png
> but I still get the same failure.
>
> The really strange thing is this is what happens if I run midori
> to the local X server.  If I 'ssh -X' into my board it works properly!
> I've run strace on it in this mode and I can see that it's using a
> different GTK theme - Raleigh, which does seem to find the icons.
>
> Any ideas how I can get this to work on my local X server?
>
> n.b. there seems to be a bug in the GTK libraries that make them fail if
> the default
> icons are not available.  It tries to render GTK_STOCK_MISSING_IMAGE for
> the missing
> icons and this fails if there is no such icon available in the set (e.g.
> in sato).
> On ARM at least, this is a fatal segmentation error.  Should I report this
> as a bug?
> Where?
>
> I've also tried to add the missing icon(s) to the sato-icon-theme package,
> but
> no matter what I do, GTK can't ever seem to find the
> GTK_STOCK_MISSING_IMAGE ('gtk-missing-image.png')
> Any ideas how to debug this?
>
> --
> ------------------------------**------------------------------
> Gary Thomas                 |  Consulting for the
> MLB Associates              |    Embedded world
> ------------------------------**------------------------------
>
> ______________________________**_________________
> Openembedded-core mailing list
> Openembedded-core@lists.**openembedded.org<Openembedded-core@lists.openembedded.org>
> http://lists.linuxtogo.org/**cgi-bin/mailman/listinfo/**openembedded-core<http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>
>

--20cf307f37ee8f3f1c04bb136c64
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Similar things have happened to me. I tried to run oe-core built gtk 2.16 a=
nd pcmanfm on an ARM machine and pcmanfm would segfault if it didn&#39;t fi=
nd the icon it wanted. I vaguely remember similar things happening with oth=
er gtk apps, Abiword 2.8.6 comes to mind...<div>
<br></div><div>This may be an issue with gdk-pixbuf, I am not sure.<br><br>=
<div class=3D"gmail_quote">On Mon, Mar 12, 2012 at 10:28 PM, Gary Thomas <s=
pan dir=3D"ltr">&lt;<a href=3D"mailto:gary@mlbassoc.com">gary@mlbassoc.com<=
/a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Note: This problem was originally sent to th=
e Poky list, but it&#39;s not<br>
Poky specific (I&#39;ve verified it happens with other oe-core based setups=
)<br>
<br>
I&#39;m trying to run the midori browser on my Poky based system. =A0I have=
<br>
an image which is based on core-image-sato. =A0I imported the midori<br>
recipe from OE and it builds fine. =A0When I run midori, it fails<br>
like this:<br>
 =A0%midori<br>
 =A0(midori:1629): Gtk-WARNING **: Error loading theme icon &#39;stock_new-=
tab&#39; for stock: Icon &#39;stock_new-tab&#39; not present in te<br>
 =A0(midori:1629): Gtk-WARNING **: Error loading theme icon &#39;gnome-stoc=
k-trash&#39; for stock: Icon &#39;gnome-stock-trash&#39; not prese<br>
 =A0(midori:1629): Gtk-WARNING **: Error loading theme icon &#39;gtk-undo-l=
tr&#39; for stock: Icon &#39;gtk-undo-ltr&#39; not present in thee<br>
 =A0Segmentation fault<br>
<br>
I do have those icons - they come from the gnome-icon-theme package<br>
which I also installed. =A0I even tried duplicating them into the Sato<br>
icon tree and ran &#39;gtk-update-icon-cache -q /usr/share/icons/Sato&#39;<=
br>
afterwards. =A0I now have these files:<br>
 =A0root@logopak8347tbga:~# find /usr/share/icons -name &quot;stock_new-tab=
*&quot;<br>
 =A0/usr/share/icons/Sato/16x16/<u></u>actions/stock_new-tab.png<br>
 =A0/usr/share/icons/Sato/22x22/<u></u>actions/stock_new-tab.png<br>
 =A0/usr/share/icons/gnome/24x24/<u></u>actions/stock_new-tab.png<br>
 =A0/usr/share/icons/gnome/16x16/<u></u>actions/stock_new-tab.png<br>
 =A0/usr/share/icons/gnome/22x22/<u></u>actions/stock_new-tab.png<br>
but I still get the same failure.<br>
<br>
The really strange thing is this is what happens if I run midori<br>
to the local X server. =A0If I &#39;ssh -X&#39; into my board it works prop=
erly!<br>
I&#39;ve run strace on it in this mode and I can see that it&#39;s using a<=
br>
different GTK theme - Raleigh, which does seem to find the icons.<br>
<br>
Any ideas how I can get this to work on my local X server?<br>
<br>
n.b. there seems to be a bug in the GTK libraries that make them fail if th=
e default<br>
icons are not available. =A0It tries to render GTK_STOCK_MISSING_IMAGE for =
the missing<br>
icons and this fails if there is no such icon available in the set (e.g. in=
 sato).<br>
On ARM at least, this is a fatal segmentation error. =A0Should I report thi=
s as a bug?<br>
Where?<br>
<br>
I&#39;ve also tried to add the missing icon(s) to the sato-icon-theme packa=
ge, but<br>
no matter what I do, GTK can&#39;t ever seem to find the GTK_STOCK_MISSING_=
IMAGE (&#39;gtk-missing-image.png&#39;)<br>
Any ideas how to debug this?<span class=3D"HOEnZb"><font color=3D"#888888">=
<br>
<br>
-- <br>
------------------------------<u></u>------------------------------<br>
Gary Thomas =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0Consulting for the<br>
MLB Associates =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A0Embedded world<br>
------------------------------<u></u>------------------------------<br>
<br>
______________________________<u></u>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.<u></u>openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/<u></u>cgi-bin/mailman/=
listinfo/<u></u>openembedded-core</a><br>
</font></span></blockquote></div><br></div>

--20cf307f37ee8f3f1c04bb136c64--
