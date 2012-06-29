Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1SkXqK-0001PR-Tr
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jun 2012 11:50:25 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q5T9dCMd017995
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jun 2012 02:39:12 -0700 (PDT)
Received: from [128.224.163.142] (128.224.163.142) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Fri, 29 Jun 2012 02:39:12 -0700
Message-ID: <4FED77BE.2020903@windriver.com>
Date: Fri, 29 Jun 2012 17:39:10 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <4FED7714.5000309@windriver.com>
In-Reply-To: <4FED7714.5000309@windriver.com>
Subject: Re: The native perl's path is not in PATH
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
X-List-Received-Date: Fri, 29 Jun 2012 09:50:26 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 06/29/2012 05:36 PM, Robert Yang wrote:
>
> The native perl is installed to:
>
> ${STAGING_BINDIR_NATIVE}/perl-native/perl
>
> But this isn't in the PATH, so we can use the native perl

                Sorry, missed a "not" here: so we "can not" use the native perl ...

> by the command "perl" or "#!/usr/bin/env perl".
>
> I wonder why we install the perl to ${STAGING_BINDIR_NATIVE}/perl-native,
> but not to ${STAGING_BINDIR_NATIVE}.
>
> It would be good if we can add ${STAGING_BINDIR_NATIVE}/perl-native to the path
> or install the native perl to ${STAGING_BINDIR_NATIVE}, I will send a patch
> for it if you are ok with it.
>


