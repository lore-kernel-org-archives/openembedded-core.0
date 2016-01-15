Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3B580731EC;
	Fri, 15 Jan 2016 18:18:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0FIIcIA006069; Fri, 15 Jan 2016 18:18:38 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id tW4Z_D-ygKer; Fri, 15 Jan 2016 18:18:38 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0FIIaqw006059
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 15 Jan 2016 18:18:37 GMT
Message-ID: <1452881916.27999.1.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, Patches and discussions about the
	oe-core layer <openembedded-core@lists.openembedded.org>, openembeded-devel
	<openembedded-devel@lists.openembedded.org>
Date: Fri, 15 Jan 2016 18:18:36 +0000
In-Reply-To: <2EB9392C-58FE-4807-9E1D-41738D761079@gmail.com>
References: <2EB9392C-58FE-4807-9E1D-41738D761079@gmail.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: Remove pth recipe
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
X-List-Received-Date: Fri, 15 Jan 2016 18:18:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2016-01-13 at 09:36 -0800, Khem Raj wrote:
> Hi All,
> 
> We are carrying pth recipe in OE-Core.
> 
> 1. There are no packages in OE-Core which depend on it.
> 2. pth is quite old ( last release was in 2006) moreover there is
> npth replacement available and we have recipe in OE-Core
> 
> I would like to propose a removal of this recipe but before doing so,
> but wanted to find if there are any active users of this package
> 
> if you use it the please respond

Sounds good to me if nothing depends on it FWIW.

Cheers,

Richard

