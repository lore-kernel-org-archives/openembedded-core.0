Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4B1AF6D544
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Nov 2013 02:31:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rAG2VOIX002710
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 15 Nov 2013 18:31:24 -0800 (PST)
Received: from [128.224.162.213] (128.224.162.213) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Fri, 15 Nov 2013 18:31:25 -0800
Message-ID: <5286D908.3060202@windriver.com>
Date: Sat, 16 Nov 2013 10:31:36 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130804 Thunderbird/17.0.8
MIME-Version: 1.0
To: Phil Blundell <pb@pbcl.net>
References: <cover.1384512287.git.Qi.Chen@windriver.com>
	<251777d6d4284fb929939d626990ee3f26394c05.1384512287.git.Qi.Chen@windriver.com>
	<1384519913.23724.8.camel@phil-desktop.brightsign>
In-Reply-To: <1384519913.23724.8.camel@phil-desktop.brightsign>
X-Originating-IP: [128.224.162.213]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] sysvinit: use ALTERNATIVE to manage sulogin
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
X-List-Received-Date: Sat, 16 Nov 2013 02:31:24 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/15/2013 08:51 PM, Phil Blundell wrote:
> On Fri, 2013-11-15 at 18:45 +0800, Qi.Chen@windriver.com wrote:
>> -FILES_sysvinit-sulogin = "${base_sbindir}/sulogin"
>> +FILES_sysvinit-sulogin = "${base_sbindir}/sulogin.sysvinit"
> At the risk of seeming dim, how does ${base_sbindir}/sulogin.sysvinit
> get installed in the first place?
>
> p.
>
>
>
>
It's handled in the update-alternative.bbclass.

# We need to do the rename after the image creation step, but before
# the split and strip steps..  packagecopy seems to be the earliest 
reasonable
# place.
python perform_packagecopy_append () {
.....
}

Best Regards,
Chen Qi

