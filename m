Return-Path: <ross.burton@intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id 3C6EF7E553
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2020 13:20:16 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Jan 2020 05:20:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,322,1574150400"; d="scan'208";a="372933972"
Received: from jmmarti7-mobl1.amr.corp.intel.com (HELO rburton-mac01.local)
	([10.252.51.74])
	by orsmga004.jf.intel.com with ESMTP; 15 Jan 2020 05:20:16 -0800
To: =?UTF-8?Q?Maxime_Roussin-B=c3=a9langer?=
	<maxime.roussinbelanger@gmail.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>
References: <20200113211005.14693-1-maxime.roussinbelanger@gmail.com>
	<CANNYZj-2ZLcTC7j=SGTY5O6h-Z2FNRZnkNgzQcWNedSDnPBZUA@mail.gmail.com>
	<CAE=T-s6n8LLsucxfy3kioMqaAvG5gQenwNpsGqW55Gf8a_3NVQ@mail.gmail.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <61d616d4-25fb-c779-9e28-acbce0d54370@intel.com>
Date: Wed, 15 Jan 2020 13:20:16 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAE=T-s6n8LLsucxfy3kioMqaAvG5gQenwNpsGqW55Gf8a_3NVQ@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] meta: gdk-pixbuf: add man packageconfig
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
X-List-Received-Date: Wed, 15 Jan 2020 13:20:17 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

On 15/01/2020 01:25, Maxime Roussin-Bélanger wrote:
> I have modified the recipe to use manpages, but it is impossible to run 
> a build from master, because
> of my python3 pyenv setup. I had to add
> 
> +DEPENDS = "python3-native"
> 
> to ca-certificates, without it was impossible to go through the 
> do_configure step. It was using the python3
> from my system instead of the one provided by yocto? I am a bit lost here.
> 
> What do you think? Should it have python3-native? There is a fairly 
> recent patch
> to use python3 `file://0001-certdata2pem.py-use-python3.patch`

We assume that the host has a Python 3, which is fair as Bitbake needs 
Python 3.  The ca-certificates recipe should be able to use the same 
Python 3 interpretter, which was found during a search of $PATH and 
linked in tmp/hosttools/python3.

If your host Py setup is complicated, then the hosttools is where to 
look for a fix.

Ross

