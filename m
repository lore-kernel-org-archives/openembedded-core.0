Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1Ro0DI-0001Dn-78
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jan 2012 23:12:08 +0100
Received: by eaah1 with SMTP id h1so138637eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2012 14:04:28 -0800 (PST)
Received: by 10.213.22.129 with SMTP id n1mr6253909ebb.12.1327010668254;
	Thu, 19 Jan 2012 14:04:28 -0800 (PST)
Received: from [192.168.1.2] ([79.117.107.69])
	by mx.google.com with ESMTPS id u53sm3050677eeu.6.2012.01.19.14.04.26
	(version=SSLv3 cipher=OTHER); Thu, 19 Jan 2012 14:04:26 -0800 (PST)
Message-ID: <4F18936A.8050903@gherzan.ro>
Date: Fri, 20 Jan 2012 00:04:26 +0200
From: Andrei Gherzan <andrei@gherzan.ro>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:8.0) Gecko/20111124 Thunderbird/8.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1326964778.git.sgw@linux.intel.com>
	<5ab12509051b732944a5027750505fa860133f1b.1326964778.git.sgw@linux.intel.com>
	<1A94A9A8-8B34-4B8F-AAB4-98C172E584E5@dominion.thruhere.net>
In-Reply-To: <1A94A9A8-8B34-4B8F-AAB4-98C172E584E5@dominion.thruhere.net>
Subject: Re: [CONSOLIDATED PULL 02/33] busybox: defconfig modified in order to activate CONFIG_EXPR_MATH_SUPPORT_64
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
X-List-Received-Date: Thu, 19 Jan 2012 22:12:08 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/19/2012 12:29 PM, Koen Kooi wrote:
> Op 19 jan. 2012, om 10:22 heeft Saul Wold het volgende geschreven:
>
>> From: Andrei Gherzan<andrei.gherzan@windriver.com>
>>
>> Enable 64-bit math support in the expr applet. This will make
>> the applet slightly larger, but will allow computation with very
>> large numbers.
> So it finally supports yocto now?
>
> ___________________
Yes. Saul merged this commit.
> ____________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


