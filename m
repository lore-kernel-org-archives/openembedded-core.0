Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 3698B77E81
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 17 May 2017 17:51:40 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id 70so19024754wmq.1
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 17 May 2017 10:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=a0x9uvwoV1GPsHdlmv6hyoT50GlY1jM7pnDRmW7MzTA=;
	b=ua/69Fr3Ysm8nh3E9+E5jSptyX9G5TnvBdY4wJX8W1WJqw+8VJXTPe4LRBV0YxHNXC
	WanjnI5fkeaOAflTBizYeL17x+eINvcjIBF8JxjLtL5TF8nPVq6BzRkoxwby0hYgcMFL
	OKLnz3XW9C2nB64B3xCOZvCGqH9O5AJ4Trl+NafUJUhk46ScayxEQFLjIDDiW5ZF2bHl
	ebxtWGVYzI1ZMKXR1U/34Cp8u8vkEPdzs69Z+0PKFamA8B1PJchZsDLl0T07lN6q9/dE
	D92IfyMKkxhdwO7tXvno1H5gVOHucJ921E+BbxW+ErOx2rG9osnGfvWpXArXhMd+tkIN
	Z2Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=a0x9uvwoV1GPsHdlmv6hyoT50GlY1jM7pnDRmW7MzTA=;
	b=o5EVf1ob4htc+zI+JlsO0SptzYv/mWFHf09IOs6sSsGfaoVF2w0KRHQYh6qAZ7qpi6
	52m/LJjLJiciv5OF/5Pz6071CerTGh0fV3nrrt3fdw4CXRoqWHXg/jL7Hjl7eodY0Ckp
	kHd4/nK+FvtZYN9u/Sfx5JftH094Xc88GGx7O3UuEUOwqC0hGuvT3E3ASatHT7PYi5Iu
	F9dJsQ4GNCzHcX4RmK0y8tAdzZJj9oktEvB1Jrvjv+C+f8sPpNRJcI3rgR7J65Ei7UD6
	WoJgEWTT2GPKwreutF/hRCHz2uMMtr1CZAv3JsIUUQtfaSMYQKJ91stpPCbrIBiS9Ici
	V8uw==
X-Gm-Message-State: AODbwcDfVh302Bhp/KnwUOzqMzeOjRBtA77IKj+1RVN5rNVWZvHNKuBL
	wo9pzz47Zd04v7+sCW9BnSMAb0h0vA==
X-Received: by 10.80.154.65 with SMTP id o59mr3942098edb.181.1495043501241;
	Wed, 17 May 2017 10:51:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.213.154 with HTTP; Wed, 17 May 2017 10:51:40 -0700 (PDT)
In-Reply-To: <DM5PR05MB2954CA5DFFA544060B1AC3FCBBE70@DM5PR05MB2954.namprd05.prod.outlook.com>
References: <BN6PR05MB29463641747B05CF02AB8AEBBBE60@BN6PR05MB2946.namprd05.prod.outlook.com>
	<DM5PR05MB2954072E97220E285EBB4860BBE70@DM5PR05MB2954.namprd05.prod.outlook.com>
	<CA+chaQd4NPqyLQpB7RQrET=rvJp4+ChGNQje4d+hnAWEx0dd5g@mail.gmail.com>
	<DM5PR05MB2954CA5DFFA544060B1AC3FCBBE70@DM5PR05MB2954.namprd05.prod.outlook.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 17 May 2017 19:51:40 +0200
Message-ID: <CA+chaQcby5PK1YJfByF1ToKGy7kLtW7GLTeozdScXqMy=X+1jw@mail.gmail.com>
To: Bryan Evenson <bevenson@melinkcorp.com>
Cc: "Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>
Subject: Re: eudev: opkg not automatically upgrading from udev to eudev
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
X-List-Received-Date: Wed, 17 May 2017 17:51:41 -0000
Content-Type: multipart/alternative; boundary="94eb2c1954e4d0bc69054fbbf09a"

--94eb2c1954e4d0bc69054fbbf09a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes, that sounds reasonable, just keep in mind that PE bumps are forever
(once you introduce it in your binary feed, you probably wont be able to
ever remove the .bbappend with it), unless you get the PE bump merged in
oe-core as well.

I think you should just submit the fix to oe-core and then your .bbappend
will be only temporary until you upgrade to the release which already
includes the fix.

On Wed, May 17, 2017 at 7:24 PM, Bryan Evenson <bevenson@melinkcorp.com>
wrote:

