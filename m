Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3C3786B3FA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2013 05:33:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r6U5XVsd001011
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 29 Jul 2013 22:33:31 -0700 (PDT)
Received: from [128.224.162.233] (128.224.162.233) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Mon, 29 Jul 2013 22:33:30 -0700
Message-ID: <51F75030.4090600@windriver.com>
Date: Tue, 30 Jul 2013 13:33:36 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1375065009.git.Qi.Chen@windriver.com>
	<9e31ede9ba9cb827f0b5e510d4aab17260aa5eab.1375065009.git.Qi.Chen@windriver.com>
	<CAJTo0LYSeFR29EAWWqaVVGw_YO1_u=J-UquRhaMdyNq7s6gUpQ@mail.gmail.com>
In-Reply-To: <CAJTo0LYSeFR29EAWWqaVVGw_YO1_u=J-UquRhaMdyNq7s6gUpQ@mail.gmail.com>
X-Originating-IP: [128.224.162.233]
Cc: Zhangle.Yang@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2 09/10] lighttpd: make /www diretory writable in read-only rootfs
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
X-List-Received-Date: Tue, 30 Jul 2013 05:33:32 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 07/29/2013 11:56 PM, Burton, Ross wrote:
> On 29 July 2013 03:33,  <Qi.Chen@windriver.com> wrote:
>> +    echo "/www /var/volatile/www" > ${D}${sysconfdir}/default/readonly/lighttpd
> /www is the default lighttpd document root, where the web sites are
> stored, so putting them in a tmpfs would be very wrong indeed.
>
> Why does lightttp need write access?  If it's putting logs in there
Yes. Exactly the log issue.

After some thinking, I think I'll just drop this patch.
Because even if I move the log location to /var/log/xxx, it will not 
make the situation any better, as the /www directory is still not writable.
So I think, at this point, we should not do too much.
I'll assume that if the user is using a read-only rootfs and his system 
is holding a website, maybe he'll just mount some writable media to /www.

Best Regards,
Chen Qi

> then they should be in /var/log, PIDs in /run and so on.
>
> Ross
>
>


