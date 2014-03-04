Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 5693A6EEF3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Mar 2014 11:04:47 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 04 Mar 2014 03:00:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,584,1389772800"; d="scan'208";a="493723434"
Received: from mmckenna-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.51])
	by orsmga002.jf.intel.com with ESMTP; 04 Mar 2014 03:04:47 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Andreas Oberritter <obi@opendreambox.org>
Date: Tue, 04 Mar 2014 11:04:46 +0000
Message-ID: <4042276.CtDnKMlVIU@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.2 (Linux/3.13.5-200.fc20.x86_64; KDE/4.12.2; x86_64; ; )
In-Reply-To: <5315B2D1.2020804@opendreambox.org>
References: <1393532438-6852-1-git-send-email-david.c.nystrom@gmail.com>
	<1742132.ri7Qh8tc7U@peggleto-mobl5.ger.corp.intel.com>
	<5315B2D1.2020804@opendreambox.org>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] do_rootfs: Added PACKAGE_FEED_URIS functionality
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
X-List-Received-Date: Tue, 04 Mar 2014 11:04:47 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Tuesday 04 March 2014 12:02:41 Andreas Oberritter wrote:
> On 04.03.2014 11:29, Paul Eggleton wrote:
> > On Tuesday 04 March 2014 09:45:09 David Nystr=F6m wrote:
> >> On 2014-03-03 21:41, Trevor Woerner wrote:
> >>> Does this resolve issue 5407?
> >>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D5407
> >>=20
> >> This patch satisfies a small part of 5407, when this patch has bee=
n
> >> reworked into a recipe and merged
> >=20
> > I'm still confused as to why reworking this into a recipe is benefi=
cial...
> > ?
>
> Because if the feed info is stored in a package, it can be updated
> without reflashing.
>=20
> We used this once to stop updates for selected machines from a shared=

> feed (due to memory constraints), but allowed other machines to conti=
nue
> to receive updates by pointing them to a new feed location.

I see - makes sense.

Thanks,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre

