Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BB17F77735
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Mar 2017 16:39:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v27Gd5A7024840
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 7 Mar 2017 08:39:06 -0800 (PST)
Received: from soho-mhatle-m.local (172.25.36.230) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 7 Mar 2017 08:39:05 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <1488902424-9496-1-git-send-email-mark.hatle@windriver.com>
	<1488902424-9496-2-git-send-email-mark.hatle@windriver.com>
	<CAJTo0LYToEKk_wbP0ytvd+WRZbhLK21FU2zsYFjm00t2G=5D9g@mail.gmail.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <0da050dd-0a00-1d24-20ec-f600be4e28c0@windriver.com>
Date: Tue, 7 Mar 2017 10:39:04 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYToEKk_wbP0ytvd+WRZbhLK21FU2zsYFjm00t2G=5D9g@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gpgme: Fix issue building for the target
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
X-List-Received-Date: Tue, 07 Mar 2017 16:39:05 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On 3/7/17 10:08 AM, Burton, Ross wrote:
> 
> On 7 March 2017 at 16:00, Mark Hatle <mark.hatle@windriver.com
> <mailto:mark.hatle@windriver.com>> wrote:
> 
>     gpgme failed when configuring since you can only configure for one python
>     system at a time (via the inherits).  So we need to have a PACKAGECONFIG
>     that defines which one [or neither] you want to use.
> 
>     The prior pkgconfig patch introduced the usage of the variable PKG_CONFIG,
>     which is not defined anywhere.  Define this.
> 
>     When building the python module, we can not call gpg-error-config, so we
>     need to find an alternative way of finding the information the setup.py.in
>     <http://setup.py.in>
>     requires.  (In this case, it's easy to just use the environment
>     STAGING_INCDIR.)
> 
> 
> | checking for swig... no
> | checking for swig2.0... no
> | configure: error:
> | ***
> | *** You need SWIG to build the Python bindings.
> 
> It must be finding a swig binary on your host.

Thanks, I'll rework it.

--Mark

> Ross


