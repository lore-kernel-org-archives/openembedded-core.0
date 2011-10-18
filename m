Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1RGCuu-0002H4-MU
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Oct 2011 18:53:28 +0200
Received: from mail-wy0-f180.google.com ([74.125.82.180])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 18 Oct 2011 09:47:33 -0700
Received: by wyg24 with SMTP id 24so795650wyg.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Oct 2011 09:47:32 -0700 (PDT)
Received: by 10.216.51.77 with SMTP id a55mr5879876wec.5.1318956451732;
	Tue, 18 Oct 2011 09:47:31 -0700 (PDT)
Received: from [10.6.18.230] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id 11sm4550597wby.15.2011.10.18.09.47.22
	(version=SSLv3 cipher=OTHER); Tue, 18 Oct 2011 09:47:24 -0700 (PDT)
Message-ID: <4E9DAD99.9080508@intel.com>
Date: Tue, 18 Oct 2011 09:47:21 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <bb4834366391a733cbb331a52cae44f295bda2a1.1318901607.git.raj.khem@gmail.com>
	<32b67c2bc8ebfcbf0db650e93a2152399ca89ee7.1318901607.git.raj.khem@gmail.com>
	<7B75FA82-846A-4B85-872E-0B611C41C11D@dominion.thruhere.net>
In-Reply-To: <7B75FA82-846A-4B85-872E-0B611C41C11D@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH 3/3] gcc-4.6: Backport PR46934 fix
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
X-List-Received-Date: Tue, 18 Oct 2011 16:53:28 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/18/2011 07:18 AM, Koen Kooi wrote:
>
> Op 18 okt. 2011, om 03:39 heeft Khem Raj het volgende geschreven:
>
>> We have been hitting this issue on ARM/thumb and
>> have a workaround in place to compile samba
>> http://git.openembedded.org/openembedded/commit/recipes/samba/samba_3.2.15.bb?id=4ba7aa07c0dcd28f94515ff9927e2a04403fcf15
>> This backport should fix the gcc bug
>
> Can I have a rough ETA when this is going into master? There are meta-oe patches depending on this. No rush, this is just to order my patch queue more intelligently :)
>
Koen,

We are working on it, I am doing builds with these changes to day and 
will submit a consolidated pull for tonight and if all goes well RP will 
pull tomorrow.

Sau!


> regards,
>
> Koen
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



