Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 0292F78879
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jan 2018 04:08:32 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Jan 2018 20:08:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,437,1511856000"; d="scan'208";a="30802906"
Received: from fungyihn-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.71.61])
	by orsmga002.jf.intel.com with ESMTP; 30 Jan 2018 20:08:28 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Wed, 31 Jan 2018 11:22:44 +1300
Message-ID: <12542634.AghgEGdgMF@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
In-Reply-To: <ac3ea8c3-402e-229a-768c-7c305540b59c@gmail.com>
References: <1517265587-84623-1-git-send-email-juro.bystricky@intel.com>
	<90d6d504-1abe-43b9-b25c-008de4e96039@gmail.com>
	<ac3ea8c3-402e-229a-768c-7c305540b59c@gmail.com>
MIME-Version: 1.0
Cc: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] tzcode: remove unused patch files
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
X-List-Received-Date: Wed, 31 Jan 2018 04:08:33 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday, 30 January 2018 7:39:17 PM NZDT Khem Raj wrote:
> I wonder if we can cook up a script which can check for unused patches, 
> it will be very helpful to keep the code tidy
> perhaps it already exists and I am the only one who doesn't know

Patchtest is supposed to be handling this (test_src_uri_left_files:

  http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe/tree/tests/test_metadata_src_uri.py#n49

Not sure why it didn't pick up on this.

Cheers,
Paul


-- 

Paul Eggleton
Intel Open Source Technology Centre

