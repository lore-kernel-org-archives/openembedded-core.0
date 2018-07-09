Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3CE0375035
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jul 2018 08:46:37 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w698kaI4021465
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 9 Jul 2018 09:46:38 +0100
Message-ID: <d1627eab4bff8883c6238d32c7704d4c29741d70.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: changqing.li@windriver.com, openembedded-core@lists.openembedded.org
Date: Mon, 09 Jul 2018 09:46:36 +0100
In-Reply-To: <1531122592-221110-1-git-send-email-changqing.li@windriver.com>
References: <1531122592-221110-1-git-send-email-changqing.li@windriver.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] coreutils: fix compile error since use wrong libnss_nis.so
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
X-List-Received-Date: Mon, 09 Jul 2018 08:46:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2018-07-09 at 15:49 +0800, changqing.li@windriver.com wrote:
> From: Changqing Li <changqing.li@windriver.com>
> 
> id: relocation error: /lib/x86_64-linux-gnu/libnss_nis.so.2:
> symbol _nsl_default_nss version GLIBC_PRIVATE not defined in
> file libnsl.so.1 with link time reference
> 
> Recent glibc change removed libnss-nis module from glibc and
> a new recipe libnss-nis.bb was added. After this change,
> we need to include native libnss_nis in coreutils. otherwise,
> with "nis" in host /etc/nssswitch.conf, id will use host
> libnss_nis.so, which will cause above error
> 
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  meta/recipes-core/coreutils/coreutils_8.29.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

I think this would be fixed by a new version of uninative-tarball after
the recent change to include libnss-nis in it. We should probably have
a new release of uninative rather than starting to add these DEPENDS
everywhere...

Cheers,

Richard

