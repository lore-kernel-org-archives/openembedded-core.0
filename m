Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Tl0qy-0007xn-Lz
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Dec 2012 18:21:18 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qBIH6YTI018797
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 18 Dec 2012 09:06:34 -0800 (PST)
Received: from msp-dhcp56.wrs.com (172.25.34.56) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Tue, 18 Dec 2012 09:06:31 -0800
Message-ID: <50D0A297.4010702@windriver.com>
Date: Tue, 18 Dec 2012 11:06:31 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: =?UTF-8?B?QmrDuHJuIEZvcnNtYW4=?= <bjorn.forsman@gmail.com>
References: <CAEYzJUHZYS8cA3KRRM2L+etHxAOxaU=vBzgaRbUc9hSg8AJODA@mail.gmail.com>
	<50CF3D03.3040301@windriver.com>
	<CAEYzJUGVz4DTiqa8V6tOtQCg53C4TQ_zPb5jh6gEWks1+xP4vg@mail.gmail.com>
	<CAEYzJUG1fnyG53nx7DXYhSCnoxw44nW_hZXQX-gKij525dPYdA@mail.gmail.com>
	<50CF9ABE.3000508@windriver.com>
	<CAEYzJUGy1LR0YomqNEKnYPtVWAtMUpC=R21vZRZAx-SSe8GVVg@mail.gmail.com>
In-Reply-To: <CAEYzJUGy1LR0YomqNEKnYPtVWAtMUpC=R21vZRZAx-SSe8GVVg@mail.gmail.com>
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.windriver.com id
	qBIH6YTI018797
Cc: openembedded-core@lists.openembedded.org
Subject: Re: SDK confusion!
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
X-List-Received-Date: Tue, 18 Dec 2012 17:21:18 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 12/18/12 7:50 AM, Bj=C3=B8rn Forsman wrote:
> On 17 December 2012 23:20, Mark Hatle <mark.hatle@windriver.com> wrote:
> [...]
>> This is Yocto Project 1.2, the feature arrived sometime between 1.2 an=
d 1.3.
>>
>> The 'danny' branch is 1.3, 'denzil' is 1.2.  I may have said 'denzil' =
by
>> accident in the last email.
>>
>> Basically you need a newer oe-core to use this feature, or you need to
>> backport it.
>
> Ok. I have switched branches now and got it working for
> core-image-minimal. Thanks.
>
> However, the systemd-image in Angstrom has an issue that breaks
> "bitbake systemd-image -c populate_sdk". I have posted a message on
> their list just now. But basically, the error is this:
>
> $ bitbake systemd-image -c populate_sdk
> [...]
> | Package netbase-dbg (5.0-r1) installed in root is up to date.
> | Collected errors:
> |  * check_conflicts_for: The following packages conflict with openssh:
> |  * check_conflicts_for: 	dropbear *
> |  * opkg_install_cmd: Cannot install package openssh-dev.
> |  * check_conflicts_for: The following packages conflict with openssh:
> |  * check_conflicts_for: 	dropbear *
> |  * opkg_install_cmd: Cannot install package openssh-dbg.

Both dropbear and openssh appear to not be able to be installed at the sa=
me time=20
due to a stated package conflict.  As to why they are bothy trying to be=20
installed, I'm not sure.  Sorry.

--Mark

> | DEBUG: Python function do_populate_sdk finished
> | ERROR: Function failed: populate_sdk_image (see
> /home/bfo/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/work/beagleb=
one-angstrom-linux-gnueabi/systemd-image-1.0-r0/temp/log.do_populate_sdk.=
18052
> for further information)
> ERROR: Task 10 (/home/bfo/setup-scripts/sources/meta-angstrom/recipes-i=
mages/angstrom/systemd-image.bb,
> do_populate_sdk) failed with exit code '1'
>
> Best regards,
> Bj=C3=B8rn Forsman
>



