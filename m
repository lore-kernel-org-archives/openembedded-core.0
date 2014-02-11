Return-Path: <David.Nystrom@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 4C4AC6EE8E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Feb 2014 14:50:51 +0000 (UTC)
Received: from [172.16.141.133] (172.16.141.133) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.158.1;
	Tue, 11 Feb 2014 15:50:46 +0100
Message-ID: <52FA38C3.2080709@enea.com>
Date: Tue, 11 Feb 2014 15:50:43 +0100
From: =?ISO-8859-1?Q?David_Nystr=F6m?= <david.nystrom@enea.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: =?ISO-8859-1?Q?David_Nystr=F6m?= <david.nystrom@enea.com>, Laurentiu Palcu
	<laurentiu.palcu@intel.com>, <openembedded-core@lists.openembedded.org>
References: <cover.1391427313.git.laurentiu.palcu@intel.com>	<cover.1392034327.git.laurentiu.palcu@intel.com>
	<52FA34D1.6040808@enea.com>
In-Reply-To: <52FA34D1.6040808@enea.com>
X-Originating-IP: [172.16.141.133]
Subject: Re: [PATCH v5 00/53] Rootfs/image generation refactoring (cover letter only)
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
X-List-Received-Date: Tue, 11 Feb 2014 14:50:51 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2014-02-11 15:33, David Nystr=F6m wrote:
> On 2014-02-10 13:15, Laurentiu Palcu wrote:
>> V5:
>>   * dump command output in case errors occur;
>>
>
> rm -fr tmp/deploy/qemuppc/images/*
> bitbake -c cleanall core-image-minimal; bitbake core-image-minimal
>
> Above does not seem to regenerate the image ?

Sorry, Ignore this.
My mistake.


> Br,
> David
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


