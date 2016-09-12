Return-Path: <wmills@ti.com>
X-Greylist: delayed 550 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 12 Sep 2016 14:57:09 UTC
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by mail.openembedded.org (Postfix) with ESMTP id 8DB49771DC;
	Mon, 12 Sep 2016 14:57:09 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u8CElwPm031593;
	Mon, 12 Sep 2016 09:47:58 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u8CElv4Y005765;
	Mon, 12 Sep 2016 09:47:57 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 12 Sep 2016 09:47:56 -0500
Received: from [172.22.174.13] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u8CEluWX010543;
	Mon, 12 Sep 2016 09:47:56 -0500
To: Jeff Osier-Mixon <jefro@jefro.net>, Yocto Project <yocto@yoctoproject.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <CA+YB3raLEFHAECfBVAspQni9fG0_X0oTPM-Z_F64FzV6PuNdUw@mail.gmail.com>
From: William Mills <wmills@ti.com>
Message-ID: <57D6C026.1050701@ti.com>
Date: Mon, 12 Sep 2016 10:48:06 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.2
MIME-Version: 1.0
In-Reply-To: <CA+YB3raLEFHAECfBVAspQni9fG0_X0oTPM-Z_F64FzV6PuNdUw@mail.gmail.com>
Subject: Re: [yocto] Subjects for YP Developer Day at ELCE
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
X-List-Received-Date: Mon, 12 Sep 2016 14:57:10 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit


On 09/09/2016 11:51 AM, Jeff Osier-Mixon wrote:
> Hi all - we are in the planning stages for DevDay at ELCE right now,
> particularly the advanced track. This track changes every session,
> usually to cover the things we are working on hardest - for example,
> in San Diego we covered CROPS, devtool, the latest Toaster features,
> and much more.
>
> Whether you are able to attend DevDay or not, we would be grateful to
> hear your suggestions for subjects to cover in the advanced track. We
> are currently planning talks about CROPS, devtool and the ESDK,
> Toaster, wic, smack, security, and a few other things. If you have a
> burning desire to hear about something specific, please let us know.
>

*** Status and state of the art for read-only root filesystems.
1) r/o root + tmpfs only for ephemeral systems
2) r/o root + select r/w points (bind-volatile?)
3) r/o root + unionfs r/w

My interest would be in #1 & #2 as it is security related.
r/w mount would be nosuid, nodev, etc and perhaps noexec
A survey of the space should include #3 however.

I know there is a section in the developer manual for the basic 
mechanisms of r/o root but it appears a lot is left as an excrice for 
the user.  Are the full demo images etc?

*** What is the OE/YP response to Ubuntu-core?
4) Can Yocto build transactionally updated-able bundles for kernel and 
core-os/root-fs?
5) Can Yocto [cross-]build snaps or flatpaks?
6) Will snapd (or whatever flatpak needs) become 1st class ecosystem 
components?
	Ex: meta-snappy has a lot of good work but is early days
	    Currently meta-snappy disables AppArmor & seccomp
	    snapd does only light ns & cgroup control and relies on
	      AppArmor to do most of the containment
             so snapd w/o AppArmor is a demo
	    [Arch is no better BTW]

Bill

