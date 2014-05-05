Return-Path: <joelf@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by mail.openembedded.org (Postfix) with ESMTP id 315BB605B2
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 May 2014 02:37:07 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s452b8XG029508;
	Sun, 4 May 2014 21:37:08 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s452b8P5023809;
	Sun, 4 May 2014 21:37:08 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Sun, 4 May 2014 21:37:08 -0500
Received: from [172.22.145.73] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s452b72J001988;
	Sun, 4 May 2014 21:37:08 -0500
Message-ID: <5366F952.5000206@ti.com>
Date: Sun, 4 May 2014 21:37:06 -0500
From: Joel Fernandes <joelf@ti.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.1
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>, Jonathan Liu <net147@gmail.com>
References: <1399160215-16270-1-git-send-email-joelf@ti.com>
	<536613A5.3020003@gmail.com>
	<CAMKF1spb-jndL4NqiW_Qq3KChtdKKX+1Zahj5CSak6nwm7zLRw@mail.gmail.com>
In-Reply-To: <CAMKF1spb-jndL4NqiW_Qq3KChtdKKX+1Zahj5CSak6nwm7zLRw@mail.gmail.com>
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
X-List-Received-Date: Mon, 05 May 2014 02:37:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On 05/04/2014 09:31 PM, Khem Raj wrote:
> On Sun, May 4, 2014 at 3:17 AM, Jonathan Liu <net147@gmail.com> wrote:
>> I would prefer:
>> Environment="TERM=xterm"
>> ExecStart=-/sbin/agetty -8 --keep-baud %I @BAUDRATE@ $TERM
> 
> I wonder if that would add some dependency on right terminfo being
> present on system ?
> 

I thought about this too, I have no idea frankly, I can see that it
probably would :-(


