Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail.openembedded.org (Postfix) with ESMTP id 920A671D79
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Dec 2017 17:48:25 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Dec 2017 09:48:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,400,1508828400"; 
   d="scan'208";a="2743684"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga007.jf.intel.com with ESMTP; 14 Dec 2017 09:48:25 -0800
To: Stefan Agner <stefan@agner.ch>
References: <20171213180624.30839-1-stefan@agner.ch>
	<cce87fc26f1e975fe9ee6d9321bbb870@agner.ch>
	<56bd3e44-1478-9095-4fef-3f7453b7ec94@linux.intel.com>
	<a2a011e2de41685295946b44f13102f4@agner.ch>
	<74fb0f2c-574b-56be-1bba-6b859ee07029@linux.intel.com>
	<d31c5759f38e450334b7762afb5e7496@agner.ch>
	<2e3178d0-c6eb-97f8-c524-bcee54091397@linux.intel.com>
	<37d7ff0a6470bb60cf62d73585b3c3f8@agner.ch>
	<dbdaea03-62b9-3437-5da4-897b633f813d@linux.intel.com>
	<d74719f7fc9f92cfdc443720915252e5@agner.ch>
	<eb8c0e61-9433-2d83-ab23-eed945b476df@linux.intel.com>
	<c7efc74858b05a59105bd21fb6669e48@agner.ch>
	<2ddf3fe7-20f3-87e0-969d-a0ed83cf9256@linux.intel.com>
	<4a6b7a11117ca59fa8b5ffd60c889387@agner.ch>
	<84080427-d60b-6527-b0f4-938fae379559@linux.intel.com>
	<b0d062d27983acc3d7ec40061b661699@agner.ch>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <d86099aa-2449-6afd-38a9-8bc3270f3e35@linux.intel.com>
Date: Thu, 14 Dec 2017 19:49:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <b0d062d27983acc3d7ec40061b661699@agner.ch>
Cc: Stefan Agner <stefan.agner@toradex.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [RFC] opkg: avoid running postinst scripts twice when using systemd
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
X-List-Received-Date: Thu, 14 Dec 2017 17:48:25 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 12/14/2017 07:40 PM, Stefan Agner wrote:

> Oh, I see, well that simplifies it, doesn't it? E.g.
> 
>      # If package managers support postinsts and the package manager is
> present on the
>      # rootfs, then it will handle postinsts just fine, no need to deploy
> scripts again.
>      if delayed_postinsts and not runtime_pkgmanage:
>          self._save_postinsts()
> 
> And with that it will be as it used to be before the above commit, and
> the way it should be.

Sorry, but no. You are making an implicit assumption about how rpmrootfs 
child class behaves here, which is not a good thing to do in a parent class.

Alex

