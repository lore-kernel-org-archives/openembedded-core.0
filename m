Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Te4nY-00019O-4q for openembedded-core@lists.openembedded.org;
	Thu, 29 Nov 2012 15:09:04 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qATDsf3u021238;
	Thu, 29 Nov 2012 13:54:41 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21012-02; Thu, 29 Nov 2012 13:54:35 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qATDEddh020694
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Thu, 29 Nov 2012 13:54:29 GMT
Message-ID: <1354197267.4053.4.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Raymond Danks <ray.danks@se-eng.com>
Date: Thu, 29 Nov 2012 13:54:27 +0000
In-Reply-To: <50B766CC.4030904@se-eng.com>
References: <50B63784.5050502@enea.com> <1354119751.15992.2.camel@ted>
	<CADkTA4P8=aLSXNTAENp+WW7xX+ttYAPhPufRE=+yn9KXOY8Sag@mail.gmail.com>
	<50B71FD4.3090304@enea.com> <50B766CC.4030904@se-eng.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Patches, Bruce, oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: meta-cloud layer
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 29 Nov 2012 14:09:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-11-29 at 06:44 -0700, Raymond Danks wrote:
> Thanks for looping me in here David. The initial goal for the meta-xen 
> layer was in fact to encompass Xen Cloud Platform.  As such, the intent 
> was to contain both hypervisor and user-space applications.  Indeed, the 
> xen distribution itself includes xm/libxl; hypervisor abstraction would 
> be somewhat tedious in my opinion.
> 
> The layer just received commits for expanding the libvirt build to 
> support qemu.  The commonalities and shared packaged between xen, qemu, 
> and kvm implementations are such that I would also agree that meta-xen 
> should be expanded/renamed to encompass all virtualization types; I also 
> support the move to meta-virtualization.
> 
> As far as a meta-cloud layer is concerned, I'm not sure I am 
> knowledgeable enough in this area to weigh in.  I'm currently 
> researching a filesystem implementation for OpenStack and have stumbled 
> across Ceph/RBD and Gluster modules that look promising. On top of this, 
> XCP is documented to include support for VastSky and can be integrated 
> with DRBD.  And, the storage and hypervisor are only two pieces of the 
> puzzle for a cloud implementation!
> 
> I think I would encourage you to also include OpenStack in a 
> meta-virtualization layer until it has matured to the point where 
> abstraction is more warranted.  Since you've already created a presence 
> at github, would it be possible to rename your layer to 
> meta-virtualization and absorb the entire meta-xen layer?  I can push 
> any changes for Xen/XCP here, it sounds like it is a central place for 
> libvirt and could also contain Bruce's kernel modifications.
> 
> Alternatively, I can create a meta-virtualization project.  In any case, 
> those on the To and CC list should receive access to this layer as a 
> starting point.
> 
> Just my two cents.  :)

I'd like to offer to host this combined layer (whatever we decide to
call it) on git.yoctoproject.org if that would help people and people
are interested. My only concern is in the area of maintainership, we
need to clearly define who maintains what and what the patch submission
process is in the README.

Cheers,

Richard




