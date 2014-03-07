Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id E70BB6F7A8
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Mar 2014 15:36:41 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 07 Mar 2014 07:36:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,608,1389772800"; d="scan'208";a="494220747"
Received: from lbhoopat-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.98])
	by fmsmga002.fm.intel.com with ESMTP; 07 Mar 2014 07:36:40 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: =?ISO-8859-1?Q?S=E9bastien?= Mennetrier <s.mennetrier@innotis.org>
Date: Fri, 07 Mar 2014 15:36:39 +0000
Message-ID: <1626841.1TdQbzb3V4@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.3 (Linux/3.13.5-200.fc20.x86_64; KDE/4.12.3; x86_64; ; )
In-Reply-To: <CABgO3_Pe8-0rZ3hFELYfNWnNnWXtYz99w0BbgTi4+C6Zk1JtQg@mail.gmail.com>
References: <1393509239-26637-1-git-send-email-s.mennetrier@innotis.org>
	<1394199246.12327.37.camel@ted>
	<CABgO3_Pe8-0rZ3hFELYfNWnNnWXtYz99w0BbgTi4+C6Zk1JtQg@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Create gstreamer-1.0 package groups
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
X-List-Received-Date: Fri, 07 Mar 2014 15:36:42 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Friday 07 March 2014 14:36:59 S=E9bastien Mennetrier wrote:
> Ok, I will test my patch with this change on master branch.
>=20
> Thanks for your help and your tips.

BTW, if this recipe inherited packagegroup (as I think it should, since=
 that's=20
what it claims to be creating) then LIC_FILES_CHKSUM isn't necessary. A=
s a=20
bonus a number of behaviours desirable for packagegroups are enabled by=
 the=20
class.

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre

