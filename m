Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1SWNCQ-00021m-Im
	for openembedded-core@lists.openembedded.org;
	Mon, 21 May 2012 09:38:39 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q4L7SSGs017478
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 21 May 2012 00:28:28 -0700 (PDT)
Received: from [128.224.163.142] (128.224.163.142) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Mon, 21 May 2012 00:28:27 -0700
Message-ID: <4FB9EE99.80309@windriver.com>
Date: Mon, 21 May 2012 15:28:25 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <CAOHjBZvpd8TN04-BixZYRBM9OkYqmxhw37czLdN1wO4Ex0ZqrQ@mail.gmail.com>
In-Reply-To: <CAOHjBZvpd8TN04-BixZYRBM9OkYqmxhw37czLdN1wO4Ex0ZqrQ@mail.gmail.com>
Subject: Re: About RPMs installation
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
X-List-Received-Date: Mon, 21 May 2012 07:38:39 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


I'm not very clear about your questions, but the easiest way should be:

1) boot your image
2) copy your RPMs to the image via scp
3) rpm -Uvh /pat/to/rpm_file.rpm

// Robert

On 05/21/2012 03:12 PM, Giuseppe Condorelli wrote:
> Hi All,
>
> can I have an help about rpms installation, once they were built by oc-core?
> I produced both .tgz and rpms, I'm wondering how to install them (maybe
> using chroot, but I'm newbe
> about it).
> Please, have you suggestions?
>
> Thanks,
> Giuseppe
>
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


