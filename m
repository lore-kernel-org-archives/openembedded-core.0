Return-Path: <openembedded-core@emagii.com>
Received: from smtprelay-b32.telenor.se (smtprelay-b32.telenor.se
	[213.150.131.21])
	by mail.openembedded.org (Postfix) with ESMTP id 506986D6F4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2013 21:39:40 +0000 (UTC)
Received: from ipb4.telenor.se (ipb4.telenor.se [195.54.127.167])
	by smtprelay-b32.telenor.se (Postfix) with ESMTP id D590FEAD77
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2013 22:39:39 +0100 (CET)
X-SENDER-IP: [83.227.57.102]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AoAaAEorjVJT4zlmPGdsb2JhbAANTIM/vk2BMAMBAQEBOIJbAQEBAwECNUARCyEWDwkDAgECARYbFBMIAQGIAgiuZZIEEwSPchaEHAOVQ4JPlTY
X-IronPort-AV: E=Sophos;i="4.93,739,1378850400"; d="scan'208";a="358303642"
Received: from c-6639e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.236]) ([83.227.57.102])
	by ipb4.telenor.se with ESMTP; 20 Nov 2013 22:39:39 +0100
Message-ID: <528D2C1B.3050200@emagii.com>
Date: Wed, 20 Nov 2013 22:39:39 +0100
From: Ulf Samuelsson <openembedded-core@emagii.com>
Organization: eMagii
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1578881.eGB3JKVbzz@helios>
In-Reply-To: <1578881.eGB3JKVbzz@helios>
Subject: Re: FOSDEM 2014 Embedded dev room CFP
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: ulf@emagii.com
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Nov 2013 21:39:40 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

2013-11-07 11:11, Paul Eggleton skrev:
> Hi all,
>
> I didn't notice if it was already announced here, but the CFP for the FOSDEM
> Embedded dev room in 2014 is open:
>
> https://lists.fosdem.org/pipermail/fosdem/2013-October/001870.html
>
> It would be great to have some folks give OpenEmbedded/Yocto Project-related
> presentation(s) this year - we usually manage at least one for FOSDEM. It
> could be about a new feature you've worked on, a success story, a proposal for
> a new direction, a related project etc.
>
> Cheers,
> Paul
>

Working on this cool "Internet of Things" for a customer based on 
BeagleBone/Angstrom

The BeagleBone USB host is connected to a USB/ISM band Radio.
This allows wireless communications with a number of sensors.
Some fixed, some handheld. If you have a handheld sensor,
you approach the server, and "log in".
You can then wander around outside the RF range and do measurements
and then return to hand over the measured data to the server.

The server is also connected to "the cloud" over Ethernet/Wi-Fi.

The server gets its configuration (list of sensors) from the cloud, and
when the sensors report in, the sensor data is uploaded to the cloud.

Runs as a systemd service.

A user can then look at the sensor data through a browser,
or through an app on a phone or on a tablet.

The device can be monitored remotedly, since it logs stuff over UDP.
Have created a small UDP application which receives data
and prints it out. The native application sends escape sequences
allowing color coding of log data.

The UDP logging window is running natively on the Beaglebone screen
so you can see the sensors sending data, and you can see when
the server communicates with the cloud.

One minute later, the temperature data is visible on my iPad.
- Got my Galaxy Tab stolen last year at FOSDEM :-(

The only issue, is that the application, written in C++,  is proprietary.
It was originally written in C# for XP Embedded.

A number of C++ classes has been developed for the application,
and I asked and got approval to release any C++ class which
can be considered to be generic as open-source,
maybe with the boost license or the MIT license.
Then they can be used by other projects without license issues.

Thinking of a title:

Proprietary application, still benefiting open source.

What do you guys think?

Would it be appropriate to show it in the OE stand?

-- 
Best Regards
Ulf Samuelsson
eMagii


