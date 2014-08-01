Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 6409C65E08
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Aug 2014 09:32:39 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 01 Aug 2014 02:32:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,778,1400050800"; d="scan'208";a="570395014"
Received: from pwarusav-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.122.170])
	by fmsmga001.fm.intel.com with ESMTP; 01 Aug 2014 02:32:39 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Henning Heinold <henning@itconsulting-heinold.de>
Date: Fri, 01 Aug 2014 10:32:38 +0100
Message-ID: <1635829.5tfOCJn7de@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.13.3 (Linux/3.15.6-200.fc20.x86_64; KDE/4.13.3; x86_64; ; )
In-Reply-To: <20140729173251.GA9234@mail.itconsulting-heinold.de>
References: <20140729173251.GA9234@mail.itconsulting-heinold.de>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Problem with debian renaming and upgrade-path on dora
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
X-List-Received-Date: Fri, 01 Aug 2014 09:32:42 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Henning,

On Tuesday 29 July 2014 19:32:51 Henning Heinold wrote:
> I have a problem to get a sane upgrade path for a library package which
> should be splitted in to serval packages on dora.
> 
> The old package is called libfoo now the package gets split into libfoo
> libfoo-bar libfoo-set and so on.
> 
> Because of the debian renaming for libraries the PN-library package libfoo
> is renamed to libfoo3.
> 
> If we now want to upgrade from libfoo to libfoo3 oneway would be to use
> RREPLACE, but the renaming wrapping is written at do_package into files,
> before all the other stuff kicks in.
> 
> So all RREPLACES are renamed to libfoo3 too, making it impossible to get a
> REPLACE stanza for libfoo into an ipk.

Hmm. I guess one workaround for this would be to set the RREPLACES / RPROVIDES 
/ RCONFLICTS in a Python function that is called after the debian renaming 
happens.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

