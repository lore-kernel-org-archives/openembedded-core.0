Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1ROEjA-0000s8-R6
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Nov 2011 21:26:33 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 09 Nov 2011 12:20:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,485,1315206000"; d="scan'208";a="83075541"
Received: from unknown (HELO [10.255.12.15]) ([10.255.12.15])
	by fmsmga001.fm.intel.com with ESMTP; 09 Nov 2011 12:20:15 -0800
Message-ID: <4EBAE07F.2060905@linux.intel.com>
Date: Wed, 09 Nov 2011 12:20:15 -0800
From: Joshua Lock <josh@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0.1) Gecko/20110930 Thunderbird/7.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1320799787.git.josh@linux.intel.com>
	<dd949a69e2e7c9379caf5bb6162259c4f2584ea5.1320799787.git.josh@linux.intel.com>
	<8EF5D367-6159-471F-8F2C-F3FA3216F05D@dominion.thruhere.net>
	<1320831447.10843.131.camel@ted>
	<0A7ED8DD-40A2-4E01-90A1-B2BB9849E500@dominion.thruhere.net>
	<1320834947.10843.161.camel@ted>
	<215EB605-E036-4165-9C8B-0506C6E9E8C5@dominion.thruhere.net>
In-Reply-To: <215EB605-E036-4165-9C8B-0506C6E9E8C5@dominion.thruhere.net>
Subject: Re: [PATCH 2/3] classes/[gnome|gnomebase|mime]: enhance gnome related classes
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
X-List-Received-Date: Wed, 09 Nov 2011 20:26:33 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 09/11/11 03:18, Koen Kooi wrote:
> 
> Op 9 nov. 2011, om 11:35 heeft Richard Purdie het volgende geschreven:
> 
>> On Wed, 2011-11-09 at 11:27 +0100, Koen Kooi wrote:
>>> Op 9 nov. 2011, om 10:37 heeft Richard Purdie het volgende geschreven:
>>>
>>>> On Wed, 2011-11-09 at 10:27 +0100, Koen Kooi wrote:
>>>>> Op 9 nov. 2011, om 01:53 heeft Joshua Lock het volgende geschreven:
>>>>>
>>>>>> This patch pulls in the gnome related classes from oe-core which
>>>>>> adds extra packaging rules and functionality whilst modularising things
>>>>>> so that one can get a subset of gnome functionality without adding a lot
>>>>>> of extra dependencies.
>>>>>>
>>>>>> These aren't an exact copy of the classes from meta-openembedded, notable
>>>>>> differences are:
>>>>>> * gnome.bbclass - I dropped the BBCLASSEXTEND
>>>>>
>>>>> It looks that will break a number of things in meta-oe, why was it dropped?
>>>>
>>>> Unconditionally BBCLASSEXTENDing everything gnome is a great way to hack
>>>> around build issues and create a convoluted dependency mess that isn't
>>>> really required. I'd much rather we try and minimise the amount of
>>>> -native dependencies to those actually needed.
>>>>
>>>> Comparing our builds against other systems its becoming clear our
>>>> convoluted dependency trees are one of the areas we don't do as well and
>>>> it hurts performance :(.
>>>
>>> The list of -native needed in meta-gnome:
>>>
>>> bison-native
>>> cairo-native
>>> docbook-utils-native
>>> flex-native
>>> gconf-native
>>> gdk-pixbuf-native
>>> glib-2.0-native
>>> gnome-doc-utils-native
>>> gobject-introspection-native
>>> gtk-doc-native
>>> icon-naming-utils-native
>>> intltool-native
>>> libffi-native
>>> libidl-native
>>> libxml-parser-perl-native
>>> orbit2-native
>>> pango-native
>>> perl-native
>>> popt-native
>>> python-native
>>
>> Many of which are not gnome bbclass derived recipes. I therefore think
>> it makes sense to put the BBCLASSEXTEND in the recipes where its needed
>> and not the core class...
> 
> Exactly! I did a lot of dependency cleanup when importing them, so the situation isn't as bad as it was in OE classic.
> 
> Josh, what kind of test builds did you do for the meta-gnome recipes after moving the classes?
> 

I'm sorry to say almost zero.

Joshua
-- 
Joshua Lock
        Yocto Project "Johannes factotum"
        Intel Open Source Technology Centre


