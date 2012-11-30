Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <david.c.nystrom@gmail.com>) id 1TeP0F-0005qn-SM
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Nov 2012 12:43:35 +0100
Received: by mail-lb0-f175.google.com with SMTP id gg13so343711lbb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Nov 2012 03:29:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=aBz+JWJXZa1RVpQ7i6SskFrGu8wUlsYJtSeB7Yhz4gI=;
	b=Y7HL3e5YyKcDKyAZvIxxKEpuwCzb1a+0VSM6RE81fS+q8ZR4MEMnUtjZ6BawviczuY
	ZA5C3wRQTQ6YtQN5rW1DYzfaU9xmwd6HvkGkceMBg2niDoKwJPF0YWMOYnFZrmC9SVDx
	H2sImeA8p/yXs0B/8szdJZvFkjuA7X+FzzQ1qrJbJZpxt9QMIKZiTFDB2hw9bacwDgOY
	Dm+O8a4CQ1/0jYWsHR/0MGEVwQlKwDFYlLkqidOf3hIykRxx5VvNtoMBbkBHUn/04SUO
	gCKfFK+yj2hTMWSCgzCOJCUHlKJmmBkzryKwGEdZ9OxKOzcb1xcFpva7R5xAmfQeoJJ0
	Cf9Q==
Received: by 10.112.82.166 with SMTP id j6mr727352lby.25.1354274954791;
	Fri, 30 Nov 2012 03:29:14 -0800 (PST)
Received: from [172.16.140.28] (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPS id pw17sm1891599lab.5.2012.11.30.03.29.12
	(version=SSLv3 cipher=OTHER); Fri, 30 Nov 2012 03:29:13 -0800 (PST)
Message-ID: <50B89887.3070003@gmail.com>
Date: Fri, 30 Nov 2012 12:29:11 +0100
From: =?ISO-8859-1?Q?David_Nystr=F6m?= <david.c.nystrom@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <50B63784.5050502@enea.com> <1354119751.15992.2.camel@ted>
	<CADkTA4P8=aLSXNTAENp+WW7xX+ttYAPhPufRE=+yn9KXOY8Sag@mail.gmail.com>
	<50B71FD4.3090304@enea.com> <50B766CC.4030904@se-eng.com>
	<1354197267.4053.4.camel@ted>
In-Reply-To: <1354197267.4053.4.camel@ted>
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
X-List-Received-Date: Fri, 30 Nov 2012 11:43:35 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/29/2012 02:54 PM, Richard Purdie wrote:
> On Thu, 2012-11-29 at 06:44 -0700, Raymond Danks wrote:
>> Thanks for looping me in here David. The initial goal for the meta-xen
>> layer was in fact to encompass Xen Cloud Platform.  As such, the intent
>> was to contain both hypervisor and user-space applications.  Indeed, the
>> xen distribution itself includes xm/libxl; hypervisor abstraction would
>> be somewhat tedious in my opinion.
>>
>> The layer just received commits for expanding the libvirt build to
>> support qemu.  The commonalities and shared packaged between xen, qemu,
>> and kvm implementations are such that I would also agree that meta-xen
>> should be expanded/renamed to encompass all virtualization types; I also
>> support the move to meta-virtualization.
>>

meta-virtualization sounds good, let co-op on this so we don't duplicate 
work.

>> As far as a meta-cloud layer is concerned, I'm not sure I am
>> knowledgeable enough in this area to weigh in.  I'm currently
>> researching a filesystem implementation for OpenStack and have stumbled
>> across Ceph/RBD and Gluster modules that look promising. On top of this,
>> XCP is documented to include support for VastSky and can be integrated
>> with DRBD.  And, the storage and hypervisor are only two pieces of the
>> puzzle for a cloud implementation!
>>

Cool !
I know, the meta-"cloud" name is quite/too ambitious, it was not meant 
to be a one week effort. But why aim low :).

>> I think I would encourage you to also include OpenStack in a
>> meta-virtualization layer until it has matured to the point where
>> abstraction is more warranted.

Agree.

>> Since you've already created a presence
>> at github, would it be possible to rename your layer to
>> meta-virtualization and absorb the entire meta-xen layer?  I can push
>> any changes for Xen/XCP here, it sounds like it is a central place for
>> libvirt and could also contain Bruce's kernel modifications.
>>
>> Alternatively, I can create a meta-virtualization project.  In any case,
>> those on the To and CC list should receive access to this layer as a
>> starting point.
>>
>> Just my two cents.  :)
>
> I'd like to offer to host this combined layer (whatever we decide to
> call it) on git.yoctoproject.org if that would help people and people
> are interested. My only concern is in the area of maintainership, we
> need to clearly define who maintains what and what the patch submission
> process is in the README.
>

Thanks,

Sounds good to centralize everything, since Raymond is the majority code 
contributor, perhaps he, if willing, can maintain the 
meta-virtualization layer.
If you want a co/sub-maintainer I'll be happy to help out.


> Cheers,
>
> Richard
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



