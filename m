Return-Path: <andrew.shadura@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id 4D1E277107
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Oct 2015 11:06:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: andrewsh) with ESMTPSA id B5FCC600FA0
User-Agent: K-9 Mail for Android
In-Reply-To: <CAJTo0LZ4eNqiyX0JzPEb=FLAk=k=2p2c2+c5mKd77a0zquepAw@mail.gmail.com>
References: <c64105ff4adca9a4e05280aa52644919d646d660.1445449278.git.andrew.shadura@collabora.co.uk>
	<CAJTo0LZ4eNqiyX0JzPEb=FLAk=k=2p2c2+c5mKd77a0zquepAw@mail.gmail.com>
MIME-Version: 1.0
From: Andrew Shadura <andrew.shadura@collabora.co.uk>
Date: Thu, 22 Oct 2015 13:06:24 +0200
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <94093E93-77C6-403A-9E9F-69C02C6C8D11@collabora.co.uk>
Cc: OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cups: explicitly configure with systemd when needed
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
X-List-Received-Date: Thu, 22 Oct 2015 11:06:30 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain;
 charset=UTF-8

On 22 October 2015 12:59:13 CEST, "Burton, Ross" <ross.burton@intel.com> wrote:
>On 21 October 2015 at 18:41, Andrew Shadura
><andrew.shadura@collabora.co.uk>
>wrote:
>
>> +               ${systemd_system_unitdir} \
>>
>
>This isn't needed as systemd.bbclass handles it for you.


Well, that's what I thought too, but no, in fact it doesn't. 

-- 
Cheers,
  Andrew

