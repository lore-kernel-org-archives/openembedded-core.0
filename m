Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 8EDBB77E0E
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 17 May 2017 16:18:12 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id 70so16089024wmq.1
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 17 May 2017 09:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=4PUMLhvfUFrlpYSh1FEVMZDFjDUQn8B1bxvGzEwB+nw=;
	b=CxjLqpCC9KSx0rtqOjA8QSJ9XtLjVoeaJQkM4UmLleFCOk0ndAVbqTuM5POcoDiFxo
	UFIr18Y0W3ZpArDzslakv2ocYACN8e9H4YbIBjYb62iC/mh9sEvHIS6YT4lqROeMrGGP
	+fe7tsGH9QFTc6Mt2R1v0ieIhj/EjOdd/Suske1JVOd8SMOQ/pRMFwX7PdsSh51YImro
	TfbiMlts7MBTl+gs3JIROJtOP869LAmU2aEWik16uy91+nrIGLrGvktVrTkJfD6SN1B8
	NnY7HUAQn2rg7vjFQXtQ6Xd/mddSRmlrNtgA87K8mpIqiemN0CgeTNCgzxtZCD98LNZG
	FzuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=4PUMLhvfUFrlpYSh1FEVMZDFjDUQn8B1bxvGzEwB+nw=;
	b=ty4dhQOP6J6ggHp48rbufhyNpgAO1Lj/UpGt0+bXT6Thp0UdjHiK5uIOuYlNv+qrfD
	/SoUxBBVwDNKGC24X0SG6zYOIa26Dxd8lLl+KrMN17XaKUtzjz+1qiExSUxIEpRELNxo
	hwTw9ijOLjeagKvdOvJOmlDadzX6s/T3IbTa5NswNsrGL0odG29MFCyJkXrBRciKdkb9
	SUYBDtZw9rKgLhe/VI6xhzWlWPKeipOphFeOAJCOFg+KzWdoBn+ISPEV9dwVLngIIRYC
	SizEtYwsdb7ElOc6whBWYQy8nsFB/R64Q89D+7pbjh6FE6DZQzM3+MK07G4JcJrRUgUl
	1ntQ==
X-Gm-Message-State: AODbwcA1oOEiNSoLMgAsLvdXjfv1FzMbeyFxTWHQ9PNcU/HeVSXAjCEC
	t3y3q4kBHNMWUNuu34izRvVV9DkYjg==
X-Received: by 10.80.177.8 with SMTP id k8mr3656010edd.4.1495037892375; Wed,
	17 May 2017 09:18:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.213.154 with HTTP; Wed, 17 May 2017 09:18:11 -0700 (PDT)
In-Reply-To: <DM5PR05MB2954072E97220E285EBB4860BBE70@DM5PR05MB2954.namprd05.prod.outlook.com>
References: <BN6PR05MB29463641747B05CF02AB8AEBBBE60@BN6PR05MB2946.namprd05.prod.outlook.com>
	<DM5PR05MB2954072E97220E285EBB4860BBE70@DM5PR05MB2954.namprd05.prod.outlook.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 17 May 2017 18:18:11 +0200
Message-ID: <CA+chaQd4NPqyLQpB7RQrET=rvJp4+ChGNQje4d+hnAWEx0dd5g@mail.gmail.com>
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
X-List-Received-Date: Wed, 17 May 2017 16:18:12 -0000
Content-Type: multipart/alternative; boundary="f403045c262e8038e8054fbaa27f"

--f403045c262e8038e8054fbaa27f
Content-Type: text/plain; charset="UTF-8"

Isn't it enough to set RPROVIDES/RCONFLICTS/RREPLACES combo to say that
eudev really replaces old udev even when the package version is lower.

This used to fix such upgrade-path issues before, but I've stopped testing
them long time ago.

On Wed, May 17, 2017 at 5:26 PM, Bryan Evenson <bevenson@melinkcorp.com>
wrote:

