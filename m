Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R6qMV-0001qG-O5 for openembedded-core@lists.openembedded.org;
	Thu, 22 Sep 2011 22:59:16 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8ML08Ca030872; Thu, 22 Sep 2011 22:00:08 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 3F1dcUyjiBsL; Thu, 22 Sep 2011 22:00:08 +0100 (BST)
Received: from [192.168.250.158] ([116.246.20.131]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8MKxxSG030850
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Thu, 22 Sep 2011 22:00:03 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Darren Hart <dvhart@linux.intel.com>
Date: Thu, 22 Sep 2011 21:53:42 +0100
In-Reply-To: <4E7B9864.3040404@linux.intel.com>
References: <cover.1316717234.git.dvhart@linux.intel.com>
	<4b97e6b25906806eef1131e851abc9526d81d0db.1316717234.git.dvhart@linux.intel.com>
	<1316721518.28323.1.camel@ted> <4E7B949A.8050407@linux.intel.com>
	<4E7B9864.3040404@linux.intel.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1316724829.28323.9.camel@ted>
Mime-Version: 1.0
Cc: oe-core layer <openembedded-core@lists.openembedded.org>, Patches
Subject: Re: [PATCH 1/1] shared-mime-info: add libxml-parser-perl to DEPENDS
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
X-List-Received-Date: Thu, 22 Sep 2011 20:59:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-09-22 at 13:19 -0700, Darren Hart wrote:
> On 09/22/2011 01:03 PM, Saul Wold wrote:
> > On 09/22/2011 12:58 PM, Richard Purdie wrote:
> >> On Thu, 2011-09-22 at 11:49 -0700, Darren Hart wrote:
> >>> Fixes [YOCTO #1514]
> >>>
> >>> Building core-image-minimal on qemuppc (and likely others) can fail in
> >>> the shared-mime-info configure step with the following error:
> >>>
> > I was thinking about this and went "why is shared-mime-info even in 
> > core-image-minimal", are you sure that was the image you were building. 
> > This might point to some other problem also.
> 
> Yes, core-image-minimal. It also would fail if I just tried to build
> shared-mime-info-native.

Right, its a native dependency being pulled in by one of the tools, not
the image itself...

Cheers,

Richard



