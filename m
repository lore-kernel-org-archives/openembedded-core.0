Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TfYf6-0006hs-Be
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Dec 2012 17:14:29 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 03 Dec 2012 08:00:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,208,1355126400"; d="scan'208";a="228293248"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.13.44])
	by orsmga001.jf.intel.com with ESMTP; 03 Dec 2012 08:00:04 -0800
Message-ID: <50BCCC84.5050704@linux.intel.com>
Date: Mon, 03 Dec 2012 08:00:04 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: "Prica, Mihai" <mihai.prica@intel.com>
References: <50B63784.5050502@enea.com> <1354119751.15992.2.camel@ted>
	<CADkTA4P8=aLSXNTAENp+WW7xX+ttYAPhPufRE=+yn9KXOY8Sag@mail.gmail.com>
	<50B71FD4.3090304@enea.com> <50B766CC.4030904@se-eng.com>
	<1354197267.4053.4.camel@ted> <50B89887.3070003@gmail.com>
	<50B8E999.2050109@linux.intel.com>
	<CADkTA4OPBKm6c1BPx3PGVuN9AHsmJZbG7Z7XhZd2OzT==Q5mHg@mail.gmail.com>
	<50B8F4FE.1070003@yoctoproject.org> <50B9145E.9080005@se-eng.com>
	<50B93FFB.9050505@yoctoproject.org> <50BA6C04.9040900@gmail.com>
	<97BD068FB200C44AA73C2B641F162ECF8F2064@IRSMSX101.ger.corp.intel.com>
In-Reply-To: <97BD068FB200C44AA73C2B641F162ECF8F2064@IRSMSX101.ger.corp.intel.com>
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
X-List-Received-Date: Mon, 03 Dec 2012 16:14:29 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

On 12/03/2012 07:20 AM, Prica, Mihai wrote:
> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of David Nyström
> Sent: Saturday, December 01, 2012 10:44 PM
> To: Michael Halstead
> Cc: oe-core layer
> Subject: Re: [OE-core] meta-cloud layer
>
> On 12/01/2012 12:23 AM, Michael Halstead wrote:
>> On 11/30/2012 12:17 PM, Raymond Danks wrote:
>>> On 11/30/2012 11:03 AM, Michael Halstead wrote:
>>>> On 11/30/2012 09:26 AM, Bruce Ashfield wrote:
>>>>>
>>>>>
>>>>>
>>>>> On Fri, Nov 30, 2012 at 12:15 PM, Saul Wold <sgw@linux.intel.com
>>>>> <mailto:sgw@linux.intel.com>> wrote:
>>>>>
>>>>>       On 11/30/2012 03:29 AM, David Nyström wrote:
>>>>>
>>>>>           On 11/29/2012 02:54 PM, Richard Purdie wrote:
>>>>>
>>>>>               On Thu, 2012-11-29 at 06:44 -0700, Raymond Danks wrote:
>>>>>
>>>>>                   Thanks for looping me in here David. The initial
>>>>>                   goal for the meta-xen
>>>>>                   layer was in fact to encompass Xen Cloud Platform.
>>>>>                    As such, the intent
>>>>>                   was to contain both hypervisor and user-space
>>>>>                   applications.  Indeed, the
>>>>>                   xen distribution itself includes xm/libxl;
>>>>>                   hypervisor abstraction would
>>>>>                   be somewhat tedious in my opinion.
>>>>>
>>>>>                   The layer just received commits for expanding the
>>>>>                   libvirt build to
>>>>>                   support qemu.  The commonalities and shared packaged
>>>>>                   between xen, qemu,
>>>>>                   and kvm implementations are such that I would also
>>>>>                   agree that meta-xen
>>>>>                   should be expanded/renamed to encompass all
>>>>>                   virtualization types; I also
>>>>>                   support the move to meta-virtualization.
>>>>>
>>>>>
>>>>>           meta-virtualization sounds good, let co-op on this so we
>>>>>           don't duplicate
>>>>>           work.
>>>>>
>>>>>       If everyone is OK with this, I will have Michael Halstead create
>>>>>       a repo, please send him your keys so that you will have write
>>>>>       access to it.
>>>>>
>>>>>
>>>>> This works for me. If Michael already has our keys, do we need to
>>>>> resend or can a local copy happen ?
>>>> I already have keys for,
>>>>
>>>> David Nystrom df:2d:b1:59:f3:d7:73:fc:59:36:7b:cf:85:28:a7:50
>>>> Bruce Ashfield  4f:93:90:b2:c7:a1:45:21:f2:47:31:6f:60:f9:60:02
>>>>
>>>> Either of you can currently add
>>>> git@git.yoctoproject.org:meta-virtualization as a git remote and
>>>> start the repository. Once we have initial code and the maintainers
>>>> and patch submission guidelines in the readme I can publicly list the
>>>> new repository.
>>>>
>>>> I require an ssh public key for Raymond Danks.
>>> Thanks Michael.  I got your response and was able to push meta-xen to
>>> the newly created repository on meta-virtualization.  I added one
>>> commit to tweak the README and conf/layer.conf for the new name.
>>>>
>>>>
>>>> We also need a short description for the listing on
>>>> git.yoctoproject.org. I could be something similar to, but better
>>>> than, "Layer enabling virtualization support. "
>>> How about "Layer enabling hypervisor, virtualization tool stack, and
>>> cloud support."
>>>
>> Sounds good to me. Thank you.
>>> Also - I referenced the mail alias meta-virtualization at yoctoproject
>>> in the README.  When you publish this, can we use something like that
>>> as well?
>>>
>> I can add a private list for meta-virtualization@yoctoproject.org. Who
>> shall I add to membership?
>>
>>
>> I would like to be added, since it seems I can't add myself at
>> https://lists.yoctoproject.org/listinfo
>>
>> Best Regards,
>> David
>
> I would like to be added as well to the private list.
>
Just to be clear to all this is not a private list, there was some issue 
I think with getting it initialized, it is visiable and available to all 
from the https://lists.yoctoproject.org/listinfo URL, and it is getting 
added to the main list of Mailing lists today.

Sorry for any confusion.

Sau!


> Thanks,
> Mihai
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>


