Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (unknown [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 6C81465D5B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 May 2014 12:01:25 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 21 May 2014 05:01:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,879,1392192000"; d="scan'208";a="535409507"
Received: from mmckenna-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.156])
	by fmsmga001.fm.intel.com with ESMTP; 21 May 2014 05:01:23 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
Date: Wed, 21 May 2014 13:01:22 +0100
Message-ID: <6870056.jNAsUvdqdq@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.5 (Linux/3.14.4-200.fc20.x86_64; KDE/4.12.5; x86_64; ; )
In-Reply-To: <1400672277-7181-2-git-send-email-Matthieu.Crapet@ingenico.com>
References: <1400672277-7181-1-git-send-email-Matthieu.Crapet@ingenico.com>
	<1400672277-7181-2-git-send-email-Matthieu.Crapet@ingenico.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/4] libav: add version 10.1
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
X-List-Received-Date: Wed, 21 May 2014 12:01:27 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Matthieu,

On Wednesday 21 May 2014 13:37:55 Matthieu Crapet wrote:
> Using common libav.inc

I'm not exactly thrilled with the prospect of carrying not just two but now 
three versions of libav - do you know what the compatibility story is for 
libav 10 with the recipes we would want to build against it (i.e. those 
currently building against 9.x)?

> Notice that DEFAULT_PREFERENCE = "-1" is not included.

Given that we need 0.8.x to be built for gstreamer 0.10 which (as we've 
discussed recently) is still needed, unless we can add some extra dependency 
relationship which forces the correct version of libav to be built as Richard 
suggested I don't think we can remove DEFAULT_PREFERENCE here.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

