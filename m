Return-Path: <ross.burton@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id A73DE7F37E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jan 2020 14:42:45 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Jan 2020 06:42:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,326,1574150400"; d="scan'208";a="305869870"
Received: from jmmarti7-mobl1.amr.corp.intel.com (HELO rburton-mac01.local)
	([10.252.51.74])
	by orsmga001.jf.intel.com with ESMTP; 16 Jan 2020 06:42:45 -0800
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	Carlos Rafael Giani <crg7475@mailbox.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <20200112135954.23868-1-crg7475@mailbox.org>
	<20200112135954.23868-2-crg7475@mailbox.org>
	<5f643784a4c74504a4e5339f3a0eef51@XBOX03.axis.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <4aadd9d1-e2aa-3517-693f-34ff8c9d277e@intel.com>
Date: Thu, 16 Jan 2020 14:42:44 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <5f643784a4c74504a4e5339f3a0eef51@XBOX03.axis.com>
Subject: Re: [PATCH 02/12] gstreamer1.0: Transition to meson based builds
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
X-List-Received-Date: Thu, 16 Jan 2020 14:42:45 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Changes to packages/core2-64-poky-linux/gstreamer1.0 (sysroot):
   /usr/share/bash-completion/helpers/gst was removed
   /usr/share/bash-completion/helpers was removed
   /usr/share/bash-completion/completions/gst-launch-1.0 was removed
   /usr/share/bash-completion/completions was removed

Bash completion was on by default previously.  Also there's a class to 
package it neatly.

Ross

