Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <david.c.nystrom@gmail.com>) id 1Teu8Y-00078U-Nu
	for openembedded-core@lists.openembedded.org;
	Sat, 01 Dec 2012 21:58:10 +0100
Received: by mail-lb0-f175.google.com with SMTP id gg13so1243217lbb.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 01 Dec 2012 12:43:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=lgwR8OtKfXpb/jmpzQ7kvczZsHSpAYgpX+2RHcolCXY=;
	b=bLLURZGK+rTdbVhpLGtfeNljCJYOPyHwwWR0G2/lnmYZ0Z+pEUMdvzwtmxaVeiUaYT
	0eQTjvcr+HQVCvT5AuC4zb+xpl/AnCtRVLknbsWxJylzWqF7/+f8V0FlBpVQXcAcaUSh
	ZrmfgCmpf16tiRlq14oJhYylGyFYcIYVuAOe4XhgxT+mhhx7vn6JiyCvRPvQ/dHAzroD
	VmRWFQxVW/iPA0ROnaObO/h0/yb8fn0JS0pwGSgabN5hmxJvHVIKpZ5ZHhVXp0HlS5nw
	RRDSF71FsiP33v6Z+S2v/FOgpfA1MVKC7i8LuqT4nN4DslI6L9F8EcPwyRST4X6ujZKu
	fUyQ==
Received: by 10.112.38.226 with SMTP id j2mr2446555lbk.128.1354394631672;
	Sat, 01 Dec 2012 12:43:51 -0800 (PST)
Received: from [79.102.65.90] (c-4f66415a-74736162.cust.telenor.se.
	[79.102.65.90])
	by mx.google.com with ESMTPS id oz12sm3361640lab.17.2012.12.01.12.43.49
	(version=SSLv3 cipher=OTHER); Sat, 01 Dec 2012 12:43:50 -0800 (PST)
Message-ID: <50BA6C04.9040900@gmail.com>
Date: Sat, 01 Dec 2012 21:43:48 +0100
From: =?ISO-8859-1?Q?David_Nystr=F6m?= <david.c.nystrom@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Michael Halstead <michael@yoctoproject.org>
References: <50B63784.5050502@enea.com> <1354119751.15992.2.camel@ted>
	<CADkTA4P8=aLSXNTAENp+WW7xX+ttYAPhPufRE=+yn9KXOY8Sag@mail.gmail.com>
	<50B71FD4.3090304@enea.com> <50B766CC.4030904@se-eng.com>
	<1354197267.4053.4.camel@ted> <50B89887.3070003@gmail.com>
	<50B8E999.2050109@linux.intel.com>
	<CADkTA4OPBKm6c1BPx3PGVuN9AHsmJZbG7Z7XhZd2OzT==Q5mHg@mail.gmail.com>
	<50B8F4FE.1070003@yoctoproject.org> <50B9145E.9080005@se-eng.com>
	<50B93FFB.9050505@yoctoproject.org>
In-Reply-To: <50B93FFB.9050505@yoctoproject.org>
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
X-List-Received-Date: Sat, 01 Dec 2012 20:58:10 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

On 12/01/2012 12:23 AM, Michael Halstead wrote:
> On 11/30/2012 12:17 PM, Raymond Danks wrote:
>> On 11/30/2012 11:03 AM, Michael Halstead wrote:
>>> On 11/30/2012 09:26 AM, Bruce Ashfield wrote:
>>>>
>>>>
>>>>
>>>> On Fri, Nov 30, 2012 at 12:15 PM, Saul Wold <sgw@linux.intel.com
>>>> <mailto:sgw@linux.intel.com>> wrote:
>>>>
>>>>      On 11/30/2012 03:29 AM, David Nyström wrote:
>>>>
>>>>          On 11/29/2012 02:54 PM, Richard Purdie wrote:
>>>>
>>>>              On Thu, 2012-11-29 at 06:44 -0700, Raymond Danks wrote:
>>>>
>>>>                  Thanks for looping me in here David. The initial
>>>>                  goal for the meta-xen
>>>>                  layer was in fact to encompass Xen Cloud Platform.
>>>>                   As such, the intent
>>>>                  was to contain both hypervisor and user-space
>>>>                  applications.  Indeed, the
>>>>                  xen distribution itself includes xm/libxl;
>>>>                  hypervisor abstraction would
>>>>                  be somewhat tedious in my opinion.
>>>>
>>>>                  The layer just received commits for expanding the
>>>>                  libvirt build to
>>>>                  support qemu.  The commonalities and shared packaged
>>>>                  between xen, qemu,
>>>>                  and kvm implementations are such that I would also
>>>>                  agree that meta-xen
>>>>                  should be expanded/renamed to encompass all
>>>>                  virtualization types; I also
>>>>                  support the move to meta-virtualization.
>>>>
>>>>
>>>>          meta-virtualization sounds good, let co-op on this so we
>>>>          don't duplicate
>>>>          work.
>>>>
>>>>      If everyone is OK with this, I will have Michael Halstead create
>>>>      a repo, please send him your keys so that you will have write
>>>>      access to it.
>>>>
>>>>
>>>> This works for me. If Michael already has our keys, do we need to
>>>> resend or can
>>>> a local copy happen ?
>>> I already have keys for,
>>>
>>> David Nystrom df:2d:b1:59:f3:d7:73:fc:59:36:7b:cf:85:28:a7:50
>>> Bruce Ashfield  4f:93:90:b2:c7:a1:45:21:f2:47:31:6f:60:f9:60:02
>>>
>>> Either of you can currently add
>>> git@git.yoctoproject.org:meta-virtualization as a git remote and
>>> start the repository. Once we have initial code and the maintainers
>>> and patch submission guidelines in the readme I can publicly list the
>>> new repository.
>>>
>>> I require an ssh public key for Raymond Danks.
>> Thanks Michael.  I got your response and was able to push meta-xen to
>> the newly created repository on meta-virtualization.  I added one
>> commit to tweak the README and conf/layer.conf for the new name.
>>>
>>>
>>> We also need a short description for the listing on
>>> git.yoctoproject.org. I could be something similar to, but better
>>> than, "Layer enabling virtualization support. "
>> How about "Layer enabling hypervisor, virtualization tool stack, and
>> cloud support."
>>
> Sounds good to me. Thank you.
>> Also - I referenced the mail alias meta-virtualization at yoctoproject
>> in the README.  When you publish this, can we use something like that
>> as well?
>>
> I can add a private list for meta-virtualization@yoctoproject.org. Who
> shall I add to membership?
>

I would like to be added, since it seems I can't add myself at 
https://lists.yoctoproject.org/listinfo

Best Regards,
David




