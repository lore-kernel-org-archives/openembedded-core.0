Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AB7C06067D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2016 03:12:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u6K3C3Uw013911
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 19 Jul 2016 20:12:03 -0700 (PDT)
Received: from [128.224.162.240] (128.224.162.240) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 19 Jul 2016 20:12:01 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1468935802.git.liezhi.yang@windriver.com>
	<ad9ff8511f1da318f04d6b4ccdf05a639dbc166d.1468935802.git.liezhi.yang@windriver.com>
	<CAJTo0Lbnc0JWAhc-wM8grZvr0mW4+Dd-Wzze5vAZnK+J9Evf9Q@mail.gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <578EEC00.50304@windriver.com>
Date: Wed, 20 Jul 2016 11:12:00 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0Lbnc0JWAhc-wM8grZvr0mW4+Dd-Wzze5vAZnK+J9Evf9Q@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/8] gettext: 0.19.6 -> 0.19.8.1
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
X-List-Received-Date: Wed, 20 Jul 2016 03:12:04 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 07/20/2016 12:37 AM, Burton, Ross wrote:
>
> On 19 July 2016 at 14:44, Robert Yang <liezhi.yang@windriver.com
> <mailto:liezhi.yang@windriver.com>> wrote:
>
>     +FILES_${PN} += "${datadir}/${BPN}-0.19.8/*"
>
>
> Can this use a wildcard so we don't need to fix this every upgrade?

Yes, sounds, good, updated in the repo:

   git://git.openembedded.org/openembedded-core-contrib rbt/pu
   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/pu


# The its/Makefile.am has defined:
# itsdir = $(pkgdatadir)$(PACKAGE_SUFFIX)/its
# not itsdir = $(pkgdatadir), so use wildcard to match the version.
FILES_${PN} += "${datadir}/${BPN}-*/*"

// Robert

>
> Ross

