Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1SV2JA-0005oP-GW
	for openembedded-core@lists.openembedded.org;
	Thu, 17 May 2012 17:08:05 +0200
Received: from mail-lb0-f180.google.com ([209.85.217.180])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 17 May 2012 07:56:55 -0700
Received: by lbbgh12 with SMTP id gh12so1255484lbb.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2012 07:56:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding:x-gm-message-state;
	bh=lalK14CU0Yqpa18n07kW+3dEwf7xKLvE1vDm5VuW+H4=;
	b=cCLNoHyo2UOfqmIZ/TXvgG2ibF3xsuQ07FyaEkaqjoky0zP03qpBbqZ2E1cRIu02Yp
	c78Eri7A/F5YvVaXpQcib/bXS5HcSXyTLy4CTXYOsri+2FigOGrbBdQkSzF7/fSpFqo2
	E+0TKBtNSscJcfnOsx4jRiUmsMInGlLVYomAS0vadnJKa7cNsb2L+pCTb35TT07UpG7m
	cIHS8dQ6rIcNpB31BA1W+ioDKDpIurFE/DKkyovPRTmr14h2nf82u7vyK8YUnujJl7Gu
	FPKcebJbsEeOC8Tm7S9V5YigHUPAPM3fuOpwrKe0hMGu8Tc1B+JrLlB5repJB0VygrYM
	Tm7g==
MIME-Version: 1.0
Received: by 10.112.83.228 with SMTP id t4mr3224471lby.74.1337266613704; Thu,
	17 May 2012 07:56:53 -0700 (PDT)
Received: by 10.112.107.137 with HTTP; Thu, 17 May 2012 07:56:53 -0700 (PDT)
In-Reply-To: <4FB50005.7000807@gherzan.ro>
References: <CAK18fxECi+PxHhW8pAm2URRE1ZF=h2_gEPXMvvioTQnhKGWYHw@mail.gmail.com>
	<CADkTA4MXvMJt=JhDKdjDR9o3nkYVWmfnEmRnC1cheju6Tbh0Sw@mail.gmail.com>
	<4FB50005.7000807@gherzan.ro>
