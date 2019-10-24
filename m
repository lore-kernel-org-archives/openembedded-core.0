Return-Path: <stefan@herbrechtsmeier.net>
Received: from dd41138.kasserver.com (dd41138.kasserver.com [85.13.157.12])
	by mail.openembedded.org (Postfix) with ESMTP id 6DC4C7F9A0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2019 17:45:00 +0000 (UTC)
Received: from [192.168.178.37] (unknown [94.134.94.146])
	by dd41138.kasserver.com (Postfix) with ESMTPSA id E43B811A0046;
	Thu, 24 Oct 2019 19:45:00 +0200 (CEST)
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <20191022090353.21151-1-jean-marie.lemetayer@savoirfairelinux.com>
	<8e660284b1ece9e66eb47747213e8faafdd99655.camel@linuxfoundation.org>
	<5290bb1a-4cc8-4ed9-8f33-3c8994f06f22@herbrechtsmeier.net>
	<CANNYZj99FATCkw+6V088NkTWm3DEUAcoZaP+XBUR0xZnGeeQdw@mail.gmail.com>
	<22cbc060-0f73-4354-1edb-ca90dbed4d73@herbrechtsmeier.net>
	<CANNYZj9L7O9a9RfyXpQP7kY2X_HNt5P9yJQCmUONeZq1rWDKwQ@mail.gmail.com>
	<541b19fa-54c4-42ce-0367-27ddd403d34f@herbrechtsmeier.net>
	<CANNYZj80r-WGgREdj=2TYC-uPNpTnWEL3mfZLtG53z-XR71bOQ@mail.gmail.com>
From: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
Message-ID: <24e39481-ea5c-06e9-6dbb-139a5d0dd445@herbrechtsmeier.net>
Date: Thu, 24 Oct 2019 19:44:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CANNYZj80r-WGgREdj=2TYC-uPNpTnWEL3mfZLtG53z-XR71bOQ@mail.gmail.com>
Cc: "Paul Eggleton \(paul.eggleton@linux.intel.com\)"
	<paul.eggleton@linux.intel.com>, rennes@savoirfairelinux.com,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH 0/6] NPM refactoring
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
X-List-Received-Date: Thu, 24 Oct 2019 17:45:00 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Am 24.10.19 um 16:22 schrieb Alexander Kanavin:
> On Thu, 24 Oct 2019 at 15:52, Stefan Herbrechtsmeier 
> <stefan@herbrechtsmeier.net <mailto:stefan@herbrechtsmeier.net>> wrote:
> 
> 
>      > Yes:
>      >
>     http://lists.openembedded.org/pipermail/openembedded-architecture/2017-March/001270.html
> 
>     Do you have an up-to-date example? The mean.io <http://mean.io>
>     project is dead.
> 
> 
> http://meanjs.org/ I guess.

The project isn't really up-to-date and the "npm install" failed.

> The package-lock.json in their tarball is 600K.

The project use two major version and seven different versions with 30 
installations of debug. Furthermore the dependencies include build tools 
which should not be installed on the device.

The "@angular/cli" (242) and "node-red" (324) package share 106 packages.

Regards
   Stefan

