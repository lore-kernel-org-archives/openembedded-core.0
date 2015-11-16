Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 380BE7653B;
	Mon, 16 Nov 2015 11:22:26 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 16 Nov 2015 03:22:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,302,1444719600"; d="scan'208";a="601037944"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 16 Nov 2015 03:22:25 -0800
Message-ID: <5649BCB9.4090708@linux.intel.com>
Date: Mon, 16 Nov 2015 13:23:37 +0200
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
References: <58488.10.252.13.130.1447346734.squirrel@linux.intel.com>	<CALbNGRTcwpywgtSJvm-q6aZHK5vaF5BFcxmKseHYjcy6aWnmBg@mail.gmail.com>	<4335862.fNWyiaI9Bu@peggleto-mobl.ger.corp.intel.com>	<CAP9ODKqk4B_i+59asEqoVNjkynBWTACD0cM4f0JdxMCopprTkA@mail.gmail.com>	<20151113114617.GB2567@jama>	<5649A542.8000307@linux.intel.com>
	<CAP9ODKpU_6sVy6iidiCem8Sb+EWAgNCVrvOPmOhr4_uMt174Hw@mail.gmail.com>
In-Reply-To: <CAP9ODKpU_6sVy6iidiCem8Sb+EWAgNCVrvOPmOhr4_uMt174Hw@mail.gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] qt4 moves out of oe-core - to meta-qt4, or to meta-oe?
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
X-List-Received-Date: Mon, 16 Nov 2015 11:22:27 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/16/2015 01:20 PM, Otavio Salvador wrote:

>> Making a separate repository with this layer is even more disruptive, and
>> complicates administration and maintenance. I'm not going to handle those.
>> So I'll make a meta-qt4 layer under meta-oe, and it's fine if there is no
>> official maintainer or ongoing build testing for it at least until someone
>> volunteers to pick it up.
>
> I will nack the patch to include it onto meta-oe; I also guess that
> Martin will also nack it.
>
> Make it another layer as suggested, please.

A separate layer under meta-openembedded or a separate repository with 
the layer? Please be clear.


Alex


