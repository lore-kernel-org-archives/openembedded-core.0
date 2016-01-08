Return-Path: <mike.looijmans@topicproducts.com>
Received: from mx18-05.smtp.antispamcloud.com (mx18-05.smtp.antispamcloud.com
	[207.244.64.174])
	by mail.openembedded.org (Postfix) with ESMTP id 5F9AD6011A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 08:12:12 +0000 (UTC)
Received: from 100-208.ftth.onsbrabantnet.nl ([88.159.208.100]
	helo=TOP-EX01.TOPIC.LOCAL)
	by mx18.antispamcloud.com with esmtps (TLSv1:AES256-SHA:256)
	(Exim 4.85) (envelope-from <mike.looijmans@topicproducts.com>)
	id 1aHS9U-0007st-9J; Fri, 08 Jan 2016 09:12:10 +0100
Received: from [192.168.80.121] (192.168.80.121) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Fri, 8 Jan 2016 09:10:08 +0100
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <568533E5.4000105@topic.nl> <56856023.5060407@linux.intel.com>
	<5686447F.60200@topic.nl>
	<3915097.5a95lnvstk@peggleto-mobl.ger.corp.intel.com>
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
Message-ID: <568F6F51.2070202@topic.nl>
Date: Fri, 8 Jan 2016 09:12:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <3915097.5a95lnvstk@peggleto-mobl.ger.corp.intel.com>
X-Originating-IP: [192.168.80.121]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
X-Filter-ID: s0sct1PQhAABKnZB5plbIbbvfIHzQjPVmPLZeVYSu3xU9luQrU+8/8qthi+0Jd/W6KAUC/fjyuDn
	NXFr4uarw2qn2YSnBaxCIAHbc091Tc1/63A71K+jqMokMNyfk/ad6zUhnDUpwAEsjGnc8y38ChhW
	DHFYc6XC0Haiqey5b0Mem3nkaZsJp+9zNJIzCkmTMs/L10cDkLpTnn4qczTRAC4BK799vJr3bhfJ
	JhehJC5yS6irc4Pfrx/aFNaH02YdU8iFIPlc8f1HTiACu5l1DAfDCCWOXlUijDOKoAq8J0T0tO3h
	fZqLLPuQ0Ed+uLMsGDC3kF8ZXhPGdVxTxwkEMjwJWw42swm4bO6gacpMpzIii8Xv40r+ydGsvmSk
	Z2dUIETfjFEMPxfeLu9itVZPlskrBivLik0C/5j+2aD/dtsoCWafhBjRdrnDmZHbf9aZNHShThNw
	X2RE8NuebgaaWJJY168q7fj/KrwEcYTsFAlbg0BHSpuuXE1G31mgwJ8utJVcNrFf4GaM5Eg5slNO
	Y9Bn7wwWiF4fKf3El2Vzy4sbZ4eu78HN+DBOKbGFnL+eL/47yVl5eG2UlH96Ca2Z5eXZ1NwaH8s+
	+NwTjgL86dGZ3JKVmi72ocgY5kMQSjs7FFVsAK5UGDMxktSe5pVTep+HnovJHKa3FPVAgLfLmOlK
	uuiujdeaYuCrbje0rfiQXXP/PhacSgLwLXdxYAFaWMx5HwExkKyxLBs/0mpa5PjonV+E7OMXRvgt
	dyMlnmWikSEWVJT5CK7gfU5ZxgDhkY3CAn2kPTzYgaBk0GEI8wY5rCjLITelXZYo5eupLLn570FT
	8anALod3TcnFNHZ7jg==
X-Report-Abuse-To: spam@mx99.antispamcloud.com
X-Filter-Fingerprint: IFrWXGses7OKB5S5G8/dJUb3OPwsHaH0Fvg5oXltHd/JUWjZ8+qhjyB23tbDuyLOYL8Ff78gYsez
	4Rl08xudmXi4esCQ0R1MchVjt7wblGlvhFgW0MjUMRkF5sMCDfftTXNFDzN17hnrWeZYOJvLq0Ic
	WjZ+XcEjj/7Pkld0zkmvziDInX9WdMov2kn2yXjdwv61T+KDYyYtREgszdyFwv8IxCB3p/oCKvxr
	eyISh3JGb7OS5oVgiO+kDxZrVPLz3MmEGC2PrUKqLq5WmHK+Nw==
