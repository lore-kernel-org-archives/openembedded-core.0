Received: from starfish.geekisp.com ([216.168.135.166])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1TerI0-0002vG-6c
	for openembedded-core@lists.openembedded.org;
	Sat, 01 Dec 2012 18:55:44 +0100
Received: (qmail 6390 invoked by uid 1003); 1 Dec 2012 17:41:24 -0000
Received: from unknown (HELO ?192.168.5.146?)
	(philip@opensdr.com@64.134.228.183)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	1 Dec 2012 17:41:24 -0000
Message-ID: <50BA4142.8060409@balister.org>
Date: Sat, 01 Dec 2012 09:41:22 -0800
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <50B63784.5050502@enea.com> <1354119751.15992.2.camel@ted>
	<CADkTA4P8=aLSXNTAENp+WW7xX+ttYAPhPufRE=+yn9KXOY8Sag@mail.gmail.com>
	<50B71FD4.3090304@enea.com> <50B766CC.4030904@se-eng.com>
	<1354197267.4053.4.camel@ted> <50B89887.3070003@gmail.com>
	<50B8E999.2050109@linux.intel.com>
	<CADkTA4OPBKm6c1BPx3PGVuN9AHsmJZbG7Z7XhZd2OzT==Q5mHg@mail.gmail.com>
	<50B8F4FE.1070003@yoctoproject.org> <50B9145E.9080005@se-eng.com>
	<50B93FFB.9050505@yoctoproject.org>
	<CADkTA4Nd0-bB2XHT9axsp7xfehcL3swks9q7mMXM+q5oVfDY_g@mail.gmail.com>
In-Reply-To: <CADkTA4Nd0-bB2XHT9axsp7xfehcL3swks9q7mMXM+q5oVfDY_g@mail.gmail.com>
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
X-List-Received-Date: Sat, 01 Dec 2012 17:55:44 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

On 12/01/2012 09:30 AM, Bruce Ashfield wrote:
> On Fri, Nov 30, 2012 at 6:23 PM, Michael Halstead
> <michael@yoctoproject.org>wrote:
>
>>   On 11/30/2012 12:17 PM, Raymond Danks wrote:
>>
>> On 11/30/2012 11:03 AM, Michael Halstead wrote:
>>
>> On 11/30/2012 09:26 AM, Bruce Ashfield wrote:
>>
>>
>>
>>
>> On Fri, Nov 30, 2012 at 12:15 PM, Saul Wold <sgw@linux.intel.com> wrote:
>>
>>> On 11/30/2012 03:29 AM, David Nyström wrote:
>>>
>>>> On 11/29/2012 02:54 PM, Richard Purdie wrote:
>>>>
>>>>> On Thu, 2012-11-29 at 06:44 -0700, Raymond Danks wrote:
>>>>>
>>>>>> Thanks for looping me in here David. The initial goal for the meta-xen
>>>>>> layer was in fact to encompass Xen Cloud Platform.  As such, the intent
>>>>>> was to contain both hypervisor and user-space applications.  Indeed,
>>>>>> the
>>>>>> xen distribution itself includes xm/libxl; hypervisor abstraction would
>>>>>> be somewhat tedious in my opinion.
>>>>>>
>>>>>> The layer just received commits for expanding the libvirt build to
>>>>>> support qemu.  The commonalities and shared packaged between xen, qemu,
>>>>>> and kvm implementations are such that I would also agree that meta-xen
>>>>>> should be expanded/renamed to encompass all virtualization types; I
>>>>>> also
>>>>>> support the move to meta-virtualization.
>>>>>>
>>>>>>
>>>> meta-virtualization sounds good, let co-op on this so we don't duplicate
>>>> work.
>>>>
>>>>   If everyone is OK with this, I will have Michael Halstead create a
>>> repo, please send him your keys so that you will have write access to it.
>>>
>>
>>   This works for me. If Michael already has our keys, do we need to resend
>> or can
>> a local copy happen ?
>>
>> I already have keys for,
>>
>> David Nystrom df:2d:b1:59:f3:d7:73:fc:59:36:7b:cf:85:28:a7:50
>> Bruce Ashfield  4f:93:90:b2:c7:a1:45:21:f2:47:31:6f:60:f9:60:02
>>
>> Either of you can currently add
>> git@git.yoctoproject.org:meta-virtualization as a git remote and start
>> the repository. Once we have initial code and the maintainers and patch
>> submission guidelines in the readme I can publicly list the new repository.
>>
>> I require an ssh public key for Raymond Danks.
>>
>> Thanks Michael.  I got your response and was able to push meta-xen to the
>> newly created repository on meta-virtualization.  I added one commit to
>> tweak the README and conf/layer.conf for the new name.
>>
>>
>>
>> We also need a short description for the listing on git.yoctoproject.org.
>> I could be something similar to, but better than, "Layer enabling
>> virtualization support. "
>>
>> How about "Layer enabling hypervisor, virtualization tool stack, and cloud
>> support."
>>
>>   Sounds good to me. Thank you.
>>
>>   Also - I referenced the mail alias meta-virtualization at yoctoproject in
>> the README.  When you publish this, can we use something like that as well?
>>
>>   I can add a private list for meta-virtualization@yoctoproject.org. Who
>> shall I add to membership?
>>
>>
>
> At the risk of stating the obvious, I like the idea of a separate list, and
> would like to be
> added. But then again, i can always add myself later as well (assuming the
> same
> interface as the rest of the lists).

