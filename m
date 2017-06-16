Return-Path: <martin.jansa@gmail.com>
Received: from mail-yw0-f181.google.com (mail-yw0-f181.google.com
	[209.85.161.181])
	by mail.openembedded.org (Postfix) with ESMTP id 9FE01784F8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 18:39:22 +0000 (UTC)
Received: by mail-yw0-f181.google.com with SMTP id l75so23407803ywc.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 11:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=1IS5nT8/1bBmTzc2uDVlPUuMPx1ViQfmic6unYveLjc=;
	b=l4joqA1tyQs50dimxOJiEOaZvUvPbujMSisOcApMMpFGrYomDQQ+wSj47tj06QgT5W
	4wBRJUIzCMmzZMWwBQpCmW2STeGOyrRjN81EX6jKGIiYQBCSqio7mckSoyTdMHsUOLeY
	jCpZPBKmYlO0I+lC5/ozjZ3QJxZ2p5XReNWM99MT7F0GTPT2knyKmJr62Hy2oQQo+w0h
	jzDdIquk2wVzLEcL90j9IYw/gqitb2abPv0G1thmj4mJ+toAH0KBNvimrsXDhLe3mbsh
	HVf8OK1ENpnrAUN8sP4RgTVxFxsDqaHWeAxxwZeofL6rtKBsCcgxPfE5zfZy0Uu5iD7u
	Zqhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=1IS5nT8/1bBmTzc2uDVlPUuMPx1ViQfmic6unYveLjc=;
	b=n0WOB1fvNZ5/GObQcPp67W7QVt+uVhwCTtZn5ilwBd7wnwlocu3rWIVZLKIIM64KFQ
	1uLorkPbiEIUxEWRo65TCWz1t7i+y5q1I9fM59iJARlVRXTxEMNJ1tNTX3O7W9tgGa+p
	okX0Q4QmCtg7666U41TjTx53DYR2+vcTPvPLOo6Qp2TUMJq0g9li/BrMypoyoZBu7kd/
	TW5DkJFVCjYOHr3X9/VjXaRArveabg07nx803XrmGue6Bo3CGAV/2QXaC9QzGqG3dg69
	O0sq51Kq4UaVy4VxJKEzfgAxGmSvWwt+BuvSmKFtNmvWWgexAMqOq0tBh2rYEs9bNXW5
	x/bg==
X-Gm-Message-State: AKS2vOz8mBFzCJhlcS5UvdE2zsDjhPfd+NSEI4zjfS9yFSdc1gWiHztz
	yz4EiuCy5RuX4F1oXpchPoX0sXysSIUh
X-Received: by 10.13.200.135 with SMTP id k129mr9622043ywd.243.1497638363210; 
	Fri, 16 Jun 2017 11:39:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.181.204 with HTTP; Fri, 16 Jun 2017 11:39:22 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 16 Jun 2017 20:39:22 +0200
Message-ID: <CA+chaQeJVOrExYkyWCsyx+mtARAuvhge6a_ds=n_pXXuYofaXw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: New warning from linux-yocto
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
X-List-Received-Date: Fri, 16 Jun 2017 18:39:23 -0000
Content-Type: multipart/alternative; boundary="001a114dbd90a429a90552181a43"

--001a114dbd90a429a90552181a43
Content-Type: text/plain; charset="UTF-8"

New linux-yocto version.. new warning..

WARNING: linux-yocto-4.10.17+gitAUTOINC+4b89f331d4_6648a34e00-r0
do_kernel_configcheck: [kernel config]: specified values did not make
it into the kernel's final configuration:

---------- CONFIG_X86_BIGSMP -----------------
Config: CONFIG_X86_BIGSMP
From: /home/jenkins/oe/world/shr-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.kernel-meta/configs/standard/cfg/smp.cfg
Requested value:  CONFIG_X86_BIGSMP=y
Actual value:

--001a114dbd90a429a90552181a43
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">New linux-yocto version.. new warning..<div><br></div><div=
><pre style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:break-w=
ord;margin-top:0px;margin-bottom:0px;color:rgb(51,51,51);font-size:14px">WA=
RNING: linux-yocto-4.10.17+gitAUTOINC+4b89f331d4_6648a34e00-r0 do_kernel_co=
nfigcheck: [kernel config]: specified values did not make it into the kerne=
l&#39;s final configuration:

---------- CONFIG_X86_BIGSMP -----------------
Config: CONFIG_X86_BIGSMP
From: /home/jenkins/oe/world/shr-core/tmp-glibc/work-shared/qemux86-64/kern=
el-source/.kernel-meta/configs/standard/cfg/smp.cfg
Requested value:  CONFIG_X86_BIGSMP=3Dy
Actual value:    =20
</pre></div><div><br></div></div>

--001a114dbd90a429a90552181a43--
