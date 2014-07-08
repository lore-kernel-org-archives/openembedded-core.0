Return-Path: <akuster@mvista.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id 2507270409
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Jul 2014 20:39:33 +0000 (UTC)
Received: by mail-pa0-f49.google.com with SMTP id lj1so7869364pab.22
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Jul 2014 13:39:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=LBWqR+xbaH2raVSoNdAqdK84rwPxfdITjrKz+aeCCMM=;
	b=VX3iAn0UlL9doxw1R1SR3YANZOzSYWkbUPH+GakA67nOnOjO1EjhYrZox6DP0tCGbF
	VBo8W6EH27NInhmxhGermyzvvZmuxJ3BsfrEmEO753Dx5VA6gKCNa/+nXvtutRqCGzS7
	6dcJro+tg08N+wddVNYW0ZMaO6zdj6htR7V4CRxeVxQizpVThQbxWb/GwWzzCbuC/tnA
	EW7RDhJxnclkU0ptpqupLca2TXzJ+O0CI2vTkiWsuw6tUlPRcJvliejGBFCfRy92gV/X
	axa+cYf2R1vfVbWF/NCPA9Tk1OCVt4Nde6BK3xWl4ZilFyrEFw0xN58S8KfBGB9elYwg
	VADQ==
X-Gm-Message-State: ALoCoQmqGZ7xaVN/8cncoLvoCJ0owIRtgCMA/TluXcm8/GdeEI4GVklrHTdgGQDfv+94utV/CjAb
X-Received: by 10.68.200.10 with SMTP id jo10mr4145688pbc.143.1404851974093;
	Tue, 08 Jul 2014 13:39:34 -0700 (PDT)
Received: from [10.7.100.231] (64.2.3.195.ptr.us.xo.net. [64.2.3.195])
	by mx.google.com with ESMTPSA id
	hk5sm56648070pbb.86.2014.07.08.13.39.32 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 08 Jul 2014 13:39:33 -0700 (PDT)
Message-ID: <53BC5704.4020804@mvista.com>
Date: Tue, 08 Jul 2014 13:39:32 -0700
From: akuster <akuster@mvista.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>, Armin Kuster <akuster@mvista.com>
References: <1404768785-24026-1-git-send-email-akuster@mvista.com>	<1404768785-24026-2-git-send-email-akuster@mvista.com>
	<CAJTo0LYo+VSRkjKrbC3a5SRS0ixGdHXT=Ox0NCU1St7_mSm_9w@mail.gmail.com>
In-Reply-To: <CAJTo0LYo+VSRkjKrbC3a5SRS0ixGdHXT=Ox0NCU1St7_mSm_9w@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] lz4: update to latest version 119
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
X-List-Received-Date: Tue, 08 Jul 2014 20:39:41 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit



On 07/08/2014 03:15 AM, Burton, Ross wrote:
> On 7 July 2014 22:33, Armin Kuster <akuster@mvista.com> wrote:
>> -LIC_FILES_CHKSUM = "file://LICENSE;md5=2008d2325e11691e17fcaa3a6046f850"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=0b0d063f37a4477b54af2459477dcafd"
>
> Please add a comment in the commit message explaining why the checksum
> has changed.

ok, will do.

>
>> -SRC_URI = "svn://lz4.googlecode.com/svn/;module=trunk;protocol=http"
>> +SRC_URI = "https://github.com/Cyan4973/lz4/archive/${PV}.tar.gz"
>
> Github archives can't be trusted as they can be re-generated at any
> time by github (and the checksums will change).  If upstream doesn't
> provide static tarballs then use the git fetcher and checkout the
> release tag.
>
Thanks for the info. I will look for a different solution.

- Armin

>> +S = "${WORKDIR}/${BPN}-${PV}"
>
> This is the default value.
>
> Ross
>

