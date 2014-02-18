Return-Path: <dvhart@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 44CFE6EE32
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2014 17:54:05 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 18 Feb 2014 09:49:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,502,1389772800"; d="scan'208";a="457536750"
Received: from dvhart-mac01.jf.intel.com (HELO [10.7.196.51]) ([10.7.196.51])
	by orsmga001.jf.intel.com with ESMTP; 18 Feb 2014 09:53:47 -0800
User-Agent: Microsoft-MacOutlook/14.3.9.131030
Date: Tue, 18 Feb 2014 09:54:26 -0800
From: Darren Hart <dvhart@linux.intel.com>
To: =?ISO-8859-1?B?Sm/jbw==?= Henrique Ferreira de Freitas <joaohf@gmail.com>, 
	<openembedded-core@lists.openembedded.org>
Message-ID: <CF28DE43.6EA84%dvhart@linux.intel.com>
Thread-Topic: [PATCH v2 1/2] kernel-yocto: Add do_diffconfig task
References: <1392586858-12205-1-git-send-email-joaohf@gmail.com>
	<1392586858-12205-2-git-send-email-joaohf@gmail.com>
In-Reply-To: <1392586858-12205-2-git-send-email-joaohf@gmail.com>
Mime-version: 1.0
Subject: Re: [PATCH v2 1/2] kernel-yocto: Add do_diffconfig task
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
X-List-Received-Date: Tue, 18 Feb 2014 17:54:05 -0000
Content-type: text/plain;
	charset="ISO-8859-1"
Content-transfer-encoding: quoted-printable

On 2/16/14, 13:40, "Jo=E3o Henrique Ferreira de Freitas" <joaohf@gmail.com>
wrote:

>Instead of using 'diff' command between two kernel config files,
>the task diffconfig does the job creating the file
>$WORKDIR/fragment.cfg that user should review and use.
>
>[YOCTO #3862]
>
>Signed-off-by: Jo=E3o Henrique Ferreira de Freitas <joaohf@gmail.com>

Acked-by: Darren Hart <dvhart@linux.intel.com>

--=20
Darren Hart
Yocto Project - Linux Kernel
Intel Open Source Technology Center





