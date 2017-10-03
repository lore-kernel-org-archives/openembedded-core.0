Return-Path: <juro.bystricky@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id D0209779F5
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Oct 2017 20:44:26 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Oct 2017 13:44:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,475,1500966000"; d="scan'208";a="1178272326"
Received: from orsmsx104.amr.corp.intel.com ([10.22.225.131])
	by orsmga001.jf.intel.com with ESMTP; 03 Oct 2017 13:44:27 -0700
Received: from orsmsx112.amr.corp.intel.com ([169.254.3.30]) by
	ORSMSX104.amr.corp.intel.com ([169.254.4.87]) with mapi id
	14.03.0319.002; Tue, 3 Oct 2017 13:44:27 -0700
From: "Bystricky, Juro" <juro.bystricky@intel.com>
To: Marek Vasut <marex@denx.de>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] siteinfo: nios2-linux - remove wrong mutex info
Thread-Index: AQHTPIEGNYgUfqhfHkK+qXASEBSJKqLTAHaA//+UMdI=
Date: Tue, 3 Oct 2017 20:44:26 +0000
Message-ID: <6E51916E4A1F32428260031F4C7CD2B611A22BC6@ORSMSX112.amr.corp.intel.com>
References: <1507060295-34074-1-git-send-email-juro.bystricky@intel.com>,
	<0794973c-f52e-b63f-010e-2bf72b76cb5a@denx.de>
In-Reply-To: <0794973c-f52e-b63f-010e-2bf72b76cb5a@denx.de>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.19.9.46]
MIME-Version: 1.0
Cc: "jurobystricky@hotmail.com" <jurobystricky@hotmail.com>, "Gan,
	Yau Wai" <yau.wai.gan@intel.com>
Subject: Re: [PATCH] siteinfo: nios2-linux - remove wrong mutex info
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
X-List-Received-Date: Tue, 03 Oct 2017 20:44:26 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

=0A=
> While I understand ARM/ is wrong, why is removing the db_cv_mutex a=0A=
> correct fix instead of ie. s/ARM/nios2/ ? The patch description does not=
=0A=
> explain that.=0A=
=0A=
With the relatively recent commit http://git.yoctoproject.org/cgit.cgi/poky=
/commit/meta/recipes-support/db?id=3Df4e8e9242c5df095b52688b083df3c9d36e714=
4b=0A=
some nios2 builds (uboot, core-image-minimal, etc) were broken due to db tr=
ying to=0A=
use ARM instructions in mutexes. The reason was db "configure" used the cac=
hed entry =0A=
from nios2-linux (which was incorrect).  So the remedy was to remove the in=
correct cached entry=0A=
and let db "configure" figure out which is the proper mutex to use. =0A=
Besides, I don't even know if nios2/gcc-assembly exists.=0A=
Also, none of other Linux info files provides this entry (db_cv_mutex).=0A=
=0A=

