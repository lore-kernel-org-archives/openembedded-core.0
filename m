Received: from sanddollar.geekisp.com ([216.168.135.167])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1Ty1bx-00032z-Lz
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Jan 2013 15:47:34 +0100
Received: (qmail 25234 invoked by uid 1003); 23 Jan 2013 14:32:01 -0000
Received: from unknown (HELO ?192.168.1.107?)
	(philip@opensdr.com@96.240.188.95)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	23 Jan 2013 14:32:01 -0000
Message-ID: <50FFF460.5050108@balister.org>
Date: Wed, 23 Jan 2013 09:32:00 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Mark Hatle <mark.hatle@windriver.com>
References: <50FFE5D6.8020207@balister.org> <50FFF12B.7010709@windriver.com>
In-Reply-To: <50FFF12B.7010709@windriver.com>
X-Enigmail-Version: 1.5
Cc: openembedded-core@lists.openembedded.org
Subject: Re: UHD (from meta-oe) failure when rpm packaging selected
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 23 Jan 2013 14:47:40 -0000
X-List-Received-Date: Wed, 23 Jan 2013 14:47:40 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 01/23/2013 09:18 AM, Mark Hatle wrote:
> On 1/23/13 7:29 AM, Philip Balister wrote:
>> The recipe builds fine with ipk only, but when you add rpm packaging the
>> recipe fails to build with:
>>
>> so.5 libncurses.so.5
>> Processing files: uhd-dbg-3.5.0-r3.0.armv7a_vfp_neon
>> Finding  Provides:
>> /home/balister/src/oe-core/build/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/uhd/1_3.5.0-r3.0/uhd.provides
>>
>> Finding  Requires:
>> /home/balister/src/oe-core/build/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/uhd/1_3.5.0-r3.0/uhd.requires
>>
>> Processing files: uhd-dev-3.5.0-r3.0.armv7a_vfp_neon
>> Finding  Provides:
>> /home/balister/src/oe-core/build/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/uhd/1_3.5.0-r3.0/uhd.provides
>>
>> error: line 719: Illegal char '-' in EVR:

[balister@mini ~]$ wc -l
thuvia/src/oe-core/build/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/uhd/1_3.5.0-r3.0/uhd.spec

719
thuvia/src/oe-core/build/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/uhd/1_3.5.0-r3.0/uhd.spec

The last line is blank.

Philip

>>
>> error: Failed to find Provides:
>>
>>
>> RPM build errors:
>>      line 719: Illegal char '-' in EVR:
> 
> The line above is from the generated spec file.  Look at
> /home/balister/src/oe-core/build/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/uhd/1_3.5.0-r3.0/uhd.spec
> -- line 719 and see what it contains.
> 
> In RPM there is a rule that the Epoch, Version and Release may not
> contain a "-".  So a translation should have occurred to change it to
> either a + or a _..  (I don't remember which at the moment.)
> 
>>      Failed to find Provides:
>> DEBUG: Python function do_package_rpm finished
>>
>> Any suggestions?
>>
>> Philip
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> 
> 