X-Originating-IP: 88.159.208.100
X-Spampanel-Domain: topic.nl
X-Spampanel-Username: 88.159.208.100
Authentication-Results: antispamcloud.com;
	auth=pass smtp.auth=88.159.208.100@topic.nl
X-Spampanel-Outgoing-Class: ham
X-Spampanel-Outgoing-Evidence: Combined (0.00)
X-Recommended-Action: accept
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Getting "menuconfig" to work again?
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
X-List-Received-Date: Fri, 08 Jan 2016 08:12:16 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 01-01-16 18:58, Paul Eggleton wrote:
> Hi Mike,
>
> On Fri, 01 Jan 2016 10:18:55 Mike Looijmans wrote:
>> On 31-12-15 18:04, Leonardo Sandoval wrote:
>>> On 12/31/2015 07:58 AM, Mike Looijmans wrote:
>>>> On 31-12-15 14:55, Mike Looijmans wrote:
>>>>> When running a "menuconfig" (or any other task that needs a terminal)=
,
>>>>> bitbake just "stops" and doesn't show any terminal.
>>>>>
>>>>> I'm using the current master branch of everything, on Ubuntu 15.
>>>>>
>>>>> When running with "-D" I can see the following log:
>>>>>
>>>>> DEBUG: Executing task do_menuconfig
>>>>> DEBUG: Attempting to spawn terminal "custom"
>>>>> DEBUG: No custom terminal (OE_TERMINAL_CUSTOMCMD) set
>>>>> DEBUG: Attempting to spawn terminal "tmux-running"
>>>>> DEBUG: Attempting to spawn terminal "tmux-new-window"
>>>>> DEBUG: Attempting to spawn terminal "gnome"
>>>>>
>>>>> But nothing happens from that point.
>>>>
>>>> Extra info: apparently it spawns a process:
>>>>
>>>> /usr/bin/python3 /usr/bin/gnome-terminal --version
>>>
>>> gnome-terminal is a pain... there are some checks base on the version
>>> and based on that certain parameters are set. which g-t version are you
>>> using?
>>
>> $ gnome-terminal --version
>> GNOME Terminal 3.14.2
>>
>>>> If I kill that process, the menuconfig magically appears.
>>
>> Digging into the source code, I saw that "gnome-terminal --version" is
>> only being called to determine if the "--disable-factory" option should
>> be passed to it. For some reason, in OE that call "hangs", I suspect
>> because of the way the environment and pipes are laid out at that point.
>>
>> If I just run 'gnome-terminal -t hello --disable-factory -x sh' I don't
>> get any errors and it works just fine. To me it looks like the whole
>> version check could be removed and always pass "--disable-factory".
>
> Unfortunately that's what we did earlier and it was fine until gnome-term=
inal
> stopped accepting that option. Perhaps it's now a no-op in the version yo=
u're
> using, I'm not sure; but in 3.10 they made it trigger an error.

Nice... For me simply removing the "version" part fixed the problem. A simp=
le=20
"try and ask forgiveness" patch wasn't as simple as I thought, the actual=20
terminal command execution is being done elsewhere.

On newer Ubuntus, the "--version" just hangs, probably waiting for terminal=
=20
input or something silly like that.

For now, I'd say removing the version check would be better - if you happen=
 to=20
have that bad 3.10 version, you get a nice error message. That's a lot easi=
er=20
to diagnose than a hangup.

> It ought not to be too hard to fix the hanging - hopefully someone with a=
 GNOME
> desktop installed (not me) can figure out what's happening there.

To be quite honest, I don't know what desktop I'm running. I just run whate=
ver=20
was default with Ubuntu, so that might be Gnome...




Kind regards,

Mike Looijmans
System Expert

TOPIC Embedded Products
Eindhovenseweg 32-C, NL-5683 KH Best
Postbus 440, NL-5680 AK Best
Telefoon: +31 (0) 499 33 69 79
E-mail: mike.looijmans@topicproducts.com
Website: www.topicproducts.com

Please consider the environment before printing this e-mail






