Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1RlbJq-0007ig-2J
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Jan 2012 08:12:58 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q0D75OTY029978
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jan 2012 23:05:25 -0800 (PST)
Received: from [128.224.162.146] (128.224.162.146) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 12 Jan 2012 23:05:24 -0800
Message-ID: <4F0FD7C5.4040907@windriver.com>
Date: Fri, 13 Jan 2012 15:05:41 +0800
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.23) Gecko/20110921 Thunderbird/3.1.15
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1326355020.git.xiaofeng.yan@windriver.com>	<d3939f8f64b50aca9bf23e9c017160d32cd814f6.1326355020.git.xiaofeng.yan@windriver.com>	<4F0F42D9.4040501@linux.intel.com>
	<1326400424.3360.1.camel@lenovo.internal.reciva.com>
In-Reply-To: <1326400424.3360.1.camel@lenovo.internal.reciva.com>
X-Originating-IP: [128.224.162.146]
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id
	q0D75OTY029978
Subject: Re: [PATCH 3/3] pango.inc: add directory "/etc/pango"
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
X-List-Received-Date: Fri, 13 Jan 2012 07:12:58 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2012=E5=B9=B401=E6=9C=8813=E6=97=A5 04:33, Phil Blundell wrote:
> On Thu, 2012-01-12 at 12:30 -0800, Saul Wold wrote:
>> On 01/12/2012 12:12 AM, Xiaofeng Yan wrote:
>>> -FILES_${PN} =3D "/etc/pango/* ${bindir}/* ${libdir}/libpango*${SOLIB=
S}"
>>> +FILES_${PN} +=3D "${syscondir}/* ${bindir}/* ${libdir}/libpango*${SO=
LIBS}"
>> Is this too general?  Should it be ${sysconfdir}/pango?
> "${sysconfdir}" is in the default FILES_${PN} anyway.
I will remove this changes.
>   (Also,
> "${syscondir}/*" won't match anything since there is no such variable.)
>
> So this change is largely benign but it won't accomplish much.
>
> p.
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



