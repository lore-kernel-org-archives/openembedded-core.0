Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1SIVn2-0006vX-AW
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Apr 2012 03:59:08 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q3D1nkYp021364
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 12 Apr 2012 18:49:46 -0700 (PDT)
Received: from [128.224.162.202] (128.224.162.202) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 12 Apr 2012 18:49:45 -0700
Message-ID: <4F878641.1010207@windriver.com>
Date: Fri, 13 Apr 2012 09:49:53 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: Andreas Oberritter <obi@opendreambox.org>
References: <4F87233E.2030604@opendreambox.org>
In-Reply-To: <4F87233E.2030604@opendreambox.org>
X-Originating-IP: [128.224.162.202]
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id
	q3D1nkYp021364
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: cleanup-workdir
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
X-List-Received-Date: Fri, 13 Apr 2012 01:59:08 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2012=E5=B9=B404=E6=9C=8813=E6=97=A5 02:47, Andreas Oberritter wrote:
> Hello Kai,
>
> because I was low on disk space, I just tried scripts/cleanup-workdir
> for the first time. My observations:

Hi Andreas,
 =20

> 1.) It deletes work directories that were built for other machines
> (archs) than the current one. I guess the list of architectures to
> handle should be queried from bitbake to avoid this.
Do you mean that you build for 2 archs under the same "build" directory?
Even in this way the script only delete the packages' build dir for old=20
versions.
Your requirement is that cleanup-workdir just clean the build dirs for=20
current arch, right?

> 2.) It doesn't delete work directories of previously deleted recipes.
Because when the recipe gone, I can NOT tell whether the directory is=20
left by bitbake or created by user.
I will list them and let user to choose delete them or not.

Regards,
Kai
>
> Regards,
> Andreas



