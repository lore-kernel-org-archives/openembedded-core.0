Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 43C8365D4F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Nov 2014 15:56:40 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 04 Nov 2014 07:50:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="411227407"
Received: from unknown (HELO [10.255.13.89]) ([10.255.13.89])
	by FMSMGA003.fm.intel.com with ESMTP; 04 Nov 2014 07:48:08 -0800
Message-ID: <5458F733.2010600@linux.intel.com>
Date: Tue, 04 Nov 2014 07:56:35 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.7.0
MIME-Version: 1.0
To: Artur Wroblewski <wrobell@pld-linux.org>, 
	openembedded-core@lists.openembedded.org
References: <20141103235157.GC19739@greymatter>
In-Reply-To: <20141103235157.GC19739@greymatter>
Subject: Re: python 3.4.2 patch
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
X-List-Received-Date: Tue, 04 Nov 2014 15:56:46 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/03/2014 03:51 PM, Artur Wroblewski wrote:
> Hi,
>
> As advised at
>
>      https://bugzilla.yoctoproject.org/show_bug.cgi?id=6857
>
> I am attaching a patch to replace Python 3.3.x with Python 3.4.2. This also
> fixes issue with missing basic Python 3.x modules, see
>
>      https://bugzilla.yoctoproject.org/show_bug.cgi?id=6831
>
> Build tested with git master:
>
>      $ tar tvjf tmp/deploy/images/qemux86/core-image-minimal-qemux86.tar.bz2 | grep python3.4 | wc -l
>      2028
>
> Regards,
>
> w
>
>
>
Thanks for working up the patch.

Your patch needs a Signed-off-by: tag and alittle more explaination in 
the commit message as to what you did (removed patches, rebased patches, 
...), It's also important to note why the LIC_FILES_CHKSUM changed, it 
might be as simple as version or date changes, but we need to flag them 
in case the actual License changed.

Would it make sense to use a PYTHON_MAJMIN in the manifest generator 
instead of hardcoding the python version? This would allow for the 
manifest.inc changeset to be much smaller.

Sau!



