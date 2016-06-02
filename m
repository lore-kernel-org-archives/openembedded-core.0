Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id B2629774A2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jun 2016 19:28:16 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 02 Jun 2016 12:28:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,407,1459839600"; d="scan'208";a="994061026"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 02 Jun 2016 12:28:18 -0700
Received: by linux.intel.com (Postfix, from userid 48)
	id 97AC76A4008; Thu,  2 Jun 2016 13:15:45 -0700 (PDT)
Received: from 10.252.18.48 (SquirrelMail authenticated user alexander.kanavin)
	by linux.intel.com with HTTP; Thu, 2 Jun 2016 23:15:45 +0300 (EEST)
Message-ID: <63886.10.252.18.48.1464898545.squirrel@linux.intel.com>
In-Reply-To: <1464892387-696-1-git-send-email-alejandro.delcastillo@ni.com>
References: <1464892387-696-1-git-send-email-alejandro.delcastillo@ni.com>
Date: Thu, 2 Jun 2016 23:15:45 +0300 (EEST)
From: alexander.kanavin@linux.intel.com
To: "Alejandro del Castillo" <alejandro.delcastillo@ni.com>
User-Agent: SquirrelMail/1.4.8-5.el4.centos.8
MIME-Version: 1.0
X-Priority: 3 (Normal)
Importance: Normal
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] opkg-utils: update SRCREV
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
X-List-Received-Date: Thu, 02 Jun 2016 19:28:17 -0000
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit

> Drop patches now included in newer SRCREV. Update HOMEPAGE and PV
> version to better align with opkg. Current revision include:
> +SRCREV = "ecd9a499d336ffd127bda3c5ba403f0a5ca056a5"
> +PV = "0.3.1+git${SRCPV}"

PV should match an existing version tag in the repository, and currently
there are no tags at all. Please start tagging the versions there,
otherwise there is no link between the version and the commit id in the
upstream.

Alex

