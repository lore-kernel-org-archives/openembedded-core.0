Return-Path: <joelf@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by mail.openembedded.org (Postfix) with ESMTP id 2564F60DD7
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 May 2014 02:51:24 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s452pPcU030669;
	Sun, 4 May 2014 21:51:25 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s452pPWM007757;
	Sun, 4 May 2014 21:51:25 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Sun, 4 May 2014 21:51:24 -0500
Received: from [172.22.145.73] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s452pOGM029392;
	Sun, 4 May 2014 21:51:24 -0500
Message-ID: <5366FCAB.3040907@ti.com>
Date: Sun, 4 May 2014 21:51:23 -0500
From: Joel Fernandes <joelf@ti.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.1
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>, Jonathan Liu <net147@gmail.com>
References: <1399160215-16270-1-git-send-email-joelf@ti.com>
	<536613A5.3020003@gmail.com>
	<CAMKF1spb-jndL4NqiW_Qq3KChtdKKX+1Zahj5CSak6nwm7zLRw@mail.gmail.com>
	<5366F952.5000206@ti.com>
In-Reply-To: <5366F952.5000206@ti.com>
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
X-List-Received-Date: Mon, 05 May 2014 02:51:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On 05/04/2014 09:37 PM, Joel Fernandes wrote:
> On 05/04/2014 09:31 PM, Khem Raj wrote:
>> On Sun, May 4, 2014 at 3:17 AM, Jonathan Liu <net147@gmail.com> wrote:
>>> I would prefer:
>>> Environment="TERM=xterm"
>>> ExecStart=-/sbin/agetty -8 --keep-baud %I @BAUDRATE@ $TERM
>>
>> I wonder if that would add some dependency on right terminfo being
>> present on system ?
>>
> 
> I thought about this too, I have no idea frankly, I can see that it
> probably would :-(
> 

Khem,
terminfo data (/usr/share/terminfo) seems to be coming from ncurses in
my build. I think ncurses-terminfo-base. Not sure what the right
dependency play we should be doing for this... set dependency to
ncurses-terminfo-base?

by the way
/lib/systemd/system/debug-shell.service
which ships with systemd already sets Environment=TERM=linux

Thanks,
-Joel


