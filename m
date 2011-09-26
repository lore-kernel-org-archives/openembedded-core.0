Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gchoc-openembedded-core@m.gmane.org>)
	id 1R8Bnu-0006f5-8x for openembedded-core@lists.openembedded.org;
	Mon, 26 Sep 2011 16:05:07 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gchoc-openembedded-core@m.gmane.org>)
	id 1R8Bih-0004fH-MZ for openembedded-core@lists.openembedded.org;
	Mon, 26 Sep 2011 15:59:43 +0200
Received: from nat-rup.mentorg.com ([139.181.168.34])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2011 15:59:43 +0200
Received: from dbaryshkov by nat-rup.mentorg.com with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2011 15:59:43 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-core@lists.openembedded.org
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Date: Mon, 26 Sep 2011 17:58:37 +0400
Message-ID: <j5q0g1$u9t$1@dough.gmane.org>
References: <1316950444.8185.14.camel@ted>	<1DFC8F6E-C652-42A6-83B2-147A77A70A95@dominion.thruhere.net>	<j5pran$mtt$1@dough.gmane.org>
	<1317040621.26109.32.camel@ted>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: nat-rup.mentorg.com
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.21) Gecko/20110831 Iceowl/1.0b2 Icedove/3.1.13
In-Reply-To: <1317040621.26109.32.camel@ted>
Subject: Re: qt3 vs qt4 issues
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
X-List-Received-Date: Mon, 26 Sep 2011 14:05:07 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/26/2011 04:36 PM, Richard Purdie wrote:
> On Mon, 2011-09-26 at 16:30 +0400, Dmitry Eremin-Solenikov wrote:
>> On 09/25/2011 06:50 PM, Koen Kooi wrote:
>>>
>>> Op 25 sep. 2011, om 13:33 heeft Richard Purdie het volgende geschreven:
>>>
>>>> I've been looking at the qt3 failures on the autobuilder. It seems there
>>>> is some kind of contamination between the qt4 builds and the qt3 builds
>>>> and I'm not sure what is or isn't expected to work there.
>>>>
>>>> We're doing the following in the build:
>>>>
>>>> a) Build core-image-lsb (includes qt4, builds qt4+qt4-native)
>>>> b) Wipe out tmp
>>>> c) Add in meta-qt3 layer
>>>> d) Enable sstate from build in a)
>>>> e) Build core-image-lsb-qt3 which adds in qt3
>>>> f) Bitbake determines it needs to install qt4 for the image but
>>>>     nothing depends on the native qt4 tools so these are not installed
>>>> g) This will build qt3+qt3-native with qt4 in the sysroot but no
>>>>     qt4-native
>>>> h) We see build failures as qt3 seems to want to find bits of qt4-native
>>>>
>>>> If qt4 and qt4-native are present, qt3 works
>>>> If qt4 and qt4-native are not present, qt3 works
>>>> If qt4 is present but qt4-native is not, qt3 fails
>>>>
>>>> How do we fix this?
>>>
>>> I suspect qt3 is missing bits of the tool renaming we do for qt4 and qt2 (moc, uic, lrelease, etc)
>>
>> Most probably it's true. However for qt3 it can be harder, as qt4
>> already provides uic3, etc.
>
> If there is overlap, the files could be installed into subdirectories
> under bin and then inserted into PATH by the appropriate .bbclass
> files...

For qt2/opie we just install uic/moc as uic2/moc2 and the select 
appropriate tools by passing OE_xxx_MOC (I don't remember xxx ATM) 
environment variable to qmake/make.

-- 
With best wishes
Dmitry



