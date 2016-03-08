Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 0480965C5C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Mar 2016 15:32:16 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 08 Mar 2016 07:31:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,556,1449561600"; d="scan'208";a="919420825"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 08 Mar 2016 07:31:10 -0800
To: openembedded-core@lists.openembedded.org
References: <cover.1456449257.git.hongxu.jia@windriver.com>
	<05c06ed8ffad83ab3bf492ef793f33f2a5d346e3.1456449257.git.hongxu.jia@windriver.com>
	<CAJTo0LYNcQTcB9tLgYO0gRak4cLV3feaQJGautCBFyxVTQwBaQ@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <56DEEF52.6040305@linux.intel.com>
Date: Tue, 8 Mar 2016 17:27:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.6.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYNcQTcB9tLgYO0gRak4cLV3feaQJGautCBFyxVTQwBaQ@mail.gmail.com>
Subject: Re: [PATCH 13/15] python-pygobject: fix buildpath QA issue
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
X-List-Received-Date: Tue, 08 Mar 2016 15:32:17 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 03/08/2016 05:24 PM, Burton, Ross wrote:

>     +do_install_append_class-target() {
>     +       sed -i -e "s:${PYTHON}:\`which python\`:g" \
>     +           ${D}${bindir}/pygobject-codegen-2.0
>     +}
>
>
> If you're going to expect the shell to find the right python on the
> target there's no need to use `which python` as exec will search $PATH.
> However, we do know where Python on the target it: ${bindir}/python.

pygobject 3.x (which replaces 2.x as a part of introspection series) 
does not contain this script anymore, so the patch is moot anyway.

Alex


