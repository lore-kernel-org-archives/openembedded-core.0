Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 17E4778976
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Mar 2018 09:01:14 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Mar 2018 01:01:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,411,1515484800"; d="scan'208";a="35368826"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 02 Mar 2018 01:01:14 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <20180301140052.1388-1-alexander.kanavin@linux.intel.com>
	<20180301140052.1388-7-alexander.kanavin@linux.intel.com>
	<CAJTo0Lb+JQLsZh+ZKC0BPyg+uo=u0rROS44=Er6ezHr0f1QOsQ@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <7b13b018-7b5e-559a-6ec2-19548c5fcf22@linux.intel.com>
Date: Fri, 2 Mar 2018 10:55:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0Lb+JQLsZh+ZKC0BPyg+uo=u0rROS44=Er6ezHr0f1QOsQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 07/15] gtk-doc.bbclass: inherit python3native
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
X-List-Received-Date: Fri, 02 Mar 2018 09:01:15 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 03/02/2018 01:34 AM, Burton, Ross wrote:
> Can the inherit of python3native be avoided if gtk-doc isn't enabled? 
>   (I just removed the dependency on py3native in glib)

gobject-introspection has the same inherit. And meson, and rpm. I don't 
think we should fight against this: python3 does not take very long to 
build, and is not on a critical path (from my many observations of the 
build process). I'd look into why perl takes over 4 minutes to build first.

Alex

