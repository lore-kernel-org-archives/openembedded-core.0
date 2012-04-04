Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SFWTt-0002WM-Ry
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Apr 2012 22:07:02 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q34JvntQ015672
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 4 Apr 2012 12:57:49 -0700 (PDT)
Received: from msp-dhcp14.wrs.com (172.25.34.14) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 4 Apr 2012 12:57:49 -0700
Message-ID: <4F7CA7BC.10806@windriver.com>
Date: Wed, 4 Apr 2012 14:57:48 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1333481624.git.mark.hatle@windriver.com>
	<23c9e1f3a0ba5acbb54ae85cb194310020d3e80e.1333481624.git.mark.hatle@windriver.com>
	<CAEsOVNd+9mg92Q0vx2Zqbx9Wjrxn+BcVVAMztRqpt_-a5Cf3RA@mail.gmail.com>
In-Reply-To: <CAEsOVNd+9mg92Q0vx2Zqbx9Wjrxn+BcVVAMztRqpt_-a5Cf3RA@mail.gmail.com>
Subject: Re: [PATCH 4/7] conf/machine/include: Cleanup PowerPC tunings to match README
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
X-List-Received-Date: Wed, 04 Apr 2012 20:07:02 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 4/4/12 1:02 PM, Matthew McClintock wrote:
> On Tue, Apr 3, 2012 at 12:47 PM, Mark Hatle<mark.hatle@windriver.com>  wrote:
>> +ABIEXTENSION .= "${SPEABIEXTENSION}"
>>
>>   AVAILTUNES += "ppce500"
>>   TUNE_FEATURES_tune-ppce500 = "m32 spe ppce500"
>> +TUNE_PKGARCH_tune-ppce500 = "ppce500"
>>   PACKAGE_EXTRA_ARCHS_tune-ppce500 = "ppce500"
>
> meta/conf/machine/include/tune-ppce500.inc:PACKAGE_EXTRA_ARCHS_tune-ppce500
> = "ppce500"
> meta/conf/machine/include/tune-ppce500v2.inc:PACKAGE_EXTRA_ARCHS_tune-ppce500v2
> = "ppce500v2"
>
> Should these have ${PACKAGE_EXTRA_ARCHS_tune-powerpc} as well?

No, the tunes for ppce500 and ppce500v2 are NOT compatible w/ powerpc or any 
other tunes (due to the SPE ABI interactions).

--Mark

> -M
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



