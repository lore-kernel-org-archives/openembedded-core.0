Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QRsZ4-0000Zz-Ny
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 23:02:55 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1QRsVt-00015f-Jn from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 13:59:37 -0700
Received: from SVR-ORW-FEM-04.mgc.mentorg.com ([147.34.97.41]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Wed, 1 Jun 2011 13:59:37 -0700
Received: from [172.30.80.84] (147.34.91.1) by svr-orw-fem-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.1.270.1;
	Wed, 1 Jun 2011 13:59:37 -0700
Message-ID: <4DE6A836.3040004@mentor.com>
Date: Wed, 1 Jun 2011 13:59:34 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1306931844.git.dexuan.cui@intel.com>	<4DE67440.1020405@mentor.com>
	<1306950977.27470.461.camel@rex>	<4DE69582.2090508@mentor.com>	<1306958729.3119.3.camel@lenovo.internal.reciva.com>	<4DE6A43A.3050401@mentor.com>
	<1306961135.3119.13.camel@lenovo.internal.reciva.com>
In-Reply-To: <1306961135.3119.13.camel@lenovo.internal.reciva.com>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 01 Jun 2011 20:59:37.0437 (UTC)
	FILETIME=[D13EB0D0:01CC209E]
Subject: Re: [RFC v1 PATCH 00/16] populate perl-native into its own	directory
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
X-List-Received-Date: Wed, 01 Jun 2011 21:02:55 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 06/01/2011 01:45 PM, Phil Blundell wrote:
> On Wed, 2011-06-01 at 13:42 -0700, Tom Rini wrote:
>> What falls down in this case is that  once
>> perl-native is built (and in our PATH), if it's a different version than
>> system-wide perl, stuff starts failing on version mis-match.
> 
> I think that's the bit that I'm not properly understanding.  Which
> versions are mismatching, exactly?  
> 
> Surely the local perl from the sysroot ought to be completely
> self-contained and shouldn't be using any bits from the host perl
> install at that point.

So this jogs my memory a bit!  It's not so much perl itself but stuff
that uses perl that can get dirty and then no, you have stuff thats
built for system perl and stuff that's built with perl-native clashing.

Relying even more on memory, I think help2man was one of the "easy"
culprits and since we also modify the env, we do things like have
help2man run with PERL5LIB and so on pointing system-wide perl at
perl-native's lib directory and so forth.

-- 
Tom Rini
Mentor Graphics Corporation


