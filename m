Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 8D10A6FFED
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Oct 2017 14:32:49 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Oct 2017 07:32:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,505,1500966000"; d="scan'208";a="158891767"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga005.jf.intel.com with ESMTP; 10 Oct 2017 07:32:48 -0700
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	Andre McCurdy <armccurdy@gmail.com>
References: <20171009141227.21795-1-otavio@ossystems.com.br>
	<d31de312-7137-d95d-7cf6-2f15ac4ac1b6@linux.intel.com>
	<CAJ86T=UGY1LciuKpDvpDFot8fQaJHaQEGp=N0zVHo9nMP+4vJw@mail.gmail.com>
	<0eea3119-a905-9a62-6572-1cab90a43a2d@linux.intel.com>
	<c4183a19150d4970881e5a06d0b327a6@XBOX02.axis.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <6a454b42-aeeb-c3d0-53ca-d26f4eab32c2@linux.intel.com>
Date: Tue, 10 Oct 2017 17:29:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <c4183a19150d4970881e5a06d0b327a6@XBOX02.axis.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Otavio Salvador <otavio@ossystems.com.br>, OpenEmbedded Core Mailing List
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cmake: Upgrade to 3.9.3 release
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
X-List-Received-Date: Tue, 10 Oct 2017 14:32:49 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10/10/2017 04:57 PM, Peter Kjellerstedt wrote:

> That is not the entire story though. If you have COPY_LIC_MANIFEST and
> COPY_LIC_DIRS set in your configuration, the relevant licenses will be
> installed in the image, and for licenses specified with beginline and/or
> endline this only includes the specified lines.

Thanks, I did not know that.

> Then, if the license requires that you include the copyright information,
> which is pretty common, e.g., BSD, leaving out that part just to avoid
> having to update the recipe once a year means that you are not really
> complying with the license... And neither will any users of the layer
> be who believe they are covered license wise by including the license
> information bitbake produces and installs in their images.

Once a year times the amount of recipes one maintains. Which, for me is 
111 oe-core recipes, plus 76 oe-core recipes that Jussi Kukkonen left 
behind. How many recipes do you guys keep up to date on a regular basis? :-)

We actually have an open bug to provide better tooling for manually 
comparing the licenses [1], but no progress has been made with that for 
a long time. Paul, how is it now?

[1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=10801

Alex

