Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 0CD9478491
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 13:02:35 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Jun 2017 06:02:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,347,1493708400"; d="scan'208";a="98629631"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga004.jf.intel.com with ESMTP; 16 Jun 2017 06:02:35 -0700
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <1497602550-1491-1-git-send-email-richard.purdie@linuxfoundation.org>
	<1497602550-1491-3-git-send-email-richard.purdie@linuxfoundation.org>
	<867deeaf462e453b8de99a2fa9f609ec@XBOX02.axis.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <ca0a4fe0-c6ad-32f5-7d12-4ddf918ea295@linux.intel.com>
Date: Fri, 16 Jun 2017 16:02:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <867deeaf462e453b8de99a2fa9f609ec@XBOX02.axis.com>
Subject: Re: [PATCH 3/4] kconfig-frontends: Remove as only needed for eglibc
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
X-List-Received-Date: Fri, 16 Jun 2017 13:02:36 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 06/16/2017 03:36 PM, Peter Kjellerstedt wrote:

> Please move it to meta-oe if you remove it from OE-core. We rely on it.

Peter, may I suggest that you create this patch? It's trivial to do, and 
sets a better precedent, in my opinion.

Alex


