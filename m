Return-Path: <Hongbo.Zhong@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 75EBB6D85E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Nov 2013 03:30:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rAE3UDLv007772
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 13 Nov 2013 19:30:13 -0800 (PST)
Received: from [128.224.162.173] (128.224.162.173) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.347.0;
	Wed, 13 Nov 2013 19:30:13 -0800
Message-ID: <528443D5.8020105@windriver.com>
Date: Thu, 14 Nov 2013 11:30:29 +0800
From: Zhong Hongbo <hongbo.zhong@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130510 Thunderbird/17.0.6
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1384337335-32231-1-git-send-email-hongbo.zhong@windriver.com>
	<1384337335-32231-3-git-send-email-hongbo.zhong@windriver.com>
	<CAJTo0LZZhEF5S9anD54RrrVyGe07KkdNhTh1gz=giRJk_n7k7A@mail.gmail.com>
In-Reply-To: <CAJTo0LZZhEF5S9anD54RrrVyGe07KkdNhTh1gz=giRJk_n7k7A@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] bluez4: Fix no moudle named gi.repository and GObject for simpel-agent
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
X-List-Received-Date: Thu, 14 Nov 2013 03:30:13 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/2013 08:30 PM, Burton, Ross wrote:
> On 13 November 2013 10:08, Zhong Hongbo <hongbo.zhong@windriver.com> wrote:
>> +++ b/meta/recipes-connectivity/bluez/bluez4-4.101/fix-no-module-name-GObject-for-simple-agent.patch
>> @@ -0,0 +1,25 @@
>> +Fix No module name gi.repository and GObject for simple-agent
>> +
>> +Signed-off-by: Zhong Hongbo <hongbo.zhong@windriver.com>
> Patch needs an Upstream-Status ("Inappropriate [revert]" would be
> suitable), and please rename the patch/comment to something more
> accurate along the lines of "use legacy pygobject instead of
> gobject-introspection".
Sorry, This is my first RR. I will do it in the next RR.

Thanks,
Hongbo
>
> Ross
>
>


