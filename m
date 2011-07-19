Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QjBju-0002fK-3a
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jul 2011 16:57:38 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1QjB7j-0002hQ-8X from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jul 2011 07:18:11 -0700
Received: from SVR-ORW-FEM-02.mgc.mentorg.com ([147.34.96.206]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Tue, 19 Jul 2011 07:18:10 -0700
Received: from [172.30.80.89] (147.34.91.1) by svr-orw-fem-02.mgc.mentorg.com
	(147.34.96.168) with Microsoft SMTP Server id 14.1.289.1;
	Tue, 19 Jul 2011 07:18:09 -0700
Message-ID: <4E259221.3000502@mentor.com>
Date: Tue, 19 Jul 2011 07:18:09 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Lightning/1.0b2 Thunderbird/3.1.11
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1310758615.git.tom_rini@mentor.com>	<c7276dd332ad9e38935443d679c0296a032a511c.1310758615.git.tom_rini@mentor.com>	<1310770123.20015.1259.camel@rex>
	<4E20C4E0.2030908@mentor.com>	<4E24AFF0.9060408@mentor.com>
	<1311077841.30326.28.camel@phil-desktop>
In-Reply-To: <1311077841.30326.28.camel@phil-desktop>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 19 Jul 2011 14:18:10.0986 (UTC)
	FILETIME=[B06DF0A0:01CC461E]
Subject: Re: [PATCH 3/5] help2man-native: Add 1.36.4 (GPLv2) and 1.38.2 (GPLv3)
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
X-List-Received-Date: Tue, 19 Jul 2011 14:57:38 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 07/19/2011 05:17 AM, Phil Blundell wrote:
> On Mon, 2011-07-18 at 15:13 -0700, Tom Rini wrote:
>> OK, here's a "why" on not changing:
>> | configure.in:4: error: possibly undefined macro: AC_PROG_PERL
>> |       If this token and others are legitimate, please use
>> m4_pattern_allow.
>> |       See the Autoconf documentation.
>> | configure.in:7: error: possibly undefined macro: AC_PERL_MODULE
>>
>> Which if we fix by building vs perlnative we then need autotools.bbclass
>> to inherit perlnative to make life reliable which isn't what you want
>> wrt perl-native in the build chain :)
> 
> How about fixing it by installing those two macros into ${S} before
> running aclocal?  You could do that just as a patch, I guess.

It feels like overkill just to make a perl program.  Assuming
sstate-help2man-native-x86_64-linux-1.38.2-r2-x86_64-2-<signature>_populate-sysroot.tgz
is the right file to peek at, it's just help2man and a man page.

-- 
Tom Rini
Mentor Graphics Corporation


