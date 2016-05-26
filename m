Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id ECB456014F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2016 09:18:25 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 26 May 2016 02:18:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,367,1459839600"; d="scan'208";a="709177361"
Received: from linux.intel.com ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 26 May 2016 02:18:27 -0700
Received: by linux.intel.com (Postfix, from userid 48)
	id 41BAF6A4008; Thu, 26 May 2016 03:05:56 -0700 (PDT)
Received: from 10.252.8.31 (SquirrelMail authenticated user alexander.kanavin)
	by linux.intel.com with HTTP; Thu, 26 May 2016 13:05:56 +0300 (EEST)
Message-ID: <62127.10.252.8.31.1464257156.squirrel@linux.intel.com>
In-Reply-To: <534a7be7-380a-1d4a-085b-0ce503d59542@balister.org>
References: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
	<a387f0885671262248796e339920b43fd1639eca.1464088997.git.alexander.kanavin@linux.intel.com>
	<9d52fc33-80fb-be4e-1401-c6e0bbd451e8@balister.org>
	<51007.10.252.8.31.1464180342.squirrel@linux.intel.com>
	<534a7be7-380a-1d4a-085b-0ce503d59542@balister.org>
Date: Thu, 26 May 2016 13:05:56 +0300 (EEST)
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
X-List-Received-Date: Thu, 26 May 2016 09:18:27 -0000
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit

>
> It would be nice to use PACKAGECONFIG to select 2 versus 3 so we can
> build sdks that only have python2.

This requires a conditional class inherit (pythonnative vs.
python3native), which you can't at the moment do with PACKAGECONFIG.

If you really need this, make a swig-python2 recipe.

Alex

