Return-Path: <ross.burton@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 20CAD7F48D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2019 19:49:38 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	25 Nov 2019 11:49:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,242,1571727600"; d="scan'208";a="239664737"
Received: from xsanroma-mobl1.ger.corp.intel.com (HELO blackadder.local)
	([10.249.34.24])
	by fmsmga002.fm.intel.com with ESMTP; 25 Nov 2019 11:49:38 -0800
To: Ankur Tyagi <ankur.tyagi85@gmail.com>
References: <CADySD0HN_q_ffonmJJAmHJvjcRUHrDrhzo6zoWd8vYZUZzd_Tw@mail.gmail.com>
	<e92b8e21-99c6-c2c9-646a-b3a2e76d90aa@intel.com>
	<CADySD0GqssgFeMVj72iV+R3EjUOY=hqJLe7tVTNFbwnmRNzeiQ@mail.gmail.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <49e6e98b-9061-4e97-dfd5-6bd3e80ecf49@intel.com>
Date: Mon, 25 Nov 2019 19:49:37 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <CADySD0GqssgFeMVj72iV+R3EjUOY=hqJLe7tVTNFbwnmRNzeiQ@mail.gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Very large size of libraries in core-image-minimal rootfs
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
X-List-Received-Date: Mon, 25 Nov 2019 19:49:39 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 25/11/2019 19:33, Ankur Tyagi wrote:
> Thanks for the suggestion.
> But curious why libs are so big now?

The same files on my system:

-rwxr-xr-x root/root   1806504 2019-11-04 21:14 ./lib64/libc-2.30.so
-rwxr-xr-x root/root    113296 2019-11-04 21:14 ./lib64/libpthread-2.30.so
-rw-r--r-- root/root    100248 2019-11-04 21:14 ./lib64/libgcc_s.so.1

Your files are a lot larger, so I suspect that you've somehow turned off 
debug stripping.

Ross

