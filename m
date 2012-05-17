Received: from mail-qc0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SV174-0008QW-V1
	for openembedded-core@lists.openembedded.org;
	Thu, 17 May 2012 15:51:31 +0200
Received: by qcso7 with SMTP id o7so1222267qcs.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2012 06:41:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=iobE30rk3BG2GPzhDmah06hUWzJwswEs/N+BijNBb3Q=;
	b=Q43+YcM/kyBJ4GCjOkTlKgL438qI/7sztH4yd8ugyWgANdsnSUodtVtpl6OYLV8KKQ
	FyVyT/rO68oYN/b1qBTGQ9oZMztLTEUgquxUOW8G5BQZy2ovvtlkVEGFXYIwKhjAc4R4
	5yxTHYvwx87f3YKXHUO58k99LiOs8pZM2pvejemfsebc3wC+QIKPIPUx4H6lFjvt2Cdg
	fvBY6M+guCmtgHHwC/0kpao6WR/SZW5q1tiielycuCexnM1bqIrZFZb/IrfS+gydn0AK
	yHQSMlMw84hsR/6a2W/OGCIHMkeROaMYxBYS7FeTRd/oAcGwvRXLf8idi5YfB3vr74Th
	iXiw==
Received: by 10.229.135.136 with SMTP id n8mr3338518qct.135.1337262087800;
	Thu, 17 May 2012 06:41:27 -0700 (PDT)
Received: from [128.224.170.221] ([89.121.200.106])
	by mx.google.com with ESMTPS id ej8sm14840916qab.15.2012.05.17.06.41.26
	(version=SSLv3 cipher=OTHER); Thu, 17 May 2012 06:41:27 -0700 (PDT)
Message-ID: <4FB50005.7000807@gherzan.ro>
Date: Thu, 17 May 2012 16:41:25 +0300
From: Andrei Gherzan <andrei@gherzan.ro>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <CAK18fxECi+PxHhW8pAm2URRE1ZF=h2_gEPXMvvioTQnhKGWYHw@mail.gmail.com>
	<CADkTA4MXvMJt=JhDKdjDR9o3nkYVWmfnEmRnC1cheju6Tbh0Sw@mail.gmail.com>
