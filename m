Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Paul.Gortmaker@windriver.com>) id 1T2R96-0005Mx-PU
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 20:19:45 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q7HI7gqb028211
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 17 Aug 2012 11:07:42 -0700 (PDT)
Received: from [128.224.146.65] (128.224.146.65) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Fri, 17 Aug 2012 11:07:43 -0700
Message-ID: <502E886E.30002@windriver.com>
Date: Fri, 17 Aug 2012 14:07:42 -0400
From: Paul Gortmaker <paul.gortmaker@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1344897787-27726-1-git-send-email-paul.gortmaker@windriver.com>
	<1345222636.27428.20.camel@ted>
In-Reply-To: <1345222636.27428.20.camel@ted>
X-Originating-IP: [128.224.146.65]
Subject: Re: [PATCH] libproxy: add dependency on glib-2.0
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
X-List-Received-Date: Fri, 17 Aug 2012 18:19:45 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 12-08-17 12:57 PM, Richard Purdie wrote:
> On Mon, 2012-08-13 at 18:43 -0400, Paul Gortmaker wrote:
>> Without this, you will get occasional build failures if libproxy
>> tries to build before the glib headers are placed in the sysroot.
>>
>> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
>>
>> diff --git a/meta/recipes-support/libproxy/libproxy_0.4.7.bb b/meta/recipes-support/libproxy/libproxy_0.4.7.bb
>> index 7e3cf27..a39e3a8 100644
>> --- a/meta/recipes-support/libproxy/libproxy_0.4.7.bb
>> +++ b/meta/recipes-support/libproxy/libproxy_0.4.7.bb
>> @@ -6,7 +6,7 @@ LICENSE = "LGPLv2.1+"
>>  LIC_FILES_CHKSUM = "file://COPYING;md5=7d7044444a7b1b116e8783edcdb44ff4 \
>>                      file://utils/proxy.c;beginline=1;endline=18;md5=55152a1006d7dafbef32baf9c30a99c0"
>>  
>> -DEPENDS = "gconf"
>> +DEPENDS = "gconf glib-2.0"
>>  
> 
> We've gone around in circles on this and had issues over circular
> dependencies. The bottom line is that we don't need glib-2.0 here, we
> want to disable the glib-2.0 using components of libproxy. I don't know

Fair enough.

Can we _finally_ fix the mailing lists to not override the To/Cc lines
with crap Reply-To: lines?  Once again I almost missed seeing this reply,
since I was no longer on the To/Cc.

AFAICT, all were in agreement that it was broken, but it never got fixed.

Thanks,
Paul.
--

> cmake well enough to know how to configure it to do this though (instead
> of autodetecting)
> 
> Cheers,
> 
> Richard
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> 
> 


