Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f65.google.com (mail-pa0-f65.google.com
	[209.85.220.65])
	by mail.openembedded.org (Postfix) with ESMTP id BEB2E606D0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2016 15:47:57 +0000 (UTC)
Received: by mail-pa0-f65.google.com with SMTP id dx3so6329024pab.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2016 08:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=2apEiWA8UtgE5+KiEeC4aeYlwywJpB0OYDwrqKOluK4=;
	b=xf6sme2wQclhXgkr3g7Ub+3bR81zOa2qFsf4N1mBf1hyuLdELHdHid1qUBMTVEFpjx
	aL26omCvSviq854dof/tFVTQ3t4ohAi+D9xkWE41YLZk2TlDMdok3xh9QDL0Z3UJE1VX
	uPNBLDNn9UJGspJV652CXIHFo5jACHbEkPJvDjizJCbmDcH2tG5T86rDrEm8dsInnt6M
	Zus8DnosJGZUkzgJF65kiK9H0XYK/F9zBLfPzx6s/y85suTgde+pvppNTeOogd4e55R/
	nmOAVUxjRAwffUcWqU2uStn62sYWLmPkyw7xH0D2VHN8YxK3SrogbQp0ZXapf6MVlsMY
	7wiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=2apEiWA8UtgE5+KiEeC4aeYlwywJpB0OYDwrqKOluK4=;
	b=Mm91LErPm720E4+9veyTwMR5BLgt82TXn1rNnM7fvhpFv4ZVkfHXGqSkggSp4nrOUf
	rxJ0+Cit2N+hpOUX+ojhNE1ApwVaB5etbk0wUgmRa3APl9k0Rxju6K0FNbJKcO6naWoi
	PrMZQaSaKcGGDQf11znI1eCUrPsJ7I2fqNSpBqpmf8W4zOADAVbltuqzKM4AbEj3F5cA
	X7RN6XVKzjG+eHYF1IP+I0N6oVghppP4vyesGq8f/8gOasdoMd+KoUrw5YMu2N2Qy0et
	Xi4oc/r9/e3nzOjvNIk23C+9wghP19FHJk6KwDS14JCrbc/q+FEqGDh0VaKKbGwOKIhj
	BEvA==
X-Gm-Message-State: ALyK8tJqeEisAByrhWMv5eLd/qu9nPz73BiPZL+wk2BAYNKOm2yy23CTY5jBYBz09HKz0w==
X-Received: by 10.66.170.44 with SMTP id aj12mr33047320pac.131.1468597678471; 
	Fri, 15 Jul 2016 08:47:58 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:194d:2232:d2ef:3b9c?
	([2601:202:4001:9ea0:194d:2232:d2ef:3b9c])
	by smtp.googlemail.com with ESMTPSA id
	lf11sm5644055pab.17.2016.07.15.08.47.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Jul 2016 08:47:57 -0700 (PDT)
To: Saul Wold <sgw@linux.intel.com>, Yocto Discussion <yocto@yoctoproject.org>,
	OpenEmbedded List <openembedded-core@lists.openembedded.org>
References: <1468596746.6912.772.camel@linux.intel.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <578905AB.4090701@gmail.com>
Date: Fri, 15 Jul 2016 08:47:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <1468596746.6912.772.camel@linux.intel.com>
Subject: Re: [yocto] Yocto Project Status WW29
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
X-List-Received-Date: Fri, 15 Jul 2016 15:48:01 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit



On 07/15/2016 08:32 AM, Saul Wold wrote:
> 
> Current Dev Position: YP 2.2 M2
> Next Deadline: YP 2.2 M2 cut off would
> be: 7/18/16 (This coming Monday - 5:00pm GMT)
> 
> SWAT team rotation: Paul -> Ross
> https://wiki.yoctoproject.org/wiki/Yoct
> o_Build_Failure_Swat_Team
> 
> Key Status/Updates:
>  * Richard has been out this week, so the report will be thin.
>  * Performance regressions were narrowed down to the GCC6 Update, movingto GTK3 and the Python3 port. Investigation into how to mitigate thisis ongoing.
>  * We’re considering removing uclibc and GCC 5.4 (preferring musl and GCC6) from OE Core 2.2, so if this would impact you please speak up.
>  * 2.1.1 Completed QA, but there was a High found to do with supportingFedora 24, which released very soon after 2.1 initially released andshould be a supported build host. This will delay 2.1.1 until after M2QA is completed.

Any idea on an ETA on M2QA will start. Since 2.1.1 is being delayed,
does that open the door for more back ports not related to the F24 fixes ?

- armin

>  * Reminder that the M2 cut off is this coming Monday!
> 
> Key YP 2.2 Dates:
>  * YP 2.2 M1 release would be: 6/24/16
>  * YP 2.2 M2 cut off would be: 7/18/16
>  * YP 2.2 M2 release would be: 7/29/16
>  * YP 2.2 M3 cut off would be: 8/29/16
>  * YP 2.2 M3 release would be: 9/9/16
>  * YP 2.2 M4 cut off would be: 10/3/16
>  * YP 2.2 M4 release would be: 10/28/16
> 
> Tracking Metrics:
> 	WDD 2698 (last week 2747)
> (https://wiki.yoctoproject.org/charts/combo.html)
> 
> Key Status Links for YP:
> https://wiki.yoctoproject.org/wiki/Yocto_Project_v2.2_Status
> https://wiki.yoctoproject.org/wiki/Yocto_2.2_Schedule
> https://wiki.yoctoproject.org/wiki/Yocto_2.2_Features
> 
> [If anyone has suggestions for other information you’d like to see on this weekly status update, let us know!]
> 
> 
> 
> 

