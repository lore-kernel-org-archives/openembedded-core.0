Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id B9601731E1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jun 2016 18:24:37 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 17 Jun 2016 11:24:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,484,1459839600"; d="scan'208";a="1004472910"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 17 Jun 2016 11:24:38 -0700
To: openembedded-core@lists.openembedded.org
References: <20160617042358.24237-1-raj.khem@gmail.com>
	<20160617042358.24237-2-raj.khem@gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <5c3ceaf8-f58e-3e21-653f-72623b8a19f4@linux.intel.com>
Date: Fri, 17 Jun 2016 21:24:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.1.0
MIME-Version: 1.0
In-Reply-To: <20160617042358.24237-2-raj.khem@gmail.com>
Subject: Re: [PATCH 2/2] gstreamer1.0-plugins-ugly: Add mpg123 PACKAGECONFIG
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
X-List-Received-Date: Fri, 17 Jun 2016 18:24:38 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 06/17/2016 07:23 AM, Khem Raj wrote:
> mpg123 plugin moved from bad collection to ugly in 1.8
> since mpg123 has commercial licence implications its best
> to keep it with a knob.
> +
> +PACKAGECONFIG[mpg123] = "--enable-mpg123,--disable-mpg123,mpg123"
>

This patch is not necessary as gstreamer1.0-plugins-ugly.inc already has 
this line.

Alex

