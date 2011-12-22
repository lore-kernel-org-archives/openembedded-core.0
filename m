Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gchoc-openembedded-core@m.gmane.org>)
	id 1Rdj91-0004dv-E3 for openembedded-core@lists.openembedded.org;
	Thu, 22 Dec 2011 14:57:15 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gchoc-openembedded-core@m.gmane.org>)
	id 1Rdj2B-0006WN-4S for openembedded-core@lists.openembedded.org;
	Thu, 22 Dec 2011 14:50:11 +0100
Received: from nat-rup.mentorg.com ([139.181.168.34])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2011 14:50:11 +0100
Received: from dbaryshkov by nat-rup.mentorg.com with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2011 14:50:11 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-core@lists.openembedded.org
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Date: Thu, 22 Dec 2011 17:48:23 +0400
Message-ID: <jcvci7$nff$1@dough.gmane.org>
References: <4EF1F39E.60903@jhksoftware.com> <jct88c$ajb$1@dough.gmane.org>
	<4EF26D31.9050209@eukrea.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: nat-rup.mentorg.com
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:8.0) Gecko/20111109 Icedove/8.0
In-Reply-To: <4EF26D31.9050209@eukrea.com>
Subject: Re: meta-toolchain-qte and wrong paths to QT tools
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
X-List-Received-Date: Thu, 22 Dec 2011 13:57:15 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

On 12/22/2011 03:35 AM, Eric Bénard wrote:
> Hi Dmitry,
>
> Le 21/12/2011 19:22, Dmitry Eremin-Solenikov a écrit :
>> On 12/21/2011 06:56 PM, Juraj Hercek wrote:
>>> Hello list,
>>>
>>> I've two questions:
>>>
>>> 1) When I build meta-toolchain-qte (c2de8d4 metadata revision) and
>>> install the resulting sdk, I see two directories in /usr/local/:
>>> oecore-i686-arm and oecore-i686-i686. What is a rationale behind having
>>> these two directories instead of one i.e.: oecore-i686-arm?
>>
>> Because oecore-i686-i686 holds files that are created on i686 to be
>> used on
>> i686. They will be common for arm meta-toolchain-qte, mips
>> meta-toolchain-qte,
>> powerpc meta-toolchain-qte, etc.
>>
>>> 2) The oecore-i686-arm/environment-setup-armv5te-oe-linux-gnueabi script
>>> sets paths to the QT tools which should be installed in oecore-i686-arm
>>> directory, but they are not. These tools are installed under
>>> oecore-i686-i686 directory. Changing the path in
>>> environment-setup-armv5te-oe-linux-gnueabi after toolchain installation
>>> is easy, but I do not consider it to be a correct fix (assuming that
>>> oecore-i686-{arm,i686} directories represents proper toolchain
>>> structure). What is a proper fix for this issue?
>>
>> I have the attached patch in my patch queue. Hope this helps.
>>
> there seems to be something wrong here :
>
> - (cd ${SDK_OUTPUT}/${QT_TOOLS_PREFIX}/..; ln -s
> ${SDKTARGETSYSROOT}/usr/share/qtopia/mkspecs mkspecs;)
> + (cd ${SDK_NATIVE_OUTPUT}/${QT_TOOLS_PREFIX}/..; ln -s
> ${SDKTARGETSYSROOT}/usr/share/qtopia/mkspecs mkspecs;)
>
>
> ${SDK_NATIVE_OUTPUT} seems undefined.

My fault. I think you can ignore this part of the patch.

>
> Eric


-- 
With best wishes
Dmitry



