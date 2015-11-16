Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id 531B7762B4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Nov 2015 10:38:11 +0000 (UTC)
Received: by igvg19 with SMTP id g19so72016306igv.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Nov 2015 02:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Lp1Mce3ozXZhS8Zhq3/LJXSkocvrH0sd3UVevNIAcwQ=;
	b=QBqW58ai9SDk6RU63dqKCAAWAYUXCoeHexDRZuKXJavOG2c/sYxhTw+lIqDlvnfzoI
	ejTi8AGyL4/CKrEFor6TWcRuf/buJk1ABqKssUlOfvTvh6rn9oa7rd3c+raeHh8xoH+y
	oORirDK03slCAvbB4l8co3LcJXafgw5cY0wtrS6zjUZ22kZnNuzxnSrpmeWprdKk6FB2
	0Xfd0xhZLE155sLfnSw3/G1fkIaNe4YYKcv1zga49HuNpnDhVar62aUhH5LoA2OG6vWg
	cVKxTAac2Cfacxdcu1XE0Of/lU0ysm4bwGA5BMkMQl0OmDOYzQ4fuw/R4dDY+eTO6mrm
	to9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Lp1Mce3ozXZhS8Zhq3/LJXSkocvrH0sd3UVevNIAcwQ=;
	b=C/Zmn5tW+lTvW9AKxgxEK9cNTFMX/tb9Hjuv+PctDvQY8FwY5bCK3A5LZrl0UBtkzW
	VNInHm2Pfggk7R2uyvlNnLUTnY1rrRGW2Yui+QvjCLEzOGA+rB50955jmg3sqDHhTB33
	OWrgU6ulLUifQo2uHGqav8KOu6CJO1/JAtMf3po4WX0dOFiBiVAa4lUBhsM+FDJAe0yY
	eeI1GjEc09ukTQ6ggLQrtOdWU1cOEY8WqbwMAxOWELr2M4YOQ8l7DQw0/55gXx5i2QRm
	lm5CRE2DxEduYcgATmhpsFjz3lowmyAhbuUYn9adnErO1OUdFThW7XyP/8chaX0uiEqh
	emuA==
X-Gm-Message-State: ALoCoQlyjWpnRRSUqv0c5yXkIMrTrc5ywNHfednybCopnnBVWrf7U9+4Nq+J4TY61px+amq9V55Z
X-Received: by 10.50.79.129 with SMTP id j1mr14632402igx.52.1447670291098;
	Mon, 16 Nov 2015 02:38:11 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Mon, 16 Nov 2015 02:37:51 -0800 (PST)
In-Reply-To: <20151112185907.GL2574@jama>
References: <58488.10.252.13.130.1447346734.squirrel@linux.intel.com>
	<20151112171915.GK2574@jama>
	<58904.10.252.13.130.1447349938.squirrel@linux.intel.com>
	<20151112185907.GL2574@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 16 Nov 2015 10:37:51 +0000
Message-ID: <CAJTo0LbxLwz7ijSoAmbj6ij51cGynk9Omf=M+QvbPQ7ahmo2Mg@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] qt4 moves out of oe-core - to meta-qt4, or to meta-oe?
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
X-List-Received-Date: Mon, 16 Nov 2015 10:38:12 -0000
Content-Type: multipart/alternative; boundary=089e011609fc740d670524a601f0

--089e011609fc740d670524a601f0
Content-Type: text/plain; charset=UTF-8

On 12 November 2015 at 18:59, Martin Jansa <martin.jansa@gmail.com> wrote:

> > > There is already enough meta-oe bloat moved from oe-core:
> > >
> > >
> http://lists.openembedded.org/pipermail/openembedded-core/2015-November/112665.html
> > >
> > > WARN: qt-mobility-embedded: qt-mobility-embedded rdepends on glib-2.0,
> but
> > > it isn't a build dependency?
> >
> > If increasing bloat is a problem, why do recipes in meta-oe need to be
> > maintained indefinitely? Old cruft can be dropped from meta-oe, just as
> it
> > is dropped from oe-core. Just ask the public if it's ok, set a timeframe,
> > and do it.
> >
> > qt-mobility in particular has been dead for several years, and doesn't
> > even have official upstream tarballs anymore. Why spend time fixing it?
>
> That's why there is increasing number of PNBLACKLISTs with each release.
>

The recipes were removed from oe-core as they're dead upstream, and
basically as a courtesy moved to meta-oe so anyone still using dead
software can still build it.  If they're just bitrotting and literally
nobody is using the recipes then they should be removed: meta-oe isn't a
historical archive that you're expected to maintain for the next decade.

Ross

--089e011609fc740d670524a601f0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 12 November 2015 at 18:59, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D=
"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">&gt;=
 &gt; There is already enough meta-oe bloat moved from oe-core:<br>
&gt; &gt;<br>
&gt; &gt; <a href=3D"http://lists.openembedded.org/pipermail/openembedded-c=
ore/2015-November/112665.html" rel=3D"noreferrer" target=3D"_blank">http://=
lists.openembedded.org/pipermail/openembedded-core/2015-November/112665.htm=
l</a><br>
&gt; &gt;<br>
&gt; &gt; WARN: qt-mobility-embedded: qt-mobility-embedded rdepends on glib=
-2.0, but<br>
&gt; &gt; it isn&#39;t a build dependency?<br>
&gt;<br>
&gt; If increasing bloat is a problem, why do recipes in meta-oe need to be=
<br>
&gt; maintained indefinitely? Old cruft can be dropped from meta-oe, just a=
s it<br>
&gt; is dropped from oe-core. Just ask the public if it&#39;s ok, set a tim=
eframe,<br>
&gt; and do it.<br>
&gt;<br>
&gt; qt-mobility in particular has been dead for several years, and doesn&#=
39;t<br>
&gt; even have official upstream tarballs anymore. Why spend time fixing it=
?<br>
<br>
</span>That&#39;s why there is increasing number of PNBLACKLISTs with each =
release.<br>
<div class=3D"HOEnZb"></div></blockquote></div><br>The recipes were removed=
 from oe-core as they&#39;re dead upstream, and basically as a courtesy mov=
ed to meta-oe so anyone still using dead software can still build it.=C2=A0=
 If they&#39;re just bitrotting and literally nobody is using the recipes t=
hen they should be removed: meta-oe isn&#39;t a historical archive that you=
&#39;re expected to maintain for the next decade.</div><div class=3D"gmail_=
extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--089e011609fc740d670524a601f0--
