Return-Path: <joelf@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by mail.openembedded.org (Postfix) with ESMTP id D81B260DD7
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 May 2014 22:53:04 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s43Mr4Xw002345;
	Sat, 3 May 2014 17:53:04 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s43Mr4f7028640;
	Sat, 3 May 2014 17:53:04 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Sat, 3 May 2014 17:53:03 -0500
Received: from [172.22.140.4] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s43Mr3Px005334;
	Sat, 3 May 2014 17:53:03 -0500
Message-ID: <5365734E.5090604@ti.com>
Date: Sat, 3 May 2014 17:53:02 -0500
From: Joel Fernandes <joelf@ti.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.1
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>
References: <1399156743-14903-1-git-send-email-joelf@ti.com>
	<CAP9ODKqbWSBmOm=A47aypdT53eeRMZQ27_8BsoaoHGHoVu-50Q@mail.gmail.com>
In-Reply-To: <CAP9ODKqbWSBmOm=A47aypdT53eeRMZQ27_8BsoaoHGHoVu-50Q@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] serial-getty service: Add linux as default TERM
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
X-List-Received-Date: Sat, 03 May 2014 22:53:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On 05/03/2014 05:44 PM, Otavio Salvador wrote:
> On Sat, May 3, 2014 at 7:39 PM, Joel Fernandes <joelf@ti.com> wrote:
>> In poky with systemd enabled, vt102 is selected for getty
>> causing user to experience a very crappy terminal. Default
>> TERM to linux.
>>
>> Signed-off-by: Joel Fernandes <joelf@ti.com>
> 
> Don't bump PR, this is not needed in this case.
> 

OK, will the package still update for folks?

