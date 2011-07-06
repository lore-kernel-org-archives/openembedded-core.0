Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QeWMG-0007vI-Vf
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Jul 2011 19:57:57 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1QeWIZ-0005Df-3t from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Jul 2011 10:54:07 -0700
Received: from SVR-ORW-FEM-04.mgc.mentorg.com ([147.34.97.41]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 6 Jul 2011 10:53:03 -0700
Received: from [172.30.80.250] (147.34.91.1) by svr-orw-fem-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.1.289.1;
	Wed, 6 Jul 2011 10:54:05 -0700
Message-ID: <4E14A132.9090003@mentor.com>
Date: Wed, 6 Jul 2011 10:53:54 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1309453832.7987.33.camel@desktop.home>	<1309472051.20015.465.camel@rex>	<BANLkTimzg79tkU+=-AgwgYhJSC52jJVT6Q@mail.gmail.com>	<1299A20C-0494-4434-84C4-E1503FAE0CFC@dominion.thruhere.net>	<BANLkTimqAhtqPWbhvnA4KdzYO2oJw63bvQ@mail.gmail.com>
	<57C7DA2B-0811-40F1-AACA-9F710955A4D1@dominion.thruhere.net>
In-Reply-To: <57C7DA2B-0811-40F1-AACA-9F710955A4D1@dominion.thruhere.net>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 06 Jul 2011 17:53:03.0874 (UTC)
	FILETIME=[8DD1C620:01CC3C05]
Subject: Re: Proposal: recipe feature switches
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
X-List-Received-Date: Wed, 06 Jul 2011 17:57:57 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 07/01/2011 02:41 AM, Koen Kooi wrote:
> 
> Op 1 jul 2011, om 11:26 heeft Frans Meulenbroeks het volgende geschreven:
> 
>>
>>
>> 2011/7/1 Koen Kooi <koen@dominion.thruhere.net>
>>
>> Op 1 jul 2011, om 10:55 heeft Frans Meulenbroeks het volgende geschreven:
>>
>>>
>>> Good idea.
>>> Personally I'd like to also bring footprint into the equation. If a feature drags in lots of additional packages, it is interesting to make it configurable.
>>> My favourite example: bluez dragging in all kind of rendering stuff (through DEPENDS) even though the hardware functionality might not be there (e.g. you have BT but not audio).
>>
>> Which is a great example, since that doesn't impact footprint at all, it's an alsa *plugin* that will get produced.
>>
>>
>> bluez.inc:DEPENDS = "gstreamer gst-plugins-base dbus glib-2.0"
>>
>> I don't think gstreamer is really needed or desired if you e.g. just want to do some tethering over bluetooth, or in my case, connect to a BT HID, and they do contribute to both the build time and the footprint.
> 
> Again, a plugin, so no footprint issues.

I disagree.  I care about the footprint of sstate/packaged-staging
files.  And build time is still a concern without
sstate/packaged-staging being used/found.

-- 
Tom Rini
Mentor Graphics Corporation


