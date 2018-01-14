Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A7069786B6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Jan 2018 09:20:12 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w0E9KBf1025349
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Sun, 14 Jan 2018 09:20:12 GMT
Message-ID: <1515921611.29722.193.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	openembedded-core@lists.openembedded.org
Date: Sun, 14 Jan 2018 09:20:11 +0000
In-Reply-To: <20180112220906.27915-1-alistair.francis@xilinx.com>
References: <20180112220906.27915-1-alistair.francis@xilinx.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: vineethchowz.chowdary@xilinx.com
Subject: Re: [PATCH v3] receipes-devtools: QEMU: Bump to version 2.11.0
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
X-List-Received-Date: Sun, 14 Jan 2018 09:20:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2018-01-12 at 14:09 -0800, Alistair Francis wrote:
> Use the latest QEMU release 2.11. Remove all patches that are no
> longer
> required as they have been merged into the 2.11 releaese. One patch
> had
> to be updated to apply to thet 2.11 tree.
> 
> This also reverts a linux user patch to avoid webkitgtk build hangs.
> 
> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>

Sorry, could you rebase this against master again please? There were
some other qemu patches which have gone in and I'm struggling to get
this to apply.

If the musl issue is fixed this should be straightforward to merge now.

Cheers,

Richard

