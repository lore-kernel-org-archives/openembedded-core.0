Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 95D25731E5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2016 15:52:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u7JFptmu003218; Fri, 19 Aug 2016 16:52:40 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 6Go48GAS4w72; Fri, 19 Aug 2016 16:52:40 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u7JFqaIv003424
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 19 Aug 2016 16:52:37 +0100
Message-ID: <1471621956.16712.47.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexandru Moise <alexandru.moise@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Fri, 19 Aug 2016 16:52:36 +0100
In-Reply-To: <1471429608-28971-1-git-send-email-alexandru.moise@windriver.com>
References: <1471429608-28971-1-git-send-email-alexandru.moise@windriver.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH] Fix S4U2Self KDC crash when anon is restricted
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
X-List-Received-Date: Fri, 19 Aug 2016 15:52:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2016-08-17 at 13:26 +0300, Alexandru Moise wrote:
> This is CVE-2016-3120
> 
> The validate_as_request function in kdc_util.c in the Key
> Distribution
> Center (KDC) in MIT Kerberos 5 (aka krb5) before 1.13.6 and 1.4.x
> before
> 1.14.3, when restrict_anonymous_to_tgt is enabled, uses an incorrect
> client data structure, which allows remote authenticated users to
> cause
> a denial of service (NULL pointer dereference and daemon crash) via
> an
> S4U2Self request.
> 
> Signed-off-by: Alexandru Moise <alexandru.moise@windriver.com>
> ---
>  .../krb5/krb5/krb5-CVE-2016-3120.patch             | 63
> ++++++++++++++++++++++
>  meta-oe/recipes-connectivity/krb5/krb5_1.13.2.bb   |  1 +
>  2 files changed, 64 insertions(+)
>  create mode 100644 meta-oe/recipes-connectivity/krb5/krb5/krb5-CVE
> -2016-3120.patch

This is a meta-oe patch which needs to go to the openembedded-devel
list and also needs a correct shortlog (which mentions its fixing krb5
recipe as a prefix).

Cheers,

Richard



