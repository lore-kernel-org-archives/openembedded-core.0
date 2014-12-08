Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-wg0-f48.google.com (mail-wg0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 177A572476
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Dec 2014 07:44:20 +0000 (UTC)
Received: by mail-wg0-f48.google.com with SMTP id y19so5500332wgg.35
	for <openembedded-core@lists.openembedded.org>;
	Sun, 07 Dec 2014 23:44:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:reply-to:subject:date:message-id:organization:user-agent
	:in-reply-to:references:mime-version:content-type
	:content-transfer-encoding;
	bh=Z4gR9QvHtOrl0km0F/YnXN+Oka/Gx0diQdyRcjeMyWo=;
	b=UD1yu4PkT0iDLEz00Nb873FLmpGfcdmvEmUvOo8GpKi94IAqfq/6Lyl5U+jepNe2ce
	sRJXVnMJoH26+xalo6hBrdj0LeZ/GLhrn2yA5wUny2WL/lrFuuZFEhNA9+7QokSpL6pE
	yDZlO45YdQn0iTN2X7WuHwQ3AGBBOAsrbWqbT7mIfjP56+XIeJMOrVqBR4QLkNA7pD9y
	8zAnOsSHGVzsrkVaIucUSLwT5ig9EFwzbBrA7rmT9tlukaRPx4g+VmKU+MJfXmU7kx6a
	ISWvnvR75GwSjTHpoRKvHJXYJOT7J4ocobc85sZ+GaGrLTLDvbByClBe4G7eIMUt2/Qz
	x79g==
X-Received: by 10.194.187.235 with SMTP id fv11mr43175532wjc.16.1418024660229; 
	Sun, 07 Dec 2014 23:44:20 -0800 (PST)
Received: from chl500346.localnet (mail.neratec.com. [46.140.151.2])
	by mx.google.com with ESMTPSA id d5sm55533092wjb.34.2014.12.07.23.44.18
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 07 Dec 2014 23:44:19 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 08 Dec 2014 08:44:17 +0100
Message-ID: <14622950.e2sRxVVxgh@chl500346>
Organization: Privat
User-Agent: KMail/4.13.3 (Linux/3.13.0-40-generic; KDE/4.13.3; x86_64; ; )
In-Reply-To: <54812AAA.4010103@windriver.com>
References: <A612847CFE53224C91B23E3A5B48BAC7ACF18D3E7B@xmail3.se.axis.com>
	<54811FDE.7050605@windriver.com> <54812AAA.4010103@windriver.com>
MIME-Version: 1.0
Subject: Re: Why is systemd installed to / (was: [yocto] Export bitbake variables between recipes)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: adrian.freihofer@gmail.com
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 08 Dec 2014 07:44:29 -0000
Content-Type: multipart/alternative; boundary="nextPart2995753.UHdvKjsibA"
Content-Transfer-Encoding: 7Bit

--nextPart2995753.UHdvKjsibA
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 04 December 2014 21.46:50 Mark Hatle wrote:
> On 12/4/14, 9:00 PM, ChenQi wrote:
> > On 12/04/2014 09:34 PM, Peter Kjellerstedt wrote:
> >>> -----Original Message-----
> >>> From: openembedded-core-bounces@lists.openembedded.org
> >>> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> >>> Mark Hatle
> >>> Sent: den 3 december 2014 16:47
> >>> To: Peter Kjellerstedt; openembedded-core@lists.openembedded.org
> >>> Subject: Re: [OE-core] Why is systemd installed to / (was: [yocto]
> >>> Export bitbake variables between recipes)
> >>>
> >>> On 12/3/14, 9:36 AM, Peter Kjellerstedt wrote:
> >>>>>> Can anyone please explain why OE-core installs systemd to /
> >>>>>> rather than /usr? Because I have traced the recipe all the
> >>>>>> way back to its introduction in OE classic, and I cannot
> >>>>>> find any rationale for this odd decision. And it is extra
> >>>>>> weird given the systemd authors' agenda that everything
> >>>>>> should be in /usr (and /etc)...
> >>>>> It's only strange compared to Fedora.  We're not Fedora.. and
> >>>>> I've got systems that need to boot from a small '/' before
> >>>>> mounting '/usr'.
> >>>> Speaking of Fedora, would an official image feature, e.g.,
> >>>> "unified-fs", be acceptable for OE-Core that sets up the file
> >>>> system with /bin, /sbin and /lib* as links to their /usr
> >>>> counterparts? That would alleviate our problems with the
> >>>> differences in how systemd is installed.
> >>> The system permits developers to set the paths for the various pieces.
> >>> To get a Fedora like unified filesystem, you could do something like:
> >>>
> >>> * provide your own fs-perms.txt:
> >> I had not noticed fs-perms.txt before. And it seems easy enough
> >> to extend via the FILESYSTEMS_PERMS_TABLES variable. :)
> >>
> >>> /usr/bin	link	${base_bindir}
> >>> /usr/sbin	link	${base_sbindir}
> >>> /usr/lib	link	${base_libdir}
> >>>
> >>> Then in your local.conf:
> >>>
> >>> bindir = "${base_bindir}"
> >>> sbindir = "${base_sbindir}"
> >>> libdir = "${base_libdir}"
> >> I think you mean the opposite, i.e., that /bin should be a
> >> link to ${bindir} and ${base_bindir} should be set to ${bindir},
> >> but I get your point.
> >>
> >>> This will result in /usr/bin, sbin and lib being linked to /bin,
> >>> /sbin, /lib -- and all of the package produced for your
> >>> configuration will only reference '/'.
> >>>
> >>> This isn't that unusual of a configuration from what I've been told.
> >> Which is why I think it warrants an official distro feature (an
> >> image feature, as I originally suggested, will of course not do
> >> if it is done the way you suggest since the packages' contents
> >> are modified). That way people would not have to invent the wheel
> >> over and over again (and somehow find out that there is such a
> >> thing as fs-perms.txt which up until now had eluded me).
> >>
> >>> --Mark
> >> //Peter
> >>
> >
> > Hi Peter,
> >
> > It's easy to link /usr/bin to /bin, /usr/sbin to /sbin and make things
> > work in OE.
> > But if we want the opposite to work, we might need several additional
> > patches to OE.
> 
> Exactly.. and going back to the FHS, the FHS says that '/' is required to boot, 
> /usr is not.  So /usr should be linked to / for those items.
> 
> There is a fairly standard OE configuration some people do where they don't 
> define a /usr at all.  They just set the prefix (normally /usr) to '/'.
> 
> That SHOULD be working still, at least it used to be a well tested configuration...
> 
> > Several days ago, I tried to do /usr merge in OE (like what Fedora and
> > Arch does). It turned out that we need to patch several packages to make
> > things work.
> >
> > (I haven't sent out the patches because it's just some initial
> > investigation and I'm not sure if people want this feature or not.)
> >
> > If you want this feature in OE, please open a bug/enhancement in
> > bugzilla https://bugzilla.yoctoproject.org/ to see if the community
> > wants it or not.
> >
> > Regards,
> > Chen Qi
> >
> >
> 
> 
Hi Mark

Lennard Poettering and others have good arguments to have no /bin, /lib and /sbin folder at all. There is an interesting blog here: http://0pointer.net/blog/revisiting-how-we-put-together-linux-systems.html[1]. In short: The goal is to have one mount point (/usr) where all the read only binaries are in. Having /usr on a read only btrfs partition would allow to use the send receive feature (binary diff on filesystem level) of btrfs to deploy software updates to many devices. This approach could provide a generic, robust and optimized SW update procedure for embedded systems as well.

Regards,
Adrian



--------------------
Adrian Freihofer
Gschwaderweg 29
8610 Uster
043 497 84 01

--------
[1] http://0pointer.net/blog/revisiting-how-we-put-together-linux-systems.html

--nextPart2995753.UHdvKjsibA
Content-Transfer-Encoding: 7Bit
Content-Type: text/html; charset="us-ascii"

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0//EN" "http://www.w3.org/TR/REC-html40/strict.dtd">
<html><head><meta name="qrichtext" content="1" /><style type="text/css">
p, li { white-space: pre-wrap; }
</style></head><body style=" font-family:'Ubuntu'; font-size:9pt; font-weight:400; font-style:normal;">
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">On Thursday 04 December 2014 21.46:50 Mark Hatle wrote:</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; On 12/4/14, 9:00 PM, ChenQi wrote:</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt; On 12/04/2014 09:34 PM, Peter Kjellerstedt wrote:</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt;&gt;&gt; -----Original Message-----</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt;&gt;&gt; From: openembedded-core-bounces@lists.openembedded.org</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt;&gt;&gt; [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt;&gt;&gt; Mark Hatle</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt;&gt;&gt; Sent: den 3 december 2014 16:47</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt;&gt;&gt; To: Peter Kjellerstedt; openembedded-core@lists.openembedded.org</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt;&gt;&gt; Subject: Re: [OE-core] Why is systemd installed to / (was: [yocto]</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt;&gt;&gt; Export bitbake variables between recipes)</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt;&gt;&gt;</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt;&gt;&gt; On 12/3/14, 9:36 AM, Peter Kjellerstedt wrote:</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt;&gt;&gt;&gt;&gt;&gt; Can anyone please explain why OE-core installs systemd to /</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt;&gt;&gt;&gt;&gt;&gt; rather than /usr? Because I have traced the recipe all the</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt;&gt;&gt;&gt;&gt;&gt; way back to its introduction in OE classic, and I cannot</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt;&gt;&gt;&gt;&gt;&gt; find any rationale for this odd decision. And it is extra</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt;&gt;&gt;&gt;&gt;&gt; weird given the systemd authors' agenda that everything</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt;&gt;&gt;&gt;&gt;&gt; should be in /usr (and /etc)...</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt;&gt;&gt;&gt;&gt; It's only strange compared to Fedora.  We're not Fedora.. and</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt;&gt;&gt;&gt;&gt; I've got systems that need to boot from a small '/' before</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt;&gt;&gt;&gt;&gt; mounting '/usr'.</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt;&gt;&gt;&gt; Speaking of Fedora, would an official image feature, e.g.,</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt;&gt;&gt;&gt; &quot;unified-fs&quot;, be acceptable for OE-Core that sets up the file</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt;&gt;&gt;&gt; system with /bin, /sbin and /lib* as links to their /usr</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt;&gt;&gt;&gt; counterparts? That would alleviate our problems with the</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt;&gt;&gt;&gt; differences in how systemd is installed.</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt;&gt;&gt; The system permits developers to set the paths for the various pieces.</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt;&gt;&gt; To get a Fedora like unified filesystem, you could do something like:</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt;&gt;&gt;</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt;&gt;&gt; * provide your own fs-perms.txt:</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt;&gt; I had not noticed fs-perms.txt before. And it seems easy enough</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt;&gt; to extend via the FILESYSTEMS_PERMS_TABLES variable. :)</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt;&gt;</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt;&gt;&gt; /usr/bin	link	${base_bindir}</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt;&gt;&gt; /usr/sbin	link	${base_sbindir}</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt;&gt;&gt; /usr/lib	link	${base_libdir}</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt;&gt;&gt;</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt;&gt;&gt; Then in your local.conf:</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt;&gt;&gt;</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt;&gt;&gt; bindir = &quot;${base_bindir}&quot;</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt;&gt;&gt; sbindir = &quot;${base_sbindir}&quot;</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt;&gt;&gt; libdir = &quot;${base_libdir}&quot;</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt;&gt; I think you mean the opposite, i.e., that /bin should be a</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt;&gt; link to ${bindir} and ${base_bindir} should be set to ${bindir},</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt;&gt; but I get your point.</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt;&gt;</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt;&gt;&gt; This will result in /usr/bin, sbin and lib being linked to /bin,</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt;&gt;&gt; /sbin, /lib -- and all of the package produced for your</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt;&gt;&gt; configuration will only reference '/'.</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt;&gt;&gt;</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt;&gt;&gt; This isn't that unusual of a configuration from what I've been told.</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt;&gt; Which is why I think it warrants an official distro feature (an</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt;&gt; image feature, as I originally suggested, will of course not do</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt;&gt; if it is done the way you suggest since the packages' contents</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt;&gt; are modified). That way people would not have to invent the wheel</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt;&gt; over and over again (and somehow find out that there is such a</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt;&gt; thing as fs-perms.txt which up until now had eluded me).</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt;&gt;</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt;&gt;&gt; --Mark</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt;&gt; //Peter</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt;&gt;</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt;</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt; Hi Peter,</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt;</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt; It's easy to link /usr/bin to /bin, /usr/sbin to /sbin and make things</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt; work in OE.</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt; But if we want the opposite to work, we might need several additional</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt; patches to OE.</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; </p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; Exactly.. and going back to the FHS, the FHS says that '/' is required to boot, </p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; /usr is not.  So /usr should be linked to / for those items.</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; </p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; There is a fairly standard OE configuration some people do where they don't </p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; define a /usr at all.  They just set the prefix (normally /usr) to '/'.</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; </p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; That SHOULD be working still, at least it used to be a well tested configuration...</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; </p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt; Several days ago, I tried to do /usr merge in OE (like what Fedora and</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt; Arch does). It turned out that we need to patch several packages to make</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt; things work.</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt;</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt; (I haven't sent out the patches because it's just some initial</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt; investigation and I'm not sure if people want this feature or not.)</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt;</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt; If you want this feature in OE, please open a bug/enhancement in</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt; bugzilla https://bugzilla.yoctoproject.org/ to see if the community</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt; wants it or not.</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt;</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt; Regards,</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt; Chen Qi</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt;</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt;</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; </p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; </p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">Hi Mark</p>
<p style="-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; ">&nbsp;</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">Lennard Poettering and others have good arguments to have no /bin, /lib and /sbin folder at all. There is an interesting blog here: <a href="http://0pointer.net/blog/revisiting-how-we-put-together-linux-systems.html"><span style=" text-decoration: underline; color:#0057ae;">http://0pointer.net/blog/revisiting-how-we-put-together-linux-systems.html</span></a>. In short: The goal is to have one mount point (/usr) where all the read only binaries are in. Having /usr on a read only btrfs partition would allow to use the send receive feature (binary diff on filesystem level) of btrfs to deploy software updates to many devices. This approach could provide a generic, robust and optimized SW update procedure for embedded systems as well.</p>
<p style="-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; ">&nbsp;</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">Regards,</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">Adrian</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"><br />-- </p>
<p style="-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; ">&nbsp;</p>
<hr />
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">Adrian Freihofer</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">Gschwaderweg 29</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">8610 Uster</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">043 497 84 01</p></body></html>

--nextPart2995753.UHdvKjsibA--
