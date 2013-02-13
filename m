Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1U5kfX-0001Ct-C9
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Feb 2013 23:19:22 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r1DM37tI025303
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 13 Feb 2013 14:03:08 -0800 (PST)
Received: from msp-dhcp47.wrs.com (172.25.34.47) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Wed, 13 Feb 2013 14:03:05 -0800
Message-ID: <511C0D93.7000707@windriver.com>
Date: Wed, 13 Feb 2013 16:02:59 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130107 Thunderbird/17.0.2
MIME-Version: 1.0
To: McClintock Matthew-B29882 <B29882@freescale.com>
References: <cover.1360270199.git.mark.hatle@windriver.com>
	<01fc2a44e951dd523989d5834ccd5a4e22feb40f.1360270199.git.mark.hatle@windriver.com>
	<70CC66F5C30A414DADDA6973E4CA391A87C379@039-SN1MPN1-001.039d.mgd.msft.net>
In-Reply-To: <70CC66F5C30A414DADDA6973E4CA391A87C379@039-SN1MPN1-001.039d.mgd.msft.net>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [denzil 11/18] qemu-0.15.1: add patch to fix compilatation problems on powerpc
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
X-List-Received-Date: Wed, 13 Feb 2013 22:19:29 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 2/13/13 11:01 AM, McClintock Matthew-B29882 wrote:
> On Thu, Feb 7, 2013 at 5:56 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
>> From: Matthew McClintock <msm@freescale.com>
>>
>> ERROR: Function failed: do_compile (see /opt/yocto/cache-build/p5020ds-64b/build_p5020ds-64b_release/tmp/work/ppc64e5500-fsl-linux/qemu-0.15.1-r6/temp/log.do_compile.28447 for further information)
>> ERROR: Logfile of failure stored in: /opt/yocto/cache-build/p5020ds-64b/build_p5020ds-64b_release/tmp/work/ppc64e5500-fsl-linux/qemu-0.15.1-r6/temp/log.do_compile.28447
>> Log data follows:
>> | DEBUG: SITE files ['endian-big', 'bit-64', 'powerpc-common', 'common-linux', 'common-glibc', 'powerpc-linux', 'powerpc64-linux', 'common']
>> | ERROR: Function failed: do_compile (see /opt/yocto/cache-build/p5020ds-64b/build_p5020ds-64b_release/tmp/work/ppc64e5500-fsl-linux/qemu-0.15.1-r6/temp/log.do_compile.28447 for further information)
>> | NOTE: make -j 24
>> |   LINK  ppc-linux-user/qemu-ppc
>> | /opt/yocto/cache-build/p5020ds-64b/build_p5020ds-64b_release/tmp/sysroots/x86_64-linux/usr/libexec/ppc64e5500-fsl-linux/gcc/powerpc64-fsl-linux/4.6.4/ld:/opt/yocto/cache-build/p5020ds-64b/build_p5020ds-64b_release/tmp/work/ppc64e5500-fsl-linux/qemu-0.15.1-r6/qemu-0.15.1/ppc64.ld:84: syntax error
>> | collect2: ld returned 1 exit status
>> | make[1]: *** [qemu-ppc] Error 1
>> | make: *** [subdir-ppc-linux-user] Error 2
>> | make: *** Waiting for unfinished jobs....
>> | ERROR: oe_runmake failed
>>
>> Signed-off-by: Matthew McClintock <msm@freescale.com>
>>
>> (master rev: a9207aad5b163a071cd8298517d61514c587e0ed)
>>
>> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
>> ---
>>   meta/recipes-devtools/qemu/qemu_0.15.1.bb | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-devtools/qemu/qemu_0.15.1.bb b/meta/recipes-devtools/qemu/qemu_0.15.1.bb
>> index b3fb354..2cc59f6 100644
>> --- a/meta/recipes-devtools/qemu/qemu_0.15.1.bb
>> +++ b/meta/recipes-devtools/qemu/qemu_0.15.1.bb
>> @@ -3,7 +3,7 @@ require qemu.inc
>>   LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
>>                       file://COPYING.LIB;endline=24;md5=c04def7ae38850e7d3ef548588159913"
>>
>> -PR = "r8"
>> +PR = "r9"
>>
>>   FILESPATH = "${FILE_DIRNAME}/qemu-${PV}"
>>   FILESDIR = "${WORKDIR}"
>> --
>> 1.8.1.2.545.g2f19ada
>
> Missing a patch?

I finally understand..  Yes, my mistake, this one had been merged into Denzil 
already and when I rebased I didn't notice.

11/18 can be dropped from the set.  (The other ones will need the PR's 
adjusted.)  If anyone cares, I'll be happy to do this and send up a new set.

--Mark

> -M
>
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



