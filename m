Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3B3AF796BF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2018 11:03:52 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w8BB3pXf022151
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Tue, 11 Sep 2018 12:03:53 +0100
Message-ID: <ebb98875748fd4ea061979a741d941c433ba591a.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andrea Adami <andrea.adami@gmail.com>, Khem Raj <raj.khem@gmail.com>
Date: Tue, 11 Sep 2018 12:03:51 +0100
In-Reply-To: <CAAQYJAv5m+H=aOsG=C2f8fWvw-oqgbuTWfbjQprEe2XtZjkiHQ@mail.gmail.com>
References: <20180727074130.19685-1-raj.khem@gmail.com>
	<CAAQYJAv5m+H=aOsG=C2f8fWvw-oqgbuTWfbjQprEe2XtZjkiHQ@mail.gmail.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] defaultsetup.conf: Enable security flags+pie by default
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
X-List-Received-Date: Tue, 11 Sep 2018 11:03:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2018-09-07 at 15:28 +0200, Andrea Adami wrote:
> What is holding back this patch?

I think there were concerns about changing the OE defaults like this so
Khem and I agreed to merge it into poky as a default there for now.
There are probably a few defaults in poky we should have in
defaultsetup but those changes tend to be disruptive and
controversial...

Cheers,

Richard

