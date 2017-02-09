Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 452C170178
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Feb 2017 15:08:51 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga101.jf.intel.com with ESMTP; 09 Feb 2017 07:08:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,349,1484035200"; d="scan'208";a="56934996"
Received: from lsandov1-mobl2.zpn.intel.com (HELO [10.219.128.141])
	([10.219.128.141])
	by orsmga004.jf.intel.com with ESMTP; 09 Feb 2017 07:08:51 -0800
To: "Robert P. J. Day" <rpjday@crashcourse.ca>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
References: <alpine.LFD.2.20.1702090654250.29564@uk63952.mitel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Message-ID: <37eeaba5-4561-6e3c-60e9-ae090b2e579f@linux.intel.com>
Date: Thu, 9 Feb 2017 09:16:15 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.20.1702090654250.29564@uk63952.mitel.com>
Subject: Re: what is the significance of the numeric version part of 'PV = "1.0.1+git${SRCPV}"'?
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
X-List-Received-Date: Thu, 09 Feb 2017 15:08:53 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 02/09/2017 06:06 AM, Robert P. J. Day wrote:
>    i *thought* i understood this, but a colleague insists i don't so
> ... dumb question time.
>
>    recently, i asked about the netdata recipe file "netdata_git.bb",
> which contains the snippet:
>
>    SRC_URI = "git://github.com/firehol/netdata.git;protocol=https"
>    SRCREV = "36c1304e37094174ea51001903058e65053107ca"
>    PV = "1.0.1+git${SRCPV}"
>
> perhaps i've been wrong all this time, but i understood the above to
> mean that the source checked out would be based on commit
> 36c1304e37094174ea51001903058e65053107ca, and that the "1.0.1+" part
> of the PV variable was simply for aesthetics.
>
>    i realize that the full value of PV would be used to generate the
> final rpm files, and here's what i get:
>
>    netdata-1.0.1+git0+36c1304e37-r0.0.ppc7400.rpm
>    netdata-dbg-1.0.1+git0+36c1304e37-r0.0.ppc7400.rpm
>    netdata-dev-1.0.1+git0+36c1304e37-r0.0.ppc7400.rpm
>
> but is there some other significance or functionality associated with
> that "1.0.1+" prefix for PV?
that is the version and it should be the most recent release or tag 
point of the SCM.
>
>    the only thing i can think of is OE's algorithm for selecting the
> most recent recipe. AIUI, if i have multiple versions for the same
> recipe. all things being equal, OE would choose the "git" recipe file
> over a numerically-versioned recipe file, correct?
>
>    so, say i have two recipe files:
>
>    netdata_1.0.2.bb
>    netdata_git.bb
>
> i assume that OE would choose the second one by default, even if,
> internally, that "git" form of the recipe selected a SRCREV that might
> represent an earlier commit than the 1.0.2 version.
On this area, check this link

http://www.yoctoproject.org/docs/2.2/ref-manual/ref-manual.html#var-PREFERRED_VERSION

If you want to use git recipe, then you need to explicitly indicate it 
through the latter variable, otherwise the 1.0.2 will be used.


>
>    do i have that right? i'm quite prepared to be told i'm totally
> off-base here. if this is explained in one of the YP docs, i'm happy
> with a pointer to it, thanks.
>
> rday
>


