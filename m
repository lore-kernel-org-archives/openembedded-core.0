Return-Path: <stefan@herbrechtsmeier.net>
Received: from dd41138.kasserver.com (dd41138.kasserver.com [85.13.157.12])
	by mail.openembedded.org (Postfix) with ESMTP id C33BD7F997
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2019 12:40:05 +0000 (UTC)
Received: from [192.168.178.37] (unknown [94.134.94.146])
	by dd41138.kasserver.com (Postfix) with ESMTPSA id 1889311A05F0;
	Thu, 24 Oct 2019 14:40:06 +0200 (CEST)
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <20191022090353.21151-1-jean-marie.lemetayer@savoirfairelinux.com>
	<8e660284b1ece9e66eb47747213e8faafdd99655.camel@linuxfoundation.org>
	<5290bb1a-4cc8-4ed9-8f33-3c8994f06f22@herbrechtsmeier.net>
	<CANNYZj99FATCkw+6V088NkTWm3DEUAcoZaP+XBUR0xZnGeeQdw@mail.gmail.com>
From: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
Message-ID: <22cbc060-0f73-4354-1edb-ca90dbed4d73@herbrechtsmeier.net>
Date: Thu, 24 Oct 2019 14:40:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CANNYZj99FATCkw+6V088NkTWm3DEUAcoZaP+XBUR0xZnGeeQdw@mail.gmail.com>
Cc: brendan.le.foll@intel.com,
	"Paul Eggleton \(paul.eggleton@linux.intel.com\)"
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
X-List-Received-Date: Thu, 24 Oct 2019 12:40:06 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Am 24.10.19 um 14:12 schrieb Alexander Kanavin:
> On Thu, 24 Oct 2019 at 14:02, Stefan Herbrechtsmeier 
> <stefan@herbrechtsmeier.net <mailto:stefan@herbrechtsmeier.net>> wrote:
> 
> 
>     @Richard: What is your opinion about the per recipe dependency?
>     Typically OE use one recipe per project. The NPM based solution
>     handle a
>     project and all dependencies via one recipe.
> 
> 
> I don't think it's at all realistic to stick to the 'one recipe per 
> component' in node.js world. A typical 'npm install' can pull down 
> hundreds, or over a thousand dependencies, it's not feasible to have a 
> recipe for each.

Do you have an example package?

> 
> I very much welcome a solution that uses 'npm install' in a way that 
> preserves offline builds, and integrity/reproducibility of downloads.

Fist we should use 'npm ci' instead of 'npm install'.

How would you handle prebuild binaries? Would you disable prebuild binaries?

How would you handle native packages (ex. angular-cli)?

How would you patch dependencies?

How would you remove unneeded files (ex. documentation, examples, source 
code)?

> License management should be also handled by npm, and if it isn't, then 
> we need to work with the upstream to address it.

To my knowledge npm don't check license files. It only reads the license 
in the package.json.

Regards
   Stefan

