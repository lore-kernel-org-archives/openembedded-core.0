Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by mail.openembedded.org (Postfix) with SMTP id 3BEA9725F4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Dec 2014 16:55:05 +0000 (UTC)
Received: (qmail 14586 invoked by uid 1003); 16 Dec 2014 16:55:06 -0000
Received: from unknown (HELO ?192.168.1.109?) (philip@opensdr.com@71.171.45.99)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	16 Dec 2014 16:55:05 -0000
Message-ID: <549063E9.4070403@balister.org>
Date: Tue, 16 Dec 2014 11:55:05 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <54904BDA.1080005@balister.org>
	<7CC1BDD4-170B-422B-BC51-33EC0B07E64A@gmail.com>
In-Reply-To: <7CC1BDD4-170B-422B-BC51-33EC0B07E64A@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Setting a a fixed resolv.conf file in OE built image
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
X-List-Received-Date: Tue, 16 Dec 2014 16:55:15 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 12/16/2014 11:40 AM, Khem Raj wrote:
> 
>> On Dec 16, 2014, at 7:12 AM, Philip Balister <philip@balister.org> wrote:
>>
>> Any tips on how to do this the right way? It seems like fixed
>> resolv.conf's are no longer fashionable and the volatile.cache script
>> goes to great lengths to reset it.
>>
>> Adding a dns-nameserver entry in the interfaces file never makes it to
>> resolv.conf. I tried installing the resolvconf package and played with
>> it, but no joy. This package also appears to have some issues with
>> missing pieces.
> 
> depends a lot on what package combination you are using. If its systemd and you
> are using systemd-resolved then it generates resolve.conf in /run/ and symlink
> in /etc/ gets the job done. if its udhcpc then it will populate the one in /etc
> and it will take interfaces file in /etc into consideration

Yeah, but this is an image built by adding packages to core-image. No
systemd or other network managers. It feels like just adding the
dns-nameserver line to interfaces should work, but something appears to
not re-populate resolv.conf after it is wiped at boot.

Philip

> 
>>
>> I'll file bugs, but until I can figure out how it is suposed to work,
>> any bug I file is going to be pretty vague.
>>
>> This really should be easier.
>>
>> Philip
>> -- 
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 
> 
> 

