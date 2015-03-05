Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9BD9065C7B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Mar 2015 08:10:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t258Aqch009283
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 5 Mar 2015 00:10:52 -0800 (PST)
Received: from [128.224.162.174] (128.224.162.174) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 5 Mar 2015 00:10:51 -0800
Message-ID: <54F80F8A.4040909@windriver.com>
Date: Thu, 5 Mar 2015 16:10:50 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, OE Core mailing list
	<openembedded-core@lists.openembedded.org>
References: <alpine.LFD.2.11.1503050259530.21019@Device-040570>
In-Reply-To: <alpine.LFD.2.11.1503050259530.21019@Device-040570>
Subject: Re: "_append" error in gdb-cross-canadian.inc?
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
X-List-Received-Date: Thu, 05 Mar 2015 08:11:00 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 03/05/2015 04:01 PM, Robert P. J. Day wrote:
>
>    EXTRA_OECONF_append = "--with-python=${WORKDIR}/python"
>                           ^??
>
> does that not require a leading space there?

It is required, this one doesn't cause error is because in gdb-common.inc:

EXTRA_OECONF = "[snip] \
                 --disable-rpath \
                "

If:

EXTRA_OECONF = "[snip] \
                 --disable-rpath"

Then there would be errors.

// Robert

>
> rday
>

