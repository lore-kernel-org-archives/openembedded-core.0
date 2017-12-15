Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id C4E8478295
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Dec 2017 16:13:00 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Dec 2017 08:13:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,405,1508828400"; 
   d="scan'208";a="3006316"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga007.jf.intel.com with ESMTP; 15 Dec 2017 08:13:01 -0800
To: openembedded-core@lists.openembedded.org
References: <cover.1510920094.git.alexander.kanavin@linux.intel.com>
	<9f035d6ed0e27ff91e41b67dab0ae852e96c8232.1510920094.git.alexander.kanavin@linux.intel.com>
	<CAJ86T=Xk+1sKXvfq3EfEwOuwfuPDeW72G0GSdQtqgTKieLH3JQ@mail.gmail.com>
	<1513351792.21903.53.camel@andred.net> <5A33F1E3.8020205@axis.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <10feac00-4a57-76f7-9633-7afb234e581b@linux.intel.com>
Date: Fri, 15 Dec 2017 18:13:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <5A33F1E3.8020205@axis.com>
Subject: Re: [PATCH 1/9] meson: add a recipe and class from meta-oe
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
X-List-Received-Date: Fri, 15 Dec 2017 16:13:01 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 12/15/2017 06:01 PM, Linus Svensson wrote:
>  From mesonbuild.com:
> target machine is the machine on which the compiled binary's output will 
> run
> (this is only meaningful for programs such as compilers that, when run,
> produce object code for a different CPU than what the program is being 
> run on)

Guys... you are arguing over nothing. As I said, endianness definition 
is not used anywhere in meson, although it's required to be present in 
the config. The latest patchset sets it to a bogus value :)

Alex

