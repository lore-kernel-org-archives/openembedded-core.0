Return-Path: <Nathan_Lynch@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 7B8F065C7B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Jan 2015 13:42:10 +0000 (UTC)
Received: from svr-orw-fem-02x.mgc.mentorg.com ([147.34.96.206]
	helo=SVR-ORW-FEM-02.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1YFjve-00015g-NX from Nathan_Lynch@mentor.com ;
	Mon, 26 Jan 2015 05:42:10 -0800
Received: from [127.0.0.1] (147.34.91.1) by SVR-ORW-FEM-02.mgc.mentorg.com
	(147.34.96.168) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 26 Jan 2015 05:42:10 -0800
Message-ID: <54C64431.6050409@mentor.com>
Date: Mon, 26 Jan 2015 07:42:09 -0600
From: Nathan Lynch <Nathan_Lynch@mentor.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Max Krummenacher <max.oss.09@gmail.com>
References: <1422200019-19095-1-git-send-email-max.krummenacher@toradex.com>
In-Reply-To: <1422200019-19095-1-git-send-email-max.krummenacher@toradex.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe][Patch 0/2] udev: fix ptest to not influence qemu
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
X-List-Received-Date: Mon, 26 Jan 2015 13:42:22 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 01/25/2015 09:33 AM, Max Krummenacher wrote:
> From: Max Krummenacher <max.oss.09@gmail.com<>
> 
> Hi
> 
> On a OE setup configured to build ptest packages udev's ptest test files are
> staged to the sysroot.
> A run of qemu chockes on this test files and never returns.
> 
> A ptest run on the target before any changes failed.
> Patch 1/2 first fixes ptest.
> Patch 2/2 keeps the test files in its tar-ball. run-ptest unpacks it before
> a test and cleans up afterwards.
> 
> This fixes the issues with qemu while the ptests can still be run witout
> failure.

This looks relevant to

https://bugzilla.yoctoproject.org/show_bug.cgi?id=6734
do_rootfs: The postinstall intercept hook 'update_pixbuf_cache' failed