> Martin,
>
>
>
> Thanks for the pointers.  I think I finally have it working correctly. I
> added RPROVIDES/RCONFLICTS/RREPLACES in my eudev bbappend to state it
> replaces udev.  I also needed to set PE =3D 1 for udev-cache.  Since
> udev-cache didn=E2=80=99t change the package name, I can=E2=80=99t say it
> RCONFLICTS/RREPLACES itself.
>
>
>
> Thanks,
>
> Bryan
>
>
>
> *From:* Martin Jansa [mailto:martin.jansa@gmail.com]
> *Sent:* Wednesday, May 17, 2017 12:18 PM
> *To:* Bryan Evenson <bevenson@melinkcorp.com>
> *Cc:* Openembedded-core@lists.openembedded.org
> *Subject:* Re: [OE-core] eudev: opkg not automatically upgrading from
> udev to eudev
>
>
>
> Isn't it enough to set RPROVIDES/RCONFLICTS/RREPLACES combo to say that
> eudev really replaces old udev even when the package version is lower.
>
>
>
> This used to fix such upgrade-path issues before, but I've stopped testin=
g
> them long time ago.
>
>
>
> On Wed, May 17, 2017 at 5:26 PM, Bryan Evenson <bevenson@melinkcorp.com>
> wrote:
>
> All,
>
>
> > -----Original Message-----
> > From: openembedded-core-bounces@lists.openembedded.org
> > [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
> > Of Bryan Evenson
> > Sent: Tuesday, May 16, 2017 2:01 PM
> > To: Openembedded-core@lists.openembedded.org
> > Subject: [OE-core] eudev: opkg not automatically upgrading from udev to
> > eudev
> >
> >
> > I have an image based on core-image-minimal that uses sysvinit for init
> and
> > opkg for package management.  I am doing some upgrade testing and I see
> > an issue with eudev.  I am testing upgrading an image that was built
> under
> > dizzy to my latest image built under morty.  I'm first testing that all
> the correct
> > packages and new dependencies are correctly being identified for upgrad=
e
> > by running "opkg update; opkg upgrade --download-only" from the
> > command line and comparing what is in the opkg cache directory with wha=
t
> > was available.  All packages except eudev and udev-cache are being
> > downloaded for upgrade.
> >
> > I ran the opkg upgrade again with the -V4 option for additional debug
> output
> > Here's what I saw in one section regarding udev:
> >
> > pkg_hash_fetch_best_installation_candidate: Best installation candidate
> for
> > udev:
> > pkg_hash_fetch_best_installation_candidate: apkg=3Dudev nprovides=3D2.
> > pkg_hash_fetch_best_installation_candidate: Adding eudev to providers.
> > pkg_hash_fetch_best_installation_candidate: Adding udev to providers.
> > pkg_hash_fetch_best_installation_candidate: eudev arch=3Darmv5e
> > arch_priority=3D41 version=3D3.2.
> > pkg_hash_fetch_best_installation_candidate: udev arch=3Darm926ejste
> > arch_priority=3D51 version=3D182.
> > pkg_hash_fetch_best_installation_candidate: Candidate: udev 182.
> > pkg_hash_fetch_best_installation_candidate: 2 matching pkgs for
> > apkg=3Dudev:
> > pkg_hash_fetch_best_installation_candidate: eudev 3.2 armv5e
> > pkg_hash_fetch_best_installation_candidate: udev 182 arm926ejste
> > opkg_upgrade_pkg: Comparing visible versions of pkg udev:
> >         182-r9.9 is installed
> >         182-r9.9 is available
> >         0 was comparison result
> > opkg_upgrade_pkg: Package udev (182-r9.9) installed in root is up to
> date.
> >
> > I'm assuming the problem is that udev is version 182 and eudev is
> version 3.2
> > and that opkg doesn't think udev needs to be upgraded.  Is there an
> > RDEPENDS that needs to be added somewhere so opkg sees that it needs to
> > upgrade udev to eudev?
>
> I made some changes and now both eudev and udev-cache are being pulled in
> on upgrade.  However, I'd like a second opinion that what I did was
> reasonable.
>
> First, I created eudev_%.bbappend in my private layer and added "PE =3D "=
1""
> to the bbappend.  Since the numbering scheme changed between udev and
> eudev, I figured this was a reasonable move.  This brought the update
> udev-cache in for upgrade, but not eudev.  In my private layer, I also ha=
ve
> an image version number package.  I added eudev to the RDEPENDS list for
> this package since my image, which now has linux version 4.4, does depend
> on eudev.
>
> Does this sound reasonable?  Is there a better way to do the same thing?
>
> Thanks,
> Bryan
>
>
> >
> > Thanks,
> > Bryan
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
>

--94eb2c1954e4d0bc69054fbbf09a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Yes, that sounds reasonable, just keep in mind that PE bum=
ps are forever (once you introduce it in your binary feed, you probably won=
t be able to ever remove the .bbappend with it), unless you get the PE bump=
 merged in oe-core as well.<div><br></div><div>I think you should just subm=
it the fix to oe-core and then your .bbappend will be only temporary until =
you upgrade to the release which already includes the fix.</div></div><div =
class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Wed, May 17, 2017 a=
t 7:24 PM, Bryan Evenson <span dir=3D"ltr">&lt;<a href=3D"mailto:bevenson@m=
elinkcorp.com" target=3D"_blank">bevenson@melinkcorp.com</a>&gt;</span> wro=
te:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex">





<div lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"m_-887092949972708242WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif">Martin,<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif">Thanks for the pointers.=C2=A0 I think I finally ha=
ve it working correctly. I added RPROVIDES/RCONFLICTS/RREPLACES in my eudev=
 bbappend to state it replaces udev.=C2=A0 I also needed
 to set PE =3D 1 for udev-cache.=C2=A0 Since udev-cache didn=E2=80=99t chan=
ge the package name, I can=E2=80=99t say it RCONFLICTS/RREPLACES itself.<u>=
</u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif">Thanks,<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif">Bryan<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif"><u></u>=C2=A0<u></u></span></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #e1e1e1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:11.0pt;font-family:&quot=
;Calibri&quot;,sans-serif">From:</span></b><span style=3D"font-size:11.0pt;=
font-family:&quot;Calibri&quot;,sans-serif"> Martin Jansa [mailto:<a href=
=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com=
</a><wbr>]
<br>
<b>Sent:</b> Wednesday, May 17, 2017 12:18 PM<br>
<b>To:</b> Bryan Evenson &lt;<a href=3D"mailto:bevenson@melinkcorp.com" tar=
get=3D"_blank">bevenson@melinkcorp.com</a>&gt;<br>
<b>Cc:</b> <a href=3D"mailto:Openembedded-core@lists.openembedded.org" targ=
et=3D"_blank">Openembedded-core@lists.<wbr>openembedded.org</a><br>
<b>Subject:</b> Re: [OE-core] eudev: opkg not automatically upgrading from =
udev to eudev<u></u><u></u></span></p>
</div>
</div><div><div class=3D"h5">
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<p class=3D"MsoNormal">Isn&#39;t it enough to set RPROVIDES/RCONFLICTS/RREP=
LACES combo to say that eudev really replaces old udev even when the packag=
e version is lower.<u></u><u></u></p>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">This used to fix such upgrade-path issues before, bu=
t I&#39;ve stopped testing them long time ago.<u></u><u></u></p>
</div>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<p class=3D"MsoNormal">On Wed, May 17, 2017 at 5:26 PM, Bryan Evenson &lt;<=
a href=3D"mailto:bevenson@melinkcorp.com" target=3D"_blank">bevenson@melink=
corp.com</a>&gt; wrote:<u></u><u></u></p>
<blockquote style=3D"border:none;border-left:solid #cccccc 1.0pt;padding:0i=
n 0in 0in 6.0pt;margin-left:4.8pt;margin-right:0in">
<p class=3D"MsoNormal">All,<u></u><u></u></p>
<div>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><br>
&gt; -----Original Message-----<br>
&gt; From: <a href=3D"mailto:openembedded-core-bounces@lists.openembedded.o=
rg" target=3D"_blank">openembedded-core-bounces@<wbr>lists.openembedded.org=
</a><br>
&gt; [mailto:<a href=3D"mailto:openembedded-core-bounces@lists.openembedded=
.org" target=3D"_blank">openembedded-core-<wbr>bounces@lists.openembedded.o=
rg</a><wbr>] On Behalf<br>
&gt; Of Bryan Evenson<br>
&gt; Sent: Tuesday, May 16, 2017 2:01 PM<br>
&gt; To: <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=
=3D"_blank">Openembedded-core@lists.<wbr>openembedded.org</a><br>
&gt; Subject: [OE-core] eudev: opkg not automatically upgrading from udev t=
o<br>
&gt; eudev<br>
&gt;<br>
&gt;<br>
&gt; I have an image based on core-image-minimal that uses sysvinit for ini=
t and<br>
&gt; opkg for package management.=C2=A0 I am doing some upgrade testing and=
 I see<br>
