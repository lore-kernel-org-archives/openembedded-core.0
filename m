Received: from eumx.net ([91.82.101.43] helo=owm.eumx.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1UO9tE-00089F-SQ
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Apr 2013 18:53:26 +0200
Message-ID: <515EFD76.2090009@communistcode.co.uk>
Date: Fri, 05 Apr 2013 17:36:06 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130328 Thunderbird/17.0.5
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <515ED999.9040100@communistcode.co.uk>
	<D19A794A-8644-4443-9628-2B137F2BC89F@gmail.com>
In-Reply-To: <D19A794A-8644-4443-9628-2B137F2BC89F@gmail.com>
Subject: Re: gcc-cross-initial Failure
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: ml@communistcode.co.uk
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 05 Apr 2013 16:53:27 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/04/2013 17:15, Khem Raj wrote:
> On Apr 5, 2013, at 7:03 AM, Jack Mitchell <ml@communistcode.co.uk> wrote:
>
>> Doing my usual git master pull and rebuild today, resulted in gcc-cross-initial failing to build.
>>
>> Please find the log attached, does anyone know what could have caused it? I recently changed the TUNES, so could something not be being re-built when it should be?
>
> it could be gcc is crashing on you. What TUNEs did you change

I build for the beaglebone and I changed them in line with your default 
beaglebone build patch you posted a week or so ago. I think it moved it 
form soft to hard float possibly...

>
>> Cheers,
>> Jack.
>>
>> -- 
>>
>>   Jack Mitchell (jack@embed.me.uk)
>>   Embedded Systems Engineer
>>   http://www.embed.me.uk
>>
>> --
>>
>> <log.do_compile.840>_______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



