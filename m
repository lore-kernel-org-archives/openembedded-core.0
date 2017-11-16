Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id CD88B787A7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Nov 2017 17:54:13 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Nov 2017 09:54:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,404,1505804400"; 
   d="scan'208";a="5794492"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 16 Nov 2017 09:54:13 -0800
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <20171116174541.3081-1-ricardo.ribalda@gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <db49b730-240f-3d14-3fd0-31e109bd2ee2@linux.intel.com>
Date: Thu, 16 Nov 2017 19:54:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171116174541.3081-1-ricardo.ribalda@gmail.com>
Subject: Re: [PATCH v2] meson: Port pkgconfig-native patch to 0.43.0
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
X-List-Received-Date: Thu, 16 Nov 2017 17:54:13 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/16/2017 07:45 PM, Ricardo Ribalda Delgado wrote:
> +Some libraries, like QT, have pre-processors that convert their input
> +files into something that the cross-compiler can process. We find the
> +path of those pre-processors via pkg-config-native instead of
> +pkg-config.
> +
> +This path forces the use of pkg-config-native for host_bins arguments.
> +
> +There are some discussions upstream to merge this patch, but I presonaly believe
> +that is is OE only. https://github.com/mesonbuild/meson/issues/1849#issuecomment-303730323

Does the snippet from Martin's patch that I just commented on solve this 
issue in a much simpler way?

Alex

