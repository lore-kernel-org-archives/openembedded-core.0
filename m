Return-Path: <Nathan_Lynch@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id E745677F6D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jul 2017 19:46:28 +0000 (UTC)
Received: from svr-orw-mbx-02.mgc.mentorg.com ([147.34.90.202])
	by relay1.mentorg.com with esmtp 
	id 1dTZCv-00072n-K0 from Nathan_Lynch@mentor.com ;
	Fri, 07 Jul 2017 12:46:29 -0700
Received: from localhost (147.34.91.1) by svr-orw-mbx-02.mgc.mentorg.com
	(147.34.90.202) with Microsoft SMTP Server (TLS) id 15.0.1263.5;
	Fri, 7 Jul 2017 12:46:26 -0700
From: Nathan Lynch <nathan_lynch@mentor.com>
To: "Burton, Ross" <ross.burton@intel.com>
In-Reply-To: <CAJTo0La9rcpY8oxxuaWspjLM6NjJNugVopmdVEvps=sH2fMkcA@mail.gmail.com>
References: <20170616213952.35679-1-nathan_lynch@mentor.com>
	<20170616213952.35679-3-nathan_lynch@mentor.com>
	<CAJTo0La9rcpY8oxxuaWspjLM6NjJNugVopmdVEvps=sH2fMkcA@mail.gmail.com>
Date: Fri, 7 Jul 2017 14:46:25 -0500
Message-ID: <87y3s0xc6m.fsf@mentor.com>
MIME-Version: 1.0
X-ClientProxiedBy: svr-orw-mbx-04.mgc.mentorg.com (147.34.90.204) To
	svr-orw-mbx-02.mgc.mentorg.com (147.34.90.202)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] lttng-tools: update to 2.9.5
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
X-List-Received-Date: Fri, 07 Jul 2017 19:46:38 -0000
Content-Type: text/plain

"Burton, Ross" <ross.burton@intel.com> writes:

> On 16 June 2017 at 22:39, Nathan Lynch <nathan_lynch@mentor.com> wrote:
>
>> Miscellaneous fixes.
>>
>
> This isn't related to the upgrade as it was a problem in the old release
> too but I thought you should know:
>
> WARNING: lttng-tools-2.9.5-r0 do_package_qa: QA Issue: lttng-tools-ptest:
> /usr/lib/lttng-tools/ptest/tests/regression/tools/health/health_check looks
> like a libtool wrapper script [libtool-wrapper]
> WARNING: lttng-tools-2.9.5-r0 do_package_qa: QA Issue: lttng-tools-ptest:
> /usr/lib/lttng-tools/ptest/tests/regression/tools/health/health_check looks
> like a libtool wrapper script [libtool-wrapper]
> WARNING: lttng-tools-2.9.5-r0 do_package_qa: QA Issue: lttng-tools-ptest:
> /usr/lib/lttng-tools/ptest/tests/regression/tools/live/live_test looks like
> a libtool wrapper script [libtool-wrapper]
> WARNING: lttng-tools-2.9.5-r0 do_package_qa: QA Issue: lttng-tools-ptest:
> /usr/lib/lttng-tools/ptest/tests/regression/tools/live/live_test looks like
> a libtool wrapper script [libtool-wrapper]
> WARNING: lttng-tools-2.9.5-r0 do_package_qa: QA Issue: lttng-tools-ptest:
> /usr/lib/lttng-tools/ptest/tests/unit/ini_config/ini_config looks like a
> libtool wrapper script [libtool-wrapper]
> WARNING: lttng-tools-2.9.5-r0 do_package_qa: QA Issue: lttng-tools-ptest:
> /usr/lib/lttng-tools/ptest/tests/unit/ini_config/ini_config looks like a
> libtool wrapper script [libtool-wrapper]

Where can I find the libtool-wrapper QA check?  It doesn't appear to be
in oe-core or poky.

