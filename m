Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B47146FC2F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jun 2014 02:06:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s5626taA022225
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 5 Jun 2014 19:06:55 -0700 (PDT)
Received: from [128.224.162.187] (128.224.162.187) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.169.1;
	Thu, 5 Jun 2014 19:06:55 -0700
Message-ID: <53912277.4080107@windriver.com>
Date: Fri, 6 Jun 2014 10:07:51 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1401945914.git.Qi.Chen@windriver.com>
	<e495f3e49d33bd3b855c8eb91206622e0f2e3d14.1401945914.git.Qi.Chen@windriver.com>
	<CAJTo0LbN9V7f29md9LNEA5aG9NaLHG6ZiKt8m_72wO=E9hkWpw@mail.gmail.com>
In-Reply-To: <CAJTo0LbN9V7f29md9LNEA5aG9NaLHG6ZiKt8m_72wO=E9hkWpw@mail.gmail.com>
X-Originating-IP: [128.224.162.187]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2 1/3] gawk: upgrade from 4.0.2 to 4.1.1
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 06 Jun 2014 02:07:01 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 06/05/2014 05:42 PM, Burton, Ross wrote:
> On 5 June 2014 06:29, Chen Qi <Qi.Chen@windriver.com> wrote:
>> +FILES_gawk-common += "${datadir}/awk/* ${libexecdir}/awk/* ${libexecdir}/*.so"
> Gawk doesn't install extensions into libexecdir, but $libdir/gawk:
>
> AC_SUBST([pkgextensiondir], ['${pkglibdir}'])
>
> They may end up in the same location but that can't be guaranteed for
> all time (especially when I have a series that changes libexecdir).
>
> Ross
>
>

Hi Ross,

I checked out your branch and saw your changes.

-export libexecdir = "${libdir}/${BPN}"
+export libexecdir = "${exec_prefix}/libexec"

I'll update my patch and send out a V3.
I think this time, I'll also have to modify the gawk recipe of the old 
3.1.5 version.

(P.S. I grepped in the project, and it seems that there are also other 
recipes that may need some changes about the libexec.)

Best Regards,
Chen Qi

