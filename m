Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2ADC877470
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Feb 2016 18:50:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1QIoGXv013495; Fri, 26 Feb 2016 18:50:47 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id z_YZWgbwhkLh; Fri, 26 Feb 2016 18:50:47 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1QIoiGS013507
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 26 Feb 2016 18:50:45 GMT
Message-ID: <1456512644.11498.108.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Philip Balister <philip@balister.org>, "yocto@yoctoproject.org"
	<yocto@yoctoproject.org>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Fri, 26 Feb 2016 18:50:44 +0000
In-Reply-To: <56D09D35.8040002@balister.org>
References: <1456508168.11498.95.camel@linuxfoundation.org>
	<56D09D35.8040002@balister.org>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: Yocto Project Status WW09
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
X-List-Received-Date: Fri, 26 Feb 2016 18:50:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2016-02-26 at 13:45 -0500, Philip Balister wrote:
> On 02/26/2016 12:36 PM, Richard Purdie wrote:
> > Current Dev Position: YP 2.1 M3
> > Next Deadline: YP 2.1 M3 Cutoff (Feature Freeze) February 29, 2016
> >  
> > SWAT team rotation: Tracy -> Alejandero
> > https://wiki.yoctoproject.org/wiki/Yocto_Build_Failure_Swat_Team
> >  
> > Key Status/Updates:
> > * 2.1 Feature Freeze is upon us. If there is any feature you want
> > to 
> >   see in 2.1 which isn't going to make the deadline, talk to RP.
> > * We plan to release 2.1 M2 despite the sato glib issue, granting
> > an
> >   exception for the high bug and then  concentrate on 2.1 M3.
> > * 2.1 M3 build won't happen until sato glib issue resolved.
> > * Also planning to merge the gobject-introspection changes 
> > * Pseudo connection issue appears to be addressed with increased
> > retry 
> >   numbers. Tests ongoing.
> > * We're about to try and transition meta-yocto within meta-yocto to
> >   meta-poky. The amount of pain this is causing is horrible :(.
> 
> Thanks for doing this. Can you summarize the pain? Are there any
> important lessons here?

The key lesson is our current "migration" code in OE-Core sucks and I
have some patches in progress which rewrite pieces of it in a way that
makes it more useful. I'm therefore trying to make some positives from
it.

That said, I haven't found a way to make this work without leaving a
dummy layer.conf in the old location since a missing layer.conf file is
fatal to bitbake very early on before any migration code triggers.

More should become clear when I post the patches, I've been holding off
that until I actually manage a patch set that works on the
autobuilder...

Patches should be out over the weekend (in time for the freeze).

Cheers,

Richard