Date: Thu, 17 May 2012 07:56:53 -0700
Message-ID: <CAPhnLPDzZfuRBKxR3Ru+2nvozRy4evhmtFUf2d-NmqNwY4RjZw@mail.gmail.com>
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQkzagl4s7ITVV7q3xv0xFlQaxzGUKCCTRXLhTQYlBTv7R6oPFAxRnL54ExsNsEbnOKOclom
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
X-List-Received-Date: Thu, 17 May 2012 15:08:05 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, May 17, 2012 at 6:41 AM, Andrei Gherzan <andrei@gherzan.ro> wrote:
> On 05/17/2012 04:38 PM, Bruce Ashfield wrote:
>>
>> On Thu, May 17, 2012 at 6:09 AM, Andrei Gherzan<andrei@gherzan.ro> =A0wr=
ote:
>>>
>>> Today i ran into an issue that Florin Sarbu signaled sometime last week=
.
>>> It
>>> seems like do_patch crashes while compiling linux 3.0:
>>>
>>> ERROR: Logfile of failure stored in:
>>>
>>> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/work/vexpressa9-poky=
-linux-gnueabi/linux-yocto-3.0.24+git1+34e0d2b4b4e9778b31f9ea99ca43f0dc71a7=
ee23_1+6b4bf6173b0bd2d1619a8218bac66ebc4681dd35-r4/temp/log.do_patch.10864
>>> Log data follows:
>>> | Branch meta-temp set up to track remote branch meta from origin.
>>> | git reset --mixed 620917de59eeb934b9f8cf35cc2d95c1ac8ed0fc
>>> | Deleted branch meta-temp (was 620917d).
>>> |
>>>
>>> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/=
usr/bin/updateme:
>>> line 434: yocto/standard/beagleboard-standard.scc: No such file or
>>> directory
>>> |
>>>
>>> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/=
usr/bin/updateme:
>>> line 436: yocto/standard/beagleboard-standard.scc: No such file or
>>> directory
>>> |
>>>
>>> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/=
usr/bin/updateme:
>>> line 437: yocto/standard/beagleboard-standard.scc: No such file or
>>> directory
>>> |
>>>
>>> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/=
usr/bin/updateme:
>>> line 438: yocto/standard/beagleboard-standard.scc: No such file or
>>> directory
>>> |
>>>
>>> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/=
usr/bin/updateme:
>>> line 441: yocto/standard/beagleboard-standard.scc: No such file or
>>> directory
>>> | readlink: missing operand
>>> | Try `readlink --help' for more information.
>>> |
>>>
>>> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/=
usr/bin/scc:
>>> line 399: yocto/standard/beagleboard-standard: No such file or director=
y
>>> |
>>>
>>> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/=
usr/bin/scc:
>>> line 399: yocto/standard/beagleboard-standard: No such file or director=
y
>>> |
>>>
>>> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/=
usr/bin/scc:
>>> line 399: yocto/standard/beagleboard-standard: No such file or director=
y
>>> |
>>>
>>> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/=
usr/bin/scc:
>>> line 399: yocto/standard/beagleboard-standard: No such file or director=
y
>>> |
>>>
>>> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/=
usr/bin/scc:
>>> line 399: yocto/standard/beagleboard-standard: No such file or director=
y
>>> |
>>>
>>> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/=
usr/bin/scc:
>>> line 399: yocto/standard/beagleboard-standard: No such file or director=
y
>>> |
>>>
>>> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/=
usr/bin/scc:
>>> line 399: yocto/standard/beagleboard-standard: No such file or director=
y
>>> |
>>>
>>> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/=
usr/bin/scc:
>>> line 399: yocto/standard/beagleboard-standard: No such file or director=
y
>>> |
>>>
>>> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/=
usr/bin/scc:
>>> line 399: yocto/standard/beagleboard-standard: No such file or director=
y
>>> |
>>>
>>> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/=
usr/bin/scc:
>>> line 399: yocto/standard/beagleboard-standard: No such file or director=
y
>>> |
>>>
>>> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/=
usr/bin/scc:
>>> line 399: yocto/standard/beagleboard-standard: No such file or director=
y
>>> |
>>>
>>> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/=
usr/bin/scc:
>>> line 399: yocto/standard/beagleboard-standard: No such file or director=
y
>>> |
>>>
>>> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/=
usr/bin/scc:
>>> line 399: yocto/standard/beagleboard-standard: No such file or director=
y
>>> |
>>>
>>> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/=
usr/bin/scc:
>>> line 399: yocto/standard/beagleboard-standard: No such file or director=
y
>>> |
>>>
>>> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/=
usr/bin/scc:
>>> line 399: yocto/standard/beagleboard-standard: No such file or director=
y
>>> |
>>>
>>> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/=
usr/bin/scc:
>>> line 399: yocto/standard/beagleboard-standard: No such file or director=
y
>>> |
>>>
>>> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/=
usr/bin/scc:
>>> line 399: yocto/standard/beagleboard-standard: No such file or director=
y
>>> |
>>>
>>> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/=
usr/bin/scc:
>>> line 399: yocto/standard/beagleboard-standard: No such file or director=
y
>>> |
>>>
>>> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/=
usr/bin/scc:
>>> line 399: yocto/standard/beagleboard-standard: No such file or director=
y
>>> | /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmERROR: Function
>>> failed:
>>> do_patch (see
>>>
>>> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/work/vexpressa9-poky=
-linux-gnueabi/linux-yocto-3.0.24+git1+34e0d2b4b4e9778b31f9ea99ca43f0dc71a7=
ee23_1+6b4bf6173b0bd2d1619a8218bac66ebc4681dd35-r4/temp/log.do_patch.10864
>>> for further information)
>>> | p/sysroots/i686-linux/usr/bin/scc: line 399:
>>> yocto/standard/beagleboard-standard: No such file or directory
>>> |
>>>
>>> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/=
usr/bin/scc:
>>> line 399: yocto/standard/beagleboard-standard: No such file or director=
y
>>> |
>>>
>>> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/=
usr/bin/scc:
>>> line 399: yocto/standard/beagleboard-standard: No such file or director=
y
>>> |
>>>
>>> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/=
usr/bin/scc:
>>> line 399: yocto/standard/beagleboard-standard: No such file or director=
y
>>> |
>>>
>>> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/=
usr/bin/scc:
>>> line 399: yocto/standard/beagleboard-standard: No such file or director=
y
>>> |
>>>
>>> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/=
usr/bin/scc:
>>> line 399: yocto/standard/beagleboard-standard: No such file or director=
y
>>> |
>>>
>>> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/=
usr/bin/scc:
>>> line 399: yocto/standard/beagleboard-standard: No such file or director=
y
>>> |
>>>
>>> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/=
usr/bin/scc:
>>> line 399: yocto/standard/beagleboard-standard: No such file or director=
y
>>> |
>>>
>>> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/=
usr/bin/scc:
>>> line 399: yocto/standard/beagleboard-standard: No such file or director=
y
>>> |
>>>
>>> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/=
usr/bin/scc:
>>> line 399: yocto/standard/beagleboard-standard: No such file or director=
y
>>> |
>>>
>>> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/=
usr/bin/scc:
>>> line 399: yocto/standard/beagleboard-standard: No such file or director=
y
>>> |
>>>
>>> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/=
usr/bin/scc:
>>> line 399: yocto/standard/beagleboard-standard: No such file or director=
y
>>> |
>>>
>>> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/=
usr/bin/scc:
>>> line 399: yocto/standard/beagleboard-standard: No such file or director=
y
>>> |
>>>
>>> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/=
usr/bin/scc:
>>> line 399: yocto/standard/beagleboard-standard: No such file or director=
y
>>> |
>>>
>>> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/=
usr/bin/scc:
>>> line 399: yocto/standard/beagleboard-standard: No such file or director=
y
>>> |
>>>
>>> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/=
usr/bin/scc:
>>> line 399: yocto/standard/beagleboard-standard: No such file or director=
y
>>> | ERROR. Could not find an excutable target for yocto/standard/base
>>> | ERROR. Could not locate meta series for yocto/standard/beagleboard
>>> | ERROR. Could not modify yocto/standard/base
>>> NOTE: package
>>>
>>> linux-yocto-3.0.24+git1+34e0d2b4b4e9778b31f9ea99ca43f0dc71a7ee23_1+6b4b=
f6173b0bd2d1619a8218bac66ebc4681dd35-r4:
>>> task do_patch: Failed
>>>
>>> I didn't have time to understand were is the source of this problem but=
 i
>>> suspect that is a sever-sided issue as this was reproducible yesterday
>>> even
>>> if i didn't change anything in layers.
>>
>> I should remember to read all the way to the bottom :) I just
>> configured and built the beagle
>> board here, out of master. But my kernel is already fetched and
>> complete, so I didn't
>> run into any issues.
>>
>> We've got other reports of the servers pushing out a zero byte file
>> for the kernel tree
>> (again), so that very well could be what is happening here as well.
>>
>
> That's my opinion as well. I think what we got from server is corrupted.

I've seen reports of this but haven't been able to replicate it. I'll
look at the server today and see if there is something going on from
that end, however:

518M May 15 23:21 git2_git.yoctoproject.org.linux-yocto-3.0.git.tar.gz
620M May 16 00:13 git2_git.yoctoproject.org.linux-yocto-3.0.tar.gz

So at least as of yesterday, the tarballs exist and were not 0 byte

-b

> Anyway i'm was talking about a vexpressa9 machine based on beagleboard
> kernel.
> Hope somebody will find the fast fix for this. We need it asap.
>
>
> @g
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



--=20
Elizabeth Flanagan
Yocto Project
Build and Release


