Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id D3F5075A0E;
	Mon, 22 Jun 2015 12:22:20 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 22 Jun 2015 05:22:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,659,1427785200"; d="scan'208";a="592493731"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.143])
	([10.237.68.143])
	by orsmga003.jf.intel.com with ESMTP; 22 Jun 2015 05:22:21 -0700
Message-ID: <5587FE0C.5040705@linux.intel.com>
Date: Mon, 22 Jun 2015 15:22:36 +0300
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <20150619165245.GB2398@jama>
	<CAJTo0LZBZJdUbqPWNDsJ6SmgPHmpio0JwVE=xfsen-2OoB0RnQ@mail.gmail.com>
In-Reply-To: <CAJTo0LZBZJdUbqPWNDsJ6SmgPHmpio0JwVE=xfsen-2OoB0RnQ@mail.gmail.com>
Subject: Re: [oe] State of bitbake world, Failed tasks 2015-06-19
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
X-List-Received-Date: Mon, 22 Jun 2015 12:22:27 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 06/22/2015 02:07 PM, Burton, Ross wrote:

> I've just filed a bug for this chunk, looks like we missed something when
> disabling GStreamer 0.10 in Qt.

Not really; the recipes for qt-mobility were moved from oe-core to 
meta-oe as they were, without any modifications.

This looks like a simple missing dependency issue, but I don't know why 
it wasn't reported earlier. Note that there are also missing 
dependencies for libxv and qt-creator, so it's not gstreamer-specific


Alex


