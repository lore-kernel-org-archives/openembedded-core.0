Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 367AF65F18
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jun 2014 01:38:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s5O1cWeg021553
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 23 Jun 2014 18:38:33 -0700 (PDT)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.169.1;
	Mon, 23 Jun 2014 18:38:32 -0700
Message-ID: <53A8D695.8060500@windriver.com>
Date: Tue, 24 Jun 2014 09:38:29 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1403490121.git.kai.kang@windriver.com>
	<c33af6b8216db6c04c5a4114d818182a5438ed0e.1403490121.git.kai.kang@windriver.com>
	<CAJTo0Lb-bcLx4T1HHOEzsY3uXmNW8NzdKO9sBQtnottgEfyzXw@mail.gmail.com>
In-Reply-To: <CAJTo0Lb-bcLx4T1HHOEzsY3uXmNW8NzdKO9sBQtnottgEfyzXw@mail.gmail.com>
X-Originating-IP: [128.224.162.231]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/5] iptables: add default rules
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
X-List-Received-Date: Tue, 24 Jun 2014 01:38:43 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2014年06月23日 18:42, Burton, Ross wrote:
> On 23 June 2014 03:32, Kai Kang <kai.kang@windriver.com> wrote:
>> +# Firewall configuration written by system-config-securitylevel
>> +# Manual customization of this file is not recommended.
> That's just going to be confusing to anyone who doesn't know that this
> file was copied directly from RedHat.

OK, I'll remove them.

>
> Also, is it sensible to ship a static firewall configuration?  The one
> thing we're not is one-size-fits-all.

I just want users could start iptables without any professional work. 
And these static firewall rules are common for desktop/server.
Or does the empty rule is better? Anyone who wants to use iptables 
writes his/her own rules. But it is a little difficult for the people 
who not familiar with iptables.

Any suggestion?

Thanks,
Kai

>
> Ross
>
>


-- 
Regards,
Neil | Kai Kang


