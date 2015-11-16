Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 7C6A9762AF;
	Mon, 16 Nov 2015 10:24:55 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 16 Nov 2015 02:24:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,302,1444719600"; d="scan'208";a="686463865"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 16 Nov 2015 02:24:54 -0800
Message-ID: <5649AF3D.2020106@linux.intel.com>
Date: Mon, 16 Nov 2015 12:26:05 +0200
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: Andreas Oberritter <obi@opendreambox.org>, 
	openembedded-devel@lists.openembedded.org, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <58488.10.252.13.130.1447346734.squirrel@linux.intel.com>
	<CALbNGRTcwpywgtSJvm-q6aZHK5vaF5BFcxmKseHYjcy6aWnmBg@mail.gmail.com>
	<4335862.fNWyiaI9Bu@peggleto-mobl.ger.corp.intel.com>
	<CAP9ODKqk4B_i+59asEqoVNjkynBWTACD0cM4f0JdxMCopprTkA@mail.gmail.com>
	<20151113114617.GB2567@jama> <5649A542.8000307@linux.intel.com>
	<5649AACB.6070204@opendreambox.org>
In-Reply-To: <5649AACB.6070204@opendreambox.org>
Subject: volunteers for meta-qt4 repo maintenance?
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
X-List-Received-Date: Mon, 16 Nov 2015 10:24:57 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 11/16/2015 12:07 PM, Andreas Oberritter wrote:
>> Making a separate repository with this layer is even more disruptive,
>> and complicates administration and maintenance. I'm not going to handle
>> those. So I'll make a meta-qt4 layer under meta-oe, and it's fine if
>> there is no official maintainer or ongoing build testing for it at least
>> until someone volunteers to pick it up.
>
> Basically everyone agreed on moving qt4 to its own repo. And your
> conclusion is to ignore that and move qt4 to meta-openembedded, already
> expecting bitrot?

Are you willing to be the maintainer of that separate repo? So far no 
one has stepped up for this job. In this situation, it's better to keep 
the recipes under meta-openembedded tree and mark them as unmaintained.

I'll ask this explicitly - any volunteers for a separate meta-qt4 
repository and layer maintenance?


Alex


