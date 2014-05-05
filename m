Return-Path: <joelf@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by mail.openembedded.org (Postfix) with ESMTP id 5DAD865F54
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 May 2014 15:31:02 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s45FV32R002343;
	Mon, 5 May 2014 10:31:03 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s45FV17l018909;
	Mon, 5 May 2014 10:31:03 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 5 May 2014 10:31:02 -0500
Received: from [10.247.29.57] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s45FV2a2020595;
	Mon, 5 May 2014 10:31:02 -0500
Message-ID: <5367AEB4.5080909@ti.com>
Date: Mon, 5 May 2014 10:31:00 -0500
From: Joel Fernandes <joelf@ti.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.1
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <1399160215-16270-1-git-send-email-joelf@ti.com>
	<536613A5.3020003@gmail.com>
	<CAMKF1spb-jndL4NqiW_Qq3KChtdKKX+1Zahj5CSak6nwm7zLRw@mail.gmail.com>
	<5366F952.5000206@ti.com> <5366FCAB.3040907@ti.com>
	<CAMKF1sq43mfkbe_DN6rK563eOPjhQ7Ti_z-Y5apT-LFTTirFyA@mail.gmail.com>
In-Reply-To: <CAMKF1sq43mfkbe_DN6rK563eOPjhQ7Ti_z-Y5apT-LFTTirFyA@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] serial-getty service: Add linux as default TERM
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
X-List-Received-Date: Mon, 05 May 2014 15:31:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On 05/04/2014 10:02 PM, Khem Raj wrote:
> On Sun, May 4, 2014 at 7:51 PM, Joel Fernandes <joelf@ti.com> wrote:
>> Khem,
>> terminfo data (/usr/share/terminfo) seems to be coming from ncurses in
>> my build. I think ncurses-terminfo-base. Not sure what the right
>> dependency play we should be doing for this... set dependency to
>> ncurses-terminfo-base?
>>
> 
> adding ncurses to dependencies would do it. but that could be an overkill.
> 
>> by the way
>> /lib/systemd/system/debug-shell.service
>> which ships with systemd already sets Environment=TERM=linux
> 
> yes this seems ok probably.
> 

Ok. I'll take that as an Ack :-D. So can you pull this patch (or someone
else)?

Regards,
-Joel

