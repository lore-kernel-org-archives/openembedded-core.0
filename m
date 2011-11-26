Received: from smtprelay-h22.telenor.se ([195.54.99.197])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <openembedded-core@emagii.com>) id 1RUJek-00073F-IS
	for openembedded-core@lists.openembedded.org;
	Sat, 26 Nov 2011 15:55:09 +0100
Received: from ipb3.telenor.se (ipb3.telenor.se [195.54.127.166])
	by smtprelay-h22.telenor.se (Postfix) with ESMTP id 80A32D333
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Nov 2011 15:14:53 +0100 (CET)
X-SENDER-IP: [83.227.56.19]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: Ag8bAFnz0E5T4zgTPGdsb2JhbAAMOKsYAQEBATeCJAEBAQECAQEBAS8BBTYGBBELGAkWDwkDAgECARUBGxQGDQYCAQGIAQi1WYNfhwMEkiqCIJIM
X-IronPort-AV: E=Sophos;i="4.69,575,1315173600"; 
   d="scan'208";a="3353977"
Received: from c-1338e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.244]) ([83.227.56.19])
	by ipb3.telenor.se with ESMTP; 26 Nov 2011 15:14:52 +0100
Message-ID: <4ED0F45B.8010606@emagii.com>
Date: Sat, 26 Nov 2011 15:14:51 +0100
From: Ulf Samuelsson <openembedded-core@emagii.com>
Organization: eMagii
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.23) Gecko/20110922 Thunderbird/3.1.15
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4ED0CC76.4040606@emagii.com> <4ED0DDBF.9000104@eukrea.com>
In-Reply-To: <4ED0DDBF.9000104@eukrea.com>
Subject: Re: Feedback on building openembedded-core for qemuarm. Excerpts from buildlog
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: ulf@emagii.com, Patches and discussions about the oe-core layer
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
X-List-Received-Date: Sat, 26 Nov 2011 14:55:09 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2011-11-26 13:38, Eric B=E9nard wrote:
> Hi Ulf,
>
> Le 26/11/2011 12:24, Ulf Samuelsson a =E9crit :
>> 3. When I ran into this problem, I exited with ctrl-C.
>> This left some recipes in the middle of a fetch ,and the build could n=
ot
>> continue.
>> I had to "bitbake -c clean <package>" on all problematic packages to=20
>> recover.
>> Seems a little bit fragile to me.
>>
> already met here : you must let bitbake end the other tasks already=20
> started to prevent that (so only one control C).
>
>> 4. linux-3.0 recipe in meta-ti does not build (On Ubuntu 11.10 x64).
>> Fails in the fetch stage.
>> I removed the layer, since it was not needed for qemuarm.
>>
> I also met this kind of problem. To prevent that problem, in my bsp=20
> overlay, I always add COMPATIBLE_MACHINE =3D "" to the machine specific=
=20
> recipes.
> What is strange is that meta-ti also have this in its recipes so their=20
> linux-3.0 recipe should not be used if you target qemuarm.
>
>> 5. When compiling on a Ubuntu 11.10 x64 host (linux 3.x host)
>> tiff won't build.
>> Did:
>> bitbake console-image"
>> bitbake -c clean tiff
>> bitbake tiff
>> - No luck
>> Reading through the mailing list, I found someone which deleted
>> $TMPDIR and then
>> bitbake tiff
>> bitbake console-image
>> That worked for me as well once, second time, same problem.
>> Problem is that #include <iostream> fails.
>>
>> I noted that "iostream" is built and available in=20
>> <sysroot>/usr/include/c++
>> On the host, it is located in /usr/incolude/c++/<version>
>> "tiff" build seems to be OK with Ubuntu 11.04 i686.
>>
> what is your BB_NUMBER_THREADS setting ?
> Here (on 2 different hosts/distro/arch but with an i7 CPU in both=20
> cases) if I set it over 4, I often (always with a value of 8) meet=20
> problems with c++ includes during build from scratch. 4 seems the=20
> magic value which never trigger the problem.

OK, it is higher than that.
Was trying out a Core-i7-980X with 6 cores/12 threads with TMP on a fast=20
SSD.
The CPU seems to be running at low frequencies most of the time.


>
> Eric
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


--=20
Best Regards
Ulf Samuelsson
eMagii



