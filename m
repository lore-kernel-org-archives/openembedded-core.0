Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 59CD373170
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Mar 2016 22:15:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u24MFt02018100; Fri, 4 Mar 2016 22:15:55 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id f2BAJGLkPgO4; Fri,  4 Mar 2016 22:15:55 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u24MFo9Q018097
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 4 Mar 2016 22:15:51 GMT
Message-ID: <1457129750.2804.55.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: guojian.zhou@windriver.com, openembedded-core@lists.openembedded.org
Date: Fri, 04 Mar 2016 22:15:50 +0000
In-Reply-To: <1454227827-1812-1-git-send-email-guojian.zhou@windriver.com>
References: <1454227827-1812-1-git-send-email-guojian.zhou@windriver.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH 1/1] oe-core: Add the "PACKAGE_VENDOR_REPO" directory for the vendor-proprietary rpm
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
X-List-Received-Date: Fri, 04 Mar 2016 22:15:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2016-01-31 at 16:10 +0800, guojian.zhou@windriver.com wrote:
> From: Guojian Zhou <guojian.zhou@windriver.com>
> 
> The vendor proprietary rpms should be packaged into the
> "vendor_proprietary_extensions" directory. Add the
> "PACKAGE_VENDOR_REPO"
> to allow the recipes select the required packages directory.
> 
> Signed-off-by: Guojian Zhou <guojian.zhou@windriver.com>
> ---
>  meta/classes/package_rpm.bbclass | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

Why isn't the "vendor extension" just a normal extra package
architecture?

For example, meta-intel was able to define a specific graphics package
architecture for a subset of packages quite easily without this kind of
change.

Cheers,

Richard

