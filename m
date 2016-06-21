Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id BEA46612E5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2016 14:57:22 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga103.jf.intel.com with ESMTP; 21 Jun 2016 07:57:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,504,1459839600"; d="scan'208";a="126024274"
Received: from lsandov1-mobl2.zpn.intel.com (HELO [10.219.5.155])
	([10.219.5.155])
	by fmsmga004.fm.intel.com with ESMTP; 21 Jun 2016 07:57:24 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Christopher Larson <clarson@kergoth.com>,
	"Jolley, Stephen K" <stephen.k.jolley@intel.com>
References: <9ADD3FDE8B189B4AA2F8A3C711F8155E5718DD13@fmsmsx111.amr.corp.intel.com>
	<CABcZANkPQBWukZTtzz69JQZHOFRpnXyPV1BvP8Bv-CZqqRtSkA@mail.gmail.com>
	<1466201427.25557.39.camel@linuxfoundation.org>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Message-ID: <e99c75eb-a359-de49-acc2-624e99601128@linux.intel.com>
Date: Tue, 21 Jun 2016 09:59:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <1466201427.25557.39.camel@linuxfoundation.org>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] Yocto Project Status WW25
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
X-List-Received-Date: Tue, 21 Jun 2016 14:57:23 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit



On 06/17/2016 05:10 PM, Richard Purdie wrote:
> On Fri, 2016-06-17 at 14:42 -0700, Christopher Larson wrote:
>> On Fri, Jun 17, 2016 at 8:31 AM, Jolley, Stephen K <
>> stephen.k.jolley@intel.com> wrote:
>>> ·        There is a multilib issue related to the layout of the
>>> host libraries leaking into python’s build process which we’re
>>> struggling to debug
>> Could I get some details on this? I've seen something like this where
>> cmake and automake are relying on sys.lib from python3-native/python
>> -native to determine the sitepackages directory, is that the behavior
>> others are hitting? So python modules end up in /usr/lib/ rather than
>> /usr/lib64/, for example?
>>
>> If that's the issue in question, the issue is the mismatch between
>> the native sys.lib and target. We already patch automake to fall back
>> to using our libdir + python version to determine the path, but only
>> if it wasn't able to use sys.lib to do so. If we change that to
>> always use libdir+python version, it should fix the automake
>> packages. Then we might need to patch FindPythonLibs in cmake to do
>> the same. I'm testing the automake change locally now.
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=9717 is the bug
Proposed fixed for this problem:

http://lists.openembedded.org/pipermail/openembedded-core/2016-June/123061.html 

> Cheers,
>
> Richard


