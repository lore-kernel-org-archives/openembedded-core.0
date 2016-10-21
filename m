Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 4711565C8A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Oct 2016 15:20:05 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga105.fm.intel.com with ESMTP; 21 Oct 2016 08:20:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,377,1473145200"; d="scan'208";a="1073759489"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 21 Oct 2016 08:20:07 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1476888929.git.alexander.kanavin@linux.intel.com>
	<c5f8205c2501e2c8264bd3c315b42569d66ac6c7.1476888929.git.alexander.kanavin@linux.intel.com>
	<CAJTo0Lb3B9FSEXHjd4ZhkF4GwosbCkUVkq5nHuM7sEEV7EgVaA@mail.gmail.com>
	<CAJTo0LYqYBvyYnkE2Mud6DykHxbhD0ORvKCa7kUAZLfKqy_zog@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <71a7dd79-4c72-5f9d-d401-82142dccd349@linux.intel.com>
Date: Fri, 21 Oct 2016 18:17:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYqYBvyYnkE2Mud6DykHxbhD0ORvKCa7kUAZLfKqy_zog@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 18/19] webkitgtk: update to 2.14.1
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
X-List-Received-Date: Fri, 21 Oct 2016 15:20:07 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/20/2016 12:27 PM, Burton, Ross wrote:
> I should have finished reading the report before hitting send:
>
> packages/corei7-64-poky-linux/webkitgtk/webkitgtk: FILELIST: removed
> "/usr/lib/libwebkit2gtk-4.0.so.37.13.11
> /usr/lib/libjavascriptcoregtk-4.0.so.18.3.13" added
> "/usr/lib/libjavascriptcoregtk-4.0.so.18.4.8
> /usr/libexec/webkit2gtk-4.0/MiniBrowser /usr/libexec/webkit2gtk-4.0/jsc
> /usr/lib/libwebkit2gtk-4.0.so.37.14.8"
>
> If libexecdir is the right place for these then we can remove
> lib_package, otherwise the question is why are they in there and can
> they be moved back to bindir.

They did it on purpose, no idea why:

What's new in WebKitGTK+ 2.14.1?

   - MiniBrowser and jsc binaries are now installed in pkglibexecdir 
instead of bindir.


I've dropped the lib_package.

Alex


