Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RWvv8-0005jF-HX
	for openembedded-core@lists.openembedded.org;
	Sat, 03 Dec 2011 21:10:50 +0100
Received: by lagj5 with SMTP id j5so1701052lag.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 03 Dec 2011 12:04:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=wtbOBl6mpL8UjhiEFQahH4zM8s8ry2QGIMZYo4VSzXU=;
	b=bvKKR7Ylk308NQuSF79zBZLSXPHny7E7nt9R9z/XA3hJ/2bTI6qhPjQ19GIgm0A9S1
	6oj3Ae6JGqO/5rzgGVOyVmc/y8OJdgo9zN+LKebr7AmZJhJfvz5dOhoHBH8kiLK4e4dP
	yzoxXzqxMJn/fhMmsgl4Qo+btgHKCXoUybdAs=
Received: by 10.152.106.115 with SMTP id gt19mr2175315lab.27.1322942645462;
	Sat, 03 Dec 2011 12:04:05 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.24.36 with HTTP; Sat, 3 Dec 2011 12:03:34 -0800 (PST)
In-Reply-To: <4EC6B45A.9060107@intel.com>
References: <4EC6B45A.9060107@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 3 Dec 2011 12:03:34 -0800
Message-ID: <CAMKF1soKb__tnx5z-A5-P9nxxzbMayeW1_WqR72YbKLw0vPDSw@mail.gmail.com>
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
X-List-Received-Date: Sat, 03 Dec 2011 20:10:50 -0000
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
> If this is true, I assume it would pretty much mean that no one can build
> our images without more than 2 GB of RAM. Is this true? Is this something
> for us to be concerned about?
>

I think this could be because of gcc bug
http://gcc.gnu.org/bugzilla/show_bug.cgi?id=48190
that bug has now been fixed and backported to gcc-4.5 and gcc 4.6
branches as well
however this fix has to go into the gcc in distro that you are running
on build host
we will get this fix into oe-core gcc as well but that may not help
with qemu-native

-Khem


