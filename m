Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1Qvfr8-0004yG-AS
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Aug 2011 03:32:42 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p7N1RtWF025827
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 22 Aug 2011 18:27:55 -0700 (PDT)
Received: from [128.224.162.178] (128.224.162.178) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Mon, 22 Aug 2011 18:27:55 -0700
Message-ID: <4E5301BE.3050404@windriver.com>
Date: Tue, 23 Aug 2011 09:26:22 +0800
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Thunderbird/3.1.11
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1314010928.git.xiaofeng.yan@windriver.com>
	<1b28a73fd25e40a29659583ee1432f7f3c720b68.1314010928.git.xiaofeng.yan@windriver.com>
	<201108221352.38897.paul.eggleton@linux.intel.com>
In-Reply-To: <201108221352.38897.paul.eggleton@linux.intel.com>
X-Originating-IP: [128.224.162.178]
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id
	p7N1RtWF025827
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] qt4-x11-demo-image: Fix bug 999
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
X-List-Received-Date: Tue, 23 Aug 2011 01:32:42 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2011=E5=B9=B408=E6=9C=8822=E6=97=A5 20:52, Paul Eggleton wrote:
> On Monday 22 August 2011 12:34:11 Xiaofeng Yan wrote:
>> From: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>>
>> [YOCTO #999]
>> Add qt4-x11-demo-image for fixing bug 999
> Thanks for looking into this bug. A couple of comments though:
>
> 1) You need to specify an appropriate commit message. This should inclu=
de a
> reason for adding (i.e. to allow easy testing of Qt4 on X11); you also =
need to
> credit OE if that's where you copied some of the metadata from.
>
> 2) This adds quite a lot more than should be needed for a simple demo i=
mage.
> The image itself should inherit from core-image, this will save a lot o=
f
> duplication. Why are you adding palmtop.bbclass, sdk.bbclass, task-sdk-=
host,
> micro-base-image etc.? These should not be needed at all.
>
> Cheers,
> Paul
>
Thanks for your comments very much. I will make a change for the method=20
to fix bug 999 according to your suggestion.

Thanks
Yan


