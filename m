Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 537CC77114
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Oct 2015 14:01:11 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 22 Oct 2015 07:00:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,182,1444719600"; d="scan'208";a="586013759"
Received: from lsandov1-mobl-linux.zpn.intel.com (HELO [10.219.5.90])
	([10.219.5.90])
	by FMSMGA003.fm.intel.com with ESMTP; 22 Oct 2015 07:00:09 -0700
Message-ID: <5628EC6A.2090803@linux.intel.com>
Date: Thu, 22 Oct 2015 09:02:18 -0500
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: "Noor, Ahsan" <noor_ahsan@mentor.com>, 
	openembedded-core@lists.openembedded.org
References: <1445443468-8394-1-git-send-email-noor_ahsan@mentor.com>
In-Reply-To: <1445443468-8394-1-git-send-email-noor_ahsan@mentor.com>
Subject: Re: [RFC] rawcopy.py: Copy source file in image creation build folder
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
X-List-Received-Date: Thu, 22 Oct 2015 14:01:12 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit


> +        else:
> +            dst = os.path.join(cr_workdir, source_params['file'])
> +            dd_cmd = "cp src dst"
> +            exec_cmd(dd_cmd)
>

the constructed dst variable is not being included into the dd_cmd, is 
it? I would expect something like

dd_cmd = "cp %s %s" % (src, dst)

