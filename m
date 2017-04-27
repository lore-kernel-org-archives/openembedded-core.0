Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 65A7271DEE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Apr 2017 09:56:24 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga104.jf.intel.com with ESMTP; 27 Apr 2017 02:56:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,383,1488873600"; d="scan'208";a="92791595"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga005.jf.intel.com with ESMTP; 27 Apr 2017 02:56:24 -0700
To: Ilkka Myller <ilkka.myller@nodefield.com>,
	Trevor Woerner <twoerner@gmail.com>
References: <655290B7709079438B7932553958E60D16D23684@ESS-EX01.essvote.corp.local>
	<20170426192815.GA2366@linux-uys3>
	<CB34FC1D-AA6C-4C69-8C64-DF963214FFEB@nodefield.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <419a4206-23c1-239b-5ef4-f162af60d092@linux.intel.com>
Date: Thu, 27 Apr 2017 12:56:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CB34FC1D-AA6C-4C69-8C64-DF963214FFEB@nodefield.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Thu, 27 Apr 2017 09:56:25 -0000
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

These are important concerns in the embedded world (as opposed to the 
cloud world where node.js originated).

> meta-nodejs has chosen not to promote non-standard use of npm utility,
> npm repository or npm installation process.

With this, I fully agree. I can only see pain and suffering with the 
current oe-core approach.


Alex