&gt; an issue with eudev.=C2=A0 I am testing upgrading an image that was bu=
ilt under<br>
&gt; dizzy to my latest image built under morty.=C2=A0 I&#39;m first testin=
g that all the correct<br>
&gt; packages and new dependencies are correctly being identified for upgra=
de<br>
&gt; by running &quot;opkg update; opkg upgrade --download-only&quot; from =
the<br>
&gt; command line and comparing what is in the opkg cache directory with wh=
at<br>
&gt; was available.=C2=A0 All packages except eudev and udev-cache are bein=
g<br>
&gt; downloaded for upgrade.<br>
&gt;<br>
&gt; I ran the opkg upgrade again with the -V4 option for additional debug =
output<br>
&gt; Here&#39;s what I saw in one section regarding udev:<br>
&gt;<br>
&gt; pkg_hash_fetch_best_<wbr>installation_candidate: Best installation can=
didate for<br>
&gt; udev:<br>
&gt; pkg_hash_fetch_best_<wbr>installation_candidate: apkg=3Dudev nprovides=
=3D2.<br>
&gt; pkg_hash_fetch_best_<wbr>installation_candidate: Adding eudev to provi=
ders.<br>
&gt; pkg_hash_fetch_best_<wbr>installation_candidate: Adding udev to provid=
ers.<br>
&gt; pkg_hash_fetch_best_<wbr>installation_candidate: eudev arch=3Darmv5e<b=
r>
&gt; arch_priority=3D41 version=3D3.2.<br>
&gt; pkg_hash_fetch_best_<wbr>installation_candidate: udev arch=3Darm926ejs=
te<br>
&gt; arch_priority=3D51 version=3D182.<br>
&gt; pkg_hash_fetch_best_<wbr>installation_candidate: Candidate: udev 182.<=
br>
&gt; pkg_hash_fetch_best_<wbr>installation_candidate: 2 matching pkgs for<b=
r>
&gt; apkg=3Dudev:<br>
&gt; pkg_hash_fetch_best_<wbr>installation_candidate: eudev 3.2 armv5e<br>
&gt; pkg_hash_fetch_best_<wbr>installation_candidate: udev 182 arm926ejste<=
br>
&gt; opkg_upgrade_pkg: Comparing visible versions of pkg udev:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0182-r9.9 is installed<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0182-r9.9 is available<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 was comparison result<br>
&gt; opkg_upgrade_pkg: Package udev (182-r9.9) installed in root is up to d=
ate.<br>
&gt;<br>
&gt; I&#39;m assuming the problem is that udev is version 182 and eudev is =
version 3.2<br>
&gt; and that opkg doesn&#39;t think udev needs to be upgraded.=C2=A0 Is th=
ere an<br>
&gt; RDEPENDS that needs to be added somewhere so opkg sees that it needs t=
o<br>
&gt; upgrade udev to eudev?<u></u><u></u></p>
</div>
</div>
<p class=3D"MsoNormal">I made some changes and now both eudev and udev-cach=
e are being pulled in on upgrade.=C2=A0 However, I&#39;d like a second opin=
ion that what I did was reasonable.<br>
<br>
First, I created eudev_%.bbappend in my private layer and added &quot;PE =
=3D &quot;1&quot;&quot; to the bbappend.=C2=A0 Since the numbering scheme c=
hanged between udev and eudev, I figured this was a reasonable move.=C2=A0 =
This brought the update udev-cache in for upgrade, but not eudev.=C2=A0
 In my private layer, I also have an image version number package.=C2=A0 I =
added eudev to the RDEPENDS list for this package since my image, which now=
 has linux version 4.4, does depend on eudev.<br>
<br>
Does this sound reasonable?=C2=A0 Is there a better way to do the same thin=
g?<br>
<br>
Thanks,<br>
Bryan<u></u><u></u></p>
<div>
<div>
<p class=3D"MsoNormal"><br>
&gt;<br>
&gt; Thanks,<br>
&gt; Bryan<br>
&gt; --<br>
&gt; ______________________________<wbr>_________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"=
_blank">Openembedded-core@lists.<wbr>openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" target=3D"_blank">
http://lists.openembedded.org/<wbr>mailman/listinfo/openembedded-<wbr>core<=
/a><br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" target=3D"_blank">http://lists.openembedded.org/<wbr>mailman/listinfo/ope=
nembedded-<wbr>core</a><u></u><u></u></p>
</div>
</div>
</blockquote>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
</div></div></div>
</div>
</div>

</blockquote></div><br></div>

--94eb2c1954e4d0bc69054fbbf09a--
