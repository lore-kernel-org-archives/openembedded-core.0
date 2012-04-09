Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SHHCp-0003dt-1F
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Apr 2012 18:12:39 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q39G3Kkw004670
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 9 Apr 2012 09:03:20 -0700 (PDT)
Received: from msp-dhcp17.wrs.com (172.25.34.17) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Mon, 9 Apr 2012 09:03:20 -0700
Message-ID: <4F830847.1020501@windriver.com>
Date: Mon, 9 Apr 2012 11:03:19 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1333481624.git.mark.hatle@windriver.com>
	<c1765e7544603baa60bec27185a947aeee404bee.1333481624.git.mark.hatle@windriver.com>
	<4F7CC6E6.6020006@opendreambox.org>
	<CAMKF1soi+==bbEKMD+FLdk+8BvWNK3Nj24EJVhoyT5e=_5MvDw@mail.gmail.com>
	<4F7F28FB.20600@windriver.com>
	<CAMKF1srkXSBHFtO__F9m9TQ=dJzfn+7kfmXoK4=tWknEdc80eg@mail.gmail.com>
	<4F7F85DC.2000301@windriver.com>
	<4F820472.1080109@opendreambox.org>
	<4F82FD70.9080609@windriver.com>
	<1B24CCF7-14B3-47EC-9CF9-369EB44A3C70@dominion.thruhere.net>
In-Reply-To: <1B24CCF7-14B3-47EC-9CF9-369EB44A3C70@dominion.thruhere.net>
Subject: Re: [PATCH 3/7] conf/machine/include: Cleanup MIPS tunings to match README
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
X-List-Received-Date: Mon, 09 Apr 2012 16:12:39 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 4/9/12 10:56 AM, Koen Kooi wrote:
>
> Op 9 apr. 2012, om 17:17 heeft Mark Hatle het volgende geschreven:
>
>> On 4/8/12 4:34 PM, Andreas Oberritter wrote:
>>> On 07.04.2012 02:10, Mark Hatle wrote:
>>>> Just ran a local build with the qemumips machine, this is a standard
>>>> mips32 target.
>>>>
>>>>  From the configure line for eglibc:
>>>>
>>>> /msp-lpggp1/mhatle/git/oe-core/build-mips32/tmp-eglibc/work/mips32-oe-linux/eglibc-2.13-r23+svnr15508/eglibc-2_13/libc/configure
>>>> --build=x86_64-linux --host=mips-oe-linux --target=mips-oe-linux
>>>> --prefix=/usr --exec_prefix=/usr --bindir=/usr/bin --sbindir=/usr/sbin
>>>> --libexecdir=/usr/libexec --datadir=/usr/share --sysconfdir=/etc
>>>> --sharedstatedir=/com --localstatedir=/var --libdir=/usr/lib
>>>> --includedir=/usr/include --oldincludedir=/usr/include
>>>> --infodir=/usr/share/info --mandir=/usr/share/man --disable-silent-rules
>>>> --disable-dependency-tracking
>>>> --with-libtool-sysroot=/msp-lpggp1/mhatle/git/oe-core/build-mips32/tmp-eglibc/sysroots/qemumips
>>>> --enable-kernel=2.6.16 --without-cvs --disable-profile --disable-debug
>>>> --without-gd --enable-clocale=gnu
>>>> --enable-add-ons=ports,nptl,libidn,ports
>>>> --with-headers=/msp-lpggp1/mhatle/git/oe-core/build-mips32/tmp-eglibc/sysroots/qemumips/usr/include
>>>> --without-selinux
>>>>
>>>> The system is correctly setting the target to "mips-oe-linux".
>>>>
>>>> I checked and bash is the same way.
>>>>
>>>> So the canonical arch is correct, the mips32 is only the packaging
>>>> arch.  It was always intended that the packaging arch be used in full on
>>>> MIPS.  (This will allow us to specify mips32r2, mipsiii, mipsiv, etc as
>>>> necessary if we expand the mips tunings.)
>>>
>>> I don't think such a change should be done only few days before a
>>> release. Until this patch was applied, the packaging arch has always
>>> been mipsel, not mips32el. Please, revert or fix this!
>>
>> This is easy to change to the previous behavior...  however it was a bug in the original implementation.
>>
>> But again, I stress nothing changed except for the packaging arch... the way the packages are configured, compiled, installed remain the same, only the package arch has changed.
>
> "only"

Yes, only.  The package arch is used by the feed system and the build of the 
images.  I verified the images were still being generated corrected.  I did not 
verify anything within external package feeds, as I have no way to easily do this.

If anything else in the system is using the package arch as a key, then it's 
broken.  The configure arch, the tuning, and similar are all reasonable things 
to use, but the package arch is arbitrary.  We may have a fairly defined, 
defacto set, but they really are arbitrary and should not affect any software -- 
other then those directly working with the package feeds.

--Mark

>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



