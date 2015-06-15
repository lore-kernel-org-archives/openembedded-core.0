Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id B07CC74115;
	Mon, 15 Jun 2015 14:44:11 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 15 Jun 2015 07:44:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,618,1427785200"; d="scan'208";a="743720424"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.143])
	([10.237.68.143])
	by fmsmga002.fm.intel.com with ESMTP; 15 Jun 2015 07:44:11 -0700
Message-ID: <557EE4C2.501@linux.intel.com>
Date: Mon, 15 Jun 2015 17:44:18 +0300
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>, =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?=
	<schnitzeltony@googlemail.com>
References: <557E9EFE.1030703@linux.intel.com>
	<CALbNGRS9UWjVQQh8POPc5zVYOeYa9VaeC7dEfzH3AMs4k9Mjzw@mail.gmail.com>
	<CAJTo0LbRVqw3h_3igs59=DTnaz6nf4w=A5ZpXepmh6xiKtVdPA@mail.gmail.com>
In-Reply-To: <CAJTo0LbRVqw3h_3igs59=DTnaz6nf4w=A5ZpXepmh6xiKtVdPA@mail.gmail.com>
Cc: Yocto Project <yocto@yoctoproject.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Webkit-gtk will be updated to latest upstream; midori browser to be replaced with Epiphany
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
X-List-Received-Date: Mon, 15 Jun 2015 14:44:12 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/15/2015 05:24 PM, Burton, Ross wrote:

> If you actually compare the build dependencies, you'll see that Midori
> and Epiphany are actually almost identical.
>
> We need to upgrade WebKit as the release we're shipping has known
> security flaws and is very old - and the community is rightly moaning
> about that.  However Midori doesn't build with a recent WebKit... if you
> have an alternative solution then your thoughts are welcome.

Also, Webkit2 itself ships with a tiny browser wrapper called MiniBrowser:

http://blogs.igalia.com/carlosgc/2011/11/04/webkit2-gtk-minibrowser-ported-to-gtk-api/

That may be enough for many people's needs, and they can simply not 
include Epiphany into their images if it's too big and bloated or whatever.


Alex

