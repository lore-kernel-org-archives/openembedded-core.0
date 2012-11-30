Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TeUPI-0001ME-DF
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Nov 2012 18:29:44 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 30 Nov 2012 09:15:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,192,1355126400"; d="scan'208";a="224837350"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.13.127])
	by azsmga001.ch.intel.com with ESMTP; 30 Nov 2012 09:15:05 -0800
Message-ID: <50B8E999.2050109@linux.intel.com>
Date: Fri, 30 Nov 2012 09:15:05 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: =?ISO-8859-1?Q?David_Nystr=F6m?= <david.c.nystrom@gmail.com>, 
	Michael Halstead <michael@yoctoproject.org>,
	Raymond Danks <ray.danks@se-eng.com>
References: <50B63784.5050502@enea.com> <1354119751.15992.2.camel@ted>
	<CADkTA4P8=aLSXNTAENp+WW7xX+ttYAPhPufRE=+yn9KXOY8Sag@mail.gmail.com>
	<50B71FD4.3090304@enea.com> <50B766CC.4030904@se-eng.com>
	<1354197267.4053.4.camel@ted> <50B89887.3070003@gmail.com>
In-Reply-To: <50B89887.3070003@gmail.com>
Cc: oe-core layer <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Fri, 30 Nov 2012 17:29:44 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

On 11/30/2012 03:29 AM, David Nyström wrote:
> On 11/29/2012 02:54 PM, Richard Purdie wrote:
>> On Thu, 2012-11-29 at 06:44 -0700, Raymond Danks wrote:
>>> Thanks for looping me in here David. The initial goal for the meta-xen
>>> layer was in fact to encompass Xen Cloud Platform.  As such, the intent
>>> was to contain both hypervisor and user-space applications.  Indeed, the
>>> xen distribution itself includes xm/libxl; hypervisor abstraction would
>>> be somewhat tedious in my opinion.
>>>
>>> The layer just received commits for expanding the libvirt build to
>>> support qemu.  The commonalities and shared packaged between xen, qemu,
>>> and kvm implementations are such that I would also agree that meta-xen
>>> should be expanded/renamed to encompass all virtualization types; I also
>>> support the move to meta-virtualization.
>>>
>
> meta-virtualization sounds good, let co-op on this so we don't duplicate
> work.
>
If everyone is OK with this, I will have Michael Halstead create a repo, 
please send him your keys so that you will have write access to it.

Sau!

>>> As far as a meta-cloud layer is concerned, I'm not sure I am
>>> knowledgeable enough in this area to weigh in.  I'm currently
>>> researching a filesystem implementation for OpenStack and have stumbled
>>> across Ceph/RBD and Gluster modules that look promising. On top of this,
>>> XCP is documented to include support for VastSky and can be integrated
>>> with DRBD.  And, the storage and hypervisor are only two pieces of the
>>> puzzle for a cloud implementation!
>>>
>
> Cool !
> I know, the meta-"cloud" name is quite/too ambitious, it was not meant
> to be a one week effort. But why aim low :).
>
>>> I think I would encourage you to also include OpenStack in a
>>> meta-virtualization layer until it has matured to the point where
>>> abstraction is more warranted.
>
> Agree.
>
>>> Since you've already created a presence
>>> at github, would it be possible to rename your layer to
>>> meta-virtualization and absorb the entire meta-xen layer?  I can push
>>> any changes for Xen/XCP here, it sounds like it is a central place for
>>> libvirt and could also contain Bruce's kernel modifications.
>>>
>>> Alternatively, I can create a meta-virtualization project.  In any case,
>>> those on the To and CC list should receive access to this layer as a
>>> starting point.
>>>
>>> Just my two cents.  :)
>>
>> I'd like to offer to host this combined layer (whatever we decide to
>> call it) on git.yoctoproject.org if that would help people and people
>> are interested. My only concern is in the area of maintainership, we
>> need to clearly define who maintains what and what the patch submission
>> process is in the README.
>>
>
> Thanks,
>
> Sounds good to centralize everything, since Raymond is the majority code
> contributor, perhaps he, if willing, can maintain the
> meta-virtualization layer.
> If you want a co/sub-maintainer I'll be happy to help out.
>
>
>> Cheers,
>>
>> Richard
>>
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>


