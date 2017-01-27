Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id E440A773C6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2017 13:06:53 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 27 Jan 2017 05:06:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,295,1477983600"; d="scan'208";a="36298762"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 27 Jan 2017 05:06:52 -0800
To: openembedded-core@lists.openembedded.org
References: <alpine.LFD.2.20.1701270739140.15334@uk63952.mitel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <9db73377-c748-0630-38ac-35820a706ecf@linux.intel.com>
Date: Fri, 27 Jan 2017 15:07:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.6.0
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.20.1701270739140.15334@uk63952.mitel.com>
Subject: Re: what is the working directory for configure/compile/install tasks?
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
X-List-Received-Date: Fri, 27 Jan 2017 13:06:55 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 01/27/2017 02:44 PM, Robert P. J. Day wrote:
>

>   i've been handed a simple example of Makefile-based source to turn
> into a recipe, and the configure/build process is absolutely
> straightforward -- top-level "configure" and "Makefile" files to be
> run -- to the point where i can simply define my own do_configure(),
> do_compile(), etc. tasks.

It's not entirely clear, but is the source GNU autotools based? Can you 
provide a link to it, so we can see what configure actually does?

Alex


