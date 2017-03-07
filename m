Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id C42FB77825
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Mar 2017 20:12:09 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 Mar 2017 12:12:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,258,1486454400"; d="scan'208";a="1105909666"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.141])
	by orsmga001.jf.intel.com with ESMTP; 07 Mar 2017 12:12:09 -0800
Message-ID: <1488917974.3261.25.camel@linux.intel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: Matthew McClintock <msm-oss@mcclintock.net>
Date: Tue, 07 Mar 2017 14:19:34 -0600
In-Reply-To: <1488916121-30447-1-git-send-email-msm-oss@mcclintock.net>
References: <1488916121-30447-1-git-send-email-msm-oss@mcclintock.net>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] utility-task: Add do_patchall task
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
X-List-Received-Date: Tue, 07 Mar 2017 20:12:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit




On Tue, 2017-03-07 at 13:48 -0600, Matthew McClintock wrote:
> This is useful in a few scenarios:
> 
> 1) A developer wants to be able to grep all the code in a particular
> without having to run patch on various components until they guess the
> right one (e.g. which component is generating an error/warning?)
> 
> 2) Other code scanning tools that can be run without requiring a full
> image to be built (legal, static code analysis, etc)
> 
> Signed-off-by: Matthew McClintock <msm-oss@mcclintock.net>
> ---
>  meta/classes/utility-tasks.bbclass | 7 +++++++
>  meta/conf/documentation.conf       | 1 +

Doc patches goes into the yocto mailing list.


> 



