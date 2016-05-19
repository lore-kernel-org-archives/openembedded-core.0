Return-Path: <tristan.vanberkom@codethink.co.uk>
Received: from ducie-dc1.codethink.co.uk (ducie-dc1.codethink.co.uk
	[185.25.241.215])
	by mail.openembedded.org (Postfix) with ESMTP id 0597D62136
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 03:35:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by ducie-dc1.codethink.co.uk (Postfix) with ESMTP id E5EDE462E17;
	Thu, 19 May 2016 04:35:16 +0100 (BST)
X-Virus-Scanned: Debian amavisd-new at ducie-dc1.codethink.co.uk
Received: from ducie-dc1.codethink.co.uk ([127.0.0.1])
	by localhost (ducie-dc1.codethink.co.uk [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id nPuWxl9nxBSa; Thu, 19 May 2016 04:35:14 +0100 (BST)
Received: from think (unknown [114.207.54.40])
	by ducie-dc1.codethink.co.uk (Postfix) with ESMTPSA id 49F29462D3A;
	Thu, 19 May 2016 04:35:11 +0100 (BST)
Message-ID: <1463628906.20980.12.camel@codethink.co.uk>
From: Tristan Van Berkom <tristan.vanberkom@codethink.co.uk>
To: Gary Thomas <gary@mlbassoc.com>, openembedded-core@lists.openembedded.org
Date: Thu, 19 May 2016 12:35:06 +0900
In-Reply-To: <573D300C.5080309@mlbassoc.com>
References: <cover.1463562174.git.liezhi.yang@windriver.com>
	<4d1dd04acc6195e8e498741a36b67b208c62b32b.1463562174.git.liezhi.yang@windriver.com>
	<CAMKF1srNvmFgT0s_Tp174WO4SG2RAXUkhcg5_41Vu0V5NRHgwg@mail.gmail.com>
	<573D300C.5080309@mlbassoc.com>
Organization: Codethink LTD
X-Mailer: Evolution 3.18.5.1-1 
Mime-Version: 1.0
Subject: Re: [PATCH 1/1] webkitgtk: turn off JIT on armv4 and armv7a
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
X-List-Received-Date: Thu, 19 May 2016 03:35:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2016-05-19 at 05:16 +0200, Gary Thomas wrote:
[...]
> Why do you think that changing the instruction set (to thumb2) would
> make the JIT work any better?
> 
> If you tell me how, I'll test it on my i.MX6 (Cortex-A9) which is
> the platform that inspired the original bug report.

FWIW, I ran into this issue as well the first time I tried building
webkitgtk with a compiler tuned for armv7a.

I did not try many variations but was able to build with a machine
configuration with DEFAULTTUNE set to armv7ahf-neon (hard float with
neon simd).

This link seems to also provide some more information on what
configurations can be used to build webkitgtk on arm:
    http://patchwork.openembedded.org/patch/105081/

Cheers,
    -Tristan


