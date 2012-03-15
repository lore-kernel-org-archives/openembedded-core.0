Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1S813L-0004io-Cb
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Mar 2012 04:08:35 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 842EB315A198
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2012 03:59:51 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id Hm9yz5y29Yqv
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2012 03:59:43 +0100 (CET)
Received: from [172.22.22.61] (drms-590ecefe.pool.mediaWays.net
	[89.14.206.254])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 8DADD315A196
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2012 03:59:43 +0100 (CET)
Message-ID: <4F615B1E.1060004@opendreambox.org>
Date: Thu, 15 Mar 2012 03:59:42 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <ad10381bea270e54aeefbbc3af0f9f1dce60e49f.1331776831.git.nitin.a.kamble@intel.com>
	<1b743bf3864539a8ce1902a269a5cec7d50dba1b.1331776832.git.nitin.a.kamble@intel.com>
In-Reply-To: <1b743bf3864539a8ce1902a269a5cec7d50dba1b.1331776832.git.nitin.a.kamble@intel.com>
Subject: Re: [PATCH 5/8] python: fix install when libdir is not "lib"
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 15 Mar 2012 03:08:35 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello Nitin,

On 15.03.2012 03:02, nitin.a.kamble@intel.com wrote:
> --- a/meta/recipes-devtools/python/python_2.7.2.bb
> +++ b/meta/recipes-devtools/python/python_2.7.2.bb
> @@ -20,7 +20,7 @@ SRC_URI += "\
>    file://setup_py_skip_cross_import_check.patch \
>    file://add-md5module-support.patch \
>    file://host_include_contamination.patch \
> -  file://sys_platform_is_now_always_linux2.patch \

did you remove this one by accident?

Regards,
Andreas


