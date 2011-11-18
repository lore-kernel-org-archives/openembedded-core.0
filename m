Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RRUYP-0005cZ-Od
	for openembedded-core@lists.openembedded.org;
	Fri, 18 Nov 2011 20:56:56 +0100
Received: by faat2 with SMTP id t2so4878728faa.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Nov 2011 11:50:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=+S8AEPlcABGldco5yX/EYELL/4ElYszvnn/cH802Ztg=;
	b=HiDdTrPGOOpnJ0jZr/elLyBbdReZIa7zlrsBMGVXITxWiLv/Dw4p+VLSwPOBC+nRov
	lfCxlVmcBFcAtKVtF83gXkJRJDMYWYR2bL7he6sk9ekbfR8/fE2kYBBwT/vS3N2lxRrq
	vDLfmsc0/+u/gQB0PZXQTL60lyfcS9+WFWUMQ=
Received: by 10.152.102.148 with SMTP id fo20mr2859629lab.51.1321645827108;
	Fri, 18 Nov 2011 11:50:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.24.36 with HTTP; Fri, 18 Nov 2011 11:49:56 -0800 (PST)
In-Reply-To: <4EC6B45A.9060107@intel.com>
References: <4EC6B45A.9060107@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 18 Nov 2011 11:49:56 -0800
Message-ID: <CAMKF1spQ5roygTCMRtZ5nhfhV+S9520tJYdV5Lyt-MB-Je1XZA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: qemu needs > 2 GB of RAM to build?
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
X-List-Received-Date: Fri, 18 Nov 2011 19:56:59 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Nov 18, 2011 at 11:39 AM, Scott Garman <scott.a.garman@intel.com> wrote:
> Hi all,
>
> I'm testing building core-image-minimal in a resource-constrained
> environment (a VirtualBox VM with 2300 MB of RAM allocated to it). With
> PARALLEL_MAKE set to -j4 (the VM does have two CPUs allocated), I'm finding
> that the build of qemu-native fails because the OOM killer steps in and
> kills gcc. This is happening during the linking phase of building qemu.
>

what distro are you running on guest ? it could be something wrong
with the distro gcc or system

> If this is true, I assume it would pretty much mean that no one can build
> our images without more than 2 GB of RAM. Is this true? Is this something
> for us to be concerned about?

I have not seen such an error on a system which has 2G RAM all builds
qemu-native fine here

>
> Scott
>
> --
> Scott Garman
> Embedded Linux Engineer - Yocto Project
> Intel Open Source Technology Center
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


