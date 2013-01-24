Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xin.Ouyang@windriver.com>) id 1TyHyH-0007eK-LS
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Jan 2013 09:15:47 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r0O6S6ki011105
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 23 Jan 2013 22:28:06 -0800 (PST)
Received: from [128.224.162.207] (128.224.162.207) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Wed, 23 Jan 2013 22:28:06 -0800
Message-ID: <5100D477.9040305@windriver.com>
Date: Thu, 24 Jan 2013 14:28:07 +0800
From: Pascal Ouyang <xin.ouyang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1358908276-14786-1-git-send-email-Xin.Ouyang@windriver.com>
	<CAJTo0Lbg6OyQ=eWun_fp_01AbX8Ybcf+Cmw+9MKPVk7tLxoZqA@mail.gmail.com>
In-Reply-To: <CAJTo0Lbg6OyQ=eWun_fp_01AbX8Ybcf+Cmw+9MKPVk7tLxoZqA@mail.gmail.com>
X-TagToolbar-Keys: D20130124142807474
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id
	r0O6S6ki011105
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libcgroup: fix the QA issue for pam_cgroup.so*
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
X-List-Received-Date: Thu, 24 Jan 2013 08:15:49 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=E4=BA=8E 2013=E5=B9=B401=E6=9C=8823=E6=97=A5 20:00, Burton, Ross =E5=86=99=
=E9=81=93:
> On 23 January 2013 02:31, Xin Ouyang <Xin.Ouyang@windriver.com> wrote:
>> pam modules in ${base_libdir}/security/ should be binary .so files,
>> not symlinks. So fix this QA issue.
>
> The short log should explain the problem more than just "fix QA issue".
>
> The commit log also doesn't say anything about moving libcgroup from
> /usr/lib to /lib.  Also isn't just setting --libdir in EXTRA_OEMAKE
> cleaner?


You know pam_cgroup.so is installed into ${base_libdir}/security, this=20
will cause "unsafe-references-in-binaries" QA issue if libcgroup.so.0 is=20
installed into ${libdir}.

I will add this reason in V2.

I do not use --libdir because pkgconfig/dev-so files should always=20
installed into ${libdir} instead of ${base_libdir}.

>
> Finally, no PR bumps are needed in oe-core.

Why no PR bumps needed?

Thanks. :)

- Pascal

>
> Ross
>
>


--=20
- Pascal


