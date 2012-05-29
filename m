Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1SZTSi-0003cQ-6g
	for openembedded-core@lists.openembedded.org;
	Tue, 29 May 2012 22:56:16 +0200
Received: by wgbdr1 with SMTP id dr1so3939965wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2012 13:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:content-transfer-encoding:subject:date:message-id
	:cc:to:mime-version:x-mailer;
	bh=eYuSRhnsppM8G8rBr29CtA4OGSfgRLWfWOdKnKR7HxQ=;
	b=JDclJPz+uByy8L7AiYgZ+uJuuDtyD2c4gIca1sqs1TiyffNz+Erbonjrm5FgOO3Qrh
	Gi/LZPag9TKMRCKK6OXgzGgmyogoIToR5ILV30iT3Okwk+w9Gl4ZNufcsyfMYg00/uTL
	5r8Iq1PjlqizO821yN8GYicojOZPjp7wp+aYdvg6itsZfKDcEBh/SlIjBN2qG3zyOXGQ
	z3pzP14TQTjkHoiuL+pyn6bJT+SrG5uJCGGQnu8lkrqvpQM2brpkCl8ZdANIJpoaKrTi
	D8TcOdZtmdf7kdKBzNXtUY3gWo41e3YHtyOHj1FXUxnXK5T7hLtWDGp3BE10YSCdTAN2
	OGQw==
Received: by 10.216.195.201 with SMTP id p51mr8606493wen.158.1338324358664;
	Tue, 29 May 2012 13:45:58 -0700 (PDT)
Received: from [192.168.1.36] (247.Red-83-60-170.dynamicIP.rima-tde.net.
	[83.60.170.247])
	by mx.google.com with ESMTPS id dg2sm48467909wib.4.2012.05.29.13.45.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 29 May 2012 13:45:57 -0700 (PDT)
From: Elvis Dowson <elvis.dowson@gmail.com>
Date: Tue, 29 May 2012 22:45:58 +0200
Message-Id: <10E43685-CA73-4A70-8890-E8CC780CD034@gmail.com>
To: Adrian Alonso <aalonso00@gmail.com>
Mime-Version: 1.0 (Apple Message framework v1278)
X-Mailer: Apple Mail (2.1278)
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: meta-xilinx: Which version of the linux kernel?
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
X-List-Received-Date: Tue, 29 May 2012 20:56:16 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi Adrian,
                    Could you please tell me which version of the linux =
kernel, the meta-xilinx layer was tested against, using ISE 12.1?

At the moment I get an error because no version number is specified for =
the kernel recipe, so I think I have to rename it to something like say =
linux-xilinx-3.2.bb or linux-xilinx-2.6.38.bb.

Here is an output of the errors that I get when trying to bitbake =
meta-toolchain:

$ bitbake meta-toolchain
Pseudo is not present but is required, building this first before the =
main build
NOTE: Error expanding variable pkg_postinst_kernel-base                  =
                                    | ETA:  --:--:--
NOTE: Error during finalise of =
/tool/yocto/meta-xilinx/recipes-kernel/linux/linux-xilinx_git.bb
ERROR: Failure expanding variable KERNEL_PRIORITY, expression was =
${@int(d.getVar('PV',1).split('-')[0].split('+')[0].split('.')[0]) * =
10000 +                        =
int(d.getVar('PV',1).split('-')[0].split('+')[0].split('.')[1]) * 100 +  =
                      =
int(d.getVar('PV',1).split('-')[0].split('+')[0].split('.')[-1])} which =
triggered exception ValueError: invalid literal for int() with base 10: =
'git'
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


Best regards,

Elvis Dowson=


