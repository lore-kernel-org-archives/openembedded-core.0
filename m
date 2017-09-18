Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id E1B7778264
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Sep 2017 13:34:10 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga105.fm.intel.com with ESMTP; 18 Sep 2017 06:34:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,413,1500966000"; d="scan'208";a="153083444"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga006.fm.intel.com with ESMTP; 18 Sep 2017 06:34:11 -0700
To: Will Newton <will.newton@gmail.com>, Armin Kuster <akuster808@gmail.com>
References: <20170911124558.2863-1-otavio@ossystems.com.br>
	<20170911124558.2863-5-otavio@ossystems.com.br>
	<CAFbHwiSZswkrn2u6_4U7gOd7r=vDzAVGNPdBT+CD_k2Soc0ifQ@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <93b87dd3-5a75-1c8a-1e79-490059dd3313@linux.intel.com>
Date: Mon, 18 Sep 2017 16:30:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CAFbHwiSZswkrn2u6_4U7gOd7r=vDzAVGNPdBT+CD_k2Soc0ifQ@mail.gmail.com>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v5 04/26] goarch.bbclass: Replace logic for setting GOARM
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
X-List-Received-Date: Mon, 18 Sep 2017 13:34:11 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 09/18/2017 04:26 PM, Will Newton wrote:
> Would it be possible to get this patch backported to the Pyro branch?
> 
> It fixes running Go programs on Raspberry Pi 1 systems which without
> this will die with illegal instruction errors.

Just do the backport and submit it to this list with [pyro] prefix.


Alex

