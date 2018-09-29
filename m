Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id DA03279982
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Sep 2018 12:44:02 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w8TCi2lY026822
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Sat, 29 Sep 2018 13:44:03 +0100
Message-ID: <d53eac33f13004eec2b52746d09ca77a3019ccaa.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: kai.kang@windriver.com, openembedded-core@lists.openembedded.org
Date: Sat, 29 Sep 2018 13:44:02 +0100
In-Reply-To: <5266d8bc086fe75047d2cc84d25a4a83b28811b5.1538199671.git.kai.kang@windriver.com>
References: <cover.1538199671.git.kai.kang@windriver.com>
	<5266d8bc086fe75047d2cc84d25a4a83b28811b5.1538199671.git.kai.kang@windriver.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 05/10] nss: move create blank certificates to pkg_postinst
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
X-List-Received-Date: Sat, 29 Sep 2018 12:44:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2018-09-29 at 13:43 +0800, kai.kang@windriver.com wrote:
> From: Kai Kang <kai.kang@windriver.com>
> 
> There is a multilib install file conflict of nss:
> > file /etc/pki/nssdb/key4.db conflicts between attempted installs of
> > lib32-nss-3.38-r0.corei7_32 and nss-3.38-r0.corei7_64
> 
> Move the creation of blank certificates to pkg_postinst. And check if
> certificates exist already, don't re-create them.
> 
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta/recipes-support/nss/nss_3.38.bb | 32 +++++++++++++++++---------
> --
>  1 file changed, 20 insertions(+), 12 deletions(-)

This does raise a question - why aren't the generated files the same?
Is there a determinism problem here? This sounds like the image would
change with each build and couldn't be reproduced so we have a bigger
problem?

Cheers,

Richard

