Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 2E87A731D1
	for <openembedded-core@openembedded.org>;
	Fri,  5 Aug 2016 20:48:07 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 05 Aug 2016 13:48:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,474,1464678000"; d="scan'208";a="1035955189"
Received: from ggtan-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.178.18])
	by fmsmga002.fm.intel.com with ESMTP; 05 Aug 2016 13:48:04 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: =?ISO-8859-1?Q?An=EDbal_Lim=F3n?= <anibal.limon@linux.intel.com>
Date: Sat, 06 Aug 2016 08:48:01 +1200
Message-ID: <1505808.fKHZxyACnI@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.6.4-201.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <1470429030-30444-1-git-send-email-anibal.limon@linux.intel.com>
References: <1470429030-30444-1-git-send-email-anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>,
	openembedded-core@openembedded.org
Subject: Re: [PATCH] oeqa/utils/httpserver.py: HTTPServer enable thread connection handling
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
X-List-Received-Date: Fri, 05 Aug 2016 20:48:10 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Fri, 05 Aug 2016 15:30:30 An=EDbal Lim=F3n wrote:
> HTTPServer now supports multiple connections using Python threads.
>=20
> Signed-off-by: An=EDbal Lim=F3n <anibal.limon@linux.intel.com>
> ---
>  meta/lib/oeqa/utils/httpserver.py | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/lib/oeqa/utils/httpserver.py
> b/meta/lib/oeqa/utils/httpserver.py index bd76f36..7d12331 100644
> --- a/meta/lib/oeqa/utils/httpserver.py
> +++ b/meta/lib/oeqa/utils/httpserver.py
> @@ -1,8 +1,9 @@
>  import http.server
>  import multiprocessing
>  import os
> +from socketserver import ThreadingMixIn
>=20
> -class HTTPServer(http.server.HTTPServer):
> +class HTTPServer(ThreadingMixIn, http.server.HTTPServer):
>=20
>      def server_start(self, root_dir):
>          import signal

This looks like a neat solution to the sstate serving issue Francisco h=
as been=20
dealing with - thanks!

Cheers,
Paul


--=20

Paul Eggleton
Intel Open Source Technology Centre

