Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id 5D9C37706D
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Jan 2016 23:11:42 +0000 (UTC)
Received: by mail-pa0-f43.google.com with SMTP id cy9so70735862pac.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Jan 2016 15:11:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-type:content-transfer-encoding;
	bh=+2maHQKi4DLPIlCJ8bovqCvw/sgg3FMnHPUrg7lzSnE=;
	b=LvHrj0xlDjcc/D0rJJiRghmwyoJC12uwy4yepZoRsJ2W8zL2yN45kzGjkX7y3pZtop
	p+VrBh9uSeIw/gJXrkuB6TdjHq2EGLjvBjMbifhMtvqV8G0XDpE89OPHIhrNW5EZC0ie
	IN4QJQdRf/+1bfzAzyCowI6h8HWDs5PjLadcRMQLkCkr6CASZvoOa87e0GPQnh2eHhTF
	4j3na1s0ezcnL+g3PqnCSYUUjzTzFrtTtMQXipj9mbUvrGMcWZi09wj3TunqKu5orL7i
	rikUcOUdtxmPIb/Vq9SspprwYHNtDLpPiLynl1oaoWimzaeUQqFPlCcvnQ1cgpusU4GM
	7Ncg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=+2maHQKi4DLPIlCJ8bovqCvw/sgg3FMnHPUrg7lzSnE=;
	b=OJkLEJ2S3tRRE1DVvL7sBf8lw9S/UL6QtZvlU/iG/m05OnGOuU12xnQ19kyr8ZHLBO
	ZlvDroh4KeIDrFmNDrLE7kTl5IpbxZSypTlBW/uNCBoFew8LEDH9nIUUJHgKyr+sQBzt
	z+CBLzcFKnR5fR9rZZ0gUCJdz6gWOwgcb8pIEMeyLd4276LdrN/6hhyl0OpbnjLOXKg8
	shvlVf5u6/kNOTC952xHpeq+M8qR/ZBWrMWyFLCjzjmMc3ClmqRPk9xMV0omdU1Tg5XP
	5jvKOO/Vp9g3APX8qrGBxvNh7GF7Ol5HOI+qt/eL1clibACRso4unI86JRtX1hz8HJoZ
	aDTA==
X-Gm-Message-State: AG10YOQ76OS1TuTkeIBmxlhfQRc0Ng2HkShiOK4paROKlLteV50LVpylNJ7zjDcUmGSZUw==
X-Received: by 10.66.149.7 with SMTP id tw7mr21745982pab.72.1453677103725;
	Sun, 24 Jan 2016 15:11:43 -0800 (PST)
Received: from ?IPv6:2601:202:4000:1239:b584:3e69:b68e:9dba?
	([2601:202:4000:1239:b584:3e69:b68e:9dba])
	by smtp.googlemail.com with ESMTPSA id
	m87sm23743431pfi.47.2016.01.24.15.11.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 24 Jan 2016 15:11:42 -0800 (PST)
To: "Jolley, Stephen K" <stephen.k.jolley@intel.com>,
	"yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <9ADD3FDE8B189B4AA2F8A3C711F8155E56FAE346@fmsmsx111.amr.corp.intel.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <56A55A21.50504@gmail.com>
Date: Sun, 24 Jan 2016 15:11:29 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <9ADD3FDE8B189B4AA2F8A3C711F8155E56FAE346@fmsmsx111.amr.corp.intel.com>
Subject: Re: Yocto Project Status WW04
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
X-List-Received-Date: Sun, 24 Jan 2016 23:11:43 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 01/22/2016 08:29 AM, Jolley, Stephen K wrote:
> Current Dev Position: YP 2.1 M2
> Next Deadline: YP 2.1 M2 Cutoff (Feature Freeze) date is January 25, 2016 noon GMT
> 
> SWAT team rotation: Randy -> Benjamin
> https://wiki.yoctoproject.org/wiki/Yocto_Build_Failure_Swat_Team
> 
> Key Status/Updates:
> 
>   *   Yocto Project 2.0.1 was successfully built and is due out of QA soon, likely to release next week.
>   *   Yocto Project 2.1 M2 cutoff is on Monday, please ensure any patches expected to be in M2 are sent to the mailing list for review before then.
>   *   We are looking pretty up to date with patch review/processing although there is a large queue in -next pending final checks but which should merge soon.
>   *   We are keeping an eye on CVEs and ensuring they get merged to various branches as we can find the bandwidth but we're low on manpower for this.

What CVEs need merging? New ones or ones submitted for stable branches?

- armin


>   *   I'd like to highlight that there are increasing numbers of stack overflow questions about the project and help in providing good answers on there would be appreciated.
>   *   WDD and bug trend continue to rise to new heights. We are simply receiving more bugs than we have resources to fix/close.
> 
> Key YP 2.1 Dates:
> YP 2.1 M2 Cutoff (Feature Freeze) date is January 25, 2016 noon GMT
> YP 2.1 M2 Target release date is February 12, 2016
> YP 2.1 M3 Cutoff (Feature Freeze) date is February 29, 2016 noon GMT
> YP 2.1 M3 Target release date is March 18, 2016
> YP 2.1 M4 / Final Cutoff: March 28, 2016 noon GMT - Stabilization only milestone.
> YP 2.1 Final Release Target: April 29, 2016
> 
> Key Status Links for YP:
> https://wiki.yoctoproject.org/wiki/Yocto_Project_v2.1_Status
> https://wiki.yoctoproject.org/wiki/Yocto_2.1_Schedule
> https://wiki.yoctoproject.org/wiki/Yocto_2.1_Features
> 
> Tracking Metrics:
>             WDD 2581 (last week 2524 )
> (https://wiki.yoctoproject.org/charts/combo.html)
> 
> [If anyone has suggestions for other information you'd like to see on this weekly status update, let us know!]
> 
> Thanks,
> 
> Stephen K. Jolley
> Yocto Project Program Manager
> INTEL, MS JF1-255, 2111 N.E. 25th Avenue, Hillsboro, OR 97124
> *   Work Telephone:          (503) 712-0534
> *    Cell:                                (208) 244-4460
> * Email:                             stephen.k.jolley@intel.com
> 
> 
> 
> 

