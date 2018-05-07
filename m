Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 493416E671
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 May 2018 10:28:23 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 May 2018 03:28:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,373,1520924400"; d="scan'208";a="53795405"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 07 May 2018 03:28:23 -0700
To: Paulo Neves <ptsneves@gmail.com>, openembedded-core@lists.openembedded.org
References: <20180505100516.23875-1-ptsneves@gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <f4a2397b-7c5a-dbf8-6522-be978300f4d1@linux.intel.com>
Date: Mon, 7 May 2018 13:22:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180505100516.23875-1-ptsneves@gmail.com>
Subject: Re: [meta-oe][PATCH v2] package_manager.py: set dnf always debug verbosity
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
X-List-Received-Date: Mon, 07 May 2018 10:28:24 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 05/05/2018 01:05 PM, Paulo Neves wrote:
> @@ -892,7 +892,7 @@ class RpmPM(PackageManager):
>                                "--setopt=logdir=%s" % (self.d.getVar('T'))
>                               ]
>           cmd = [dnf_cmd] + standard_dnf_args + dnf_args
> -        bb.note('Running %s' % ' '.join(cmd))
> +        bb.debug(1, 'Running %s' % ' '.join(cmd))

This should stay as bb.note. It only prints the command with arguments 
that is about to be executed.

>           try:
>               output = subprocess.check_output(cmd,stderr=subprocess.STDOUT).decode("utf-8")
>               if print_output:
> 

The actual output is logged just after these lines, so tweak it there 
please. Also, this should be a separate patch.

Alex

