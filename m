Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 95BDE786BA
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Dec 2017 17:39:47 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	vB4HddV9016018
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Mon, 4 Dec 2017 17:39:41 GMT
Message-ID: <1512409179.862.212.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@windriver.com>, Khem Raj
	<raj.khem@gmail.com>
Date: Mon, 04 Dec 2017 17:39:39 +0000
In-Reply-To: <ad367df7-795c-20c9-eef3-436f12038f97@windriver.com>
References: <cover.1512401707.git.bruce.ashfield@windriver.com>
	<fc66fbd898d637782560e123ec6a87a62dde89fc.1512401707.git.bruce.ashfield@windriver.com>
	<CAMKF1soUD8m1vOyzVwiygp3ib4jCyy7dfdqxde2Y-LG_CXqOTA@mail.gmail.com>
	<ad367df7-795c-20c9-eef3-436f12038f97@windriver.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, Saul Wold <saul.wold@intel.com>
Subject: Re: [PATCH 8/8] linux-yocto-dev: update to v4.15+
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
X-List-Received-Date: Mon, 04 Dec 2017 17:39:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2017-12-04 at 12:24 -0500, Bruce Ashfield wrote:
> On 2017-12-04 11:38 AM, Khem Raj wrote:
> > 
> > On Mon, Dec 4, 2017 at 7:39 AM, Bruce Ashfield
> > <bruce.ashfield@windriver.com> wrote:
> > > 
> > > Outside of the normal patch refreshes and boot issues, there are
> > > new
> > > build time tools within the kernel that required the following
> > > dependencies:
> > > 
> > > For ORC_UNWINDER support in x86-64:
> > > 
> > >   DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-
> > > native elfutils', '', d)}"
> > do we need both target and host elfutils
> Yup. There were references to both. Some had to run for hostcc
> and others in the target arch.

Just for reference this is pretty bad for performance as it delays the
kernel compile until some substantial parts of userspace build.

Is ORC_UNWINDER useful and commonly used?

Cheers,

Richard

