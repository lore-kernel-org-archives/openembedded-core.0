Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1SwyRy-0005Ze-I5
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 18:40:38 +0200
Received: from localhost ([127.0.0.1]:54085 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>)
	id 1SwyGg-0001MC-QG; Thu, 02 Aug 2012 16:28:58 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=eumx.net; h=message-id
	:date:from:reply-to:mime-version:to:cc:subject:references
	:in-reply-to:content-type:content-transfer-encoding; s=default;
	bh=S14nG4JHCgVk3VKMSDK8TMUyG9E=; b=DVxDXg+MrTOq6GVt2vowgm0Zv3sI
	IoOD4Hused/g3hTKsq3m6wKL9AVm3HB64Fx0AeajPxW85QSue9JqMGzokho3LHo7
	M572JE7oW/aMyyIoz3fUTlbEZNt2DtL6geyhkQcth6x7lmzqKaSSv8IWEY/t9xln
	5R0b8GRzCMEYX2k=
Received: from cpc2-cmbg15-2-0-cust171.5-4.cable.virginmedia.com
	([86.26.12.172]:49329 helo=[192.168.1.113])
	by eumx.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <ml@communistcode.co.uk>)
	id 1SwyGg-0001M8-ME; Thu, 02 Aug 2012 16:28:58 +0000
Message-ID: <501AAACA.2010903@communistcode.co.uk>
Date: Thu, 02 Aug 2012 17:28:58 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:14.0) Gecko/20120713 Thunderbird/14.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <501A43F2.7020209@communistcode.co.uk>
	<1343914820.9756.74.camel@ted>
	<501A9CA6.6020704@communistcode.co.uk>
	<1343922080.9756.79.camel@ted>
In-Reply-To: <1343922080.9756.79.camel@ted>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Qemu refusing to build
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: ml@communistcode.co.uk,
	Patches and discussions about the oe-core layer
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
X-List-Received-Date: Thu, 02 Aug 2012 16:40:38 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/08/2012 16:41, Richard Purdie wrote:
> On Thu, 2012-08-02 at 16:28 +0100, Jack Mitchell wrote:
>> How would I manually attempt to configure? There are no files what so
>> ever in the
>> /mnt/storage/yoctoBuilds/poky-vanilla.git/build/tmp/work/x86_64-linux/qemu-native-0.15.1-r10/qemu-0.15.1
>> directory.
>
> Well, that is a big help to know. It sounds like something has wiped the
> work directory and its then trying to rebuild it. Are you using rm_work
> of some kind? It sounds like some kind of malfunction has occurred with
> it...
>
> Cheers,
>
> Richard.
>

It could very well be related to the fact that I am building over NFS 
and the other problems that have come with it. I'm building with the bog 
standard vanilla poky with quemu arm uncommented. In this situation I 
would normally -c cleansstate and try again, but that function is also 
broken for me (again possibly NFS related).

I changed my NFS mount settings to force sync which makes it act like a 
more traditional hard drive but it doesn't seem to have done me any good.

I'm not back in work till Monday so I'll see if I can do anything more 
with it then. If anyone could confirm that they build on an NFS mount 
then that would be a massive help.

Cheers,