> All,
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
> > packages and new dependencies are correctly being identified for upgrade
> > by running "opkg update; opkg upgrade --download-only" from the
> > command line and comparing what is in the opkg cache directory with what
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
> > pkg_hash_fetch_best_installation_candidate: apkg=udev nprovides=2.
> > pkg_hash_fetch_best_installation_candidate: Adding eudev to providers.
> > pkg_hash_fetch_best_installation_candidate: Adding udev to providers.
> > pkg_hash_fetch_best_installation_candidate: eudev arch=armv5e
> > arch_priority=41 version=3.2.
> > pkg_hash_fetch_best_installation_candidate: udev arch=arm926ejste
> > arch_priority=51 version=182.
> > pkg_hash_fetch_best_installation_candidate: Candidate: udev 182.
> > pkg_hash_fetch_best_installation_candidate: 2 matching pkgs for
> > apkg=udev:
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
> First, I created eudev_%.bbappend in my private layer and added "PE = "1""
> to the bbappend.  Since the numbering scheme changed between udev and
> eudev, I figured this was a reasonable move.  This brought the update
> udev-cache in for upgrade, but not eudev.  In my private layer, I also have
> an image version number package.  I added eudev to the RDEPENDS list for
> this package since my image, which now has linux version 4.4, does depend
> on eudev.
>
> Does this sound reasonable?  Is there a better way to do the same thing?
>
> Thanks,
> Bryan
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

--f403045c262e8038e8054fbaa27f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Isn&#39;t it enough to set RPROVIDES/RCONFLICTS/RREPLACES =
combo to say that eudev really replaces old udev even when the package vers=
ion is lower.<div><br></div><div>This used to fix such upgrade-path issues =
before, but I&#39;ve stopped testing them long time ago.</div></div><div cl=
ass=3D"gmail_extra"><br><div class=3D"gmail_quote">On Wed, May 17, 2017 at =
5:26 PM, Bryan Evenson <span dir=3D"ltr">&lt;<a href=3D"mailto:bevenson@mel=
inkcorp.com" target=3D"_blank">bevenson@melinkcorp.com</a>&gt;</span> wrote=
:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">All,<br>
<div><div class=3D"h5"><br>
&gt; -----Original Message-----<br>
&gt; From: <a href=3D"mailto:openembedded-core-bounces@lists.openembedded.o=
rg">openembedded-core-bounces@<wbr>lists.openembedded.org</a><br>
&gt; [mailto:<a href=3D"mailto:openembedded-core-bounces@lists.openembedded=
.org">openembedded-core-<wbr>bounces@lists.openembedded.org</a><wbr>] On Be=
half<br>
&gt; Of Bryan Evenson<br>
&gt; Sent: Tuesday, May 16, 2017 2:01 PM<br>
&gt; To: <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openem=
bedded-core@lists.<wbr>openembedded.org</a><br>
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
&gt; upgrade udev to eudev?<br>
<br>
</div></div>I made some changes and now both eudev and udev-cache are being=
 pulled in on upgrade.=C2=A0 However, I&#39;d like a second opinion that wh=
at I did was reasonable.<br>
<br>
First, I created eudev_%.bbappend in my private layer and added &quot;PE =
=3D &quot;1&quot;&quot; to the bbappend.=C2=A0 Since the numbering scheme c=
hanged between udev and eudev, I figured this was a reasonable move.=C2=A0 =
This brought the update udev-cache in for upgrade, but not eudev.=C2=A0 In =
my private layer, I also have an image version number package.=C2=A0 I adde=
d eudev to the RDEPENDS list for this package since my image, which now has=
 linux version 4.4, does depend on eudev.<br>
<br>
Does this sound reasonable?=C2=A0 Is there a better way to do the same thin=
g?<br>
<br>
Thanks,<br>
Bryan<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt;<br>
&gt; Thanks,<br>
&gt; Bryan<br>
&gt; --<br>
&gt; ______________________________<wbr>_________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.<wbr>openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<=
wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br></div>

--f403045c262e8038e8054fbaa27f--
