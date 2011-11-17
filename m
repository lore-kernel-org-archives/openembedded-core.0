Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1RQrsr-0007nU-Qx
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Nov 2011 03:39:26 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pAH2Ww2a021515
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 16 Nov 2011 18:32:58 -0800 (PST)
Received: from [128.224.162.225] (128.224.162.225) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 16 Nov 2011 18:32:58 -0800
Message-ID: <4EC47257.5030302@windriver.com>
Date: Thu, 17 Nov 2011 10:32:55 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4EAE0428.2020209@windriver.com>
	<CAMKF1spV_BiCTo1YCoKL7XUTqRWtFJFYP4yB16FoyETjYzAuxg@mail.gmail.com>
In-Reply-To: <CAMKF1spV_BiCTo1YCoKL7XUTqRWtFJFYP4yB16FoyETjYzAuxg@mail.gmail.com>
X-Originating-IP: [128.224.162.225]
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id
	pAH2Ww2a021515
Cc: Saul Wold <saul.wold@intel.com>
Subject: Re: What is the strategy to update eglibc?
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
X-List-Received-Date: Thu, 17 Nov 2011 02:39:26 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2011=E5=B9=B411=E6=9C=8817=E6=97=A5 05:38, Khem Raj wrote:
> On Sun, Oct 30, 2011 at 7:12 PM, Kang Kai<Kai.Kang@windriver.com>  wrot=
e:
>> Hi Saul,
>>
>> I just want to update eglibc but eglibc is using its 2.14 branch and u=
se svn
>> commit revision "15225" as current version. Of course it is behind the
>> latest svn revision, but I don't quit sure about which is the right re=
vision
>> to update eglibc.

Hi Khem,
> since release branches of eglibc only get bug fixes in ideal case it
> should be good at any revision. However if we have bug
> fixes that dont affect us immediately we do not tend to update
> the revision. If you find that some bug fix thats applied upstream is
> needed it certainly can be a reason to bump up srcrev given we do some
> level of build and runtime testing
> with new revision.

Thanks very much for your detailed explanation.
I check the changelog of eglibc 2.13 branch(latest is 15508), and they=20
are some tiny updates except the revision 15226 that is same with=20
current patch

glibc_bug_fix_12454.patch

And I made the rough tests of image-sato of qemu-x86 and qemu-arm and=20
results are fine.

Regards,
Kai
>
>> Could you give me some guide? Thank you!
>>
>> Regards,
>> Kai
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



