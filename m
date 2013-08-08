Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3805F6AF12
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2013 09:47:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r789lLX5007817
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 8 Aug 2013 02:47:21 -0700 (PDT)
Received: from [128.224.162.218] (128.224.162.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 8 Aug 2013 02:47:19 -0700
Message-ID: <5203691F.9080306@windriver.com>
Date: Thu, 8 Aug 2013 17:47:11 +0800
From: wenzong fan <wenzong.fan@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: "'Patches and discussions about the oe-core layer'"
	<openembedded-core@lists.openembedded.org>
Subject: sstate_create_package fails since 'tar: xxxx: file changed as we read it'
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 08 Aug 2013 09:47:21 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Hi All,

I met it on some packages like: util-macros-native, glib-2.0-native, 
libogg ...

Build host: CentOS 5.9
Error messages:
-------------------------------
DEBUG: Preparing tree 
/home/nxadm/nx/yow-blade4.1/builds-2013-08-06-030257/e500-kvm-guest_std/bitbake_build/tmp/work/x86_64-linux/util-macros-native/1_1.17-r0/sysroot-destdir/home/nxadm/nx/yow-blade4.1/builds-2013-08-06-030257/e500-kvm-guest_std/bitbake_build/tmp/sysroots/x86_64-linux 
for packaging at 
/home/nxadm/nx/yow-blade4.1/builds-2013-08-06-030257/e500-kvm-guest_std/bitbake_build/tmp/work/x86_64-linux/util-macros-native/1_1.17-r0/sstate-build-populate-sysroot/x86_64-linux
NOTE: Removing hardcoded paths from sstate package: 'grep -Irl 
/home/nxadm/nx/yow-blade4.1/builds-2013-08-06-030257/e500-kvm-guest_std/bitbake_build/tmp/sysroots 
/home/nxadm/nx/yow-blade4.1/builds-2013-08-06-030257/e500-kvm-guest_std/bitbake_build/tmp/work/x86_64-linux/util-macros-native/1_1.17-r0/sstate-build-populate-sysroot/ 
| xargs grep -l -e 
'/home/nxadm/nx/yow-blade4.1/builds-2013-08-06-030257/e500-kvm-guest_std/bitbake_build/tmp/sysroots' 
| tee /home/nxadm/nx/yow-blade4.1/builds-2013-08-0
6-030257/e500-kvm-guest_std/bitbake_build/tmp/work/x86_64-linux/util-macros-native/1_1.17-r0/sstate-build-populate-sysroot/fixmepath 
| xargs --no-run-if-empty sed -i -e 
's:/home/nxadm/nx/yow-blade4.1/builds-2013-08-06-030257/e500-kvm-guest_std/bitbake_build/tmp/sysroots:FIXMESTAGINGDIR:g''
NOTE: Replacing absolute paths in fixmepath file: 'sed -i -e 
's:^/home/nxadm/nx/yow-blade4.1/builds-2013-08-06-030257/e500-kvm-guest_std/bitbake_build/tmp/work/x86_64-linux/util-macros-native/1_1.17-r0/sstate-build-populate-sysroot/::g' 
/home/nxadm/nx/yow-blade4.1/builds-2013-08-06-030257/e500-kvm-guest_std/bitbake_build/tmp/work/x86_64-linux/util-macros-native/1_1.17-r0/sstate-build-populate-sysroot/fixmepath'
DEBUG: Executing shell function sstate_create_package
tar: x86_64-linux/usr/share/aclocal/xorg-macros.m4: file changed as we 
read it
WARNING: 
/home/nxadm/nx/yow-blade4.1/builds-2013-08-06-030257/e500-kvm-guest_std/bitbake_build/tmp/work/x86_64-linux/util-macros-native/1_1.17-r0/temp/do_populate_sysroot/run.do_populate_sysroot.sstate_create_package.18975:122 
exit 1 from
   tar -czf $TFILE fixmepath x86_64-linux
DEBUG: Python function sstate_task_postfunc finished
-------------------------------

I searched and found this discussions but did not found any conclusions, 
anyone know about that?
-------------------------------
JaMa	anyone seeing:	11:40
JaMa	| DEBUG: Executing shell function sstate_create_package	11:40
JaMa	| tar: x86_64-linux/usr/share/aclocal/lib-prefix.m4: file changed 
as we read it	11:40
JaMa	? I've found 
http://www.mail-archive.com/openembedded-core@lists.openembedded.org/msg36323.html 
but without solution	11:40
JaMa	it happens in different recipes, so far all were -native

RP	JaMa: relatively old OS?	21:26

JaMa	RP: no Ubuntu 12.04	22:15
JaMa	and it started suddenly few days ago even on different machines
-------------------------------

Thanks
Wenzong

