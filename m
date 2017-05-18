Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id D28DE6FFD7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 May 2017 05:40:02 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 May 2017 22:40:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,357,1491289200"; d="scan'208";a="1131837352"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 17 May 2017 22:40:02 -0700
To: openembedded-core@lists.openembedded.org,
	Max Krummenacher <max.oss.09@gmail.com>,
	Max Krummenacher <max.krummenacher@toradex.com>
References: <20170517201652.27476-1-max.krummenacher@toradex.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <918cd582-010b-d732-3471-4858f4e2e836@linux.intel.com>
Date: Thu, 18 May 2017 08:37:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170517201652.27476-1-max.krummenacher@toradex.com>
Subject: Re: [PATCH] libsolv: don't pick up bundled db from host rpm
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
X-List-Received-Date: Thu, 18 May 2017 05:40:03 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 05/17/2017 11:16 PM, Max Krummenacher wrote:
> With rpm v4 in openembedded but on a host with existing /usr/include/rpm/db.h
> the build fails to compile.
> +-  # check if rpm contains a bundled berkeley db
> +-  CHECK_INCLUDE_FILE(rpm/db.h HAVE_RPM_DB_H)
> ++  set(HAVE_RPM_DB_H 0)

The problem seems to be that CHECK_INCLUDE_FILE is incorrectly looking 
for headers in host's /usr/include. Perhaps you could look into why that 
is happening and if it can be fixed, rather than fix one specific 
instance in libsolv where it is known to cause trouble?

Alex


