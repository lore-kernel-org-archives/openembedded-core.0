Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 5B00D6093E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jan 2018 11:11:58 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w03BBvDD007270
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Wed, 3 Jan 2018 11:11:58 GMT
Message-ID: <1514977917.5525.130.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Date: Wed, 03 Jan 2018 11:11:57 +0000
In-Reply-To: <20171221130434.24427-2-alexander.kanavin@linux.intel.com>
References: <20171221130434.24427-1-alexander.kanavin@linux.intel.com>
	<20171221130434.24427-2-alexander.kanavin@linux.intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 2/9] gnomebase.bbclass: split into autotools and meson versions
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
X-List-Received-Date: Wed, 03 Jan 2018 11:11:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2017-12-21 at 15:04 +0200, Alexander Kanavin wrote:
> gnomebase.bbclass unfortunately hardcodes the autotools inherit,
> so we have to introduce gnomebase-nobuildsystem.bbclass where
> the common bits between autotools and meson classes can be placed.

In the interests of trying to avoid a ton more class files, could you
tweak this to do something like:

GNOMEBASEBUILDCLASS ??= "autotools"

inherit ${GNOMEBASEBUILDCLASS}

and then 

GNOMEBASEBUILDCLASS = "meson"
inherit gnomebase-autotools

(or the other way around but you get the idea)

Cheers,

Richard


