Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2107560557
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Oct 2018 21:39:40 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w9VLdbic026125
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Wed, 31 Oct 2018 21:39:38 GMT
Message-ID: <a7ddb9edd7b0256003aab8b4e2101dbbb90b2bbf.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: akuster808 <akuster808@gmail.com>, Alexander Kanavin
	<alex.kanavin@gmail.com>, Oleksandr Kravchuk
	<open.source@oleksandr-kravchuk.com>
Date: Wed, 31 Oct 2018 21:39:37 +0000
In-Reply-To: <d3099fd6-6334-a61c-7a98-38a381661d90@gmail.com>
References: <20181008210551.1394-1-dev@sashko.rv.ua>
	<acc91765-559e-ffc3-3ed7-3c802bf7be1a@sashko.rv.ua>
	<A58156EC-A873-4737-8CBA-A8F8AA86FFA3@gmail.com>
	<d3099fd6-6334-a61c-7a98-38a381661d90@gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] connman: update to 1.36
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
X-List-Received-Date: Wed, 31 Oct 2018 21:39:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2018-10-31 at 13:51 -0700, akuster808 wrote:
> On 10/31/18 12:15 PM, Alexander Kanavin wrote:
> > There is a feature freeze up until thud is released. Generally
> > version upgrades aren’t accepted in M4 phase.
> 
> 
> Did I miss the announcement that no patches will be accepted?

Nobody has said "no patches will be accepted". The weekly status
reports do have a theme though:

https://lists.yoctoproject.org/pipermail/yocto/2018-September/042436.html

"We’re now into M3 feature freeze so new feature patches, particularly
for unplanned changes will be much less likely to be merged until 2.7
now."

https://lists.yoctoproject.org/pipermail/yocto/2018-October/042725.html

"We’re now past feature freeze and all major changes planned for 2.6
have been merged so only bug fixes will be accepted now."


https://lists.yoctoproject.org/pipermail/yocto/2018-October/042790.html

"We’re now past feature freeze and all major changes planned for 2.6
have been merged so only bug fixes will be accepted now."

https://lists.yoctoproject.org/pipermail/yocto/2018-October/042948.html

We have branched for thud at this point and the new release branches
have been created. We have not started working on master patches yet
though, we’re still concentrating on the 2.6 release.

https://lists.yoctoproject.org/pipermail/yocto/2018-October/043068.html

We’re starting to see patches being submitted for master but these will
continue to be a secondary priority until 2.6 is released.


So I think its quite clear we're focused on 2.6 and whilst the status
update does not spell it out, the definition of M4 is no version
upgrades unless they're for security issues or major bugfixes and no
new features.

Cheers,

Richard


