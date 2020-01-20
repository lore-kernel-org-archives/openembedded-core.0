Return-Path: <ross.burton@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 728AF7FB36
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 13:41:43 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Jan 2020 05:41:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,342,1574150400"; d="scan'208";a="221442802"
Received: from grossi-mobl.ger.corp.intel.com (HELO rburton-mac01.local)
	([10.252.38.20])
	by fmsmga008.fm.intel.com with ESMTP; 20 Jan 2020 05:41:43 -0800
To: openembedded-core@lists.openembedded.org
References: <20200120130151.92546-1-martin@geanix.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <fd674606-4855-739c-1e8f-2b1aff68c704@intel.com>
Date: Mon, 20 Jan 2020 13:41:43 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200120130151.92546-1-martin@geanix.com>
Subject: Re: [PATCH] package: disable libseccomp for find
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
X-List-Received-Date: Mon, 20 Jan 2020 13:41:43 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

On 20/01/2020 13:01, Martin Hundebøll wrote:
> -    result = subprocess.check_output(["file", "-b", path], stderr=subprocess.STDOUT).decode("utf-8")
> +    result = subprocess.check_output(["file", "-S", "-b", path], stderr=subprocess.STDOUT).decode("utf-8")

$ file -S /usr/bin/file
Usage: file [-bcCdEhikLlNnprsvzZ0] [--apple] [--extension] [--mime-encoding]
             [--mime-type] [-e <testname>] [-F <separator>]  [-f <namefile>]
             [-m <magicfiles>] [-P <parameter=value>] <file> ...
        file -C [-m <magicfiles>]
        file [--help]

Only the latest release of file supports -S.

Ross

