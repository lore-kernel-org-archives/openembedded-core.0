Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1SPKav-0008Pe-BD
	for openembedded-core@lists.openembedded.org;
	Tue, 01 May 2012 23:26:49 +0200
Received: from mail-pb0-f52.google.com ([209.85.160.52])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 01 May 2012 14:17:04 -0700
Received: by pbbro8 with SMTP id ro8so11087606pbb.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 May 2012 14:17:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=j5VIVHubNv6tU//qflcwSvRJVN6a71vkMWlkj09YuCg=;
	b=f8OlRoexAGP+YgmtLGrh/P7FTO/BcSN93BWBH6+kdIrzesSqrnLpALYCf8LkzeAMRG
	3wlIP1wwRP7tYIwcD9l6H1Z3BB10BwspFP+bRaT8rEI2bTPSdlDCMJodCRGgOGmOFCVq
	s2FxJv0gZI/R86UN3BFMF2oFyEHbJnHRzH0C2BKti4YFBEAyXtYO12HoV1elQwAhnMsH
	OS9EC0WK14H+R8EbhrQWgvjL5hhEECdvAbMQLW+rq05P2FexP49ti5Xp5FWPEQfHb7QI
	U+q7Vg//vMtWlJld2lbLm2u+ucUQX33eki1Jqhu72OsO3mHP0bqBlhlYV6WNxVUsrTYo
	vpVw==
Received: by 10.68.211.197 with SMTP id ne5mr17937405pbc.143.1335907023888;
	Tue, 01 May 2012 14:17:03 -0700 (PDT)
Received: from [10.1.10.192] (c-50-137-42-92.hsd1.or.comcast.net.
	[50.137.42.92])
	by mx.google.com with ESMTPS id tx9sm9323145pbc.10.2012.05.01.14.17.01
	(version=SSLv3 cipher=OTHER); Tue, 01 May 2012 14:17:02 -0700 (PDT)
Message-ID: <4FA052CB.6050508@intel.com>
Date: Tue, 01 May 2012 14:16:59 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: yocto@yoctoproject.org
References: <4FA001F0.7010705@intel.com>
In-Reply-To: <4FA001F0.7010705@intel.com>
X-Gm-Message-State: ALoCoQmlff745Edw3DNeipnuZB28drKwiRETABYUoBwcL92wT2sSta80dZt1vuzy414TrF9mugET
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Yocto Project 1.2.1 release plan.
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
X-List-Received-Date: Tue, 01 May 2012 21:26:49 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/01/2012 08:32 AM, Scott Garman wrote:
> Richard has already started pulling in some patches from master into the
> denzil-next branch on oe-core:
>
> http://git.openembedded.org/openembedded-core/log/?h=denzil-next
>
> I'll be merging these on an ongoing basis into my sgarman/denzil-next
> branch in the poky-contrib repo:
>
> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=sgarman/denzil-next

Sorry about this folks - my denzil-next branch was based on oe-core and 
not poky. So I've just deleted the branch and will be re-creating it 
shortly.

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


