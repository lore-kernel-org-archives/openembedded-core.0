Return-Path: <ejo@pengutronix.de>
Received: from metis.ext.4.pengutronix.de (metis.ext.4.pengutronix.de
	[92.198.50.35])
	by mail.openembedded.org (Postfix) with ESMTP id A73AC6067C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jun 2016 09:32:04 +0000 (UTC)
Received: from mango.hi.pengutronix.de ([2001:67c:670:100:76d4:35ff:fee8:98b3])
	by metis.ext.pengutronix.de with esmtp (Exim 4.80)
	(envelope-from <ejo@pengutronix.de>)
	id 1bDq8B-0000MT-C3; Fri, 17 Jun 2016 11:32:03 +0200
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
References: <c41bdd4ac5371d7c08318f7c7fc760b44ce59ba9.1463546289.git.raj.khem@gmail.com>
	<85edcbf217242f13d1fa76bcf8258c153fc89db9.1463546289.git.raj.khem@gmail.com>
	<1463643393.4578.90.camel@linuxfoundation.org>
	<1463644963.4578.91.camel@linuxfoundation.org>
From: Enrico Joerns <ejo@pengutronix.de>
Message-ID: <5763C392.7070502@pengutronix.de>
Date: Fri, 17 Jun 2016 11:32:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.8.0
MIME-Version: 1.0
In-Reply-To: <1463644963.4578.91.camel@linuxfoundation.org>
X-SA-Exim-Connect-IP: 2001:67c:670:100:76d4:35ff:fee8:98b3
X-SA-Exim-Mail-From: ejo@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
	SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/5] systemd: Create missing sysusers offline
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
X-List-Received-Date: Fri, 17 Jun 2016 09:32:05 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 05/19/2016 10:02 AM, Richard Purdie wrote:
> On Thu, 2016-05-19 at 08:36 +0100, Richard Purdie wrote:
>> On Tue, 2016-05-17 at 21:40 -0700, Khem Raj wrote:
>>> Some system users which are needed by systemd components were
>>> missing
>>> create these users knobbed with relevant packageconfig
>>>
>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> ---
>>>   meta/recipes-core/systemd/systemd_229.bb | 8 +++++++-
>>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> This looks better but there do appear to still be problems:
>>
>> https://autobuilder.yoctoproject.org/main/builders/nightly-qa-systemd
>> /b
>> uilds/776/steps/Running%20Sanity%20Tests/logs/stdio
>>
>> and
>>
>> https://autobuilder.yoctoproject.org/main/builders/nightly-qa-systemd
>> /b
>> uilds/776/steps/Running%20Sanity%20Tests_2/logs/stdio
>

I just stumbled over this issue when building systemd with networkd 
enabled in krogoth release.
Shouldn't this patch be backported to krogoth as well?

Regards, Enrico

-- 
Pengutronix e.K.                           | Enrico Jörns                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-5080 |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |


