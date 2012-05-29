Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1SZT1s-00033o-Ox
	for openembedded-core@lists.openembedded.org;
	Tue, 29 May 2012 22:28:32 +0200
Received: by wgbdr1 with SMTP id dr1so3918046wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2012 13:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:content-transfer-encoding:subject:date:message-id
	:to:mime-version:x-mailer;
	bh=rXBClxYBcnjtQs9izPcUq2uixGLDYvQaKRSYizGhnEU=;
	b=ctfaGJhsuIW+yrReAiKgM80KN0IUx7iNBT+zzX5xnuGDEcrxjR9pksNMnxfofYzSnL
	6XlPkM3of0n2/Xbbydq80nGAdcBCM8Si+Khn2tvcBHU9o5VvHfU28viXtwzbE78e/eSF
	1Lfi6sqo8Ud/aQuY/+PYGwPMBLvRb4/J1DTBH6qr4+Hu6p+dHnSSXXRMouV5mbPnMMvn
	ozaOqC3RTfxMo1e0Ww2GE29jgG7IPZ/JGmL4gjCnhaYXlopi5b3nUd2GMJqpv8GwtsgU
	waPsZ+68fMCe59H5a9pU3soO2pMV3R5Ic5v2PWB/h7sgPaK9l+M10BCtcZvObt5xkijk
	tkcw==
Received: by 10.216.144.145 with SMTP id n17mr8809338wej.101.1338322694482;
	Tue, 29 May 2012 13:18:14 -0700 (PDT)
Received: from [192.168.1.36] (247.Red-83-60-170.dynamicIP.rima-tde.net.
	[83.60.170.247])
	by mx.google.com with ESMTPS id j4sm30326066wiz.1.2012.05.29.13.18.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 29 May 2012 13:18:13 -0700 (PDT)
From: Elvis Dowson <elvis.dowson@gmail.com>
Date: Tue, 29 May 2012 22:18:14 +0200
Message-Id: <3B761AC4-FE90-45BB-912C-4114A3214843@gmail.com>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Apple Message framework v1278)
X-Mailer: Apple Mail (2.1278)
Subject: meta-ti: ERROR: Unable to parse /tool/yocto/meta-ti/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.05.00.03.bb
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
X-List-Received-Date: Tue, 29 May 2012 20:28:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,
      When building with the latest meta-ti layer, I get the following =
error:

ERROR: Unable to analyse format of PR variable: b                        =
                                      | ETA:  00:01:18
ERROR: Unable to parse =
/tool/yocto/meta-ti/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.05.00.=
03.bb
Traceback (most recent call last):
  File "/tool/yocto/poky/bitbake/lib/bb/parse/ast.py", line 381, in =
multi_finalize(fn=3D'/tool/yocto/meta-ti/recipes-bsp/powervr-drivers/omap3=
-sgx-modules_4.05.00.03.bb', d=3D<bb.data_smart.DataSmart object at =
0x337efd0>):
         try:
    >        finalize(fn, d)
         except bb.parse.SkipPackage as e:
  File "/tool/yocto/poky/bitbake/lib/bb/parse/ast.py", line 323, in =
finalize(fn=3D'/tool/yocto/meta-ti/recipes-bsp/powervr-drivers/omap3-sgx-m=
odules_4.05.00.03.bb', d=3D<bb.data_smart.DataSmart object at =
0x337efd0>, variant=3DNone):
             code.append("%s(d)" % funcname)
    >    bb.utils.simple_exec("\n".join(code), {"d": d})
         bb.data.update_data(d)
  File "/tool/yocto/poky/bitbake/lib/bb/utils.py", line 274, in =
simple_exec(code=3D'__anon_119__tool_yocto_poky_meta_classes_staging_bbcla=
ss(d)\n__anon_540__tool_yocto_poky_meta_classes_base_bbclass(d)\n__anon_17=
6__tool_yocto_poky_meta_classes_package_bbclass(d)\n__anon_1106__tool_yoct=
o_poky_meta_classes_package_rpm_bbclass(d)\n__anon_736__tool_yocto_poky_me=
ta_classes_insane_bbclass(d)\n__anon_20__tool_yocto_poky_meta_classes_debi=
an_bbclass(d)\n__anon_52__tool_yocto_poky_meta_classes_sstate_bbclass(d)',=
 context=3D{'d': <bb.data_smart.DataSmart object at 0x337efd0>}):
     def simple_exec(code, context):
    >    exec(code, _context, context)
    =20
  File "<string>", line 2, in <module>
  File "__anon_540__tool_yocto_poky_meta_classes_base_bbclass", line 75, =
in =
__anon_540__tool_yocto_poky_meta_classes_base_bbclass(d=3D<bb.data_smart.D=
ataSmart object at 0x337efd0>)
AttributeError: 'NoneType' object has no attribute 'group'

ERROR: Command execution failed: Traceback (most recent call last):
  File "/tool/yocto/poky/bitbake/lib/bb/command.py", line 84, in =
runAsyncCommand
    self.cooker.updateCache()
  File "/tool/yocto/poky/bitbake/lib/bb/cooker.py", line 1202, in =
updateCache
    if not self.parser.parse_next():
  File "/tool/yocto/poky/bitbake/lib/bb/cooker.py", line 1671, in =
parse_next
    self.virtuals +=3D len(result)
UnboundLocalError: local variable 'result' referenced before assignment



best regards,

Elvis Dowson



