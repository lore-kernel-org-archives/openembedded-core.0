Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 6A8BF72F87
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 May 2017 18:58:37 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga104.jf.intel.com with ESMTP; 11 May 2017 11:58:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,325,1491289200"; d="scan'208";a="86521099"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga004.jf.intel.com with ESMTP; 11 May 2017 11:58:37 -0700
To: jose.perez.carranza@linux.intel.com,
	openembedded-core@lists.openembedded.org
References: <bd532acb-3dda-ac74-37d8-892fc797a407@linux.intel.com>
	<20170511173303.26995-1-jose.perez.carranza@linux.intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <a5c78ee6-8320-7508-18d1-16762bed364c@linux.intel.com>
Date: Thu, 11 May 2017 21:56:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170511173303.26995-1-jose.perez.carranza@linux.intel.com>
Subject: Re: [PATCH v2] runtime/dnf: Add new dnf test cases
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
X-List-Received-Date: Thu, 11 May 2017 18:58:39 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/11/2017 08:33 PM, jose.perez.carranza@linux.intel.com wrote:
> +    def test_dnf_exclude(self):
> +        excludepkg = 'curl-dev'
> +        self.dnf('list %s' % excludepkg, 0)
> +        self.dnf_with_repo('remove -y curl')
> +        self.dnf_with_repo('install -y --exclude=%s curl' % excludepkg)
> +        self.dnf('list %s' % excludepkg, 1)

1) Why is curl-dev already installed when the test starts? Will that be 
always the case?

2) I still don't understand how the test works. You are asking for curl 
to be installed and curl-dev to be excluded, but curl-dev would not be 
installed regardless of --exclude option, because curl does not depend 
on it. You need to test a situation where --exclude makes a difference, 
and check that there is indeed a difference.

Alex


