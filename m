Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 0F44F601A5
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Jan 2017 22:42:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v03Mfr7e030684; Tue, 3 Jan 2017 22:41:53 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id hQyNdxlOrwMo; Tue,  3 Jan 2017 22:41:53 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v03MfnhS030678
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 3 Jan 2017 22:41:50 GMT
Message-ID: <1483483309.4367.64.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 03 Jan 2017 22:41:49 +0000
In-Reply-To: <04107922d67fb222e89181e85f914884a34a4141.1482363237.git.alejandro.hernandez@linux.intel.com>
References: <cover.1482363237.git.alejandro.hernandez@linux.intel.com>
	<04107922d67fb222e89181e85f914884a34a4141.1482363237.git.alejandro.hernandez@linux.intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
Subject: Re: [PATCH 1/6] image-live-artifacts: Add support for creating image artifacts only
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
X-List-Received-Date: Tue, 03 Jan 2017 22:42:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2017-01-03 at 22:30 +0000, Alejandro Hernandez wrote:
> From: Tom Zanussi <tom.zanussi@linux.intel.com>
> 
> Rather than create an actual image, just put the image artifacts in
> an 'artifacts' directory that can then be picked up by wic.
> 
> Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>

I think the idea here is good, the implementation is suboptimal though.
The reason being it introduces more variables which do things outside a
clear namespace (ARTIFACTS_ONLY).

I'd really like to see this code trigger off an entry in IMAGE_FSTYPES
like IMAGE_FSTYPES = "live-artifacts-only" or some other such keyword.
The ultimate idea is we'd get rid of all these class specific variables
and you'd just set IMAGE_FSTYPES according to what you want.

The depends on COMPRESSISO also looks like a cut and paste which I'm
not sure could trigger in this codepath?

Cheers,

Richard

