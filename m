Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SoF56-0004YN-O7
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 16:37:01 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q69EPg6Z025589
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 9 Jul 2012 07:25:42 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.229) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Mon, 9 Jul 2012 07:25:42 -0700
Message-ID: <4FFAE9ED.3050505@windriver.com>
Date: Mon, 9 Jul 2012 09:25:49 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:13.0) Gecko/20120614 Thunderbird/13.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1341834900.8066.9.camel@ted> <4FFAE7B7.1080804@gmail.com>
In-Reply-To: <4FFAE7B7.1080804@gmail.com>
Subject: Re: [PATCH] ccache: Ensure CCACHE_DIR is cleaned by do_clean task
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
X-List-Received-Date: Mon, 09 Jul 2012 14:37:01 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 7/9/12 9:16 AM, Khem Raj wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 7/9/2012 4:55 AM, Richard Purdie wrote:
>> This ensures a rebuild does really build from scratch when ccache
>> is in use.
>>
>> [YOCTO #2696]
>>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> --- diff --git a/meta/classes/ccache.bbclass
>> b/meta/classes/ccache.bbclass index 5aa2da2..cd06a4b 100644 ---
>> a/meta/classes/ccache.bbclass +++ b/meta/classes/ccache.bbclass @@
>> -4,3 +4,5 @@ CCACHE_DISABLE[unexport] = "1"
>>
>> do_configure[dirs] =+ "${CCACHE_DIR}" do_kernel_configme[dirs] =+
>> "${CCACHE_DIR}" + +do_clean[cleandirs] += "${CCACHE_DIR}"
>>
>
> so will this remove all contents of .ccache dir ?
> or just the package you are cleanall'ing

I was wondering the same thing, with the default configuration:

bitbake.conf:# Assign CCACHE_DIR a default value to fix a bug of ccache 3.1.7,
bitbake.conf:# since it would always create CCACHE_DIR/.ccache even if
bitbake.conf:export CCACHE_DIR ??= "${@os.getenv('HOME')}"

--Mark

> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.12 (MingW32)
> Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/
>
> iEYEARECAAYFAk/657cACgkQuwUzVZGdMxR6/gCeIFHIc01FiI5bCB5jiFaPev0/
> VXkAn1V/VQEEfwQop6kt2/kgaei2A5yZ
> =gYFM
> -----END PGP SIGNATURE-----
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>




