Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6757D73DF0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 13:21:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t7PDLc1T018660
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 25 Aug 2015 06:21:38 -0700 (PDT)
Received: from Marks-MacBook-Pro-2.local (172.25.36.227) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.235.1; Tue, 25 Aug 2015 06:21:38 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1440126018.git.wenzong.fan@windriver.com>
	<c22d818de805fde488bce9e0263d573c51cee5c9.1440126018.git.wenzong.fan@windriver.com>
	<CAMKF1srnPDL=yzcu7_niSfwuxa8a-93bBQLN0ba-Roru4DRHhw@mail.gmail.com>
	<55DB9A37.8080600@windriver.com>
	<CAMKF1srfmPb6MAwTuV-jCKi3Z-fbWRv069fJi+uTLu2DCKtwZg@mail.gmail.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <55DC6BE1.2020602@windriver.com>
Date: Tue, 25 Aug 2015 08:21:37 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:38.0)
	Gecko/20100101 Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1srfmPb6MAwTuV-jCKi3Z-fbWRv069fJi+uTLu2DCKtwZg@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2 v2] libcap-ng: add package 0.7.7
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
X-List-Received-Date: Tue, 25 Aug 2015 13:21:41 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On 8/24/15 6:41 PM, Khem Raj wrote:
> On Mon, Aug 24, 2015 at 3:27 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
>> I agree BTW that it's the wrong answer to say since it's used in multiple places
>> that it belongs in oe-core.
>>
>> HOWEVER, in this case, I think the use in multiple places is a reasonable
>> justification that it's a commonly used, and potentially core component.
>>
>> Add that that it's implementing posix capabilities.. and I do think it's
>> reasonable to put this -one- in oe-core.  (The key to this, as always, is that
>> these things need to be looked at individually to see if it's reasonable.)
>>
>> Anyway, this ONE has my vote to go into oe-core, based on the usage patterns I
>> routinely see.. and that fact that I believe we have people willing to step in
>> and upgrade/maintain it moving forward.
> 
> you have it your way, the patch has been pushed into OE-Core so
> further discussions is moot from here on, I wish we wait for
> discussions to finish for little we discuss on patches now a days.
> anyway for this
> but on debian I see there aren't many reverse deps given thousands of
> debian packages its only needed by handful
> 
> libcap-ng0

I find it heavily used by security and auditing software.  Specifically selinux
(and related auditing), dbus, keyrings, etc..  This is why I think it was good
for oe-core.  But as you said point is moot now.

(I don't develop with debian at all, but from the list below, it looks like that
set of debian doesn't use support or use an LSM items, like selinux...)

--Mark

> Reverse Depends:
>  qemu-system-common
>  libvirt0
>  libvirt-bin
>  suricata
>  libcap-ng-utils
>  ladvd
>  heimdal-kdc
>  audispd-plugins
>  smartmontools
>  qemu-system-common
>  libvirt0
>  libvirt-bin
>  libcap-ng-dev
>  irqbalance
>  gnome-keyring
>  dbus-1-dbg
>  dbus
> 
> That doesn't look much core component to me to be frank, But yes when
> one needs it in his own setup then it becomes pretty core. I can site
> you an example of many,  RDK depend on yajl its found in multiple
> layers too but we happily take it from meta-oe because we want to
> respect the layer boundaries.
> 


