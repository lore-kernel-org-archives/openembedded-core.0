Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 36FA26E26B;
	Mon, 16 Nov 2015 09:42:20 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 16 Nov 2015 01:42:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,301,1444719600"; d="scan'208";a="851874626"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 16 Nov 2015 01:42:20 -0800
Message-ID: <5649A542.8000307@linux.intel.com>
Date: Mon, 16 Nov 2015 11:43:30 +0200
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <58488.10.252.13.130.1447346734.squirrel@linux.intel.com>	<CALbNGRTcwpywgtSJvm-q6aZHK5vaF5BFcxmKseHYjcy6aWnmBg@mail.gmail.com>	<4335862.fNWyiaI9Bu@peggleto-mobl.ger.corp.intel.com>	<CAP9ODKqk4B_i+59asEqoVNjkynBWTACD0cM4f0JdxMCopprTkA@mail.gmail.com>
	<20151113114617.GB2567@jama>
In-Reply-To: <20151113114617.GB2567@jama>
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
X-List-Received-Date: Mon, 16 Nov 2015 09:42:25 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/2015 01:46 PM, Martin Jansa wrote:

>>>> 1) or even better in a separate repo
>>>
>>> To be honest, I had anticipated this being a separate meta-qt4 repo myself. It
>>> would be consistent with what has been done with Qt 5 and much earlier with
>>> Qt 3.
>>
>> Agreed.
>
> I'm also fine with separate layer.
>
> Even better for me, I'll be less tempted to include it in my world
> builds and to fix qt-mobility-* issues.

Making a separate repository with this layer is even more disruptive, 
and complicates administration and maintenance. I'm not going to handle 
those. So I'll make a meta-qt4 layer under meta-oe, and it's fine if 
there is no official maintainer or ongoing build testing for it at least 
until someone volunteers to pick it up.


Alex


