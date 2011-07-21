Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Qjykg-0006Ea-H9
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Jul 2011 21:17:42 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1QjyRO-0001zv-5s from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Jul 2011 11:57:46 -0700
Received: from SVR-ORW-FEM-04.mgc.mentorg.com ([147.34.97.41]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Thu, 21 Jul 2011 11:55:27 -0700
Received: from [172.30.80.89] (147.34.91.1) by svr-orw-fem-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.1.289.1;
	Thu, 21 Jul 2011 11:57:45 -0700
Message-ID: <4E2876A4.8060305@mentor.com>
Date: Thu, 21 Jul 2011 11:57:40 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Lightning/1.0b2 Thunderbird/3.1.11
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1311234475.git.sgw@linux.intel.com>	<fc7ecf3f3b90f6949e790f18eeea908d069282d5.1311234475.git.sgw@linux.intel.com>
	<CAMKF1spf5Q2-fFL6=dGEjG+2Xrovujf9EXV70R5eZ4A9NDZUcw@mail.gmail.com>
In-Reply-To: <CAMKF1spf5Q2-fFL6=dGEjG+2Xrovujf9EXV70R5eZ4A9NDZUcw@mail.gmail.com>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 21 Jul 2011 18:55:27.0061 (UTC)
	FILETIME=[C1210850:01CC47D7]
Subject: Re: [CONSOLIDATED PULL 14/20] Make intltool use perlnative instead of perl on host
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
X-List-Received-Date: Thu, 21 Jul 2011 19:17:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On 07/21/2011 11:47 AM, Khem Raj wrote:
> On Thu, Jul 21, 2011 at 12:53 AM, Saul Wold <sgw@linux.intel.com> wrote:
>>
>> -inherit autotools pkgconfig
>> +inherit autotools pkgconfig perlnative
>>
>>  export PERL_virtclass-native = "/usr/bin/env perl"
> 
> is the above line still needed

It's actively wrong now and needs to be /usr/bin/env nativeperl (which
is a wrapper script to get to perl-native/perl).

-- 
Tom Rini
Mentor Graphics Corporation


