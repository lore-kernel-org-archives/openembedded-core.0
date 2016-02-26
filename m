Return-Path: <philip@balister.org>
Received: from sanddollar.geekisp.com (sanddollar.geekisp.com
	[216.168.135.167])
	by mail.openembedded.org (Postfix) with SMTP id 301B37744C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Feb 2016 18:45:10 +0000 (UTC)
Received: (qmail 4340 invoked by uid 1003); 26 Feb 2016 18:45:11 -0000
Received: from unknown (HELO ?192.168.11.140?)
	(philip@opensdr.com@71.171.15.136)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	26 Feb 2016 18:45:10 -0000
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <1456508168.11498.95.camel@linuxfoundation.org>
From: Philip Balister <philip@balister.org>
Message-ID: <56D09D35.8040002@balister.org>
Date: Fri, 26 Feb 2016 13:45:09 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <1456508168.11498.95.camel@linuxfoundation.org>
Subject: Re: Yocto Project Status WW09
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
X-List-Received-Date: Fri, 26 Feb 2016 18:45:11 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit

On 02/26/2016 12:36 PM, Richard Purdie wrote:
> Current Dev Position: YP 2.1 M3
> Next Deadline: YP 2.1 M3 Cutoff (Feature Freeze) February 29, 2016
>  
> SWAT team rotation: Tracy -> Alejandero
> https://wiki.yoctoproject.org/wiki/Yocto_Build_Failure_Swat_Team
>  
> Key Status/Updates:
> * 2.1 Feature Freeze is upon us. If there is any feature you want to 
>   see in 2.1 which isn't going to make the deadline, talk to RP.
> * We plan to release 2.1 M2 despite the sato glib issue, granting an
>   exception for the high bug and then  concentrate on 2.1 M3.
> * 2.1 M3 build won't happen until sato glib issue resolved.
> * Also planning to merge the gobject-introspection changes 
> * Pseudo connection issue appears to be addressed with increased retry 
>   numbers. Tests ongoing.
> * We're about to try and transition meta-yocto within meta-yocto to 
>   meta-poky. The amount of pain this is causing is horrible :(.

Thanks for doing this. Can you summarize the pain? Are there any
important lessons here?

Philip

> * We're considering a bump in the minimum git version requirements 
>   due to the requirements of various pieces of project tooling.
> * We're rebuilding jethro 2.0.1 due to the glibc security issue, now 
>   at -rc7.
>  
> Key YP 2.1 Dates:
> YP 2.1 M2 Target release date is February 12, 2016 (Will slip a few
> weeks.)
> YP 2.1 M3 Cutoff (Feature Freeze) date is February 29, 2016 noon GMT
> YP 2.1 M3 Target release date is March 18, 2016
> YP 2.1 M4 / Final Cutoff: March 28, 2016 noon GMT - Stabilization only
> milestone.
> YP 2.1 Final Release Target: April 29, 2016
>  
> Key Status Links for YP:
> https://wiki.yoctoproject.org/wiki/Yocto_Project_v2.1_Status
> https://wiki.yoctoproject.org/wiki/Yocto_2.1_Schedule
> https://wiki.yoctoproject.org/wiki/Yocto_2.1_Features
>  
> Tracking Metrics:
>             WDD 2565 (last week 2585)
> (https://wiki.yoctoproject.org/charts/combo.html)
>  
> [If anyone has suggestions for other information you’d like to see on
> this weekly status update, let us know!]
>  
> Thanks,
>  
> Richard
> 
> 
> 
> 
> 

