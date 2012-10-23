Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TQgy4-00070G-QH
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Oct 2012 18:04:37 +0200
Received: from localhost ([127.0.0.1]:34276 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>)
	id 1TQgl4-0004yp-JY; Tue, 23 Oct 2012 15:51:10 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=eumx.net; h=message-id
	:date:from:reply-to:mime-version:to:cc:subject:references
	:in-reply-to:content-type:content-transfer-encoding; s=default;
	bh=3e/n71wLAAJxBGKTC9+ALzJ4nRk=; b=cjicPSzC4PTjzWg44Mgr3abJqpLS
	PeOgju3Kz+y3500Xe1wWk+XQDyn+kCbc3jC80pobOuNPRs1Jv89B9D/qMF09jKia
	cC6oOHNUY1lMcpgV1YSLz8fL5UurT/fbH26yPgIjGfOwhGbemHEQx8J2w8LEgSbx
	2AHc04PD3dqQQY0=
Received: from [195.171.99.130] (port=62025 helo=[192.168.0.67])
	by eumx.net with esmtpa (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>)
	id 1TQgl4-0004yi-G6; Tue, 23 Oct 2012 15:51:10 +0000
Message-ID: <5086BD5E.3040904@communistcode.co.uk>
Date: Tue, 23 Oct 2012 16:53:02 +0100
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
In-Reply-To: <CAJTo0LZ0t1j=UpHAHR7Q=1FZ-LWGhT2TV0L+NPScEzEBmfd_Sg@mail.gmail.com>
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
X-List-Received-Date: Tue, 23 Oct 2012 16:04:37 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/10/12 16:47, Burton, Ross wrote:
> Gnnar.
>
> Go into /mnt/storage/yoctoBuilds/poky-beaglebone.git/beaglebone-db/tmp/sysroots/x86_64-nativesdk-pokysdk-linux/opt/poky/1.2+snapshot/sysroots/x86_64-pokysdk-linux/usr/lib/
> and grep it for libXau.la - need to find where it's coming from.
>
> Ross

[build@yoctoBuilder lib]$ pwd
/mnt/storage/yoctoBuilds/poky-beaglebone.git/beaglebone-db/tmp/sysroots/x86_64-nativesdk-pokysdk-linux/opt/poky/1.2+snapshot/sysroots/x86_64-pokysdk-linux/usr/lib

[build@yoctoBuilder lib]$ grep -r libXau.la *
libXext.la:dependency_libs=' 
-L=/opt/poky/1.2+snapshot/sysroots/x86_64-pokysdk-linux/usr/lib 
-L=/opt/poky/1.2+snapshot/sysroots/x86_64-pokysdk-linux/lib 
=/opt/poky/1.2+snapshot/sysroots/x86_64-pokysdk-linux/usr/lib/libX11.la 
-L=/opt/poky/1.2+snapshot/sysroots/x86_64-pokysdk-linux/usr/lib 
-L=/opt/poky/1.2+snapshot/sysroots/x86_64-pokysdk-linux/lib 
=/opt/poky/1.2+snapshot/sysroots/x86_64-pokysdk-linux/usr/lib/libxcb.la 
=/opt/poky/1.2+snapshot/sysroots/x86_64-pokysdk-linux/usr/lib/libxcb.la 
=/opt/poky/1.2+snapshot/sysroots/x86_64-pokysdk-linux/usr/lib/libXau.la 
=/opt/poky/1.2+snapshot/sysroots/x86_64-pokysdk-linux/usr/lib/libXdmcp.la =/opt/poky/1.2+snapshot/sysroots/x86_64-pokysdk-linux/usr/lib/libXau.la 
=/opt/poky/1.2+snapshot/sysroots/x86_64-pokysdk-linux/usr/lib/libXdmcp.la -ldl'
libXrandr.la:dependency_libs=' 
-L=/opt/poky/1.2+snapshot/sysroots/x86_64-pokysdk-linux/usr/lib 
-L=/opt/poky/1.2+snapshot/sysroots/x86_64-pokysdk-linux/lib 
=/opt/poky/1.2+snapshot/sysroots/x86_64-pokysdk-linux/usr/lib/libXext.la 
-L=/opt/poky/1.2+snapshot/sysroots/x86_64-pokysdk-linux/usr/lib 
-L=/opt/poky/1.2+snapshot/sysroots/x86_64-pokysdk-linux/lib 
=/opt/poky/1.2+snapshot/sysroots/x86_64-pokysdk-linux/usr/lib/libXrender.la 
=/opt/poky/1.2+snapshot/sysroots/x86_64-pokysdk-linux/usr/lib/libX11.la 
=/opt/poky/1.2+snapshot/sysroots/x86_64-pokysdk-linux/usr/lib/libX11.la 
=/opt/poky/1.2+snapshot/sysroots/x86_64-pokysdk-linux/usr/lib/libxcb.la 
=/opt/poky/1.2+snapshot/sysroots/x86_64-pokysdk-linux/usr/lib/libxcb.la 
=/opt/poky/1.2+snapshot/sysroots/x86_64-pokysdk-linux/usr/lib/libXau.la 
=/opt/poky/1.2+snapshot/sysroots/x86_64-pokysdk-linux/usr/lib/libXdmcp.la =/opt/poky/1.2+snapshot/sysroots/x86_64-pokysdk-linux/usr/lib/libXau.la 
=/opt/poky/1.2+snapshot/sysroots/x86_64-pokysdk-linux/usr/lib/libXdmcp.la -ldl'
libXrender.la:dependency_libs=' 
-L=/opt/poky/1.2+snapshot/sysroots/x86_64-pokysdk-linux/usr/lib 
-L=/opt/poky/1.2+snapshot/sysroots/x86_64-pokysdk-linux/lib 
=/opt/poky/1.2+snapshot/sysroots/x86_64-pokysdk-linux/usr/lib/libX11.la 
-L=/opt/poky/1.2+snapshot/sysroots/x86_64-pokysdk-linux/usr/lib 
-L=/opt/poky/1.2+snapshot/sysroots/x86_64-pokysdk-linux/lib 
=/opt/poky/1.2+snapshot/sysroots/x86_64-pokysdk-linux/usr/lib/libxcb.la 
=/opt/poky/1.2+snapshot/sysroots/x86_64-pokysdk-linux/usr/lib/libxcb.la 
=/opt/poky/1.2+snapshot/sysroots/x86_64-pokysdk-linux/usr/lib/libXau.la 
=/opt/poky/1.2+snapshot/sysroots/x86_64-pokysdk-linux/usr/lib/libXdmcp.la =/opt/poky/1.2+snapshot/sysroots/x86_64-pokysdk-linux/usr/lib/libXau.la 
=/opt/poky/1.2+snapshot/sysroots/x86_64-pokysdk-linux/usr/lib/libXdmcp.la -ldl'


-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



