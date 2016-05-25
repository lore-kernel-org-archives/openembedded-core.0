Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id BEFF660118
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2016 11:53:37 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 25 May 2016 04:53:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,364,1459839600"; d="scan'208";a="962014944"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 25 May 2016 04:53:37 -0700
Received: by linux.intel.com (Postfix, from userid 48)
	id D1EED6A4008; Wed, 25 May 2016 05:41:07 -0700 (PDT)
Received: from 10.252.8.31 (SquirrelMail authenticated user alexander.kanavin)
	by linux.intel.com with HTTP; Wed, 25 May 2016 15:41:07 +0300 (EEST)
Message-ID: <50977.10.252.8.31.1464180067.squirrel@linux.intel.com>
In-Reply-To: <c1841b58-1c28-7a1d-9316-d8fd4cf1f4af@balister.org>
References: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
	<70f76410663868b8cd737d28456ce2b7a5ddea27.1464088997.git.alexander.kanavin@linux.intel.com>
	<c1841b58-1c28-7a1d-9316-d8fd4cf1f4af@balister.org>
Date: Wed, 25 May 2016 15:41:07 +0300 (EEST)
From: alexander.kanavin@linux.intel.com
To: "Philip Balister" <philip@balister.org>
User-Agent: SquirrelMail/1.4.8-5.el4.centos.8
MIME-Version: 1.0
X-Priority: 3 (Normal)
Importance: Normal
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 05/45] sip.bbclass: remove
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
X-List-Received-Date: Wed, 25 May 2016 11:53:38 -0000
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit

> The pyqt recipe in meta-qt4 uses sip.

It's using the sip recipe, but not the sip class. I don't see anything in
meta-qt4 that is using the class, do you?


Alex

