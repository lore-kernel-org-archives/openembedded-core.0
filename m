Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 8A6F36A4AB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jun 2013 09:54:06 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 06 Jun 2013 02:54:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,814,1363158000"; d="scan'208";a="349013996"
Received: from unknown (HELO helios.localnet) ([10.252.121.213])
	by fmsmga002.fm.intel.com with ESMTP; 06 Jun 2013 02:54:06 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org, Saul Wold <sgw@linux.intel.com>
Date: Thu, 06 Jun 2013 10:54:05 +0100
Message-ID: <14899581.O0scG6jzAS@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.3 (Linux/3.8.0-23-generic; KDE/4.10.3; i686; ; )
In-Reply-To: <51AF6ED5.4010500@linux.intel.com>
References: <1370422910-24366-1-git-send-email-net147@gmail.com>
	<2054363.UxqkIOrzAJ@helios> <51AF6ED5.4010500@linux.intel.com>
MIME-Version: 1.0
Subject: Re: [PATCH] qmake2.bbclass: export OE_QMAKE_QT_CONFIG
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
X-List-Received-Date: Thu, 06 Jun 2013 09:54:07 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 05 June 2013 10:01:09 Saul Wold wrote:
> On 06/05/2013 09:57 AM, Paul Eggleton wrote:
> > On Wednesday 05 June 2013 09:46:49 Saul Wold wrote:
> >> On 06/05/2013 02:30 AM, Martin Jansa wrote:
> >>> On Wed, Jun 05, 2013 at 07:01:50PM +1000, Jonathan Liu wrote:
> >>>> qconfig.pri was not being loaded by qmake properly. This means Qt
> >>>> qmake projects are unable to query QT_ARCH, QT_VERSION and other
> >>>> variables defined in qconfig.pri.
> >>>> 
> >>>> Export OE_QMAKE_QT_CONFIG, setting it to the location of qconfig.pri
> >>>> so that it can be located by qmake.
> >>> 
> >>> There is such patch already:
> >>> http://lists.openembedded.org/pipermail/openembedded-core/2013-May/07831
> >>> 4.
> >>> html
> >> 
> >> Got lost in my queue, adding it for the next MUT.
> > 
> > FWIW I am still concerned by the assertion in the commit message about it
> > causing undesirable behaviour. I'd want that checked out and the note
> > removed before we look at merging this.
> 
> OK, I will shelf this until I hear more about the testing of this change
> regarding the original patch's note.

So I tested a rebuild of qt4-x11-free with Felipe's patch and two of 
Jonathan's ("qt4: fix QMAKE_QT_CONFIG being overwritten with empty value" and 
"classes/qmake_base: allow parallel make"), and did not observe any unexpected 
behaviour and buildhistory looks clean for qt itself and fotowall/quicky. So 
I'd say feel free to throw these into MUT, but I think we need to drop the 
note.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

