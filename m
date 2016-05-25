Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 6F35F60118
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2016 11:58:11 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 25 May 2016 04:58:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,364,1459839600"; d="scan'208";a="814490126"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga003.jf.intel.com with ESMTP; 25 May 2016 04:58:12 -0700
Received: by linux.intel.com (Postfix, from userid 48)
	id 2F78F6A4008; Wed, 25 May 2016 05:45:42 -0700 (PDT)
Received: from 10.252.8.31 (SquirrelMail authenticated user alexander.kanavin)
	by linux.intel.com with HTTP; Wed, 25 May 2016 15:45:42 +0300 (EEST)
Message-ID: <51007.10.252.8.31.1464180342.squirrel@linux.intel.com>
In-Reply-To: <9d52fc33-80fb-be4e-1401-c6e0bbd451e8@balister.org>
References: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
	<a387f0885671262248796e339920b43fd1639eca.1464088997.git.alexander.kanavin@linux.intel.com>
	<9d52fc33-80fb-be4e-1401-c6e0bbd451e8@balister.org>
Date: Wed, 25 May 2016 15:45:42 +0300 (EEST)
From: alexander.kanavin@linux.intel.com
To: "Philip Balister" <philip@balister.org>
User-Agent: SquirrelMail/1.4.8-5.el4.centos.8
MIME-Version: 1.0
X-Priority: 3 (Normal)
Importance: Normal
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 28/45] swig: move to Python 3
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
X-List-Received-Date: Wed, 25 May 2016 11:58:13 -0000
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit

> I'm trying to get my head around how this change will impact python2
> based programs that use swig, such as gnuradio.
>
> Does this mean all programs that use swig will need to move to python3
> now?

Probably. At least nothing in meta-oe or oe-core was impacted by this, as
far as I see, but if GNU radio isn't building properly anymore, then
copy-paste the error, and we'll work out a solution.

Alex


