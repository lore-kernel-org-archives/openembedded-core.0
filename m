Return-Path: <ajlennon@dynamicdevices.co.uk>
X-Greylist: delayed 582 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 09 May 2017 08:55:10 UTC
Received: from www.dynamicdevices.co.uk (www.dynamicdevices.co.uk
	[89.200.136.37])
	by mail.openembedded.org (Postfix) with ESMTP id 6859471AB4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 May 2017 08:55:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by www.dynamicdevices.co.uk (Postfix) with ESMTP id 5008227F18E;
	Tue,  9 May 2017 08:45:27 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at lennoab2.miniserver.com
Received: from www.dynamicdevices.co.uk ([127.0.0.1])
	by localhost (www.dynamicdevices.co.uk [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id kOK9DDgwOGU1; Tue,  9 May 2017 08:44:32 +0000 (UTC)
Received: from [192.168.0.12]
	(cpc111193-live30-2-0-cust656.17-2.cable.virginm.net [92.232.58.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by www.dynamicdevices.co.uk (Postfix) with ESMTPSA id 58A6527F188;
	Tue,  9 May 2017 08:44:30 +0000 (UTC)
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>
References: <1494240698452.53619@mentor.com>
	<CAHiDW_GPTu0WcuNd143TaBsD=8hiv6SPowWHcBF_0h8DG1x+fw@mail.gmail.com>
	<16a6f453-9856-36c0-e160-036d23e98111@linux.intel.com>
	<19161543.bPvO6Cp06Y@peggleto-mobl.ger.corp.intel.com>
	<be95c443-df9a-2c9a-394b-4b02c8710fdc@linux.intel.com>
From: Alex J Lennon <ajlennon@dynamicdevices.co.uk>
Message-ID: <931ee9bc-a5cb-fcc2-278b-20a07731524d@dynamicdevices.co.uk>
Date: Tue, 9 May 2017 09:44:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <be95c443-df9a-2c9a-394b-4b02c8710fdc@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: GUI based images
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
X-List-Received-Date: Tue, 09 May 2017 08:55:10 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 09/05/17 09:05, Alexander Kanavin wrote:
> On 05/09/2017 01:15 AM, Paul Eggleton wrote:
>>> LXDE in particular is Gtk2 based, it's no longer being developed, and
>>> has been superseded by LXQt. So it's a non-starter (and so is LXQt,
>>> which should be clear from its name :).
>>
>> FWIW I think this is a little short-sighted. Why are we ruling out Qt 
>> exactly?
>
> We would first have to agree that Qt5 belongs in oe-core with 
> appropriate level of maintenance and QA, and that it's okay to add 
> half an hour or more to the building time of a standard GUI image.
>
> From the screenshots of LxQT, it looks like yet another Win95 clone 
> meant strictly for desktop use that would certainly scale poorly to 
> small resolution screens. Who would be the target audience for it in 
> the embedded space? For the purposes of 'engineering UI', Sato is 
> fine, and we don't need something else.
>
> Alex

fwiw. I would love to be able to develop devices like those pictured 
below, which I believe are based on Qt for Device Creation.

https://d33sqmjvzgs8hq.cloudfront.net/wp-content/uploads/2014/08/devices.png

ref: https://www.qt.io/qt-for-device-creation/

Cheers,

Alex


