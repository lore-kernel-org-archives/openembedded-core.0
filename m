Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id C6F387833E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 20:26:10 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Jun 2017 13:26:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,319,1493708400"; d="scan'208";a="96417371"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga004.jf.intel.com with ESMTP; 09 Jun 2017 13:26:11 -0700
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	openembedded-core@lists.openembedded.org
References: <cover.1497036762.git.pkj@axis.com>
	<8a12c4d729fd4c1583e35e012fde72e2aefc247b.1497036762.git.pkj@axis.com>
	<92c39677-88ed-2b4a-e299-f964957dcd72@linux.intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <4a7c37c9-d4d0-f983-5e87-58d718e2bfcc@linux.intel.com>
Date: Fri, 9 Jun 2017 23:26:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <92c39677-88ed-2b4a-e299-f964957dcd72@linux.intel.com>
Subject: Re: [PATCH 11/13] rpm: Use conditional to access %{_docdir} in macros.in
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
X-List-Received-Date: Fri, 09 Jun 2017 20:26:12 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 06/09/2017 11:25 PM, Alexander Kanavin wrote:
> On 06/09/2017 10:34 PM, Peter Kjellerstedt wrote:
>> This avoids the following warning:
>>
>> warning: Ignoring invalid regex %{_docdir}
>>
>> when runing `rpmdeps -R <file>`, since %{_docdir} is only defined when
>> parsing a spec file.
>
> Is this possible to do by adding a -D/--define option to rpmdeps? The
> less 'Inappropriate' patches we have to carry, the better.

Nevermind, got this mixed up :)

Alex


