Received: from sanddollar.geekisp.com ([216.168.135.167])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1UbAiK-00060b-7F
	for openembedded-core@lists.openembedded.org;
	Sat, 11 May 2013 16:23:57 +0200
Received: (qmail 5858 invoked by uid 1003); 11 May 2013 13:59:08 -0000
Received: from unknown (HELO ?192.168.1.122?)
	(philip@opensdr.com@71.171.30.249)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	11 May 2013 13:59:08 -0000
Message-ID: <518E4EAB.8050502@balister.org>
Date: Sat, 11 May 2013 09:59:07 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130311 Thunderbird/17.0.4
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <1368189198-1294-1-git-send-email-jukka.rissanen@linux.intel.com>
	<518D7326.1030901@linux.intel.com>
In-Reply-To: <518D7326.1030901@linux.intel.com>
X-Enigmail-Version: 1.5.1
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/5] Enable VPN support in ConnMan
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
X-List-Received-Date: Sat, 11 May 2013 14:24:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 05/10/2013 06:22 PM, Saul Wold wrote:
> On 05/10/2013 05:33 AM, Jukka Rissanen wrote:
>> Hi,
>>
>> this patchset enables OpenVPN, vpnc, L2TP and PPTP VPN
>> technogies in ConnMan and fixes this bug
>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=4456
>>
>> The VPN support is activated if DISTRO_FEATURES contains
>> vpn string.
>>
> 
> This also create a dependency on the meta-openembedded layer, I am not
> sure we want to do that.

If the default setting does not add the dependency it should be OK? What
packages in meta-oe are needed? Does this suggest they should move to
oe-core?

Philip

> 
> Sau!
> 
>> Cheers,
>> Jukka
>>
>>
>> Jukka Rissanen (5):
>>    connman: Enable VPN support
>>    connman: Add OpenVPN support
>>    connman: Add vpnc support
>>    connman: Add L2TP support
>>    connman: Add PPTP support
>>
>>   meta/recipes-connectivity/connman/connman.inc | 42
>> +++++++++++++++++++++++++--
>>   1 file changed, 40 insertions(+), 2 deletions(-)
>>
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> 
> 


