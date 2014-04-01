Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 029F66A8F0
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Apr 2014 01:20:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s311KhWX026742
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 31 Mar 2014 18:20:43 -0700 (PDT)
Received: from [128.224.162.204] (128.224.162.204) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.169.1;
	Mon, 31 Mar 2014 18:20:42 -0700
Message-ID: <533A1467.7000100@windriver.com>
Date: Tue, 1 Apr 2014 09:20:39 +0800
From: Chong Lu <Chong.Lu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1395194072.git.Chong.Lu@windriver.com>
	<3e91ee5bf0390d700dd57ed89b1dba1434e3f17c.1395194072.git.Chong.Lu@windriver.com>
	<CAJTo0Lbxi0MpyY8Ev+ovn+HJ8Zzoyr4a1SzZDHL+e2p1SLz=RA@mail.gmail.com>
In-Reply-To: <CAJTo0Lbxi0MpyY8Ev+ovn+HJ8Zzoyr4a1SzZDHL+e2p1SLz=RA@mail.gmail.com>
X-Originating-IP: [128.224.162.204]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V3 1/1] dbus: fix a hard dependency about dbus-ptest
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
X-List-Received-Date: Tue, 01 Apr 2014 01:20:46 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Ping

On 03/19/2014 07:59 PM, Burton, Ross wrote:
> On 19 March 2014 02:00, Chong Lu <Chong.Lu@windriver.com> wrote:
>> If image contains dbus and ptest is in DISTRO_FEATURES, dbus-ptest package
>> is installed, regardless of whether ptest-pkgs is in IMAGE_FEATURES. This
>> issue will increase size for most small images.
>> This patch fixes this problem.
> Reviewed-by: Ross Burton <ross.burton@intel.com>
>
> Ross
>


