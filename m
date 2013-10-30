Return-Path: <Qiang.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D4EAB6AA20
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Oct 2013 09:35:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9U9ZYAq018760
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 30 Oct 2013 02:35:34 -0700 (PDT)
Received: from [128.224.162.198] (128.224.162.198) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Wed, 30 Oct 2013 02:35:34 -0700
Message-ID: <5270D2E7.5020900@windriver.com>
Date: Wed, 30 Oct 2013 17:35:35 +0800
From: Qiang Chen <qiang.chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <1382937354-31622-1-git-send-email-qiang.chen@windriver.com>
	<526FD611.30304@linux.intel.com> <2319343.tLITFFHSjA@helios>
In-Reply-To: <2319343.tLITFFHSjA@helios>
X-Originating-IP: [128.224.162.198]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] openssl: create package for openssl configuration file
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
X-List-Received-Date: Wed, 30 Oct 2013 09:35:34 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 10/30/2013 12:03 AM, Paul Eggleton wrote:

> On Tuesday 29 October 2013 08:36:49 Saul Wold wrote:
>> On 10/27/2013 10:15 PM, qiang.chen@windriver.com wrote:
>>> From: Qiang Chen <qiang.chen@windriver.com>
>>>
>>> * Add the openssl-conf package to the list of packages to
>>>
>>>     be created.  This package contains the openssl.cnf file
>>>     which is used by both the openssl executable in the
>>>     openssl package and the libcrypto library.
>>>
>>> * This is to avoid messages like:
>>>       WARNING: can't open config file: /usr/lib/ssl/openssl.cnf
>>>
>>> * When running "openssl req" to request and generate a certificate
>>>
>>>     the command will fail without the openssl.cnf file being
>>>     installed on the target system.
>>>
>>> * Made this package an RRECOMMENDS for libcrypto since:
>>> 	* libcrypto is a RDEPENDS for the openssl package
>>> 	* Users can specify a configuration file at another
>>> 	
>>>         location so it is not stricly required and many
>>>         commands will work without it (with warnings)
>>>
>>> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
>>> Signed-off-by: Qiang Chen <qiang.chen@windriver.com>
>>> ---
>>>
>>>    meta/recipes-connectivity/openssl/openssl.inc |   12 ++++++++++--
>>>    1 file changed, 10 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/meta/recipes-connectivity/openssl/openssl.inc
>>> b/meta/recipes-connectivity/openssl/openssl.inc index 78ff7ae..f4b786a
>>> 100644
>>> --- a/meta/recipes-connectivity/openssl/openssl.inc
>>> +++ b/meta/recipes-connectivity/openssl/openssl.inc
>>> @@ -33,13 +33,21 @@ export AS = "${CC} -c"
>>>
>>>    inherit pkgconfig siteinfo multilib_header
>>>
>>> -PACKAGES =+ "libcrypto libssl ${PN}-misc"
>>> +PACKAGES =+ "libcrypto libssl ${PN}-misc openssl-conf"
>> How about ${BPN}-conf here instead?
> Does this work when two multilib variants produce the same package name? I
> suspect you'll get warnings.

Hi Paul,

I will verify this problem before I send V2 patch.


Thanks.
Qiang

>
> Cheers,
> Paul
>
>

