Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id EE33271BA6
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Sep 2017 12:10:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v85CA4wq010774
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 5 Sep 2017 05:10:04 -0700 (PDT)
Received: from [172.25.44.7] (172.25.44.7) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 5 Sep 2017 05:10:03 -0700
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, Andre McCurdy
	<armccurdy@gmail.com>
References: <1499405543-3127-1-git-send-email-tobiasha@axis.com>
	<2d1bb10c-e13c-79d0-4e0e-bd5aa5d99a42@axis.com>
	<CAJ86T=Vfoe5e86OokE3j9dY8Lc0s4A1OAZPwo318mYdFiKTYdA@mail.gmail.com>
	<0fa15a09e9554731a800e4e771e25ab9@XBOX02.axis.com>
	<CAJ86T=XX0-pkH-4jRMq1o3pJbz-iwGcksGuR7oZHkaYgn86new@mail.gmail.com>
	<e986d856398445c89fa14558da885793@XBOX02.axis.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <90ef5ca5-9697-773a-3281-68a5683cbc95@windriver.com>
Date: Tue, 5 Sep 2017 08:10:02 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <e986d856398445c89fa14558da885793@XBOX02.axis.com>
X-Originating-IP: [172.25.44.7]
Cc: Tobias Hagelborn <tobiasha@axis.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 0/2] Make source code browsable locally - devtool srctree
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
X-List-Received-Date: Tue, 05 Sep 2017 12:10:15 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 2017-09-01 08:00 AM, Peter Kjellerstedt wrote:
> Well, the most common request we've gotten from the developers is that
> they want to be able to search through all the sources, e.g., to find
> out where a particular function is used. The tmp directory does not
> lend itself very well to this, given that it also contains all build
> trees, applied patches and other meta information that bitbake needs.
> Thus the idea for the parallel tree with only the source references.
> 
> //Peter

A shadow tree of links to the source is "mostly harmless" to experts
and useful for newbies and code browsers as you explained.

The src dir should be under tmp/src though since anything
that can be regenerated shouldn't be in the top level
project directory.

We don't pay that much (enough?) attention to the SECTION tag
and something like half of the oe-core recicpes doen't
have one. I suppose this feature would encourage us to
fix that.

Have you run your script with meta-openembedded and other layers?

-- 
# Randy MacLeod.  WR Linux
# Wind River an Intel Company

