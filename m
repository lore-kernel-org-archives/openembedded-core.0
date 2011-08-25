Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1QwPVP-0003h9-TJ
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Aug 2011 04:17:20 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p7P2CVVx020698
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2011 19:12:31 -0700 (PDT)
Received: from [128.224.162.178] (128.224.162.178) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 24 Aug 2011 19:12:31 -0700
Message-ID: <4E55AF1A.6040205@windriver.com>
Date: Thu, 25 Aug 2011 10:10:34 +0800
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Thunderbird/3.1.11
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1314166867.git.xiaofeng.yan@windriver.com>	<e62894baf8e79baa7e19901b7ec8c515dddb2537.1314166867.git.xiaofeng.yan@windriver.com>	<4E558B0D.1080307@linux.intel.com>
	<201108250113.20066.paul.eggleton@linux.intel.com>
In-Reply-To: <201108250113.20066.paul.eggleton@linux.intel.com>
X-Originating-IP: [128.224.162.178]
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id
	p7P2CVVx020698
Subject: Re: [PATCH 1/1] qt4e-demo-image: Fix bug 999
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
X-List-Received-Date: Thu, 25 Aug 2011 02:17:20 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2011=E5=B9=B408=E6=9C=8825=E6=97=A5 08:13, Paul Eggleton wrote:
> On Thursday 25 August 2011 00:36:45 Saul Wold wrote:
>> Why do we need the qt4e-base-image and this demo-image?  Do we expect =
to
>> have multiple images?  This creates yet another image that needs to be
>> built and tested?  Can this really just be added to the sato-sdk or
>> lsb-sdk images instead?
> No, it doesn't belong in sato-sdk and lsb-sdk is Qt4/X11 based which co=
unts it
> out also. It really needs its own image. The -base image could be merge=
d into
> -demo though.
>
> Cheers,
> Paul
>
Thanks for your suggestion.
I will merge base-image to demo-image.

Thanks,
Yan



