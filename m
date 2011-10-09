Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1RCtxM-0002iz-D1
	for openembedded-core@lists.openembedded.org;
	Sun, 09 Oct 2011 16:02:20 +0200
Received: (qmail 10749 invoked by uid 1003); 9 Oct 2011 13:56:33 -0000
Received: from unknown (HELO ?192.168.1.108?)
	(philip@opensdr.com@96.240.183.10)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	9 Oct 2011 13:56:33 -0000
Message-ID: <4E91A80D.70200@balister.org>
Date: Sun, 09 Oct 2011 09:56:29 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.22) Gecko/20110906 Fedora/3.1.14-1.fc14 Thunderbird/3.1.14
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4E907597.3090507@balister.org>
	<CAMKF1soz1FCyCZwA2Oe14q2e=RrxVZmJ3iVjQ=-P+fUghRYP3g@mail.gmail.com>
In-Reply-To: <CAMKF1soz1FCyCZwA2Oe14q2e=RrxVZmJ3iVjQ=-P+fUghRYP3g@mail.gmail.com>
X-Enigmail-Version: 1.1.2
Subject: Re: binutils from meta-oe does build build
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
X-List-Received-Date: Sun, 09 Oct 2011 14:02:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 10/08/2011 09:01 PM, Khem Raj wrote:
> On Sat, Oct 8, 2011 at 9:08 AM, Philip Balister <philip@balister.org> wrote:
>> http://pastebin.com/M0Gw0Db2
>>
>> Basically, warnings are being treated as errors and the compile fails.
> 
> you might add  --disable-werror to EXTRA_OECONF
> in meta-oe/recipes-devtools/binutils/binutils.inc

That worked. There are a number of CFLAGS in the .inc file and it is was
not obvious the proper place to insert Martin's suggestion.

I'll submit a patch later. RL intrudes.

Philip

> 
>>
>> Philip
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> 


