Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Ucbiy-00042C-1r
	for openembedded-core@lists.openembedded.org;
	Wed, 15 May 2013 15:27:01 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r4FD8IYJ011742
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 May 2013 06:08:19 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Wed, 15 May 2013 06:08:18 -0700
Message-ID: <519388C2.5000706@windriver.com>
Date: Wed, 15 May 2013 08:08:18 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130328 Thunderbird/17.0.5
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1368574528-28247-1-git-send-email-jslater@windriver.com>
	<1368574528-28247-2-git-send-email-jslater@windriver.com>
	<1368611695.6920.79.camel@phil-desktop.brightsign>
In-Reply-To: <1368611695.6920.79.camel@phil-desktop.brightsign>
Subject: Re: [PATCH 1/1] zlib: put shared libraries in base_libdir
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 15 May 2013 13:27:06 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 5/15/13 4:54 AM, Phil Blundell wrote:
> On Tue, 2013-05-14 at 16:35 -0700, Joe Slater wrote:
>> We put the shared libraries in base_libdir because at least
>> one library under base_libdir, pam_cracklib.so, needs them
>> and will cause a qa warning when it is built.
>
> Which warning are you getting?  From the description it sounds like
> unsafe-references-in-binaries but that one has been disabled since
> 2fb58da56e8e7044de21fd10fe9164d204587236.

We have that enabled in our builds.  We do so because we have customers who 
still want the root, /usr split.

--Mark

> p.
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



