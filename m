Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1RIKiL-0007fi-Uj
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Oct 2011 15:37:18 +0200
Received: from mail-iy0-f180.google.com ([209.85.210.180])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 24 Oct 2011 06:31:16 -0700
Received: by iakc1 with SMTP id c1so10538774iak.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Oct 2011 06:31:15 -0700 (PDT)
Received: by 10.68.1.1 with SMTP id 1mr33861314pbi.55.1319463073010;
	Mon, 24 Oct 2011 06:31:13 -0700 (PDT)
Received: from [10.192.3.184] ([85.13.70.251])
	by mx.google.com with ESMTPS id h5sm67559104pbq.11.2011.10.24.06.31.11
	(version=SSLv3 cipher=OTHER); Mon, 24 Oct 2011 06:31:12 -0700 (PDT)
Message-ID: <4EA568A0.4000607@intel.com>
Date: Mon, 24 Oct 2011 15:31:12 +0200
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1319394187.git.sgw@linux.intel.com>
	<dfc5efb4c54797a39c2471dfba7b7cbf14fb6476.1319394187.git.sgw@linux.intel.com>
	<1319462069.25011.0.camel@ted>
	<884DC19F-D167-41B9-B5E6-62A959BE99CB@dominion.thruhere.net>
In-Reply-To: <884DC19F-D167-41B9-B5E6-62A959BE99CB@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [CONSOLIDATED PULL 26/27] abiword: convert to svn
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
X-List-Received-Date: Mon, 24 Oct 2011 13:37:18 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/24/2011 03:18 PM, Koen Kooi wrote:
>
> Op 24 okt. 2011, om 15:14 heeft Richard Purdie het volgende geschreven:
>
>> On Sun, 2011-10-23 at 11:27 -0700, Saul Wold wrote:
>>> Signed-off-by: Saul Wold<sgw@linux.intel.com>
>>> ---
>>> meta-demoapps/recipes-gnome/abiword/abiword.inc    |    4 ++--
>>> meta-demoapps/recipes-gnome/abiword/abiword_cvs.bb |   10 ----------
>>> meta-demoapps/recipes-gnome/abiword/abiword_svn.bb |   10 ++++++++++
>>> 3 files changed, 12 insertions(+), 12 deletions(-)
>>> delete mode 100644 meta-demoapps/recipes-gnome/abiword/abiword_cvs.bb
>>> create mode 100644 meta-demoapps/recipes-gnome/abiword/abiword_svn.bb
>>>
>>> diff --git a/meta-demoapps/recipes-gnome/abiword/abiword.inc b/meta-demoapps/recipes-gnome/abiword/abiword.inc
>>> index b1b0f67..2b34a7a 100644
>>> --- a/meta-demoapps/recipes-gnome/abiword/abiword.inc
>>> +++ b/meta-demoapps/recipes-gnome/abiword/abiword.inc
>>> @@ -13,8 +13,8 @@ RRECOMMENDS_${PN}    = "glibc-gconv-ibm850 glibc-gconv-cp1252 \
>>> RELURI = "http://www.abiword.org/downloads/abiword/${PV}/source/abiword-${PV}.tar.gz"
>>> RELSRC = "${WORKDIR}/abiword-${PV}/abi"
>>>
>>> -CVSURI = "cvs://anoncvs:anoncvs@anoncvs.abisource.com/cvsroot;module=abi"
>>> -CVSSRC = "${WORKDIR}/abi"
>>> +SVNURI = "cvs://svn.abisource.com/abiword/trunk;module=abiword;proto=http"
>>> +SVNSRC = "${WORKDIR}/abi"
>>>
>> Er, its still using cvs:// ?!
>
> The whole abiword section is outdated, it has 2.5.2 which was released on 21-Aug-2007, latest is 2.8.6 released on 13-Jun-2010. I have an uncommited update in meta-oe to update abiword to 2.8.6, need to clean that up.
>
I will defer my patch for what Koen has pending then for meta-oe, 
probably the better place for it anyways, it should be removed from the 
meta-demoapps.

Sau!

> regards,
>
> Koen
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



