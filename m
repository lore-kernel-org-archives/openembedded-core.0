Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 4919F6FEFA;
	Sat, 20 May 2017 16:57:38 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 May 2017 09:57:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,370,1491289200"; d="scan'208";a="1132902881"
Received: from mbstephe-mobl1.amr.corp.intel.com ([10.254.187.130])
	by orsmga001.jf.intel.com with ESMTP; 20 May 2017 09:57:39 -0700
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
From: Tim Orling <timothy.t.orling@linux.intel.com>
In-Reply-To: <20170519191339.GA11044@jama>
Date: Sat, 20 May 2017 09:57:39 -0700
Message-Id: <938DFEF8-6CF3-4868-A052-C9217B619FDC@linux.intel.com>
References: <20170519191339.GA11044@jama>
To: Martin Jansa <martin.jansa@gmail.com>
X-Mailer: Apple Mail (2.3273)
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] State of bitbake world, Failed tasks 2017-05-17
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
X-List-Received-Date: Sat, 20 May 2017 16:57:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> On May 19, 2017, at 12:13 PM, Martin Jansa <martin.jansa@gmail.com> =
wrote:
>=20
> http://www.openembedded.org/wiki/Bitbake_World_Status

</snip>

> =3D=3D=3D common (4) =3D=3D=3D
>    * =
meta-browser/recipes-mozilla/firefox/firefox_45.6.0esr.bb:do_compile
>    * =
meta-openembedded/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb:=
do_configure
>    * =
meta-openembedded/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb:do_=
configure

I sent a patch to ML for this. vala api 0.34 -> 0.36, easy fix :)

>    * =
meta-smartphone/meta-shr/recipes-shr/3rdparty/libsensmon_git.bb:do_compile=

>=20
</snip>


