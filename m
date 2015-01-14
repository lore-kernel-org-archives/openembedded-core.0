Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 28A7C71634
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jan 2015 23:35:49 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 14 Jan 2015 15:32:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,400,1418112000"; d="scan'208";a="651269034"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com)
	([10.252.5.233])
	by fmsmga001.fm.intel.com with ESMTP; 14 Jan 2015 15:35:49 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Darren Hart <dvhart@linux.intel.com>,
	Vincent =?ISO-8859-1?Q?G=E9nieux?= <vincent2014@startigen.fr>
Date: Wed, 14 Jan 2015 23:35:48 +0000
Message-ID: <2573593.eHnZ4K4uiL@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.3 (Linux/3.17.8-200.fc20.x86_64; KDE/4.14.3; x86_64; ; )
In-Reply-To: <54B6A0DB.70706@linux.intel.com>
References: <1421100601-30956-1-git-send-email-vincent2014@startigen.fr>
	<54B6A0DB.70706@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: fix '[[: not found' error message using dash
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
X-List-Received-Date: Wed, 14 Jan 2015 23:35:55 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Wednesday 14 January 2015 09:01:15 Darren Hart wrote:
> On 1/12/15 2:10 PM, Vincent G=E9nieux wrote:
> > This is a fix for https://bugzilla.yoctoproject.org/show_bug.cgi?id=
=3D7112
> > bash specific syntax '[[ test ]]' replaced with '[ test ]'.
>=20
> Please use the tag:
>=20
> Fixes [YOCTO 7112]
>=20
> In the message body, on it's own line.

To be 100% correct, the syntax is

Fixes [YOCTO #7112]

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre

