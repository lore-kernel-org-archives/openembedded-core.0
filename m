Return-Path: <nathan.rossi@xilinx.com>
Received: from va3outboundpool.messaging.microsoft.com
	(va3ehsobe004.messaging.microsoft.com [216.32.180.14])
	by mail.openembedded.org (Postfix) with ESMTP id 321B96E881
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2014 01:20:11 +0000 (UTC)
Received: from mail202-va3-R.bigfish.com (10.7.14.252) by
	VA3EHSOBE009.bigfish.com (10.7.40.29) with Microsoft SMTP Server id
	14.1.225.22; Tue, 28 Jan 2014 01:20:10 +0000
Received: from mail202-va3 (localhost [127.0.0.1])	by
	mail202-va3-R.bigfish.com (Postfix) with ESMTP id 4797ED80230	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2014 01:20:10 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:149.199.60.83; KIP:(null); UIP:(null); IPV:NLI;
	H:xsj-gw1; RD:unknown-60-83.xilinx.com; EFVD:NLI
X-SpamScore: -2
X-BigFish: VPS-2(zz9371I542I1432Izz1f42h2148h208ch1ee6h1de0h1fdah2073h2146h1202h1e76h2189h1d1ah1d2ah21bch1fc6hzz1de098h8275bh8275dh1de097hz2fh95h109h839h944hd24hf0ah119dh1220h1288h12a5h12a9h12bdh137ah13b6h1441h14ddh1504h1537h153bh162dh1631h1758h18e1h1946h19b5h1b0ah224fh1d0ch1d2eh1d3fh1dfeh1dffh1e1dh1fe8h1ff5h2216h2336h2438h2461h2487h24d7h906i1155h)
Received-SPF: pass (mail202-va3: domain of xilinx.com designates 149.199.60.83
	as permitted sender) client-ip=149.199.60.83;
	envelope-from=nathan.rossi@xilinx.com; helo=xsj-gw1 ;
	helo=xsj-gw1 ; 
Received: from mail202-va3 (localhost.localdomain [127.0.0.1]) by mail202-va3
	(MessageSwitch) id 1390872009149106_19855;
	Tue, 28 Jan 2014 01:20:09 +0000 (UTC)
Received: from VA3EHSMHS044.bigfish.com (unknown [10.7.14.229])	by
	mail202-va3.bigfish.com (Postfix) with ESMTP id EBE6C44004C	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2014 01:20:08 +0000 (UTC)
Received: from xsj-gw1 (149.199.60.83) by VA3EHSMHS044.bigfish.com
	(10.7.99.54) with Microsoft SMTP Server id 14.16.227.3; Tue, 28 Jan 2014
	01:20:05 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-smtp1)	by
	xsj-gw1 with esmtp (Exim 4.63)	(envelope-from
	<nathan.rossi@xilinx.com>)	id
	1W7xLR-0007aH-NI	for openembedded-core@lists.openembedded.org;
	Mon, 27 Jan 2014 17:20:05 -0800
From: Nathan Rossi <nathan.rossi@xilinx.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH v2] kernel.bbclass: Fix empty modules directory QA issue
Thread-Index: AQHPEMbqTIXCp29OKUCuI60SINr61ZqZa8ag
Date: Tue, 28 Jan 2014 01:19:59 +0000
References: <2bba5e79-d06e-4b11-98ab-59506c84f896@AM1EHSMHS006.ehs.local>
	<1389662460-29515-1-git-send-email-nathan.rossi@xilinx.com>
In-Reply-To: <1389662460-29515-1-git-send-email-nathan.rossi@xilinx.com>
Accept-Language: en-AU, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.164.59]
MIME-Version: 1.0
X-RCIS-Action: ALLOW
Message-ID: <47446eb5-b21a-46d3-af8c-03a1a61cdd06@VA3EHSMHS044.ehs.local>
X-OriginatorOrg: xilinx.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
Subject: Re: [PATCH v2] kernel.bbclass: Fix empty modules directory QA issue
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
X-List-Received-Date: Tue, 28 Jan 2014 01:20:12 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Nathan Rossi [mailto:nathan.rossi@xilinx.com]
> Sent: Tuesday, January 14, 2014 11:21 AM
> To: openembedded-core@lists.openembedded.org
> Cc: Nathan Rossi; Robert Yang
> Subject: [PATCH v2] kernel.bbclass: Fix empty modules directory QA issue
>
> If a kernel is built without any external modules (aka no CONFIG_*=3Dm),
> then during a modules_install of the kernel an empty directory is
> created at /lib/modules/${KERNEL_VERIONS}/kernel. This is behaviour of
> the kernel infrastructure, the directory would normally be populated
> with the modules that were built.
>
> However because of the expectations of kernel-modules-split, no packages
> are created when there are no modules and an empty directory lingers.
> This raises QA issues as warning or errors (depending on the distro).
>
> The following patch changes the kernel_do_install task to check if the
> directory is empty and if so removes it.
>
> Signed-off-by: Nathan Rossi <nathan.rossi@xilinx.com>
> ---
>  meta/classes/kernel.bbclass |    2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 5fef446..f4dcba5 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -183,6 +183,8 @@ kernel_do_install() {
>               oe_runmake DEPMOD=3Decho INSTALL_MOD_PATH=3D"${D}" modules_=
install
>               rm "${D}/lib/modules/${KERNEL_VERSION}/build"
>               rm "${D}/lib/modules/${KERNEL_VERSION}/source"
> +             # If the kernel/ directory is empty remove it to prevent QA=

> issues
> +             rmdir --ignore-fail-on-non-empty
> "${D}/lib/modules/${KERNEL_VERSION}/kernel"
>       else
>               bbnote "no modules to install"
>       fi
> --
> 1.7.9.5
>

Ping, any additional concerns with this patch?

Regards,
Nathan


This email and any attachments are intended for the sole use of the named r=
ecipient(s) and contain(s) confidential information that may be proprietary=
, privileged or copyrighted under applicable law. If you are not the intend=
ed recipient, do not read, copy, or forward this email message or any attac=
hments. Delete this email message and any attachments immediately.



