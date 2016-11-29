Return-Path: <jiajie.hu@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 5DBC871AC0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2016 07:36:34 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga104.fm.intel.com with ESMTP; 28 Nov 2016 23:36:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,715,1473145200"; d="scan'208";a="1074903736"
Received: from jiajiehu.sh.intel.com (HELO jiajiehu.localnet)
	([10.239.160.136])
	by fmsmga001.fm.intel.com with ESMTP; 28 Nov 2016 23:36:27 -0800
From: Jiajie Hu <jiajie.hu@intel.com>
To: Christopher Larson <clarson@kergoth.com>
Date: Tue, 29 Nov 2016 15:37:26 +0800
Message-ID: <1745772.zAqL5B44bX@jiajiehu>
User-Agent: KMail/4.13.3 (Linux/4.4.0-47-generic; KDE/4.13.3; x86_64; ; )
In-Reply-To: <CABcZANmmXvVNTiozc_y-i+efy7JZGphPezgbBRS8fZKfdtYnVA@mail.gmail.com>
References: <1480388349-4206-1-git-send-email-jiajie.hu@intel.com>
	<CABcZANmmXvVNTiozc_y-i+efy7JZGphPezgbBRS8fZKfdtYnVA@mail.gmail.com>
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] devtool: execute associated functions while preparing the source tree
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
X-List-Received-Date: Tue, 29 Nov 2016 07:36:35 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Monday, November 28, 2016 11:04:40 PM Christopher Larson wrote:
> This will do the commit after the first postfunc is done, so won=E2=80=
=99t the
> changes from the main func and the first postfunc both be included in=
 that
> commit?

I suppose all changes from the main func have already been committed in=
=20
exec_func. As an example, `devtool modify x11vnc`, where x11vnc comes f=
rom=20
meta-oe, seems to work as expected.


