Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id 93CEC7827A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Feb 2018 07:08:35 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Feb 2018 23:08:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,506,1511856000"; d="scan'208";a="18011706"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga006.jf.intel.com with ESMTP; 12 Feb 2018 23:08:34 -0800
To: robert_joslyn@selinc.com, openembedded-core@lists.openembedded.org
References: <OFDC897003.15BD668A-ON88258232.006ED4D2-88258232.00742260@selinc.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <909980b2-f234-d7e0-f116-af95510e1f45@linux.intel.com>
Date: Tue, 13 Feb 2018 09:02:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <OFDC897003.15BD668A-ON88258232.006ED4D2-88258232.00742260@selinc.com>
Subject: Re: Backport OpenSSL 1.0.2n
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
X-List-Received-Date: Tue, 13 Feb 2018 07:08:35 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 02/12/2018 11:08 PM, robert_joslyn@selinc.com wrote:
> I'm working with the pyro release, and noticed that it's still using
> openssl 1.0.2k. The latest version in the 1.0.2 series is 1.0.2n, which is
> already available on master. Is there a reason that the newer version
> hasn't made it back to pyro (or rocko, which is on 1.0.2m)? I know new
> package versions are not normally backported, but looking at the change
> log, I only see one change mentioned that is not a CVE fix (the 1.0.2l
> release): > I can send patches to bring 1.0.2n to rocko and pyro if they will be
> accepted.

Yes please. The reason is that users of stable releases should take care 
of them too; the core team does not have the resources to do it for the 
users.

Alex

