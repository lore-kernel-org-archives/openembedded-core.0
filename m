Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TQgY9-0005Ys-Pt
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Oct 2012 17:37:51 +0200
Received: from localhost ([127.0.0.1]:53123 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>)
	id 1TQgL5-00040A-Dh; Tue, 23 Oct 2012 15:24:19 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=eumx.net; h=message-id
	:date:from:reply-to:mime-version:to:cc:subject:references
	:in-reply-to:content-type:content-transfer-encoding; s=default;
	bh=rzCxH6dVgjW7hroAlKDksOwQfnI=; b=MoKZtEPZbgjLtqYfCrmv8AmfGrnL
	F94EyyMzqn6RaGmQj7AevhRKsJTNsIKl8obSgk3SWQOl1aOoT3e8miMox1D5oKBR
	gcgYVtNvaUV9gqTj/98kAYvHaY2f9dmg7QER1CNKPkRSZi5/N9/oNklNlELd3GjR
	MrAdhn6XtvBYgk4=
Received: from [195.171.99.130] (port=45229 helo=[192.168.0.67])
	by eumx.net with esmtpa (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>)
	id 1TQgL5-000406-AF; Tue, 23 Oct 2012 15:24:19 +0000
Message-ID: <5086B713.30708@communistcode.co.uk>
Date: Tue, 23 Oct 2012 16:26:11 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:16.0) Gecko/20121012 Thunderbird/16.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <50869BDC.6050401@communistcode.co.uk>
	<CAJTo0LZHTGaVLnrYidOmLwvqB3Z+n9m5itr_4hA9krEPHihdsQ@mail.gmail.com>
In-Reply-To: <CAJTo0LZHTGaVLnrYidOmLwvqB3Z+n9m5itr_4hA9krEPHihdsQ@mail.gmail.com>
Subject: Re: Issues building meta-toolchain, libxau
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
X-List-Received-Date: Tue, 23 Oct 2012 15:37:51 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 23/10/12 16:15, Burton, Ross wrote:
> On 23 October 2012 14:30, Jack Mitchell <ml@communistcode.co.uk> wrote:
>> I'm struggling to build a varient of meta-toolchain as I keep running into
>> the following error. I can't see any recent changes to libxau soI'm a bit
>> stumped...
> /usr/bin/grep: /mnt/storage/yoctoBuilds/poky-beaglebone.git/beaglebone-db/tmp/sysroots/x86_64-nativesdk-pokysdk-linux/opt/poky/1.2+snapshot/sysroots/x86_64-pokysdk-linux/usr/lib/libXau.la:
> No such file or directory
>
> Hooray libtool!  :(  There have been relatively recent changes (a
> month ago?) to libX11 which may be causing this.  Is this from a clean
> build?
>
> (this is why people don't like .la files)
>
> Ross

No, it is not a clean build. However I got quite reckless with the -c 
cleansstate at one point which didn't seem to help.

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



