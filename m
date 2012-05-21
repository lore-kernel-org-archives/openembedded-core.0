Received: from starfish.geekisp.com ([216.168.135.166])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1SWT1S-0003jj-MT
	for openembedded-core@lists.openembedded.org;
	Mon, 21 May 2012 15:51:42 +0200
Received: (qmail 24805 invoked by uid 1003); 21 May 2012 13:41:23 -0000
Received: from unknown (HELO ?192.168.0.15?)
	(philip@opensdr.com@75.136.226.183)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	21 May 2012 13:41:23 -0000
Message-ID: <4FBA4608.6080401@balister.org>
Date: Mon, 21 May 2012 09:41:28 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.24) Gecko/20111108 Fedora/3.1.16-1.fc14 Thunderbird/3.1.16
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1336581863-23833-1-git-send-email-philip@balister.org>	<CAF6bG8eNvdXghPDFh7omfan5mYY56SLJyPLM_oqWRD=-xsBPrw@mail.gmail.com>	<4FBA3E04.50403@balister.org>
	<1337606728.22747.2.camel@ted>
In-Reply-To: <1337606728.22747.2.camel@ted>
X-Enigmail-Version: 1.1.2
Subject: Re: Add option to oe-buildenv-internal script to change bitbake location.
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
X-List-Received-Date: Mon, 21 May 2012 13:51:43 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 05/21/2012 09:25 AM, Richard Purdie wrote:
> On Mon, 2012-05-21 at 09:07 -0400, Philip Balister wrote:
>> On 05/09/2012 01:03 PM, Marko Lindqvist wrote:
>>> On 9 May 2012 19:44, Philip Balister <philip@balister.org> wrote:
>>>> Having bitbake inside the oe-core is annoying to some people. This commit
>>>> adds a second option to the oe-init-build-env script.
>>>>
>>>> Run like this:
>>>>
>>>> . ./oe-init-build-env ../build ../bitbake
>>>>
>>>> for example. Without the second option, the old behavior is preserved.
>>>>
>>>> Signed-off-by: Philip Balister <philip@balister.org>
>>>
>>>  Maybe you should update comment in oe-init-build-env describing
>>> typical use to contain this parameter.
>>
>> Richard, do you want me to se-send this with Marko's suggestions added?
> 
> I'm happy to have a follow up patch, I did merge the original. It broke
> various assumptions being made by for example the autobuilder scripts so
> I had to add some other changes already.

Thanks.

I'm curious how it could break things since it should not have had any
effect unless a second argument was present.

Philip


