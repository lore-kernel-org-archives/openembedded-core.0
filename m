Return-Path: <benjamin.esquivel@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 84AE7731AC;
	Mon,  4 Jan 2016 20:16:42 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 04 Jan 2016 12:16:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,522,1444719600"; d="scan'208";a="883664390"
Received: from besquive-mobl2.zpn.intel.com ([10.219.128.114])
	by orsmga002.jf.intel.com with ESMTP; 04 Jan 2016 12:16:42 -0800
Message-ID: <1451938621.11986.1.camel@linux.intel.com>
From: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>
Reply-To: benjamin.esquivel@linux.intel.com
To: openembedded-devel@lists.openembedded.org, "Burton, Ross"
	<ross.burton@intel.com>, Sona Sarmadi <sona.sarmadi@enea.com>
In-Reply-To: <568AB923.6080605@linux.intel.com>
References: <567039E1.5000205@linux.intel.com>
	<3230301C09DEF9499B442BBE162C5E48ABABDD6C@SESTOEX04.enea.se>
	<CAJTo0LYO9ptJ4PDmR49N-Yw9TbTFGsuyCUBUc4zW2FLk2CNoWQ@mail.gmail.com>
	<568AB923.6080605@linux.intel.com>
Organization: Intel Corporation
Date: Mon, 04 Jan 2016 14:17:01 -0600
Mime-Version: 1.0
X-Mailer: Evolution 3.16.5 (3.16.5-3.fc22) 
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] [RFC] Mark of upstream CVE patches
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
X-List-Received-Date: Mon, 04 Jan 2016 20:16:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2016-01-04 at 12:25 -0600, Mariano Lopez wrote:
> 
> On 12/16/2015 03:21 AM, Burton, Ross wrote:
> > 
> > On 16 December 2015 at 09:03, Sona Sarmadi <sona.sarmadi@enea.com 
> > <mailto:sona.sarmadi@enea.com>> wrote:
> > 
> >     We are supposed to have reference to the CVE identifier both in
> >     the patch file/s
> >      and the commit message(e.g.  xxx- CVE-2013-6435.pacth)
> > according
> >     to the guidelines
> >     for "Patch name convention and commit message" in the Yocto
> >     Wiki https://wiki.yoctoproject.org/wiki/Security.
> > 
> >     If a patch address multiple CVEs, perhaps we should name the
> > patch:
> >     Fix-for-multiple-CVEs.patch and list all CVEs in the patch
> > file.
> > 
> >     Will this not solve the problem? Do you think there is still
> > need
> >     for a new tag "CVE"?
> > 
> > 
> > I'd say a new tag is essential if we want to automate tooling, to 
> > reduce the chance of false-positives from simply searching the
> > patch 
> > for something that looks like a CVE reference.
> > 
> > Ross
> 
> The conclusion of this thread is to add the tag "CVE" to the metadata
> of 
> submitted CVE patches. I will edit the wiki to show this requirement.

Please let us know when the wiki has the changes reflected :)
 
> 
> Mariano

