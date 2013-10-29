Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id D30096D3A8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2013 21:04:34 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 29 Oct 2013 14:04:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="314428771"
Received: from paulonei-mobl.ger.corp.intel.com (HELO helios.localnet)
	([10.252.121.45])
	by AZSMGA002.ch.intel.com with ESMTP; 29 Oct 2013 14:04:35 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
Date: Tue, 29 Oct 2013 21:04:34 +0000
Message-ID: <1708052.DkyjeSlWrd@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-31-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <52700D71.9090809@linux.intel.com>
References: <1383060112-7835-1-git-send-email-paul.eggleton@linux.intel.com>
	<52700D71.9090809@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] scripts/oe-pkgdata-util: fix global name 'debug' is not defined
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
X-List-Received-Date: Tue, 29 Oct 2013 21:04:35 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Saul,

On Tuesday 29 October 2013 12:33:05 Saul Wold wrote:
> On 10/29/2013 08:21 AM, Paul Eggleton wrote:
> > This global variable is no longer present, so pass in the value
> > specified via the command line.
> 
> This did not seem to fix the issue, I restarted the AB after this fix
> was in.

If you check the revision it built, for whatever reason it was the revision 
before the fix. I have also double-checked and building an image works fine 
here.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

