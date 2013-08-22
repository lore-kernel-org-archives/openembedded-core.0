Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa06-04.prod.phx3.secureserver.net
	(p3plsmtpa06-04.prod.phx3.secureserver.net [173.201.192.105])
	by mail.openembedded.org (Postfix) with ESMTP id 80EAC6B0C5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 11:53:55 +0000 (UTC)
Received: from [192.168.65.10] ([66.41.60.82])
	by p3plsmtpa06-04.prod.phx3.secureserver.net with 
	id Fntr1m00L1mTNtu01ntsTS; Thu, 22 Aug 2013 04:53:53 -0700
Message-ID: <5215FBD0.6020902@pabigot.com>
Date: Thu, 22 Aug 2013 06:53:52 -0500
From: "Peter A. Bigot" <pab@pabigot.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130804 Thunderbird/17.0.8
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1377125231-23508-1-git-send-email-pab@pabigot.com>
	<CAJTo0LZZBDBEi6L-9KtsE6hA8aosUGsak8_YFduWoVz1LYhrRg@mail.gmail.com>
In-Reply-To: <CAJTo0LZZBDBEi6L-9KtsE6hA8aosUGsak8_YFduWoVz1LYhrRg@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][for-dylan] bluez4: fix network Connect parameter validation
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
X-List-Received-Date: Thu, 22 Aug 2013 11:53:55 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/22/2013 04:46 AM, Burton, Ross wrote:
> On 21 August 2013 23:47, Peter A. Bigot <pab@pabigot.com> wrote:
>> The incorrect validation prevents connection to the NAP service on another
>> device.
> Is this intended for master as well as dylan?

At the moment, no.  I have not been actively developing under master yet 
so have not tested it there.

However, if Yocto 1.5 will still provide bluez4-101 (which was the last 
bluez4 release) the patch will be needed.  I thought there was some 
discussion of moving to bluez5 with a compatibility layer (again which I 
have not personally tested).

Peter

