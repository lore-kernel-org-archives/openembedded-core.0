Return-Path: <gary@mlbassoc.com>
X-Greylist: delayed 495 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 28 May 2014 21:34:49 UTC
Received: from mail.chez-thomas.org (unknown [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id ACE106FBDF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 May 2014 21:34:49 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id B2900F811F3; Wed, 28 May 2014 15:26:35 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 5D9EBF811F2;
	Wed, 28 May 2014 15:26:34 -0600 (MDT)
Message-ID: <538654AE.2020400@mlbassoc.com>
Date: Wed, 28 May 2014 15:27:10 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1401312099-4247-1-git-send-email-akuster@mvista.com>
In-Reply-To: <1401312099-4247-1-git-send-email-akuster@mvista.com>
Subject: Re: [PATCH 0/2 V2] Update timezone files to 2014c
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
X-List-Received-Date: Wed, 28 May 2014 21:34:54 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2014-05-28 15:21, Armin Kuster wrote:
> This updates both tzcode and tzdate to latest
>
> V2: License correction
>      Solar type correction
>
> Armin Kuster (2):
>    Update tzdata to 2014c
>    Update tzcode to 2014c
>
>   .../recipes-extended/tzcode/tzcode-native_2013i.bb |  26 ---
>   .../recipes-extended/tzcode/tzcode-native_2014c.bb |  25 +++
>   meta/recipes-extended/tzdata/tzdata_2013i.bb       | 206 ---------------------
>   meta/recipes-extended/tzdata/tzdata_2014c.bb       | 205 ++++++++++++++++++++
>   4 files changed, 230 insertions(+), 232 deletions(-)
>   delete mode 100644 meta/recipes-extended/tzcode/tzcode-native_2013i.bb
>   create mode 100644 meta/recipes-extended/tzcode/tzcode-native_2014c.bb
>   delete mode 100644 meta/recipes-extended/tzdata/tzdata_2013i.bb
>   create mode 100644 meta/recipes-extended/tzdata/tzdata_2014c.bb
>

These changes would probably be much easier to read/understand
if you use the -M option since the actual differences are pretty
minor.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

