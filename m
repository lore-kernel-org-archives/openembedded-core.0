Return-Path: <ross.burton@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6807A7F346
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Sep 2019 10:57:59 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Sep 2019 03:58:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,462,1559545200"; d="scan'208";a="176548902"
Received: from oakcakay-mobl2.ger.corp.intel.com (HELO blackadder.local)
	([10.252.38.52])
	by orsmga008.jf.intel.com with ESMTP; 03 Sep 2019 03:57:58 -0700
To: Andre McCurdy <armccurdy@gmail.com>, Andrey Zhizhikin <andrey.z@gmail.com>
References: <CAHtQpK5qiC-i-nouQjbk-CToV-Z-jbN-vKZ7Zk0DOtwQC3SUYQ@mail.gmail.com>
	<CAJ86T=Wz=CpQsZgo4C62RUOGAyWVcJe5OZqX_eQFEbbdZkkjWw@mail.gmail.com>
	<20190831121850.GA4729@localhost>
	<CAHtQpK4c_g=+Z1tr2TTdM82vUrhQ1MRE6iThVK3qBBFgQBr_Lw@mail.gmail.com>
	<CAJ86T=VjgG0m4s0XFMGAqD9qLiyfeHO+urYEP+LWY47AcCLboQ@mail.gmail.com>
	<CAJ86T=We25KygPhU6+G=ogeYX7xe-kytLaSMp9TFaUGnxoynUw@mail.gmail.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <77710d94-089a-ad75-98b8-13dce33bd284@intel.com>
Date: Tue, 3 Sep 2019 11:57:57 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAJ86T=We25KygPhU6+G=ogeYX7xe-kytLaSMp9TFaUGnxoynUw@mail.gmail.com>
Cc: Adrian Bunk <bunk@stusta.de>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: FETCHCMD drop breaks build when append is used (from patch b259bd31eb)
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
X-List-Received-Date: Tue, 03 Sep 2019 10:57:59 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 31/08/2019 21:45, Andre McCurdy wrote:
> It looks like the User-Agent workaround for libedit might not be
> needed any more anyway...
> 
>    wget http://thrysoee.dk/editline/libedit-20190324-3.1.tar.gz
> 
> works fine for me ( User-Agent: Wget/1.17.1 (linux-gnu) )

Verified here, patch sent.

Ross

