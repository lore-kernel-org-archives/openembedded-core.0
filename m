Received: from 75-148-42-21-colorado.hfc.comcastbusiness.net ([75.148.42.21]
	helo=judge.camp.se-eng.com) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ray.danks@se-eng.com>) id 1TeUOc-0001Jl-3S
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Nov 2012 18:29:03 +0100
Received: from localhost (localhost [127.0.0.1])
	by judge.camp.se-eng.com (Postfix) with ESMTP id A2905138077;
	Fri, 30 Nov 2012 10:14:43 -0700 (MST)
X-Virus-Scanned: amavisd-new at camp.se-eng.com
Received: from judge.camp.se-eng.com ([127.0.0.1])
	by localhost (judge.camp.se-eng.com [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id CMdVKn0LGeHh; Fri, 30 Nov 2012 10:14:36 -0700 (MST)
Received: from [172.20.202.50] (beast.camp.se-eng.com [172.20.202.50])
	by judge.camp.se-eng.com (Postfix) with ESMTPSA id 1C94B13806E;
	Fri, 30 Nov 2012 10:14:36 -0700 (MST)
Message-ID: <50B8E97A.3040703@se-eng.com>
Date: Fri, 30 Nov 2012 10:14:34 -0700
From: Raymond Danks <ray.danks@se-eng.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:16.0) Gecko/20121011 Thunderbird/16.0.1
MIME-Version: 1.0
To: =?ISO-8859-1?Q?David_Nystr=F6m?= <david.c.nystrom@gmail.com>
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
Reply-To: ray.danks@se-eng.com
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 30 Nov 2012 17:29:03 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

On 11/30/2012 04:29 AM, David Nystr=F6m wrote:
> On 11/29/2012 02:54 PM, Richard Purdie wrote:
>> On Thu, 2012-11-29 at 06:44 -0700, Raymond Danks wrote:
>>> Thanks for looping me in here David. The initial goal for the meta-xe=
n
>>> layer was in fact to encompass Xen Cloud Platform.  As such, the inte=
nt
>>> was to contain both hypervisor and user-space applications. Indeed, t=
he
>>> xen distribution itself includes xm/libxl; hypervisor abstraction wou=
ld
>>> be somewhat tedious in my opinion.
>>>
>>> The layer just received commits for expanding the libvirt build to
>>> support qemu.  The commonalities and shared packaged between xen, qem=
u,
>>> and kvm implementations are such that I would also agree that meta-xe=
n
>>> should be expanded/renamed to encompass all virtualization types; I=20
>>> also
>>> support the move to meta-virtualization.
>>>
>
> meta-virtualization sounds good, let co-op on this so we don't=20
> duplicate work.
Yes. Agreed.
>
>>> As far as a meta-cloud layer is concerned, I'm not sure I am
>>> knowledgeable enough in this area to weigh in.  I'm currently
>>> researching a filesystem implementation for OpenStack and have stumbl=
ed
>>> across Ceph/RBD and Gluster modules that look promising. On top of=20
>>> this,
>>> XCP is documented to include support for VastSky and can be integrate=
d
>>> with DRBD.  And, the storage and hypervisor are only two pieces of th=
e
>>> puzzle for a cloud implementation!
>>>
>
> Cool !
> I know, the meta-"cloud" name is quite/too ambitious, it was not meant=20
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
>>> any changes for Xen/XCP here, it sounds like it is a central place fo=
r
>>> libvirt and could also contain Bruce's kernel modifications.
>>>
>>> Alternatively, I can create a meta-virtualization project.  In any=20
>>> case,
>>> those on the To and CC list should receive access to this layer as a
>>> starting point.
>>>
>>> Just my two cents.  :)
>>
>> I'd like to offer to host this combined layer (whatever we decide to
>> call it) on git.yoctoproject.org if that would help people and people
>> are interested. My only concern is in the area of maintainership, we
>> need to clearly define who maintains what and what the patch submissio=
n
>> process is in the README.
>>
>
> Thanks,
>
> Sounds good to centralize everything, since Raymond is the majority=20
> code contributor, perhaps he, if willing, can maintain the=20
> meta-virtualization layer.
> If you want a co/sub-maintainer I'll be happy to help out.
>
Yes.  Thanks Richard.  I was looking at some of the Yocto projects and=20
the meta-ti stood out as one that might be a model for this. Would it be=20
possible to configure a mailing list for meta-virtualization as well? =20
Once you've got the repo in place I'll push up what's in meta-xen. =20
Maybe David can come behind with what's in meta-cloud.  I also saw that=20
Mihai mentioned having a KVM tree that might integrate.  Once we've got=20
this setup we should also rename the link on the OE layers index wiki.

I'm happy with a co-maintainer type setup as well.  In fact, I prefer=20
that.  I've done work with the xen part of this, but kvm and openstack=20
are still somewhat foreign.

At any rate, I'll pay closer attention to the lists as they pertain to=20
this layer especially going forward.  I think this will work well to=20
combine our efforts here.

Ray
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



