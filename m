Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 44CD5601A8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jun 2014 06:43:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s5P6hd0I025961
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 24 Jun 2014 23:43:42 -0700 (PDT)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.169.1;
	Tue, 24 Jun 2014 23:43:41 -0700
Message-ID: <53AA6F9A.10301@windriver.com>
Date: Wed, 25 Jun 2014 14:43:38 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>, OE-core
	<openembedded-core@lists.openembedded.org>
References: <cover.1403490121.git.kai.kang@windriver.com>
	<c33af6b8216db6c04c5a4114d818182a5438ed0e.1403490121.git.kai.kang@windriver.com>
	<CAJTo0Lb-bcLx4T1HHOEzsY3uXmNW8NzdKO9sBQtnottgEfyzXw@mail.gmail.com>
	<53A8D695.8060500@windriver.com>
	<20140624060602.GB22071@ad.chargestorm.se>
In-Reply-To: <20140624060602.GB22071@ad.chargestorm.se>
X-Originating-IP: [128.224.162.231]
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
X-List-Received-Date: Wed, 25 Jun 2014 06:43:49 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2014年06月24日 14:06, Anders Darander wrote:
> * Kang Kai <Kai.Kang@windriver.com> [140624 03:40]:
>
>> On 2014年06月23日 18:42, Burton, Ross wrote:
>>> On 23 June 2014 03:32, Kai Kang <kai.kang@windriver.com> wrote:
>>> Also, is it sensible to ship a static firewall configuration?  The one
>>> thing we're not is one-size-fits-all.
>> I just want users could start iptables without any professional work.
>> And these static firewall rules are common for desktop/server.
>> Or does the empty rule is better?
> If these rules are common for a desktop/server, do they make sense here?
> Or should a simplified rule set be your example configuration in that
> case?

I am thinking put a configure file there without any special rule that 
allows every input and output.
Users could update it with their rules.

Regards,
Kai



>
> Cheers,
> Anders
>


-- 
Regards,
Neil | Kai Kang


