Received: from mx.insigma.com.cn ([115.236.48.170] helo=WX-Edge.insigma.com.cn)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <niqingliang@insigma.com.cn>) id 1RSIHT-000583-4c
	for openembedded-core@lists.openembedded.org;
	Mon, 21 Nov 2011 02:02:43 +0100
Received: from WX-ExchMB.insigma.com.cn (10.0.1.203) by WX-Edge.insigma.com.cn
	(10.0.1.205) with Microsoft SMTP Server (TLS) id 8.1.436.0;
	Mon, 21 Nov 2011 08:56:11 +0800
Received: from [192.168.0.98] (122.224.76.38) by WX-ExchMB.insigma.com.cn
	(10.0.1.203) with Microsoft SMTP Server id 8.1.240.5; Mon, 21 Nov 2011
	08:56:09 +0800
Message-ID: <1321836895.1264.50.camel@localhost.localdomain>
From: Ni Qingliang <niqingliang@insigma.com.cn>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 21 Nov 2011 08:54:55 +0800
In-Reply-To: <4EC6B45A.9060107@intel.com>
References: <4EC6B45A.9060107@intel.com>
Organization: Insigma
X-Mailer: Evolution 3.2.1 
MIME-Version: 1.0
Subject: Re: qemu needs > 2 GB of RAM to build?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: niqingliang@insigma.com.cn,
	Patches and discussions about the oe-core layer
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
X-List-Received-Date: Mon, 21 Nov 2011 01:02:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I have encountered the same problem on archlinux in VM.
after googled it, maybe it is GCC's defect

On Sat, 2011-11-19 at 03:39 +0800, Scott Garman wrote:
> Hi all,
> 
> I'm testing building core-image-minimal in a resource-constrained
> environment (a VirtualBox VM with 2300 MB of RAM allocated to it). With
> PARALLEL_MAKE set to -j4 (the VM does have two CPUs allocated), I'm
> finding that the build of qemu-native fails because the OOM killer steps
> in and kills gcc. This is happening during the linking phase of building
> qemu.
> 
> If this is true, I assume it would pretty much mean that no one can
> build our images without more than 2 GB of RAM. Is this true? Is this
> something for us to be concerned about?
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

-- 
Yi Qingliang
niqingliang@insigma.com.cn
https://niqingliang2003.wordpress.com



