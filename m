Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id BCFF8600E3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Nov 2017 16:15:58 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Nov 2017 09:15:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,335,1505804400"; d="scan'208";a="145192071"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga004.jf.intel.com with ESMTP; 02 Nov 2017 09:15:54 -0700
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
References: <20171102053922.33426-1-raj.khem@gmail.com>
	<44258d74-acbd-45cf-0a00-c82554be03ec@linux.intel.com>
	<CAP9ODKqKMjmPLm0yP91ojS3OX5rLkEW34uwrvR02V5rcs4VWGA@mail.gmail.com>
	<e7b239be-9c34-18b1-7b63-006334d7d2db@linux.intel.com>
	<CAP9ODKpwhAMfUwiSj4uJnt0yDbPXBe6LVK23v8UfMK-feJe-8A@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <9b96b81f-d727-1c7c-d943-0c9bd6aed0c6@linux.intel.com>
Date: Thu, 2 Nov 2017 18:15:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <CAP9ODKpwhAMfUwiSj4uJnt0yDbPXBe6LVK23v8UfMK-feJe-8A@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V3] musl: Update to 1.1.18
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
X-List-Received-Date: Thu, 02 Nov 2017 16:15:58 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/02/2017 06:10 PM, Otavio Salvador wrote:

> I agree partially; if it points to a tag it can be said in a comment
> ... using SRCPV for this kind of recipe makes sense as it allows for
> easy tracking of the revision in use.

But you can use SRCREV for that. Why the need specifically for SRCPV?

Alex