I also like to track some lists via nntp from gmane.

Philip

>
> Cheers,
>
> Bruce
>
>
>>
>>
>> --
>> Michael Halstead
>> Yocto Project / Sys Admin
>>
>>
>>
>>   Thanks again,
>> Ray
>>
>>
>> --
>> Michael Halstead
>> Yocto Project / Sys Admin
>>
>>
>>
>>   Cheers,
>>
>>   Bruce
>>
>>
>>>
>>> Sau!
>>>
>>>
>>>    As far as a meta-cloud layer is concerned, I'm not sure I am
>>>>>> knowledgeable enough in this area to weigh in.  I'm currently
>>>>>> researching a filesystem implementation for OpenStack and have stumbled
>>>>>> across Ceph/RBD and Gluster modules that look promising. On top of
>>>>>> this,
>>>>>> XCP is documented to include support for VastSky and can be integrated
>>>>>> with DRBD.  And, the storage and hypervisor are only two pieces of the
>>>>>> puzzle for a cloud implementation!
>>>>>>
>>>>>>
>>>> Cool !
>>>> I know, the meta-"cloud" name is quite/too ambitious, it was not meant
>>>> to be a one week effort. But why aim low :).
>>>>
>>>>   I think I would encourage you to also include OpenStack in a
>>>>>> meta-virtualization layer until it has matured to the point where
>>>>>> abstraction is more warranted.
>>>>>>
>>>>>
>>>> Agree.
>>>>
>>>>   Since you've already created a presence
>>>>>> at github, would it be possible to rename your layer to
>>>>>> meta-virtualization and absorb the entire meta-xen layer?  I can push
>>>>>> any changes for Xen/XCP here, it sounds like it is a central place for
>>>>>> libvirt and could also contain Bruce's kernel modifications.
>>>>>>
>>>>>> Alternatively, I can create a meta-virtualization project.  In any
>>>>>> case,
>>>>>> those on the To and CC list should receive access to this layer as a
>>>>>> starting point.
>>>>>>
>>>>>> Just my two cents.  :)
>>>>>>
>>>>>
>>>>> I'd like to offer to host this combined layer (whatever we decide to
>>>>> call it) on git.yoctoproject.org if that would help people and people
>>>>> are interested. My only concern is in the area of maintainership, we
>>>>> need to clearly define who maintains what and what the patch submission
>>>>> process is in the README.
>>>>>
>>>>>
>>>> Thanks,
>>>>
>>>> Sounds good to centralize everything, since Raymond is the majority code
>>>> contributor, perhaps he, if willing, can maintain the
>>>> meta-virtualization layer.
>>>> If you want a co/sub-maintainer I'll be happy to help out.
>>>>
>>>>
>>>>   Cheers,
>>>>>
>>>>> Richard
>>>>>
>>>>>
>>>>>
>>>>> _______________________________________________
>>>>> Openembedded-core mailing list
>>>>> Openembedded-core@lists.openembedded.org
>>>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>>>>
>>>>>
>>>>
>>>> _______________________________________________
>>>> Openembedded-core mailing list
>>>> Openembedded-core@lists.openembedded.org
>>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>>>
>>>>
>>>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>>
>>
>>
>>
>>   --
>> "Thou shalt not follow the NULL pointer, for chaos and madness await thee
>> at its end"
>>
>>
>>
>>
>>
>>
>
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


