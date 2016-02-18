Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 21E3475D4B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Feb 2016 20:24:33 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 18 Feb 2016 12:24:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,467,1449561600"; d="scan'208";a="918774463"
Received: from eyeoh10-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.132.216])
	by fmsmga002.fm.intel.com with ESMTP; 18 Feb 2016 12:24:31 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 19 Feb 2016 09:24:29 +1300
Message-ID: <2046956.ogQECgGtmI@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.3.5-300.fc23.x86_64; KDE/4.14.16; x86_64; ;
	)
In-Reply-To: <CA+chaQcvFnZAjNKCsc3xvPq36zPWXK5xrmi+goTonnu-i4j7sQ@mail.gmail.com>
References: <1455823285-32028-1-git-send-email-armccurdy@gmail.com>
	<1455823285-32028-3-git-send-email-armccurdy@gmail.com>
	<CA+chaQcvFnZAjNKCsc3xvPq36zPWXK5xrmi+goTonnu-i4j7sQ@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] libsoup-2.4: disable libsoup-gnome by default
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
X-List-Received-Date: Thu, 18 Feb 2016 20:24:34 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Martin,

On Thu, 18 Feb 2016 20:39:08 Martin Jansa wrote:
> IIRC this will rename the resulting package (because there will be only one
> shared library now).
> 
> that will probably break on device upgrade-path
> 
> I'm not sure if someone still cares about upgrade-paths.. there are too
> many issues going in unnoticed.

The only way we're going to fix that is if we have some automated mechanism for 
picking up on such problems. We have some of the building blocks but so far 
nobody has stepped up to write something more complete that can warn us when 
such a change has occurred.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

