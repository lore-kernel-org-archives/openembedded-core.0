Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1RiMGG-0004v4-9N
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jan 2012 09:31:52 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q048OTu5028445
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 4 Jan 2012 00:24:29 -0800 (PST)
Received: from [128.224.162.146] (128.224.162.146) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 4 Jan 2012 00:24:29 -0800
Message-ID: <4F040CC7.7070500@windriver.com>
Date: Wed, 4 Jan 2012 16:24:39 +0800
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.23) Gecko/20110921 Thunderbird/3.1.15
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <4F03FFB2.8040606@linux.intel.com>
In-Reply-To: <4F03FFB2.8040606@linux.intel.com>
X-Originating-IP: [128.224.162.146]
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id
	q048OTu5028445
Subject: Re: Recent xserver-kdrive failure and util-macros update
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
X-List-Received-Date: Wed, 04 Jan 2012 08:31:52 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2012=E5=B9=B401=E6=9C=8804=E6=97=A5 15:28, Saul Wold wrote:
>
> We seem to have a relatively new failure in xserver-kdrive, which=20
> appeared in the last set of change. I tried to run though a bisect but=20
> was not able to find the problem.
>
> The problem seems to be related to configure.ac setting of=20
> XSERVER_CFLAGS=3D'$(CWARNFLAGS)' and then using -Werror=3Daddress, whic=
h=20
> is what causes the failure.
>
> This seems to be related to the util-macros update to 1.16, which adds=20
> more warnings to errors. Since we are still using the older=20
> xserver-kdrive, there are warnings that are now errors with the update.
>
> We could patch the current xserver-kdrive, revert the 1.16 update to=20
> util-macros or update xserver-kdrive (which is in the works, but I=20
> think had some issues). This also seems to affect the libxp package on=20
> x86-64.
>
> Thoughts, I know we don't like to revert, but we may have to in this=20
> case as we don't have the kdrive update yet and would need to further=20
> investigate the libxp failure.
>
Hi Saul,

Do you have any suggestion my previous patches to update xserver-kdrive ?

  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Dxiaofeng/update




