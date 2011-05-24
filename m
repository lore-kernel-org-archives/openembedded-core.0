Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jpuhlman@mvista.com>) id 1QOxjB-0002Yk-20
	for openembedded-core@lists.openembedded.org;
	Tue, 24 May 2011 21:57:17 +0200
Received: by pzk36 with SMTP id 36so3207203pzk.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2011 12:54:14 -0700 (PDT)
Received: by 10.68.35.102 with SMTP id g6mr2835778pbj.16.1306266854709;
	Tue, 24 May 2011 12:54:14 -0700 (PDT)
Received: from [192.168.1.64] (c-67-187-204-11.hsd1.ca.comcast.net
	[67.187.204.11])
	by mx.google.com with ESMTPS id h7sm5186756pbg.74.2011.05.24.12.54.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 24 May 2011 12:54:13 -0700 (PDT)
Message-ID: <4DDC0CE1.6030604@mvista.com>
Date: Tue, 24 May 2011 12:54:09 -0700
From: Jeremy Puhlman <jpuhlman@mvista.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.17) Gecko/20110414 Lightning/1.0b2 Thunderbird/3.1.10
	ThunderBrowse/3.3.5
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1306245860-12820-1-git-send-email-koen@dominion.thruhere.net>	<1306246595.3424.932.camel@rex>	<1306249385.2525.203.camel@phil-desktop>	<1306249675.3424.936.camel@rex>	<1306250123.2525.205.camel@phil-desktop>
	<1306250696.3424.937.camel@rex>
In-Reply-To: <1306250696.3424.937.camel@rex>
X-Enigmail-Version: 1.1.1
Subject: Re: [RFC][PATCH] bitbake.conf: make OVERRIDES match what people expect
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
X-List-Received-Date: Tue, 24 May 2011 19:57:17 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

>> Ah, I see.  I must admit that I wouldn't have guessed that from the
>> name.
>>
>> Maybe we should just delete both _local and _forcevariable from the
>> default OVERRIDES on the basis that nothing in the metadata (as
>> distributed) uses either of them.  Anybody who wants to make use of them
>> from local.conf or whereever can always add them back to OVERRIDES in
>> the same place.
> 
> I'm ok with that, it can also be done by the distro...

In my experiance when dealing with disperate groups of layers, having an
override that will always work(ala old _local) was useful for helping
others do custom work. Its obviously something you really wouldn't want
stuck in to any actual provided meta data, but the end user should be
able to always be able to shoot them selves in the foot, if they really
really want to.

OTOH leaving it it up to the distro's to add back in is fine.



