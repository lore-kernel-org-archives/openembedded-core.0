Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 2472260118
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2016 11:50:24 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 25 May 2016 04:50:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,364,1459839600"; d="scan'208";a="974214184"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 25 May 2016 04:50:24 -0700
Received: by linux.intel.com (Postfix, from userid 48)
	id 045276A4008; Wed, 25 May 2016 05:37:54 -0700 (PDT)
Received: from 10.252.8.31 (SquirrelMail authenticated user alexander.kanavin)
	by linux.intel.com with HTTP; Wed, 25 May 2016 15:37:54 +0300 (EEST)
Message-ID: <50957.10.252.8.31.1464179874.squirrel@linux.intel.com>
In-Reply-To: <20160524125002.GA2566@jama>
References: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
	<caaf69df34a94f81e3aa5f853580cc59dacd6577.1464088997.git.alexander.kanavin@linux.intel.com>
	<20160524125002.GA2566@jama>
Date: Wed, 25 May 2016 15:37:54 +0300 (EEST)
From: alexander.kanavin@linux.intel.com
To: "Martin Jansa" <martin.jansa@gmail.com>
User-Agent: SquirrelMail/1.4.8-5.el4.centos.8
MIME-Version: 1.0
X-Priority: 3 (Normal)
Importance: Normal
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 09/45] python3: manipulate all of the config*/Makefile files, not just config/Makefile
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
X-List-Received-Date: Wed, 25 May 2016 11:50:26 -0000
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit

>>  	install -m 0644 Makefile.sysroot
>> ${D}/${libdir}/python${PYTHON_MAJMIN}/config/Makefile
>> +	install -m 0644 Makefile.sysroot
>> ${D}/${libdir}/python${PYTHON_MAJMIN}/config-${PYTHON_MAJMIN}m/Makefile
>
> Shouldn't it use "PYTHON_ABI" variable instead of "m"?

Thanks, I fixed it in the repo (will push a bit later).

Alex


