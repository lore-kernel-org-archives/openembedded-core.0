Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C62EC6B7C2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2014 02:12:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s0D2CAhY002798
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 12 Jan 2014 18:12:10 -0800 (PST)
Received: from [128.224.162.226] (128.224.162.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.347.0;
	Sun, 12 Jan 2014 18:12:09 -0800
Message-ID: <52D34B77.5010401@windriver.com>
Date: Mon, 13 Jan 2014 10:12:07 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>, Patches and discussions about
	the oe-core layer <openembedded-core@lists.openembedded.org>
References: <CAP9ODKpJzcrWy2RjpLJeS-KJCrNHYM+UPh2-NU9icnaBuJSSXA@mail.gmail.com>
In-Reply-To: <CAP9ODKpJzcrWy2RjpLJeS-KJCrNHYM+UPh2-NU9icnaBuJSSXA@mail.gmail.com>
Cc: "Purdie, Richard" <richard.purdie@intel.com>
Subject: Re: GCC bugfix backport into Dora
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
X-List-Received-Date: Mon, 13 Jan 2014 02:12:12 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


Hi Otavio,

I think that we need fix it in dora since gcc 4.8.1 is affected.

// Robert

On 01/11/2014 01:41 AM, Otavio Salvador wrote:
> Hello,
>
> The Dora branch seems to be affected by a toolchain bug:
>
> http://gcc.gnu.org/bugzilla/show_bug.cgi?id=57532
>
> 4.8.2 includes this bugfix and I'd like to know if it is planned anything
> in this direction to Dora or not?
>
> Regards,
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