In-Reply-To: <CADkTA4MXvMJt=JhDKdjDR9o3nkYVWmfnEmRnC1cheju6Tbh0Sw@mail.gmail.com>
X-Gm-Message-State: ALoCoQlgBTw48qsHExFHQtZPQdMwhWnXWG1kOFgHkeLGAS/rmMshvsLUSHWW45uyuQWDvHUw5qvG
Subject: Re: Linux-yocto 3.0 crashes at do_patch...
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
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
X-List-Received-Date: Thu, 17 May 2012 13:51:31 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/17/2012 04:38 PM, Bruce Ashfield wrote:
> On Thu, May 17, 2012 at 6:09 AM, Andrei Gherzan<andrei@gherzan.ro>  wrote:
>> Today i ran into an issue that Florin Sarbu signaled sometime last week. It
>> seems like do_patch crashes while compiling linux 3.0:
>>
>> ERROR: Logfile of failure stored in:
>> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/work/vexpressa9-poky-linux-gnueabi/linux-yocto-3.0.24+git1+34e0d2b4b4e9778b31f9ea99ca43f0dc71a7ee23_1+6b4bf6173b0bd2d1619a8218bac66ebc4681dd35-r4/temp/log.do_patch.10864
>> Log data follows:
>> | Branch meta-temp set up to track remote branch meta from origin.
>> | git reset --mixed 620917de59eeb934b9f8cf35cc2d95c1ac8ed0fc
>> | Deleted branch meta-temp (was 620917d).
>> |
>> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/updateme:
>> line 434: yocto/standard/beagleboard-standard.scc: No such file or directory
>> |
>> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/updateme:
>> line 436: yocto/standard/beagleboard-standard.scc: No such file or directory
>> |
>> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/updateme:
>> line 437: yocto/standard/beagleboard-standard.scc: No such file or directory
>> |
>> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/updateme:
>> line 438: yocto/standard/beagleboard-standard.scc: No such file or directory
>> |
>> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/updateme:
>> line 441: yocto/standard/beagleboard-standard.scc: No such file or directory
>> | readlink: missing operand
>> | Try `readlink --help' for more information.
>> |
>> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
>> line 399: yocto/standard/beagleboard-standard: No such file or directory
>> |
>> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
>> line 399: yocto/standard/beagleboard-standard: No such file or directory
>> |
>> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
>> line 399: yocto/standard/beagleboard-standard: No such file or directory
>> |
>> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
>> line 399: yocto/standard/beagleboard-standard: No such file or directory
>> |
>> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
>> line 399: yocto/standard/beagleboard-standard: No such file or directory
>> |
>> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
>> line 399: yocto/standard/beagleboard-standard: No such file or directory
>> |
>> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
>> line 399: yocto/standard/beagleboard-standard: No such file or directory
>> |
>> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
>> line 399: yocto/standard/beagleboard-standard: No such file or directory
>> |
>> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
>> line 399: yocto/standard/beagleboard-standard: No such file or directory
>> |
>> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
>> line 399: yocto/standard/beagleboard-standard: No such file or directory
>> |
>> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
>> line 399: yocto/standard/beagleboard-standard: No such file or directory
>> |
>> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
>> line 399: yocto/standard/beagleboard-standard: No such file or directory
>> |
>> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
>> line 399: yocto/standard/beagleboard-standard: No such file or directory
>> |
>> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
>> line 399: yocto/standard/beagleboard-standard: No such file or directory
>> |
>> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
>> line 399: yocto/standard/beagleboard-standard: No such file or directory
>> |
>> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
>> line 399: yocto/standard/beagleboard-standard: No such file or directory
>> |
>> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
>> line 399: yocto/standard/beagleboard-standard: No such file or directory
>> |
>> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
>> line 399: yocto/standard/beagleboard-standard: No such file or directory
>> |
>> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
>> line 399: yocto/standard/beagleboard-standard: No such file or directory
>> | /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmERROR: Function failed:
>> do_patch (see
>> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/work/vexpressa9-poky-linux-gnueabi/linux-yocto-3.0.24+git1+34e0d2b4b4e9778b31f9ea99ca43f0dc71a7ee23_1+6b4bf6173b0bd2d1619a8218bac66ebc4681dd35-r4/temp/log.do_patch.10864
>> for further information)
>> | p/sysroots/i686-linux/usr/bin/scc: line 399:
>> yocto/standard/beagleboard-standard: No such file or directory
>> |
>> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
>> line 399: yocto/standard/beagleboard-standard: No such file or directory
>> |
>> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
>> line 399: yocto/standard/beagleboard-standard: No such file or directory
>> |
>> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
>> line 399: yocto/standard/beagleboard-standard: No such file or directory
>> |
>> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
>> line 399: yocto/standard/beagleboard-standard: No such file or directory
>> |
>> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
>> line 399: yocto/standard/beagleboard-standard: No such file or directory
>> |
>> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
>> line 399: yocto/standard/beagleboard-standard: No such file or directory
>> |
>> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
>> line 399: yocto/standard/beagleboard-standard: No such file or directory
>> |
>> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
>> line 399: yocto/standard/beagleboard-standard: No such file or directory
>> |
>> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
>> line 399: yocto/standard/beagleboard-standard: No such file or directory
>> |
>> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
>> line 399: yocto/standard/beagleboard-standard: No such file or directory
>> |
>> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
>> line 399: yocto/standard/beagleboard-standard: No such file or directory
>> |
>> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
>> line 399: yocto/standard/beagleboard-standard: No such file or directory
>> |
>> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
>> line 399: yocto/standard/beagleboard-standard: No such file or directory
>> |
>> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
>> line 399: yocto/standard/beagleboard-standard: No such file or directory
>> |
>> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
>> line 399: yocto/standard/beagleboard-standard: No such file or directory
>> | ERROR. Could not find an excutable target for yocto/standard/base
>> | ERROR. Could not locate meta series for yocto/standard/beagleboard
>> | ERROR. Could not modify yocto/standard/base
>> NOTE: package
>> linux-yocto-3.0.24+git1+34e0d2b4b4e9778b31f9ea99ca43f0dc71a7ee23_1+6b4bf6173b0bd2d1619a8218bac66ebc4681dd35-r4:
>> task do_patch: Failed
>>
>> I didn't have time to understand were is the source of this problem but i
>> suspect that is a sever-sided issue as this was reproducible yesterday even
>> if i didn't change anything in layers.
> I should remember to read all the way to the bottom :) I just
> configured and built the beagle
> board here, out of master. But my kernel is already fetched and
> complete, so I didn't
> run into any issues.
>
> We've got other reports of the servers pushing out a zero byte file
> for the kernel tree
> (again), so that very well could be what is happening here as well.
>

That's my opinion as well. I think what we got from server is corrupted. 
Anyway i'm was talking about a vexpressa9 machine based on beagleboard 
kernel.
Hope somebody will find the fast fix for this. We need it asap.

@g


