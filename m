Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 1681675E80
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Sep 2015 11:57:34 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 4C5C9F811E4; Tue,  8 Sep 2015 05:57:34 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=10.0 tests=ALL_TRUSTED,BAYES_00,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id D2957F811DD;
	Tue,  8 Sep 2015 05:57:33 -0600 (MDT)
To: openembedded-core@lists.openembedded.org
References: <1441592391-108731-1-git-send-email-wenzong.fan@windriver.com>
	<CAJTo0LYt6Qd0OGqZgGKAtxpKuq9Cr2SUr42=vNa67+zPsUebYg@mail.gmail.com>
	<55EE38C7.30300@windriver.com>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <55EECD6D.3010602@mlbassoc.com>
Date: Tue, 8 Sep 2015 05:58:37 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <55EE38C7.30300@windriver.com>
Subject: Re: [PATCH] gnu-efi: Make setjmp.S portable to ARM
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
X-List-Received-Date: Tue, 08 Sep 2015 11:57:35 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2015-09-07 19:24, wenzong fan wrote:
> On 09/07/2015 10:08 PM, Burton, Ross wrote:
>>
>> On 7 September 2015 at 03:19, <wenzong.fan@windriver.com
>> <mailto:wenzong.fan@windriver.com>> wrote:
>>
>>     +  > Note on targets where the @ character is the start of a comment
>>     +  > (eg ARM) then another character is used instead. For example the
>>     +  > ARM port uses the % character.
>>
>>
>> Is the documentation badly written or does this now broke the build on x86?
>
> The lib/arm/setjmp.S is introduced by gnu-efi 3.0.3, there's not such assembler file in 3.0.2.
>
> It only fails while building qemuarm target.

Since this file is [obviously] only built on ARM targets,
perhaps the patch should only be applied there?  e.g. use
   SRC_URI_arm = "file://gnu-efi-Make-setjmp.S-portable-to-ARM.patch"
instead of adding it to SRC_URI

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

