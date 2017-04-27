Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 56C9D71DEE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Apr 2017 09:53:00 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga105.fm.intel.com with ESMTP; 27 Apr 2017 02:53:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,383,1488873600"; d="scan'208";a="92791005"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga005.jf.intel.com with ESMTP; 27 Apr 2017 02:53:01 -0700
To: openembedded-core@lists.openembedded.org
References: <655290B7709079438B7932553958E60D16D23684@ESS-EX01.essvote.corp.local>
	<20170426192815.GA2366@linux-uys3>
	<CB34FC1D-AA6C-4C69-8C64-DF963214FFEB@nodefield.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <f58c1b82-bd35-b494-58f4-e6a7b2c2775c@linux.intel.com>
Date: Thu, 27 Apr 2017 12:52:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CB34FC1D-AA6C-4C69-8C64-DF963214FFEB@nodefield.com>
Subject: Re: Broken NPM builds
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
X-List-Received-Date: Thu, 27 Apr 2017 09:53:01 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 04/26/2017 11:31 PM, Ilkka Myller wrote:
> This design allows building static, immutable, OE-proper packages for
> Node.js based applications while still using standard npm installation
> process on the build host. This is where OE core npm class differs the
> most by-design.

But are they reproducible? If the app is built one week later, is there 
a guarantee that it will pull in the same components, and a check that 
it is indeed so?

Also, are the licenses of various dependencies tracked and enforced?

> meta-nodejs has chosen not to promote non-standard use of npm utility,
> npm repository or npm installation process.

With this, I fully agree. I can only see pain and suffering with the 
current oe-core approach.


Alex


