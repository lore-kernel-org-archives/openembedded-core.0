Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SOsYN-0000YD-2S
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Apr 2012 17:30:19 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q3UFKZhA028712
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Apr 2012 08:20:35 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.235) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Mon, 30 Apr 2012 08:20:35 -0700
Message-ID: <4F9EADC4.7030401@windriver.com>
Date: Mon, 30 Apr 2012 10:20:36 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:12.0) Gecko/20120420 Thunderbird/12.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <CAMKF1sq94g5aaYPQZ=UZtBT6iBxCMJ7ZrKer=gaCVoEjV=eWKA@mail.gmail.com>
	<1335451639.20130.18.camel@ted> <1335468645.20130.27.camel@ted>
	<1335474399.20130.35.camel@ted>
	<CAMKF1so6gABH-H9uZ2R4ppr6F-zT9GtPg7j5fThzQQjWXKkG4g@mail.gmail.com>
	<1335796919.7415.20.camel@ted>
	<CAMKF1sriyONx1y3q7RMmi+oEztr_rx0VmLnLk3fLYE4NEq0vcg@mail.gmail.com>
	<1335797635.7415.22.camel@ted>
	<CAMKF1sofwSqoCOeaLAb9fPZ7HMQH49OsCZ37wYLJkGz_doCkEw@mail.gmail.com>
In-Reply-To: <CAMKF1sofwSqoCOeaLAb9fPZ7HMQH49OsCZ37wYLJkGz_doCkEw@mail.gmail.com>
Subject: Re: gcc 4.7 + mips64 architecture support
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
X-List-Received-Date: Mon, 30 Apr 2012 15:30:19 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 4/30/12 9:59 AM, Khem Raj wrote:
> On Mon, Apr 30, 2012 at 7:53 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org>  wrote:
>>> hmmm. Whats the error ?
>>
>> http://autobuilder.yoctoproject.org:8010/builders/nightly-tiny/builds/42/steps/shell_24/logs/stdio
>
> that should not happen. Its seems to be issue in eglibc option group
> handling somehow its asking for regexp which should be isolated in
> option groups
>
> Did this work fine with 4.6 ?

If this is reproducable outside of the build system.. (I suspect it is), we 
should mention this on the eglibc mailing list and see if they have any 
suggestions.  I wouldn't be surprised if a bug has crept into the configuration 
settings of eglibc.

--Mark

>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



