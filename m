Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9A9347197E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Apr 2017 17:20:08 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Apr 2017 10:20:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,191,1488873600"; d="scan'208";a="87964486"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga005.fm.intel.com with ESMTP; 12 Apr 2017 10:20:06 -0700
To: openembedded-core@lists.openembedded.org
References: <8d9c24ce-6a90-e080-dbe9-b3edba59aac4@linux.intel.com>
	<1491999248-3509-1-git-send-email-dv@pseudoterminal.org>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <5ede1c9a-ac67-c0fd-da11-8ec77066e1c8@linux.intel.com>
Date: Wed, 12 Apr 2017 20:19:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1491999248-3509-1-git-send-email-dv@pseudoterminal.org>
Subject: Re: [PATCH v2] kmscube: add recipe
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
X-List-Received-Date: Wed, 12 Apr 2017 17:20:08 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 04/12/2017 03:14 PM, Carlos Rafael Giani wrote:
> This is a demo application that draws a three-dimensional spinning cube
> using EGL on top of KMS, via Mesa's GBM library. A rough counterpart to
> glxgears, it is a useful tool for BSP makers to try the 3D rendering
> functionality based on EGL and OpenGL ES in a KMS environment, without
> having to set up Wayland or X11.
>
> It is also interesting for Yocto-based  projects that do not need any
> windowing environment and instead render their visual output fullscreen
> to KMS directly, since they can use it as a reference.

This is much better, but will have to wait until after 2.3 is out.

Alex


