Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Yao.Zhao@windriver.com>) id 1Sz6TB-00035e-DR
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Aug 2012 15:38:41 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q78DQq3h022734
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 8 Aug 2012 06:26:52 -0700 (PDT)
Received: from [128.224.147.210] (128.224.147.210) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.309.2;
	Wed, 8 Aug 2012 06:26:53 -0700
Message-ID: <5022691A.9010800@windriver.com>
Date: Wed, 8 Aug 2012 09:26:50 -0400
From: Yao Zhao <yao.zhao@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1344360704-23172-1-git-send-email-yao.zhao@windriver.com>
	<502152B8.6070100@gmail.com> <50215ED9.3070505@windriver.com>
	<50215FE3.5060205@gmail.com>
In-Reply-To: <50215FE3.5060205@gmail.com>
X-Originating-IP: [128.224.147.210]
Subject: Re: [PATCH] cracklib, zlib: install to /lib instead of /usr/libxx
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
X-List-Received-Date: Wed, 08 Aug 2012 13:38:41 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 12-08-07 02:35 PM, Derek Buitenhuis wrote:
> On 07/08/2012 2:30 PM, Yao Zhao wrote:
>> zlib is not using autotools although it has configure.
>> when install, oe_runmake will be make -e so Makefile will always use
>> env's libdir which is the usr/libxx, we have to overwrite it when install.
> Perhaps you don't need to specify during configure then? :shrug:
That is true.
But this makes Makefile clearer and for non oe distribution it is 
supposed to change here and will work.
The hack in install part is for oe only.

yao
> - Derek
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core




