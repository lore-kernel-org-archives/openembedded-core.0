Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 16B337136A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Sep 2014 02:38:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s832cxMc011563
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 2 Sep 2014 19:38:59 -0700 (PDT)
Received: from [128.224.162.187] (128.224.162.187) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Tue, 2 Sep 2014 19:38:59 -0700
Message-ID: <54067F4D.9030403@windriver.com>
Date: Wed, 3 Sep 2014 10:39:09 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1409655125.git.Qi.Chen@windriver.com>
	<664768e4223b4401525d0796662f1666e2d21824.1409655125.git.Qi.Chen@windriver.com>
	<CAJTo0LahyhjUwxnEqCZkTb=B1ctGb0E+sTEvvwkTpL6U6N4iTg@mail.gmail.com>
In-Reply-To: <CAJTo0LahyhjUwxnEqCZkTb=B1ctGb0E+sTEvvwkTpL6U6N4iTg@mail.gmail.com>
X-Originating-IP: [128.224.162.187]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 10/26] dhcp: add dhcpd.service
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
X-List-Received-Date: Wed, 03 Sep 2014 02:39:00 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 09/02/2014 11:03 PM, Burton, Ross wrote:
> On 2 September 2014 11:53, Chen Qi <Qi.Chen@windriver.com> wrote:
>> --- /dev/null
>> +++ b/meta/recipes-connectivity/dhcp/files/dhcpd.service
>> @@ -0,0 +1,11 @@
>> +[Unit]
>> +Description=DHCP Server Daemon
>> +After=network.target
>> +After=time-sync.target
>> +
>> +[Service]
>> +EnvironmentFile=/etc/default/dhcp-server
>> +ExecStart=-@SBINDIR@/dhcpd -q $INTERFACES
> Hard-coded /etc, replace in $sysconfdir.
>
> Ross
>
>

Got it!

Thanks,
Chen Qi

