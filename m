Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TQxCr-00034N-Jh
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Oct 2012 11:24:57 +0200
Received: from localhost ([127.0.0.1]:38704 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>)
	id 1TQwzo-0004gw-OZ; Wed, 24 Oct 2012 09:11:28 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=eumx.net; h=message-id
	:date:from:reply-to:mime-version:to:cc:subject:references
	:in-reply-to:content-type:content-transfer-encoding; s=default;
	bh=BwAN+qCpNzi5zADHGCR3EgsUyJo=; b=HvaRFTyAeYJzEaO1WOpZMgTsHfv2
	H+AKisyaDMe8Ijw/5/eYj+ugA0WPTSkAIrvisBVaIb5kZgvWCg8H1IDWjbkptpbY
	aTzpuUybY8hW4Au8GQkr16gppfdJDHxyalum1I7xttQFcQa0E0iGM/AyymwhoO7z
	ogQgOYEYOz+kbVg=
Received: from [195.171.99.130] (port=19027 helo=[192.168.0.67])
	by eumx.net with esmtpa (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>)
	id 1TQwzo-0004gt-MX; Wed, 24 Oct 2012 09:11:28 +0000
Message-ID: <5087B12F.1080504@communistcode.co.uk>
Date: Wed, 24 Oct 2012 10:13:19 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:16.0) Gecko/20121012 Thunderbird/16.0.1
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <50869BDC.6050401@communistcode.co.uk>
	<CAJTo0LZHTGaVLnrYidOmLwvqB3Z+n9m5itr_4hA9krEPHihdsQ@mail.gmail.com>
	<5086B713.30708@communistcode.co.uk>
	<CAJTo0Lb0Fv=Hwhp88EUjurQO_Lnr319M-q_2Y6Js0fbzfO7Xfw@mail.gmail.com>
	<5086BBB2.7070601@communistcode.co.uk>
	<CAJTo0LZ0t1j=UpHAHR7Q=1FZ-LWGhT2TV0L+NPScEzEBmfd_Sg@mail.gmail.com>
	<5086BD5E.3040904@communistcode.co.uk>
	<CAJTo0La7QBQ-f=v8Rknh6nSYEiz70vcp_fA5crDjXOiOP-=XPA@mail.gmail.com>
In-Reply-To: <CAJTo0La7QBQ-f=v8Rknh6nSYEiz70vcp_fA5crDjXOiOP-=XPA@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Wed, 24 Oct 2012 09:24:57 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/10/12 16:56, Burton, Ross wrote:
> Only a few hits, try cleaning those.  God knows why your sysroot is
> hosed.  Maybe we should forcibly prune .la files from the sysroot...
>
> Ross

Ok, after a bit of chat with rburton on IRC yesterday we're still stuck 
with this problem even after multiple cleansstates, I am going to try a 
clean build today as I need this working and will report back.

I have now experienced this on both my Production machine and my 
Development machine so it is at least (in some way) reproducible and not 
an error due to tinkering.

Regards,

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



