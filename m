X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <1344990a-48df-c96c-1901-9c3c7ef90632@bootlin.com>
Date: Thu, 17 Mar 2022 12:41:47 +0100
MIME-Version: 1.0
Subject: Re: [OE-core] Patches sent to mailing lists: "From" attribute modified
References: <16DCF6055FEB6DC7.29979@lists.openembedded.org>
 <d54721ab-03a8-9c80-0445-17c7d76d6570@bootlin.com>
 <047880ea-a2dc-7778-3101-a3c887715513@theobroma-systems.com>
 <eedc4f00-a940-1672-ac00-db2d09023a4c@bootlin.com>
 <YjMSk+vkVU/mtE1k@piout.net>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
In-Reply-To: <YjMSk+vkVU/mtE1k@piout.net>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: alexandre.belloni@bootlin.com
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>, OE-core <openembedded-core@lists.openembedded.org>


On 3/17/22 11:50, Alexandre Belloni via lists.openembedded.org wrote:
> On 17/03/2022 11:01:12+0100, Michael Opdenacker via lists.openembedded.org wrote:
>> Hi Quentin,
>>
>> On 3/17/22 10:43, Quentin Schulz wrote:
>>> Maybe there's something you can do to configure git send-email to add
>>> your
>>>
>>> From: Michael Opdenacker <michael.opdenacker@bootlin.com"
>>>
>>> at the top of the mail. See my patches on the ML to see what I mean
>>> exactly but that should make it nicer to maintainers because this From
>>> will be used and not the one from the mailbox's from field.
>>>
>>> FWIW, I did nothing in the configuration of git to have this, it's
>>> just that it probably detects that the sendemail.from config is
>>> different from the commit author mail address and adds it.
>>
>> Thanks for the tip. It could work, as my early tests show a difference
>> in the received e-mails.
>>
> I couldn't convince git to do it since it thinks the sender matches the
> author.


Yoohoo, it worked in my case, through this message I've just sent:
https://lore.kernel.org/yocto-docs/20220317113057.230854-1-michael.opdenacker@bootlin.com/T/#u

All I had to do was add this line to my ~/.gitconfig file (in the
[sendemail] section):
        from = michael.opdenacker@bootlin.com

Now, there is an explicity "From" field in the body of the e-mail
received through the mailing list.

Compare with
https://lore.kernel.org/yocto-docs/20220317092007.223297-1-michael.opdenacker@bootlin.com/T/#u,
in which there was just the "Signed-off-by" information.

Many thanks, Quentin!
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

