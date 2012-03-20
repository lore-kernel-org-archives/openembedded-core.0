Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1S9vgW-0000MO-Gy
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Mar 2012 10:48:56 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q2K9e2Vx029782
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2012 02:40:02 -0700 (PDT)
Received: from [128.224.162.223] (128.224.162.223) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 20 Mar 2012 02:40:02 -0700
Message-ID: <4F685087.6080303@windriver.com>
Date: Tue, 20 Mar 2012 17:40:23 +0800
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.23) Gecko/20110921 Thunderbird/3.1.15
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1331877464.git.xiaofeng.yan@windriver.com>	<22ff60ec34d2c54393d4ceb2a81394c6512baa17.1331877464.git.xiaofeng.yan@windriver.com>	<4F679F53.40302@linux.intel.com>
	<4F681A97.4020201@windriver.com>
	<665F9083-9747-4972-BCDE-BCE209266221@dominion.thruhere.net>
In-Reply-To: <665F9083-9747-4972-BCDE-BCE209266221@dominion.thruhere.net>
X-Originating-IP: [128.224.162.223]
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id
	q2K9e2Vx029782
Subject: Re: [PATCH 2/7] archiver.bbclass: New bbclass for	archiving sources, patches, logs and scripts
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
X-List-Received-Date: Tue, 20 Mar 2012 09:48:56 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2012=E5=B9=B403=E6=9C=8820=E6=97=A5 16:07, Koen Kooi wrote:
> Op 20 mrt. 2012, om 06:50 heeft Xiaofeng Yan het volgende geschreven:
>
>> On 2012=E5=B9=B403=E6=9C=8820=E6=97=A5 05:04, Saul Wold wrote:
>>> On 03/15/2012 11:23 PM, Xiaofeng Yan wrote:
>>>> From: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>>>>
>>> Why do you rebuild the tarball here are rename it instead of just cop=
ying the original tarball?
>>>
>> because many packages come from non-tarball and they could be git sour=
ces , So I archive these sources after do_unpack.
> But if you have the original tarball and reuse it, you'll get the warm =
fuzzy feeling of matching checksums.
So How about  renaming archive-original-source to archive-prepatched-sour=
ce?
> regards,
>
> Koen
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



