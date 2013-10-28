Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 172E06D245
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2013 15:11:56 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 28 Oct 2013 08:08:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="425981302"
Received: from mmckenna-mobl1.ger.corp.intel.com (HELO helios.localnet)
	([10.252.120.252])
	by orsmga002.jf.intel.com with ESMTP; 28 Oct 2013 08:11:56 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Sebastien MENNETRIER <s.mennetrier@innotis.org>
Date: Mon, 28 Oct 2013 15:11:55 +0000
Message-ID: <1622119.vHvDT1LZVD@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-31-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <CABgO3_ODLSb2ZWrkqN6jry7WNehq_rhRTBcorRQj+wuHTjfE7A@mail.gmail.com>
References: <CABgO3_ODLSb2ZWrkqN6jry7WNehq_rhRTBcorRQj+wuHTjfE7A@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Issue with package_rpm : can't install files named "%name..."
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
X-List-Received-Date: Mon, 28 Oct 2013 15:11:56 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Sebastien,

On Monday 28 October 2013 14:44:57 Sebastien MENNETRIER wrote:
> I try to cross-compile and install rubygems and the gems contain some
> directories and files named "%name...".
> 
> To create the rpm package, a spec file that contains the list of all files
> and directories that must be in the rpm package is generated in do_package.
> 
> The rpm process replace all the "%name" in the spec file by the name of the
> package. So the package process try to include some file and directory that
> doesn't exist.
> 
> How can I resolve this issue ? Is it a bug in package_rpm.bbclass ?

It is a limitation in package_rpm.bbclass's current behaviour, yes. It 
probably needs to be fixed to escape % at the start of a filename when writing 
out the spec file (assuming that is possible, that is). Could you please file a 
bug for this (at bugzilla.yoctoproject.org)?

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

