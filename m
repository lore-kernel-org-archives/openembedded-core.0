Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 90EFF65D53
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Aug 2014 12:42:20 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 06 Aug 2014 05:41:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,811,1400050800"; d="scan'208";a="572510473"
Received: from cgwithan-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.26])
	by fmsmga001.fm.intel.com with ESMTP; 06 Aug 2014 05:41:58 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 06 Aug 2014 13:41:58 +0100
Message-ID: <42649926.Kn7RmW5cEk@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.13.3 (Linux/3.15.7-200.fc20.x86_64; KDE/4.13.3; x86_64; ; )
In-Reply-To: <1407325317-5030-1-git-send-email-Martin.Jansa@gmail.com>
References: <1405512834-14423-1-git-send-email-Martin.Jansa@gmail.com>
	<1407325317-5030-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] gst-ffmpeg: add dependency on libpostproc
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
X-List-Received-Date: Wed, 06 Aug 2014 12:42:26 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 06 August 2014 13:41:56 Martin Jansa wrote:
> * building with libav-9 fails with:
>   | checking for POSTPROC... configure: error: Package requirements
>   | (libpostproc libavcodec libavutil) were not met:
>   | 
>   | No package 'libpostproc' found

Does gst-ffmpeg actually work with libav > 0.8?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

