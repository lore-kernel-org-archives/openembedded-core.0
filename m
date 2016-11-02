Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 6B09C719C5
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Nov 2016 15:50:53 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 02 Nov 2016 08:50:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,583,1473145200"; d="scan'208";a="1062926256"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 02 Nov 2016 08:50:29 -0700
To: openembedded-core@lists.openembedded.org
References: <1478030040-20670-1-git-send-email-fabio.berton@ossystems.com.br>
	<1478030040-20670-5-git-send-email-fabio.berton@ossystems.com.br>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <15eede5f-b5e6-4d66-946a-0443865ceee7@linux.intel.com>
Date: Wed, 2 Nov 2016 17:48:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <1478030040-20670-5-git-send-email-fabio.berton@ossystems.com.br>
Subject: Re: [PATCH 5/8] libsamplerate0: Update to version 0.1.9
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
X-List-Received-Date: Wed, 02 Nov 2016 15:50:53 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 11/01/2016 09:53 PM, Fabio Berton wrote:
> -LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
> -                    file://src/samplerate.c;beginline=1;endline=17;md5=d0807c35fc906466d24a50463534815a"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=336d6faf40fb600bafb0061f4052f1f4 \
> +                    file://src/samplerate.c;beginline=1;endline=17;md5=c45e8e3c7371009f0a4a569f2f22e25c"

When you do this, you *must* compare the two license files, and then 
explain in the commit log what happened. Tanu's patch does it correctly, 
as the license has in fact changed from GPL to BSD!

Alex


