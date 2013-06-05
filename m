Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 150966A598
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jun 2013 16:46:50 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 05 Jun 2013 09:44:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,808,1363158000"; d="scan'208";a="345269021"
Received: from unknown (HELO [10.255.13.19]) ([10.255.13.19])
	by fmsmga001.fm.intel.com with ESMTP; 05 Jun 2013 09:47:10 -0700
Message-ID: <51AF6B79.3040506@linux.intel.com>
Date: Wed, 05 Jun 2013 09:46:49 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <1370422910-24366-1-git-send-email-net147@gmail.com>
	<20130605093056.GD30727@jama>
In-Reply-To: <20130605093056.GD30727@jama>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] qmake2.bbclass: export OE_QMAKE_QT_CONFIG
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
X-List-Received-Date: Wed, 05 Jun 2013 16:46:50 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/05/2013 02:30 AM, Martin Jansa wrote:
> On Wed, Jun 05, 2013 at 07:01:50PM +1000, Jonathan Liu wrote:
>> qconfig.pri was not being loaded by qmake properly. This means Qt
>> qmake projects are unable to query QT_ARCH, QT_VERSION and other
>> variables defined in qconfig.pri.
>>
>> Export OE_QMAKE_QT_CONFIG, setting it to the location of qconfig.pri
>> so that it can be located by qmake.
>
> There is such patch already:
> http://lists.openembedded.org/pipermail/openembedded-core/2013-May/078314.html
>
Got lost in my queue, adding it for the next MUT.

Sau!


>>
>> Signed-off-by: Jonathan Liu <net147@gmail.com>
>> ---
>>   meta/classes/qmake2.bbclass | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/classes/qmake2.bbclass b/meta/classes/qmake2.bbclass
>> index 5eebd8e..ca6b0f0 100644
>> --- a/meta/classes/qmake2.bbclass
>> +++ b/meta/classes/qmake2.bbclass
>> @@ -22,3 +22,4 @@ export OE_QMAKE_LIBS_X11 = "-lXext -lX11 -lm"
>>   export OE_QMAKE_LIBS_X11SM = "-lSM -lICE"
>>   export OE_QMAKE_LRELEASE = "${STAGING_BINDIR_NATIVE}/lrelease4"
>>   export OE_QMAKE_LUPDATE = "${STAGING_BINDIR_NATIVE}/lupdate4"
>> +export OE_QMAKE_QT_CONFIG = "${STAGING_DATADIR}/qt4/mkspecs/qconfig.pri"
>> --
>> 1.8.2.3
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

