Return-Path: <ross.burton@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 60AB56B3D1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Aug 2019 16:28:07 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Aug 2019 09:28:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,405,1559545200"; d="scan'208";a="353293778"
Received: from pruecklm-mobl.ger.corp.intel.com (HELO blackadder.local)
	([10.249.36.159])
	by orsmga005.jf.intel.com with ESMTP; 19 Aug 2019 09:28:00 -0700
To: openembedded-core@lists.openembedded.org
References: <CAP9ODKqnJX-fLme5JUQF8XAHr2hDzJ31auZPQGOUQCehuTb4XA@mail.gmail.com>
	<b3e14a93-8d27-c5f4-0895-8122a030d451@windriver.com>
	<CAP9ODKqWyAG5Zigqcwi7JEgxreaGfSYgBKQG23fhHrHi81QVcQ@mail.gmail.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <4035859d-d86b-16ff-d40c-b5dbdbf56b71@intel.com>
Date: Mon, 19 Aug 2019 17:27:59 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAP9ODKqWyAG5Zigqcwi7JEgxreaGfSYgBKQG23fhHrHi81QVcQ@mail.gmail.com>
Subject: Re: Conflict of systemd and sysvinit
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
X-List-Received-Date: Mon, 19 Aug 2019 16:28:07 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

On 19/08/2019 11:37, Otavio Salvador wrote:
> On Sun, Aug 18, 2019 at 11:00 PM Kang Kai <Kai.Kang@windriver.com> wrote:
>> On 2019/8/18 上午3:27, Otavio Salvador wrote:
>> Would you like to give more detailed steps how the error occurred? And
>> what's extra settings in you local.conf please?
> 
> I had sysvinit and systemd enabled.

The autobuilder should be exercising this, so when it's fixed we need to 
ensure the AB covers the case Otavio is hitting.

Ross


