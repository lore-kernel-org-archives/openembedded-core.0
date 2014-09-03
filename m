Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 192BE605BD
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Sep 2014 03:00:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8330tXV021345
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 2 Sep 2014 20:00:55 -0700 (PDT)
Received: from [128.224.162.187] (128.224.162.187) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Tue, 2 Sep 2014 20:00:54 -0700
Message-ID: <54068470.2080605@windriver.com>
Date: Wed, 3 Sep 2014 11:01:04 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1409655125.git.Qi.Chen@windriver.com>
	<50321ac97381f5d3aea180c0b6506747a5c392c3.1409655125.git.Qi.Chen@windriver.com>
	<CAJTo0LagWB=cxN5jqV5SQ49Jckpn1+_ycyq7VfMYc+urMufCHQ@mail.gmail.com>
In-Reply-To: <CAJTo0LagWB=cxN5jqV5SQ49Jckpn1+_ycyq7VfMYc+urMufCHQ@mail.gmail.com>
X-Originating-IP: [128.224.162.187]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 14/26] cups: add systemd support
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
X-List-Received-Date: Wed, 03 Sep 2014 03:01:06 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 09/02/2014 11:38 PM, Burton, Ross wrote:
> On 2 September 2014 11:54, Chen Qi <Qi.Chen@windriver.com> wrote:
>> +       # Remove sysinit script and symlinks
>> +       rm -rf ${D}${sysconfdir}/init.d/
>> +       rm -rf ${D}${sysconfdir}/rc*
> Pretty sure you don't mean to unconditionally do that.
>
> Ross
>
>

Thanks for pointing it out.

Best Regards,
Chen Qi

