Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Paul.Gortmaker@windriver.com>) id 1SoJF0-0000fW-Tf
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 21:03:27 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q69IqA8f007096
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 9 Jul 2012 11:52:10 -0700 (PDT)
Received: from [128.224.146.65] (128.224.146.65) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Mon, 9 Jul 2012 11:52:09 -0700
Message-ID: <4FFB2858.7030603@windriver.com>
Date: Mon, 9 Jul 2012 14:52:08 -0400
From: Paul Gortmaker <paul.gortmaker@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Phil Blundell <philb@gnu.org>
References: <4FF0C930.4000104@linux.intel.com>
	<1341207885-9463-1-git-send-email-paul.gortmaker@windriver.com>
	<4FF33085.1070703@linux.intel.com>
	<20120704141259.GA1817@windriver.com>
	<20120704150005.GD1817@windriver.com>
	<1341415765.20265.30.camel@phil-desktop>
	<20120705161402.GA2309@windriver.com>
	<1341849720.20265.64.camel@phil-desktop>
In-Reply-To: <1341849720.20265.64.camel@phil-desktop>
X-Originating-IP: [128.224.146.65]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 0/3] u-boot recipe updates
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 09 Jul 2012 19:03:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

[CC'ing Richard, since Phil says he is list admin]

On 12-07-09 12:01 PM, Phil Blundell wrote:
> On Thu, 2012-07-05 at 12:14 -0400, Paul Gortmaker wrote:
>>> On Wed, 2012-07-04 at 11:00 -0400, Paul Gortmaker wrote:
>>>>> On a related note, is it possible to fix the mailing list so that it
>>>>> does not strip To/Cc information and Message-ID strings?  [I'd have to
>>>>> check -- maybe it is (also) inserting a needless Reply-To: header that
>>>>> messes things up.]
>>
>> Your mail suffers the exact same problem.  My address is nowhere to be
>> seen on the To/Cc:  I only happened to see it since I told mutt to
>> show me all archived poky/oe mails with u-boot in the subject.
>> Otherwise your message would have been lost in the noise, perhaps seen
>> next week when I return from OOO.
>>
>> And when I hit reply, it won't go to you unless I tell mutt to ignore
>> the broken Reply-To line.  It is the line right at the bottom:
> 
> Ah, I see.  So, just to be clear, the mailing list isn't stripping
> anything: the reason that your address doesn't appear in To/Cc is, as
> you suggest, purely because the Reply-to: header which mailman inserts
> tends to cause replies to be sent only to the list.
> 
> I tend to agree with you that the Reply-to header is a bad idea and it
> would be better off disabled, but this is a list policy decision and
> Richard, as the administrator, would need to decide whether he wants to
> disable it or not.
> 
> For what it's worth, you can partially defeat this behaviour by
> inserting your own Reply-to header in messages that you send to the
> list.  If you tell mutt to add:
> 
> Reply-to: Paul Gortmaker <paul.gortmaker@windriver.com>
> 
> then mailman will translate this to:
> 
> Reply-to: Paul Gortmaker <paul.gortmaker@windriver.com>,
> openembedded-core@lists.openembedded.org
> 
> which will probably produce more or less the effect that you are looking
> for.  I realise that this is still somewhat annoying but you might find
> it better than the behaviour you are getting at present.

Sure, there are workarounds, and I've employed some of them, but
in the end it makes no sense to have everyone manually deploy
such one-shot workarounds just in order to make the list behave
like 99% of all the other lists, when one administrator change to
delete the bogus Reply-To: header makes the whole problem go away
for everyone.

Paul.
--

> 
> p.
> 
> 



