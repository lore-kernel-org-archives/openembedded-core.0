Return-Path: <andrej.valek@siemens.com>
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id 92AFE6E668
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Sep 2017 06:06:42 +0000 (UTC)
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id v8S66e6q032495
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Thu, 28 Sep 2017 08:06:41 +0200
Received: from [192.168.253.100] ([163.242.56.100])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTPS id v8S66dDo011345
	(version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 28 Sep 2017 08:06:39 +0200
To: "Burton, Ross" <ross.burton@intel.com>
References: <1504593353-7409-1-git-send-email-andrej.valek@siemens.com>
	<CAJTo0LYxVmQidhcuq9VeSBzb7y1KPcgqN6_R97d7PNf51C094g@mail.gmail.com>
	<1ebb3564-9e52-9480-c1c8-9f959d9e9416@siemens.com>
	<CAJTo0LYwUhk9tHNHZ7DACOC5WXKW_x=1vrNd7pArCxP7-Pe_dA@mail.gmail.com>
	<b48b82e6-bb1d-2e7a-ab50-609bd39c93d8@siemens.com>
	<239a2cfd-1507-b8dc-0d85-0ab7afa98c71@siemens.com>
	<CAJTo0LbR-sLX4YY4F1myb2EcEGQ3qSZjQL5OPOh5jut2_h4djg@mail.gmail.com>
From: Andrej Valek <andrej.valek@siemens.com>
Message-ID: <59fecff0-d359-a4ea-3d3c-cb0064f0e70d@siemens.com>
Date: Thu, 28 Sep 2017 08:06:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbR-sLX4YY4F1myb2EcEGQ3qSZjQL5OPOh5jut2_h4djg@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libxml2: 2.9.4 -> 2.9.5
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
X-List-Received-Date: Thu, 28 Sep 2017 06:06:44 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Thank You for pointing to this. I have fixed and updated the pull request.

Andrej

On 09/27/2017 05:35 PM, Burton, Ross wrote:
> On 27 September 2017 at 09:52, Andrej Valek <andrej.valek@siemens.com 
> <mailto:andrej.valek@siemens.com>> wrote:
> 
>     Could You please provide my the current status of my request?
> 
> 
> Too much of a change for frozen master so it will have to wait for master to reopen.
> 
> However it fails to build with ptest enabled:
> 
> | NOTE: make 
> DESTDIR=/data/poky-tmp/master/build/work/corei7-64-poky-linux/libxml2/2.9.5-r0/image/usr/lib/libxml2/ptest 
> install-ptest
> | install: missing destination file operand after 
> '/data/poky-tmp/master/build/work/corei7-64-poky-linux/libxml2/2.9.5-r0/image/usr/lib/libxml2/ptest'
> 
> (noinst_PROGRAMS isn't set in the makefile)
> 
> Ross
> 

