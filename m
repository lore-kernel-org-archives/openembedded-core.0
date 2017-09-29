Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 23973601F2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Sep 2017 11:48:25 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 Sep 2017 04:48:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,452,1500966000"; d="scan'208";a="157496136"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga006.fm.intel.com with ESMTP; 29 Sep 2017 04:48:25 -0700
To: Jef.Driesen@niko.eu, openembedded-core@lists.openembedded.org
References: <FAB9E48578194042BE5C63B8BE47610339682897@MBX.NIKO.LAN>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <d0e88e18-0540-2d7f-abe4-11f677d5af4e@linux.intel.com>
Date: Fri, 29 Sep 2017 14:44:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <FAB9E48578194042BE5C63B8BE47610339682897@MBX.NIKO.LAN>
Subject: Re: [PATCH] Small improvement for the initscripts package
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
X-List-Received-Date: Fri, 29 Sep 2017 11:48:26 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 09/29/2017 11:38 AM, Jef.Driesen@niko.eu wrote:
> For our system, we are using some custom initscripts. Because of
> that, some files conflict with the initscripts package, and thus the
> initscript package gets removed from our build. But when trying to
> build an sdk, somehow the initscripts-dev package gets pulled in, and
> since that has an automatic dependency on initscripts, our build
> fails.

Please do find out why this happens; that's what you really need to fix.

> I've been trying to find out why this happens, but without much
> success so far. But I did found a simple workaround: remove the
> initscripts-dev package completely. Since the initscripts recipe
> contains some shell scripts the initscript-dev is empty anyway.
> 
> I've fixed this locally with a bbappend, but this is probably
> something that can be applied upstream.

You can use bbappend to instead replace the standard files with the ones 
that you want installed. Or you can add PROVIDES = "initscripts" to your 
recipe with the 'custom' initscripts, and set 
PREFERRED_PROVIDER_initscripts = "my-custom-initscripts" to have that 
installed.


Alex

