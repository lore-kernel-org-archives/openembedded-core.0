Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Yanjun.Zhu@windriver.com>) id 1TgnEX-0001LT-Ow
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Dec 2012 03:00:10 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qB71jgsk027977
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 6 Dec 2012 17:45:42 -0800 (PST)
Received: from [128.224.162.170] (128.224.162.170) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Thu, 6 Dec 2012 17:45:41 -0800
Message-ID: <50C14A4A.9000703@windriver.com>
Date: Fri, 7 Dec 2012 09:45:46 +0800
From: yzhu1 <Yanjun.Zhu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1354249830-25918-1-git-send-email-yanjun.zhu@windriver.com>
	<CAJTo0Labvea6yuAHpHQbHDrnTgB7N8-hxAno4gHBZCADVxCMnQ@mail.gmail.com>
In-Reply-To: <CAJTo0Labvea6yuAHpHQbHDrnTgB7N8-hxAno4gHBZCADVxCMnQ@mail.gmail.com>
X-Originating-IP: [128.224.162.170]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] Python: Fix for CVE-2012-2135
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
X-List-Received-Date: Fri, 07 Dec 2012 02:00:10 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 12/06/2012 09:01 PM, Burton, Ross wrote:
> On 30 November 2012 04:30, yanjun.zhu <yanjun.zhu@windriver.com> wrote:
>> The utf-16 decoder in Python 3.1 through 3.3 does not update the
>> aligned_end variable after calling the unicode_decode_call_errorhandler
>> function, which allows remote attackers to obtain sensitive information
>> (process memory) or cause a denial of service (memory corruption and crash)
>> via unspecified vectors.
> The source for the vulnurability says Python 3.1 to 3.3, but you're
> patching 2.7.  Is the source not considering the Python 2 releases, or
> is 2.7 safe from the exploit?
>
> Ross
I exploit it in Python 2.7. This CVE will affect Python2.7.


