Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3D34378515
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 17:17:40 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	vAEHHcri029367
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 14 Nov 2017 17:17:39 GMT
Message-ID: <1510679858.3952.124.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Saul Wold <sgw@linux.intel.com>, openembedded-core@lists.openembedded.org
Date: Tue, 14 Nov 2017 17:17:38 +0000
In-Reply-To: <20171114170528.5645-1-sgw@linux.intel.com>
References: <20171114170528.5645-1-sgw@linux.intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] package.bbclass: Add SRC_URI and HOMEPAGE to manifest
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
X-List-Received-Date: Tue, 14 Nov 2017 17:17:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2017-11-14 at 09:05 -0800, Saul Wold wrote:
> This will allow tools to be developed that create manifest based BOMs
> with detailed information.
> 
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta/classes/package.bbclass | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta/classes/package.bbclass
> b/meta/classes/package.bbclass
> index 2053d46395a..c2410238682 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -1387,6 +1387,8 @@ python emit_pkgdata() {
>          write_if_exists(sf, pkg, 'LICENSE')
>          write_if_exists(sf, pkg, 'DESCRIPTION')
>          write_if_exists(sf, pkg, 'SUMMARY')
> +        write_if_exists(sf, pkg, 'SRC_URI')
> +        write_if_exists(sf, pkg, 'HOMEPAGE')
>          write_if_exists(sf, pkg, 'RDEPENDS')
>          rprov = write_if_exists(sf, pkg, 'RPROVIDES')
>          write_if_exists(sf, pkg, 'RRECOMMENDS')

This was already proposed once and rejected as its using the interface
for something it really wasn't designed for :/.

Cheers,

Richard

