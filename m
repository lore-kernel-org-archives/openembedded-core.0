Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TG5Z2-0003wh-Jj
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Sep 2012 12:06:56 +0200
Received: from localhost ([127.0.0.1]:53961 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TG5MV-0007Gx-Ma
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Sep 2012 09:53:59 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=eumx.net; h=message-id
	:date:from:reply-to:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding; s=default;
	bh=iPqVqlxdkhnWZvyzMRswGtc5j1Y=; b=gDmQHhwLeTaUfXKRuHPeh2av1fG4
	YS0l3EnQR/3VO2qNlndCj1izN06aM7b/duimnF6oHGQe7URW/T6Ke3nDVIwKbmSz
	AccLJhGSJm4iMU53FUuYnWBRiTBEvbM9kQrWQkdlwsi6BsEF0zJDhEI46PvLrrIT
	mFTfPL5yZlb4h/k=
Received: from [195.171.99.130] (port=19528 helo=[192.168.0.59])
	by eumx.net with esmtpa (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TG5MV-0007Gu-Jm
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Sep 2012 09:53:59 +0000
Message-ID: <50602E1F.7060206@communistcode.co.uk>
Date: Mon, 24 Sep 2012 10:55:43 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120910 Thunderbird/15.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <506025B4.6010000@communistcode.co.uk> <50602AB2.70409@intel.com>
In-Reply-To: <50602AB2.70409@intel.com>
Subject: Re: Perl autoconf issues - possibly related to previous toolchain issues
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
X-List-Received-Date: Mon, 24 Sep 2012 10:06:56 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 24/09/12 10:41, Laurentiu Palcu wrote:
> On 09/24/2012 12:19 PM, Jack Mitchell wrote:
>> I am trying to convert my application to use the autotools suite in
>> order to get a bit of control over my build. However I am hitting an
>> issue when trying to run autoreconf -i, I believe it is to do with
>> toolchain issues again...
>>
>> configure.ac:17: the top level
>> configure.ac:7: installing './install-sh'
>> configure.ac:7: installing './missing'
>> src/Makefile.am: installing './depcomp'
>> perl: warning: Setting locale failed.
>> perl: warning: Please check that your locale settings:
>>       LANGUAGE = (unset),
>>       LC_ALL = (unset),
>>       LANG = "en_GB.utf8"
>>       are supported and installed on your system.
>> perl: warning: Falling back to the standard locale ("C").
>> Can't locate strict.pm in @INC (@INC contains:
>> /home/jack/Projects/R0005-SDK-210912/sysroots/x86_64-pokysdk-linux/usr/share/autoconf
>> /opt/poky/1.2+snapshot/sysroots/x86_64-pokysdk-linux/usr/lib/perl/site_perl/5.14.2/
>> /opt/poky/1.2+snapshot/sysroots/x86_64-pokysdk-linux/usr/lib/perl/site_perl/5.14.2
>> /opt/poky/1.2+snapshot/sysroots/x86_64-pokysdk-linux/usr/lib/perl/vendor_perl/5.14.2/
>> /opt/poky/1.2+snapshot/sysroots/x86_64-pokysdk-linux/usr/lib/perl/vendor_perl/5.14.2
>> /home/jack/Projects/poky-r0005/R0005/tmp/sysroots/x86_64-nativesdk-pokysdk-linux/usr/lib/perl/5.14.2/
>> /opt/poky/1.2+snapshot/sysroots/x86_64-pokysdk-linux/usr/lib/perl/5.14.2
>> /opt/poky/1.2+snapshot/sysroots/x86_64-pokysdk-linux/usr/lib/perl/5.14.2
>> .) at
>> /home/jack/Projects/R0005-SDK-210912/sysroots/x86_64-pokysdk-linux/usr/share/autoconf/Autom4te/Channels.pm
>> line 70.
>> BEGIN failed--compilation aborted at
>> /home/jack/Projects/R0005-SDK-210912/sysroots/x86_64-pokysdk-linux/usr/share/autoconf/Autom4te/Channels.pm
>> line 70.
>> Compilation failed in require at
>> /home/jack/Projects/R0005-SDK-210912/sysroots/x86_64-pokysdk-linux/usr/share/autoconf/Autom4te/ChannelDefs.pm
>> line 19.
>> BEGIN failed--compilation aborted at
>> /home/jack/Projects/R0005-SDK-210912/sysroots/x86_64-pokysdk-linux/usr/share/autoconf/Autom4te/ChannelDefs.pm
>> line 19.
>> Compilation failed in require at
>> /home/jack/Projects/R0005-SDK-210912/sysroots/x86_64-pokysdk-linux/usr/bin/gnu-configize
>> line 40.
>> BEGIN failed--compilation aborted at
>> /home/jack/Projects/R0005-SDK-210912/sysroots/x86_64-pokysdk-linux/usr/bin/gnu-configize
>> line 40.
>> autoreconf: gnu-configize failed with exit status: 2
>>
>> As you can see it is looking in /opt/poky again and I believe it
>> shouldn't be.
> There's already an issue reported in bugzilla about it:
>
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3100
>
> This might be a relocation issue indeed. We're investigating it. The
> toolchain issue, however, must be related to your environment not being
> set up properly... Could you try to build the test app from bug #3156
> using eclipse and see if it builds? Theoretically, it should, because it
> does when you build it manually.

Yes that is possible although it was building fine (and is still 
building fine) with the old toolchain in /opt. Hence my reasoning to 
start converting to autotools in order to take the Eclipse 'automagic' 
out of the equation ;)

>
> Thanks,
> Laurentiu
>
>> Regards,
>> Jack.
>>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



